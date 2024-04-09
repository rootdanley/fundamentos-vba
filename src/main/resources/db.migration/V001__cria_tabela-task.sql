CREATE TABLE task (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    realizado BIT NOT NULL,
    prioridade INT,
    PRIMARY KEY (id)
);