-- Active: 1788351678735@@127.0.0.1@3306@smartcoffee_dml_davi
USE SMARTCOFFEE_DML_DAVI;

-- INSERINDO DADOS NO BD
-- DML: INSERTS, UPDATE, DELETE

INSERT INTO cliente (`NOME`, `EMAIL`, `TELEFONE`, `CIDADE`, `ATIVO`) VALUES
('Adryan Costa', 'adryan@email.com', '19999999981', 'Limeira', TRUE),
('Ana Francisca', 'anaf@email.com', '19999999982', 'Lençois Paulista', TRUE),
('Anna Julia', 'anaj@email.com', '19999999983', 'Limeira', TRUE),
('Beatriz Barros', 'beatrizb@email.com', '19999999984', 'Limeira', TRUE),
('Beatriz Santana', 'beatrizs@email.com', '19999999985', 'Limeira', TRUE),
('Bruno Dias', 'brunod@email.com', '19999999986', 'Limeira', TRUE),
('Cristopher da Costa', 'cristopher@email.com', '19999999987','Mogi Guaçu', TRUE),
('Davi Guerra', 'davi@email.com', NULL, 'Limeira', TRUE),
('Gabriel Lucio', 'gabriell@email.com', '1999999987', 'Limeira', TRUE),
('Gabriela', 'gabriela@email.com', '1999999980', 'Limeira', TRUE),
('Giovana Santana', 'giovana@email.com', NULL, 'Limeira', FALSE),
('Gustavo Couto', 'gustavo@email.com', '19999999910', 'Ipatinga', FALSE),
('Isabeli Souza', 'isabeli@email.com', NULL, 'Ipatinga', TRUE),
('Jacó Souza', 'jaco@email.com', '1999999988', 'Limeira', TRUE),
('John Pierre', 'john@email.com', '1999999989', 'Cap Haitien', TRUE),
('Jonas Dawid', 'jonas@email.com', '1999999990', 'Rio de Janeiro', TRUE),
('Juan Pablo', 'juan@email.com', '1999999991', 'Limeira', TRUE),
('Julia Fernanda', 'julia@email.com', '1999999992', 'Limeira', TRUE);

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Manteiga Giovana', 14.00, TRUE, 6)

INSERT INTO pedido (DATA_PEDIDO, status, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 14.00, 87)

SET @pedido = LAST_INSERT_ID
SELECT @pedido

--------------------------------------------------------------------------

-- ATUALIZANDO OU MODIFICANDO DADOS NO BD
-- EX 1: ATUALIZANDO INFORMAÇÕES INDIVIDUAIS
UPDATE cliente
SET telefone = '19999999967'
WHERE id_cliente = 85;

-- EX 2: ATUALIZANDO MAIS DO QUE UM CAMPO
UPDATE cliente
SET telefone = '1999888016',
    cidade = 'Cap Haitien'
WHERE id_cliente = 87;

-- EX 3: ATUALIZANDO COM CONDICIONAIS
UPDATE produto
SET preco = preco * 0.50
WHERE id_categoria = 1;

--------------------------------------------------------------------------

-- APAGANDO DADOS
-- EX 1: APAGAR DADOS SEM CONTER INFORMAÇÕES

DELETE FROM cliente;

-- EX 2: APAGAR DADOS COM CONDIÇÕES
DELETE FROM cliente
WHERE id_cliente = 70;

-- EX 3: APAGANDO DADOS DE TODA TABELA
TRUNCATE TABLE cliente;

-- EX 4; APAGAR DE FORMA REPRESENTATIVA OU LÓGICA
UPDATE produto
SET ativo = FALSE
WHERE id_produto = 19;

--------------------------------------------------------------------------
-- REALIZANDO PASSOS PARA UMA COMPRA NO SMARTCOFFEE
-- PASSO 1: CADASTRAR UM NOVO CLIENTE

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Bruno A', 'brunoa@email.com', '1999123456', 'Piracicaba', TRUE)

SET @cliente = LAST_INSERT_ID();

-- PASSO 2: CRIAR O PEDIDO

INSERT INTO PEDIDO (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, 10)

SET @pedido = LAST_INSERT_ID();

-- PASSO 3: INSERIR ITENS NO PEDIDO

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido, 90, 3, 73.13),
(@pedido, 95, 4, 11.25);

-- PASSO 4: ATUALIZAR O TOTAL E STATUS
UPDATE pedido
SET valor_total = 84.38,
    status = 'Preparando'
WHERE id_pedido = @pedido;

-- PASSO 5: REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido, 1, 84.38, NOW());

delete from pagamento
where id_pagamento = 1;

---------------------------------------------------------------------

UPDATE cliente
SET ativo = TRUE
WHERE id_cliente = 84;

-- NUNCA, JAMAIS, NEVER ESQUEÇAM DE UTILIZAR O WHERE 😡😡

-- REGRA DE OURO

-- PRIMEIRA ETAPA
SELECT * FROM cliente
WHERE id_cliente = 87;

-- SEGUNDA ETAPA

UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 115;







-- CONSULTAR DADOS EM TABELA BD
SELECT * FROM item_pedido;

-- CONSULTAR TODA TABELA
SELECT * FROM produto

-- CONSULTAR DADO INDIVIDUAL POR ID
SELECT * FROM cliente
WHERE id_cliente = 115;