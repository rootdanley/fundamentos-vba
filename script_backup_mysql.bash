#!/bin/bash
# 
# Script: full_dump.sh
#

BKPDIR=/ora_bkp/mysql_backup/dump
TARDIR=/ora_bkp/mysql_backup/tar
LOGDIR=/ora_bkp/mysql_backup/log
WRKDIR=/ora_bkp/mysql_backup/script

DTHR=`date +'%Y%m%d_%H%M'`
JOBS=0
MAXJOBS=5
RETENCAO=8

ARQSCH=/tmp/lista_schemas.txt
ARQCNF=${WRKDIR}/config.cnf
ARQRES=${LOGDIR}/dump_${DTHR}.log

echo "Iniciando Dump MySQL em "`date` > ${ARQRES}
echo "" >> ${ARQRES}
echo "[`date +'%H:%M:%S'`] Limpando arquivos antigos em d-${RETENCAO}" >> ${ARQRES}

find ${BKPDIR} -mtime ${RETENCAO} -name '*.sql.gz' -exec rm {} \; 2>&1 >> ${ARQRES}
find ${TARDIR} -mtime ${RETENCAO} -name '*.tar' -exec rm {} \; 2>&1 >> ${ARQRES}

mysql --defaults-extra-file=${ARQCNF} -N <<eof > ${ARQSCH} 2>> ${ARQRES}
select distinct table_schema
from information_schema.tables
where table_schema not in ('information_schema','mysql','performance_schema','test','sys')
order by table_schema
eof

RETORNO=`grep ERROR ${ARQRES} | wc -l`
if [ ${RETORNO} -ne 0 ]
then
  exit 1
fi

mysqlbkp () {
  echo "[`date +'%H:%M:%S'`] Início dump do banco ${DB}" >> ${ARQLOG}
  mysqldump --defaults-extra-file=${ARQCNF} --databases ${DB} --routines --single-transaction --log-error=${ARQLOG} | gzip > ${ARQBKP}
  echo "[`date +'%H:%M:%S'`] Fim dump do banco ${DB}" >> ${ARQLOG}
}

for DB in `cat ${ARQSCH}`
do
  echo $JOBS
  echo "[`date +'%H:%M:%S'`] Início dump do banco ${DB}" >> ${ARQRES}
  while [ ${JOBS} -ge ${MAXJOBS} ]
  do
    sleep 2
    JOBS=`ps -ef | grep mysqldump | grep -v grep | wc -l`
  done	
  ARQLOG=${LOGDIR}/dump-${DB}-${DTHR}.log
  ARQBKP=${BKPDIR}/dump-${DB}-${DTHR}.sql.gz   
  mysqlbkp &
  JOBS=`ps -ef | grep mysqldump | grep -v grep | wc -l`
done

while [ ${JOBS} -gt 0 ]
do
  sleep 2
  JOBS=`ps -ef | grep mysqldump | grep -v grep | wc -l`
done	

echo "[`date +'%H:%M:%S'`] Início empacotamento TAR dos arquivos" >> ${ARQRES}

cd ${BKPDIR}
tar cvf ${TARDIR}/dump-${DTHR}.tar dump-*-${DTHR}.sql.gz 2>&1 >/dev/null

echo "" >> ${ARQRES}
echo "Encerado Dump MySQL em "`date` >> ${ARQRES}

