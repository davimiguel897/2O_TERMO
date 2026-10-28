-- Active: 1788351678735@@127.0.0.1@3306@biblioteca_som2_davi

-- FASE 1

--------------------------------------

CREATE DATABASE IF NOT EXISTS biblioteca_som2_davi;

--------------------------------------

CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);

--------------------------------------

CREATE TABLE LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0,
    CONSTRAINT QUANTIDADE CHECK (quantidade_disponivel >= 0)
);

--------------------------------------

alter table livro add editora VARCHAR(100);
alter table livro add id_categoria INT NOT NULL;
alter table livro add CONSTRAINT ck_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria);

--------------------------------------

CREATE TABLE EMPRESTIMO (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO',
    CONSTRAINT ck_status_emprestimo CHECK (status_emprestimo = 'ABERTO'),
    CONSTRAINT ck_id_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    CONSTRAINT ck_id_livro FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro)
);

--------------------------------------

CREATE TABLE FORNECEDOR (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    cnpj CHAR(14) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) UNIQUE
);

--------------------------------------

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(60) NOT NULL UNIQUE
);

--------------------------------------

-- FASE 2

--------------------------------------

INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Davi Guerra', 'daviguerra@email.com', '19999999967', TRUE),
('Bruno Moraes', 'brunomoraes@email.com', NULL, TRUE),
('Leonam Bittencourt', 'leonambitten@email.com', '19999999999', TRUE),
('Luis Fernando', 'luisfernando@email.com', '19999999998', TRUE);

--------------------------------------

INSERT INTO CATEGORIA (NOME) VALUES
('Terror'),
('Comédia'),
('Suspense'),
('Romance'),
('SCI-FI');

--------------------------------------

INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, id_categoria) VALUES
('Pequeno Príncipe', 'Francês Aleatório', '1992374987698', 1890, 9, 1),
('Alice no País das Maravilhas', 'Lewis Carroll', '1234567891011', 1870, 9, 5),
('Sherlock Holmes', 'Eu', '7777777777777', 1880, 9, 3),
('Diário de um Banana', 'Banana Maçã', '6666666666666', 2000, 8, 1),
('Diário de um Professor', 'Celso Ricardo de Carvalho', '1234567891012', 2025, 4, 2),
('Dom Casmurro', 'Machado de Assis', '1234567891013', 1900, 7, 4);

--------------------------------------

SELECT * FROM categoria

--------------------------------------

INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES
(1, 7, '2026-10-30', '2026-11-05', '2026-11-04', 'ABERTO'),
(2, 10, '2026-10-31', '2026-11-06', '2026-11-06', 'ABERTO'),
(3, 11, '2026-11-01', '2026-11-07', '2026-11-06', 'ABERTO');

--------------------------------------

UPDATE usuario
SET telefone = 19999902109
WHERE id_usuario = 4;

--------------------------------------

INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, id_categoria) VALUES
('A Vida Secreta', 'Alguem', '1929394857183', 2021, 9, 1),
('O Lugar do Tempo', 'Luis', '1222421424122', 2022, 9, 5);

--------------------------------------

update livro
set quantidade_disponivel = quantidade_disponivel + 2
where id_livro = 13 and 14

--------------------------------------

INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Karl Marx', 'karlmarx@email.com', '19988883322', TRUE)

--------------------------------------

DELETE FROM usuario
where id_usuario = 5

--------------------------------------

DELETE FROM usuario
where id_usuario = 1
-- O FOREIGN KEY não permite que ocorra a exclusão de um usuario registrado

-- FASE 3

--------------------------------------

select titulo, autor, quantidade_disponivel FROM livro

--------------------------------------

SELECT * FROM livro
WHERE quantidade_disponivel >= 2
ORDER BY quantidade_disponivel DESC

--------------------------------------

SELECT titulo
FROM livro
WHERE titulo LIKE 'Diário%';

--------------------------------------

SELECT *
FROM livro
WHERE ano_publicacao BETWEEN 2015 and 2025

--------------------------------------

SELECT COUNT(*) AS total_livros, AVG(quantidade_disponivel) AS quantidade_media, MIN(quantidade_disponivel) AS quantidade_minima, MAX(quantidade_disponivel) AS quantidade_maxima, SUM(quantidade_disponivel) AS quantidade_total
FROM livro;

--------------------------------------

SELECT E.id_emprestimo, U.nome AS usuario, L.titulo AS livro, E.data_emprestimo, E.status_emprestimo
FROM emprestimo AS E
INNER JOIN usuario AS U
ON E.id_usuario = U.id_usuario
INNER JOIN livro AS L
ON E.id_livro = L.id_livro;

--------------------------------------

SELECT E.id_emprestimo, E.status_emprestimo
FROM emprestimo as E
where status_emprestimo = 'ABERTO'

--------------------------------------

SELECT id_usuario, COUNT(status_emprestimo) AS quantidade_emprestimos 
FROM emprestimo
GROUP BY id_usuario;

-------------------------------------- 19

SELECT U.NOME, E.ID_EMPRESTIMO, E.DATA_EMPRESTIMO
FROM USUARIO AS U
LEFT JOIN EMPRESTIMO AS E
ON U.ID_USUARIO = E.ID_USUARIO
ORDER BY U.NOME;


-- FASE 4

-------------------------------------- 20

START TRANSACTION;

INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES
(1, 12, '2026-11-03', '2026-11-08', '2026-11-08', 'ABERTO');

UPDATE livro
set quantidade_disponivel = quantidade_disponivel - 1
WHERE id_livro = 12

select * from livro

COMMIT;

-------------------------------------- 21

START TRANSACTION

UPDATE livro
set quantidade_disponivel = 20
WHERE id_livro = 12

select * from livro

ROLLBACK

COMMIT;

-------------------------------------- 22

START TRANSACTION

UPDATE livro
set quantidade_disponivel = 8
WHERE id_livro = 12

SAVEPOINT reajuste_livro

UPDATE livro
SET quantidade_disponivel = 10
WHERE id_livro = 12

ROLLBACK TO SAVEPOINT reajuste_livro

select * from livro

COMMIT;

--------------------------------------------- 23

START TRANSACTION

UPDATE emprestimo
SET status_emprestimo = 'DEVOLVIDO'
where id_emprestimo = 1

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_livro = 7

select * from emprestimo

COMMIT

---------------------------------------------- 24

