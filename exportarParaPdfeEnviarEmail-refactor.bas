Sub exportarParaPdfeEnviarEmail()
  ' CODIGO PARA ENVIAR EMAIL
    
    Dim objOutlook As Object
    Dim objEmail As Object
    Dim strMailSubject As String
    Dim strMailBody As String
    Dim intRow As Integer
    Dim strName As String
    Dim strEmail As String

    Dim planilhaOrigem As Worksheet
    Dim planilhaDestino As Worksheet
    Dim colunaOrigem As Range
    Dim celula As Range
    Dim elemento As Variant
    Dim listaElementos As Object ' Usando um Dictionary para armazenar os elementos ?nicos
    
    Dim Data As String
    Data = Format(Now(), "MM-DD-YYYY")
 
   
    ' Defina a planilha de origem
    Set planilhaOrigem = ThisWorkbook.Worksheets("1")
    
    planilhaOrigem.Activate
    
    ' Crie uma nova planilha de destino
    Set planilhaDestino = ThisWorkbook.Worksheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
    planilhaDestino.Name = "Sheet1"
    
    ' Defina a coluna de origem a partir da c?lula F6 at? o ?ltimo elemento
    Set colunaOrigem = planilhaOrigem.Range("F6", planilhaOrigem.Cells(Rows.Count, "F").End(xlUp))
    
    ' Crie um Dictionary para armazenar os elementos ?nicos
    Set listaElementos = CreateObject("Scripting.Dictionary")
 
    ' Percorra cada c?lula na coluna de origem
    ' Percorre cada célula na coluna de origem
For Each celula In colunaOrigem
    elemento = celula.Value
    
    ' Verifica se o elemento não é 'Responsável' e se o critério de filtro é atendido
    If elemento <> "Responsável" And planilhaOrigem.Cells(celula.Row, "Y").Value = "Planejada" Then
        ' Verifica se o elemento já existe no Dictionary
        If Not listaElementos.Exists(elemento) Then
            listaElementos.Add elemento, elemento
        End If
    End If
Next celula
    
    ' Copie os elementos ?nicos para o novo sheet
    planilhaDestino.Cells.Clear ' Limpe o sheet de destino antes de copiar
    planilhaDestino.Range("A1").Resize(listaElementos.Count).Value = Application.Transpose(listaElementos.Keys)
    
    ' Muda a planilha para visualiza??o
    planilhaOrigem.Activate
    
    Dim ws As Worksheet
    Dim lista As Range
    Dim criterios As Range
    Dim criterio As Range
    
    ' Defina a planilha que cont?m a lista de crit?rios
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
  ' Defina a faixa de c?lulas que cont?m a lista de crit?rios
    Dim lastRow As Long
    Dim lastCol As Long

' Determine a ?ltima linha com dados na coluna A
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row

' Determine a ?ltima coluna com dados na linha 1
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column

' Defina a faixa de c?lulas que cont?m a lista de crit?rios
    Set lista = ws.Range("A1:A" & lastRow)

    ' Defina a faixa de c?lulas que cont?m os crit?rios de filtro
    Set criterios = ws.Range("A1:A" & lastRow)
    
    Dim TESTE As Worksheet
    Dim valorCelula As Variant
    Dim valorCelula2 As Variant
    Set TESTE = ThisWorkbook.Sheets("10")
    
    ' Seleciona a célula desejada na planilha
    valorCelula = TESTE.Range("L4").Value
    valorCelula2 = TESTE.Range("N4").Value
    
    
    
    ' Loop atrav?s de cada crit?rio
    For Each criterio In criterios
        ' Atribui o valor do crit?rio atual ? vari?vel "criterio"
        criterioValor = criterio.Value
        
        ' Atualiza o valor na c?lula correspondente na lista de crit?rios
        lista.Cells(criterio.Row, 1).Value = criterioValor
        
         ActiveSheet.ListObjects("Data9").Range.AutoFilter Field:=23, Criteria1:= _
        "Planejada"
        
        ' Aplica o filtro com base no crit?rio atual
        ActiveSheet.ListObjects("Data9").Range.AutoFilter Field:=4, Criteria1:=criterioValor
        
        ' Gera o arquivo PDF com base no crit?rio atual
        ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
            "C:\Users\rootd\OneDrive\Imagens\Saved Pictures\RelatorioDeAtividades-" & criterio.Row & Data & ".pdf", Quality:=xlQualityStandard, _
            IncludeDocProperties:=True, IgnorePrintAreas:=False, OpenAfterPublish:=False
        
        ' Limpa o filtro antes de prosseguir para o pr?ximo crit?rio
        ActiveSheet.ListObjects("Data9").AutoFilter.ShowAllData
        Set objOutlook = CreateObject("Outlook.Application")
    
    ' Loop através das linhas da coluna Email na planilha "settings"
    For intRow = 2 To ThisWorkbook.Sheets("settings").Cells(Rows.Count, 3).End(xlUp).Row
        ' Criar um novo item de email
        Set objEmail = objOutlook.CreateItem(olMailItem)
        
        ' Obter as informações do email e relatório da planilha
        strName = ThisWorkbook.Sheets("settings").Range("B" & intRow).Value
        strEmail = ThisWorkbook.Sheets("settings").Range("C" & intRow).Value
        strMailSubject = ThisWorkbook.Sheets("settings").Range("D2").Value
        strMailBody = ThisWorkbook.Sheets("settings").Range("E2").Value
        
        pdfFilePath = "C:\Users\rootd\OneDrive\Imagens\Saved Pictures\RelatorioDeAtividades-" & criterio.Row & Data & ".pdf" ' Substitua pelo caminho e nome do arquivo PDF gerado
        
        ' Substituir marcadores no corpo do email com informações específicas
        strMailBody = Replace(strMailBody, "<Nome>", strName)
        
        ' Preencher o email com informações
        With objEmail
            .To = strEmail
            .Subject = strMailSubject
            .Body = strMailBody
            .Attachments.Add pdfFilePath ' Anexar o arquivo PDF gerado
            .Send
        End With
        
        ' Limpar o objeto de email para o próximo loop
        Set objEmail = Nothing
    Next intRow
    
    ' Limpar o objeto Outlook
    Set objOutlook = Nothing
        
        
    Next criterio
    
    ' Restaura os valores originais na lista de crit?rios
    ' lista.Value = ""
    Application.DisplayAlerts = False
    
    Sheets("Sheet1").Select
    ActiveWindow.SelectedSheets.Delete
    
    Application.DisplayAlerts = True
    
    ' NOVOS ARQUIVOS PARA EXPORTACAO
    
    ' Dim Data As String Joguei a variavel mais pra cima
    Dim wsheet As Worksheet
    Dim planilhasArquivo1 As String
    Dim planilhasArquivo2 As String
    Dim planilhasArquivo3 As String
    Dim nomeArquivo1 As String
    Dim nomeArquivo2 As String
    Dim nomeArquivo3 As String
    
    ' Data = Format(Now(), "MM-DD-YYYY") Joguei a data mais pra cima
    
    ' Definir quais planilhas devem ser inclu?das em cada arquivo PDF
    planilhasArquivo1 = "2"
    planilhasArquivo2 = "3,4,5,6,7,8"
    planilhasArquivo3 = "1,0"
    
    ' Nomear os arquivos de acordo com a data atual
    nomeArquivo1 = "C:\Users\rootd\OneDrive\Imagens\Saved Pictures\Kanban " & Data & ".pdf"
    nomeArquivo2 = "C:\Users\rootd\OneDrive\Imagens\Saved Pictures\Dashboards " & Data & ".pdf"
    nomeArquivo3 = "C:\Users\rootd\OneDrive\Imagens\Saved Pictures\Tasks " & Data & ".pdf"
    ' nomeArquivo1 = "C:\Users\rootd\COMPASS BUILD CONTROL LTDA\Ambiente Controlado - PUBLICAÇÕES\" & valorCelula & "\" & valorCelula2 & "\03_Acompanhamento Contratual\03_Quadro KAMBAN\Kanban " & Data & ".pdf"
    ' nomeArquivo2 = "C:\Users\rootd\COMPASS BUILD CONTROL LTDA\Ambiente Controlado - PUBLICAÇÕES\" & valorCelula & "\" & valorCelula2 & "\03_Acompanhamento Contratual\02_Ordem de Serviço\Dashboards " & Data & ".pdf"
    ' nomeArquivo3 = "C:\Users\rootd\COMPASS BUILD CONTROL LTDA\Ambiente Controlado - PUBLICAÇÕES\" & valorCelula & "\" & valorCelula2 & "\03_Acompanhamento Contratual\04_Relatório de Atividades\Tasks " & Data & ".pdf"
    
    ' Exportar as planilhas do arquivo 1 para um ?nico PDF
    Dim planilhas1 As Variant
    planilhas1 = Split(planilhasArquivo1, ",")
    ThisWorkbook.Sheets(planilhas1).Select
    ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:=nomeArquivo1
    
    ' Exportar as planilhas do arquivo 2 para um ?nico PDF
    Dim planilhas2 As Variant
    planilhas2 = Split(planilhasArquivo2, ",")
    ThisWorkbook.Sheets(planilhas2).Select
    ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:=nomeArquivo2

    planilhaOrigem.Activate
    ActiveSheet.ListObjects("Data9").Range.AutoFilter Field:=23, Criteria1:= _
        "Planejada"
    Dim planilhas3 As Variant
    planilhas3 = Split(planilhasArquivo3, ",")
    ThisWorkbook.Sheets(planilhas3).Select
    ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:=nomeArquivo3
    MsgBox "Exportado com sucesso!"

    ' CODIGO PARA ENVIAR EMAIL
    
   ' Dim objOutlook As Object
   ' Dim objEmail As Object
   ' Dim strMailSubject As String
   ' Dim strMailBody As String
   ' Dim intRow As Integer
    'Dim strName As String
   ' Dim strEmail As String
    
    ' Inicializar o objeto Outlook
    Set objOutlook = CreateObject("Outlook.Application")
    
    ' Loop através das linhas da coluna Email na planilha "settings"
    For intRow = 2 To ThisWorkbook.Sheets("settings").Cells(Rows.Count, 3).End(xlUp).Row
        ' Criar um novo item de email
        Set objEmail = objOutlook.CreateItem(olMailItem)
        
        ' Obter as informações do email e relatório da planilha
        strName = ThisWorkbook.Sheets("settings").Range("B" & intRow).Value
        strEmail = ThisWorkbook.Sheets("settings").Range("C" & intRow).Value
        strMailSubject = ThisWorkbook.Sheets("settings").Range("D2").Value
        strMailBody = ThisWorkbook.Sheets("settings").Range("E2").Value
    
        
        ' Substituir marcadores no corpo do email com informações específicas
        strMailBody = Replace(strMailBody, "<Nome>", strName)
        
        ' Preencher o email com informações
        With objEmail
            .To = strEmail
            .Subject = strMailSubject
            .Body = strMailBody
            .Attachments.Add nomeArquivo1
            .Attachments.Add nomeArquivo2
            .Attachments.Add nomeArquivo3
            .Send
        End With
        
        ' Limpar o objeto de email para o próximo loop
        Set objEmail = Nothing
    Next intRow
    
    ' Limpar o objeto Outlook
    Set objOutlook = Nothing
    
    MsgBox "Relatórios enviados com sucesso!"
    
End Sub


Function IsInArray(val As Variant, arr As Variant) As Boolean
    Dim element As Variant
    For Each element In arr
        If element = val Then
            IsInArray = True
            Exit Function
        End If
    Next element
    IsInArray = False
End Function
