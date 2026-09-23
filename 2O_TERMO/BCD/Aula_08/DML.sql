-- Active: 1788351678735@@127.0.0.1@3306@smartcoffee_dml_davi
-- SMARTCOFFEE BASE DE DADOS - DML
-- EXECUTE SEMPRE QUE QUISER RESTAURAR A AULA

-- DROP DATABASE IF EXISTS SMARTCOFFEE_DML_DAVI;

CREATE DATABASE SMARTCOFFEE_DML_DAVI;

USE SMARTCOFFEE_DML_DAVI;
CREATE TABLE CLIENTE (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) UNIQUE,
    TELEFONE VARCHAR(20),
    CIDADE VARCHAR(60) NOT NULL,
    ATIVO BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE PRODUTO (
    ID_PRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    PRECO DECIMAL(10,2) NOT NULL,
    ATIVO BOOLEAN NOT NULL DEFAULT TRUE,
    ID_CATEGORIA INT NOT NULL,
    -- CONSTRAINT: SIGNIFICA UMA RESTRIÇÃO E DECLARAÇÃO DE CHAVE ESTRANGEIRA
    CONSTRAINT FK_PRODUTO_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA) 
);

CREATE TABLE PEDIDO (
    ID_PEDIDO INT PRIMARY KEY AUTO_INCREMENT,
    DATA_PEDIDO DATETIME NOT NULL,
    STATUS ENUM('ABERTO','PREPARANDO','FINALIZADO','CANCELADO') NOT NULL,
    VALOR_TOTAL DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    ID_CLIENTE INT NOT NULL,
    CONSTRAINT FK_PEDIDO_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

CREATE TABLE ITEM_PEDIDO (
    ID_ITEM INT PRIMARY KEY AUTO_INCREMENT,
    ID_PEDIDO INT NOT NULL,
    ID_PRODUTO INT NOT NULL,
    QUANTIDADE INT NOT NULL,
    PRECO_UNITARIO DECIMAL(10,2) NOT NULL,
    OBSERVACAO VARCHAR(150),
    CONSTRAINT FK_ITEM_PEDIDO FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    CONSTRAINT FK_ITEM_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

create table forma_pagamento (
    ID_FORMA_PAGAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE PAGAMENTO (
    ID_PAGAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    ID_PEDIDO INT NOT NULL,
    ID_FORMA_PAGAMENTO INT NOT NULL,
    VALOR DECIMAL(10,2) NOT NULL,
    DATA_PAGAMENTO DATETIME,
    constraint fk_pagamento_pedido foreign key (ID_PEDIDO) references PEDIDO(ID_PEDIDO),
    constraint fk_pagamento_forma FOREIGN key (ID_FORMA_PAGAMENTO) references FORMA_PAGAMENTO(ID_FORMA_PAGAMENTO)
);

INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
('Ana Silva', 'ana@email.com', '19999999999', 'Limeira', TRUE),
('Bruno Souza', 'bruno@email.com', '19999999999', 'Limeira', TRUE),
('Carlos Pereira', 'carlos@email.com', NULL, 'Americana', TRUE),
('Daniela Costa', 'daniela@email.com', '19999999999', 'Campinas', TRUE),
('Eduardo Santos', 'eduardo@email.com', NULL, 'Limeira', TRUE),
('Fernanda Lima', 'fernanda@email.com', '19999999999', 'Americana', TRUE),
('Gabriel Rocha', 'gabriel@email.com', '19999999999', 'Piracicaba', TRUE),
('Henrique Costa', 'henrique@email.com', NULL, 'Campinas', FALSE),
('Isabela Almeida', 'isabela@email.com', '19999999999', 'Limeira', TRUE),
('João Pereira', 'joao@email.com', '1999999999', 'Limeira', TRUE);

INSERT INTO CATEGORIA (NOME) VALUES
('Bebidas'),
('Comidas'),
('Doces'),
('Salgados'),
('Cafés');

INSERT INTO PRODUTO (NOME, PRECO, ATIVO, ID_CATEGORIA) VALUES
('Croissant', 7.99, TRUE, 1), ('Água Mineral', 2.99, TRUE, 1),
('Suco de Laranja', 4.99, TRUE, 1), ('Suco de Uva', 6.99, TRUE, 1),
('BROWNIE', 3.99, TRUE, 2), ('', 14.99, TRUE, 2), ('Pão de Queijo', 5.99, TRUE, 2),
('Cookie de Chocolate', 4.99, TRUE, 2), ('Pão Francês', 0.99, TRUE, 2), ('Torta de Limão', 9.99, TRUE, 3),
('Bolo de Cenoura', 8.99, TRUE, 3), ('Brigadeiro', 2.99, TRUE, 3),
('Chocolate', 3.99, TRUE, 3), ('Pudim', 4.99, TRUE, 3),
('Tapioca', 7.99, TRUE, 4), ('Esfiha', 6.99, TRUE, 4), ('Coxinha', 5.99, TRUE, 4),
('Salgado', 7.99, TRUE, 4), ('Sanduiche Natural', 7.99, TRUE, 4),
('Café Expresso', 2.99, TRUE, 5), ('Capuccino', 4.99, TRUE, 5),
('Café com Leite', 3.99, TRUE, 5), ('Café Gelado', 3.99, TRUE, 5);

INSERT INTO PEDIDO (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES
('2024-06-01 10:00:00', 'FINALIZADO', 7.80, 1),
('2024-06-02 11:30:00', 'CANCELADO', 5.50, 2),
('2024-06-03 14:15:00', 'FINALIZADO', 12.60, 3),
('2024-06-04 09:45:00', 'CANCELADO', 19.00, 4),
('2024-06-05 16:20:00', 'FINALIZADO', 33.90, 5),
(NOW(), 'ABERTO', 0.00, 6),
(NOW(), 'ABERTO', 0.00, 7);

SET @PEDIDO = LAST_INSERT_ID();
SELECT @PEDIDO

Insert into item_pedido (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, OBSERVACAO) VALUES
(1,1,1,7.00,NULL),
(1,2,2,5.00,'Sem gelo'),
(1,3,1,4.00,NULL),
(3,4,1,6.00,NULL),
(3,5,2,3.00,NULL),
(5,6,1,14.00,NULL),
(5,7,3,5.00,NULL);

insert into forma_pagamento (DESCRICAO) VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('PIX');

insert into pagamento (ID_PEDIDO, ID_FORMA_PAGAMENTO, VALOR, DATA_PAGAMENTO) VALUES
(1,1,7.80,'2024-06-01 10:05:00'),
(3,2,12.60,'2024-06-03 14:20:00'),
(5,3,33.90,'2024-06-05 16:25:00'),
(6,4,0.00, '2024-06-06 12:00:00'),
(7,1,0.00,'2024-06-06 12:05:00');

-- EX 1: UPDATE OU ATUALIZAÇÕES DE DADOS 
UPDATE cliente
SET telefone = 19999902109
WHERE id_cliente = 3;
-- DETERINAR O COMANDO WHERE SEMPRE :)

-- EX 2: ATUALIZANDO VÁRIOS CAMPOS
UPDATE cliente
SET telefone = 19998435675, cidade = 'Campinas'
WHERE id_cliente = 4;

-- EX 3: ATUALIZANDO VÁRIOS REGISTROS
UPDATE produto
SET preco = preco * 0.5
WHERE id_categoria = 1;

-- EX 4: ATUALIZANDO SEM WHERE
-- UPDATE produto
-- SET preco = preco * 1.00;
-- CUIDADO AO UTILIZAR ESSA LINHA

-- EX 5: ATUALIZANDO CONDICCIONAIS
UPDATE produto
SET preco = CASE
    WHEN preco < 10 THEN preco * 1.10
    ELSE preco * 1.05
END
WHERE ativo = TRUE;

--  EX 6: ATUALIZANDO PARA NULL
UPDATE cliente
SET telefone = NULL
WHERE id_cliente = 5;
-- TUDO QUE FOR NULL, NÃO PODE SER USADO EM CONDICIONAIS, COMO WHERE, HAVING, ETC.


------------------------------------------------------------------------------------------------


-- DESAFIO A
INSERT INTO cliente (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
('Lucas Martins', 'lucas@email.com', NULL, 'São Paulo', TRUE),
('Mariana Oliveira', 'mari@email.com', NULL, 'Rio de Janeiro', TRUE);

INSERT INTO categoria (nome) VALUES
('Especiais da Casa');

INSERT INTO produto (NOME, PRECO, ATIVO, ID_CATEGORIA) VALUES
('Café Especial', 12.99, TRUE, 6),
('Café com Leite Especial', 14.99, TRUE, 6),
('Cappuccino Especial', 16.99, TRUE, 6);

INSERT INTO pedido (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES
('2024-06-07 10:00:00', 'FINALIZADO', 0.00, 11),
('2024-06-07 11:30:00', 'FINALIZADO', 0.00, 12);

SET @PEDIDO = LAST_INSERT_ID();
SELECT @PEDIDO

-----------------------------------------------------------------------------------------------

SELECT * FROM pedido;

-- MENSAGEM DE SUCESSO 
SELECT 'Banco de dados realizado com sucesso!' AS Mensagem;
