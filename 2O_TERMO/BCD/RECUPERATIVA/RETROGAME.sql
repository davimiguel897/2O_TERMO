-- Active: 1794917652827@@127.0.0.1@3306@retrogame_davi
DROP DATABASE IF EXISTS RETROGAME_DAVI;

-- FASE 1 - DDL

CREATE DATABASE IF NOT EXISTS RETROGAME_DAVI;

USE RETROGAME_DAVI;

CREATE TABLE PLATAFORMA(
    id_plataforma INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT PK_PLATAFORMA PRIMARY KEY(ID_PLATAFORMA)
);

CREATE TABLE CATEGORIA(
    id_categoria INT AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT PK_CATEGORIA PRIMARY KEY(ID_CATEGORIA)
);

CREATE TABLE CLIENTE(
    ID_CLIENTE INT AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20),
    ATIVO BOOLEAN DEFAULT TRUE,

    CONSTRAINT PK_ID_CLIENTE PRIMARY KEY (ID_CLIENTE),
    CONSTRAINT UQ_EMAIL UNIQUE(EMAIL)
);

CREATE TABLE JOGO(
    ID_JOGO INT AUTO_INCREMENT,
    TITULO VARCHAR(150) NOT NULL,
    CODIGO CHAR(13) NOT NULL UNIQUE,
    ANO_LANCAMENTO INT NOT NULL,
    QUANTIDADE_DISPONIVEL INT DEFAULT 0 CHECK (QUANTIDADE_DISPONIVEL >= 0),
    ID_PLATAFORMA INT,
    ID_CATEGORIA INT,

    CONSTRAINT PK_JOGO PRIMARY KEY (ID_JOGO),
    CONSTRAINT UQ_CODIGO UNIQUE(CODIGO),
    CONSTRAINT ID_PLATAFORMA FOREIGN KEY (ID_PLATAFORMA) REFERENCES PLATAFORMA(ID_PLATAFORMA),
    CONSTRAINT ID_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE LOCACAO (
    id_locacao INT AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL, 
    status_locacao VARCHAR(20) DEFAULT 'ABERTA' CHECK(status_locacao IN ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL,

    CONSTRAINT PK_locacao PRIMARY KEY (id_locacao),
    CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente),
    CONSTRAINT fk_jogo FOREIGN KEY (id_jogo) REFERENCES JOGO (id_jogo)
)

ALTER TABLE JOGO ADD DESENVOLVEDORA VARCHAR(100);
ALTER TABLE categoria ADD NOME VARCHAR(50);
-------------------------------------------------------------------------------------------------
-- FASE 2 - DML

INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, ATIVO) VALUES 
('BRUNO', 'BRUNO@EMAIL.COM', '12345587', TRUE),
('DAVI', 'DAVI@EMAIL.COM', '12345522', TRUE),
('GABRIEL', 'GABRIEL@EMAIL.COM', NULL, TRUE),
('JOHN', 'JOHN@EMAIL.COM', '12346666', TRUE)

INSERT INTO PLATAFORMA (NOME) VALUES
('PSP'),
('MEGA-DRIVE')

INSERT INTO categoria (NOME, DESCRICAO) VALUES
('Terror', 'Jogos que dão medo'),
('Ação', 'Jogos radicais')

INSERT INTO JOGO (TITULO, CODIGO, ANO_LANCAMENTO, QUANTIDADE_DISPONIVEL, DESENVOLVEDORA) VALUES
('Resident Evil', '9223458291231', 1996, 10, 'Capcom'),
('Resident Evil 2', '9923184921213', 1998, 15, 'Capcom'),
('God of War', '8885747473829', 2005, 10, 'Santa Monica Studio'),
('Gun', '888749502933', 2005, 7, 'Neversoft Entertainment'),
('The Legend of Zelda: Majora Mask', '2293940039532', 2000, 10, 'Nintendo'),
('God of War 2', '222323211933', 2007, 12, 'Santa Monica Studio')

INSERT INTO locacao (id_cliente, id_jogo, data_retirada, data_prevista, data_devolucao, status_locacao) VALUES
(1, 1, NOW(), '2026-11-05', NULL, 'ABERTA'),
(2, 2, NOW(), '2026-11-06', NULL, 'ABERTA'),
(3, 3, NOW(), '2026-11-07', NULL, 'ABERTA');

UPDATE jogo
SET `QUANTIDADE_DISPONIVEL` = `QUANTIDADE_DISPONIVEL` - 1
WHERE `ID_JOGO` = 1;

UPDATE jogo
SET `QUANTIDADE_DISPONIVEL` = `QUANTIDADE_DISPONIVEL` - 1
WHERE `ID_JOGO` = 2;

UPDATE jogo
SET `QUANTIDADE_DISPONIVEL` = `QUANTIDADE_DISPONIVEL` - 1
WHERE `ID_JOGO` = 3;

SELECT * FROM CLIENTE;

UPDATE CLIENTE
SET TELEFONE = '19999999999'
WHERE `ID_CLIENTE` = 2;

UPDATE jogo
SET `QUANTIDADE_DISPONIVEL` = `QUANTIDADE_DISPONIVEL` + 2
WHERE `ANO_LANCAMENTO` >= 2000;

INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, ATIVO) VALUES 
('RAFAEL', 'RAFAEL@EMAIL.COM', '122255222', TRUE);

DELETE FROM cliente
WHERE id_cliente = 5;

DELETE FROM cliente
WHERE id_cliente = 1;
-- O FOREIGN KEY não permite que ocorra a exclusão de um usuario registrado

-- FASE 3 - DQL

select titulo, ano_lancamento, quantidade_disponivel FROM jogo;

SELECT * FROM jogo
WHERE quantidade_disponivel >= 2
ORDER BY quantidade_disponivel DESC;

SELECT titulo
FROM jogo
WHERE titulo LIKE '%Resident%';

SELECT *
FROM jogo
WHERE `ANO_LANCAMENTO` BETWEEN 1990 and 2005;

SELECT COUNT(*) AS TOTAL, AVG(quantidade_disponivel) AS MEDIA, MIN(quantidade_disponivel) AS MINIMO, MAX(quantidade_disponivel) AS MAXIMO, SUM(quantidade_disponivel) AS QUANTIDADE_TOTAL
FROM JOGO;

SELECT E.id_locacao, U.nome AS cliente, L.titulo AS jogo, E.data_retirada, E.status_locacao
FROM locacao AS E
INNER JOIN cliente AS U
ON E.id_cliente = U.id_cliente
INNER JOIN jogo AS L
ON E.id_jogo = L.id_jogo;

SELECT E.id_locacao, E.status_locacao
FROM locacao as E
where status_locacao = 'ABERTA';

SELECT id_cliente, COUNT(status_locacao) AS quantidade_locacoes 
FROM locacao
GROUP BY id_cliente;

SELECT U.NOME, E.ID_LOCACAO, E.DATA_RETIRADA
FROM CLIENTE AS U
LEFT JOIN LOCACAO AS E
ON U.ID_CLIENTE = E.ID_CLIENTE
ORDER BY U.NOME DESC;

-- FASE 4 - TCL
-------------------------------------------------------------------------------------------------

START TRANSACTION;

INSERT INTO locacao (id_cliente, id_jogo, data_retirada, data_prevista, data_devolucao, status_locacao) VALUES
(1, 2, '2026-11-03', '2026-11-08', '2026-11-08', 'ABERTA');

UPDATE jogo
set quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo = 2;

select * from jogo;

COMMIT;

-------------------------------------

START TRANSACTION;

UPDATE jogo
set quantidade_disponivel = 20
WHERE id_jogo = 2;

select * from jogo;

ROLLBACK;

COMMIT;

-------------------------------------

START TRANSACTION;

UPDATE jogo
set quantidade_disponivel = 8
WHERE id_jogo = 3;

SAVEPOINT reajuste_jogo;

UPDATE jogo
SET quantidade_disponivel = 10
WHERE id_jogo = 3;

ROLLBACK TO SAVEPOINT reajuste_jogo;

select * from jogo;

COMMIT;

-------------------------------------------------------

START TRANSACTION;

UPDATE locacao
SET status_locacao = 'DEVOLVIDA'
where id_locacao = 1;

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_jogo = 6;

select * from locacao;

COMMIT;

----------------------------------------------------------------------------

-- Análise Técnica
-- a) recurso que evita email repetido: CONSTRAINT
-- b) recurso que evita codigo de jogo repitido: CONSTRAINT
-- c) recurso que evita estoque negativo: CHECK
-- d) recurso que evita locação de cliente inexistente: FOREIGN KEY
-- e) recurso que evita exclusão de jogo com histórico: FOREIGN KEY
-- f) recurso que evita locação gravada sem baixa de estoque: TRANSACTION
-- g) recurso que evita locação quando não há unidades disponíveis: CHECK