-- Active: 1788351678735@@127.0.0.1@3306@smartcoffee_dml_davi
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
('Edson Wladimir', 'edson@email.com', '19999888244', 'Paris', TRUE);

-- Exemplo de estrutura simples de SELECT
-- SELECT coluna
-- FROM tabela

-- EX 1: SELECT PARA CONSULTAR TODAS AS COLUNAS
SELECT * FROM CLIENTE;

-- EX 2: CONSULTANDO POR COLUNAS
SELECT nome, email FROM cliente;

-- EX 3: INSERINDO APELIDO NAS COLUNAS -- ALIAS
SELECT nome AS Cliente
FROM cliente;
SELECT nome AS Cliente, telefone AS Contato, ativo AS Status
FROM cliente;

SELECT nome AS Produto, preco AS Preço, preco * 0.90 AS Preço_Promocional
FROM produto
-- EX 4: DISTINCT - ELIMINAR REPETIÇÕES
SELECT cidade FROM cliente;

SELECT DISTINCT cidade AS Cidade FROM cliente 
WHERE cidade IS NOT NULL;
-- SEM DISTINCT O ITEM IRÁ APARECER VÁRIAS VEZES
-- COM DISTINCT O ITEM IRÁ APARECER SOMENTE UMA VEZ

-- EX 5: FILTRO EM REGISTROS - WHERE
SELECT nome, preco
FROM produto
WHERE preco > 10;
-- RETORNA VALORES ACIMA DE 10 REAIS EM SEUS PREÇOS

SELECT nome, preco
FROM cliente
WHERE ativo = TRUE;

INSERT INTO produto (nome, preco, ativo, `ID_CATEGORIA`) VALUES
('Café Expresso', 15.00, TRUE, 1),
('Café com Leite', 12.00, TRUE, 1),
('Cappuccino', 18.00, TRUE, 1),
('Mocha', 20.00, TRUE, 1),
('Chocolate Quente', 10.00, TRUE, 2);
-- RETORNA PRODUTOS ATIVOS

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;
-- RETORNA PEDIDOS ACIMA DE DETERMINADO VALOR

-- OPERADORES DE COMPARAÇÃO
-- = IGUAL
-- <> ou != DIFERENTE
-- > MAIOR QUE
-- > = MAIOR OU IGUAL
-- < MENOR QUE
-- < = MENOR OU IGUAL

-- EX 6: USO DE AND, OR e NOT
-- AND - TODAS AS CONDIÇÕES DEVEM SER VERDADEIRAS
SELECT nome, preco
FROM produto
WHERE preco > 8 AND preco <= 20;

-- OR - PELO MENOS UMA CONDIÇÃO DEVE SER VERDADEIRA

SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba';

-- NOT - NEGAR NÃO TRAZER RESULTADO QUE FOI APRESENTADO
SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeira';

-- JUNTOS - AND E OR SEMPRE UTILIZAR OS ()
SELECT nome, cidade, ativo AS Status
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Americana');

-- EX 7 PESQUISANDO POR INTERVALOS - BETWEEN
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8 AND 15;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01' AND '2026-09-30 23:59:59'; 


-- EX 8: IN COM VÁRIAS POSSIBLIDADES
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Piracicaba', 'Americana');
SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'CAMPINAS');

-- EX 9: EXEMPLO COM TEXTOS OU PESQUISAR POR TEXTOS - LIKE
-- CORINGAS
--  % VÁRIOS CARACTERES
--  _ EXATAMENTE UM CARACTER

SELECT nome
FROM produto
WHERE nome LIKE 'Café%';
--  RETORNAR PRODUTOS QUE POSSUEM A PALAVRA CAFÉ E QUE COMEÇAM COM ELA

SELECT nome
FROM produto
WHERE nome LIKE '%chocolate';
-- RETORNAR PRODUTOS QUE POSSUEM A PALAVRA CHOCOLATE

SELECT nome
FROM produto
WHERE nome LIKE '%Silva';
-- RETORNAR NOMSE QUE TERMINAM COM SILVA

SELECT nome
FROM produto
WHERE nome LIKE '_afé%'

-- EX 10: NULL - AUSÊNCIA DE VALOR
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;
SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

-- EX 11: ORDER BY - ORDENAR RESULTADOS
-- ASC SIGNIFICA CRESCENET
-- DESC SIGNIFICA DECRESCER

SELECT nome, preco
FROM produto
ORDER BY preco ASC;

SELECT nome, preco
FROM produto
ORDER BY preco DESC;

SELECT cidade, nome
FROM cliente
ORDER BY cidade ASC, nome DESC;

-- EX 12: LIMIT - LIMITANDO A QUANTIDADE DE LINHA

SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 8;

SELECT NOME, PRECO
FROM PRODUTO
ORDER BY nome
LIMIT 5 OFFSET 5;

-- EX 13: CÁLCULO DE COLUNAS
SELECT nome, preco, preco * 1.10 AS preco_atualizado
FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS Total_Compra
FROM item_pedido;

-- EX 14: FUNÇÕES PARA CONSULTA
-- TEXTOS
SELECT UPPER(nome) AS Nome_Cliente, LOWER(email) AS Email
FROM cliente;

SELECT CONCAT(nome, ' - ', cidade) AS Cliente_Cidade
FROM cliente;

-- NÚMEROS
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;

-- DATAS
SELECT id_pedido, data_pedido, DATE(data_pedido) AS DATAS, DAY(data_pedido) AS DIAS, MONTH(data_pedido) AS MÊS, YEAR(data_pedido) AS ANO
FROM pedido;

-- SUBSTITUINDO O NULL NO RESULTADO - COALESCE
SELECT nome, COALESCE(telefone, 'NÃO INFORMADO') AS Contato
FROM cliente;

-- EX 15: FUNÇÕES DE AGREGAÇÃO - SUM, AVG, MIN, MAX, COUNT
-- COUNT - CONTAR QUANTIDADE DE REGISTROS
-- SUM - SOMA DE VALORES
-- AVG - MÉDIA DE VALORES
-- MIN - MENOR VALOR
-- MAX - MAIOR VALOR

SELECT COUNT(*) AS Total_Clientes
FROM cliente;
-- RESULTADO DE QUANTIDADE DE CLIENTES

SELECT AVG(preco) AS Média_Preços
FROM produto;
-- MÉDIA DO VALOR DOS PRODUTOS

SELECT MIN(preco) AS PROMOÇÃO, MAX(preco) AS REAJUSTE, AVG(preco) AS MÉDIA_PREÇOS
FROM produto;
-- RESUMO DE PREÇOS

SELECT SUM(valor_total) AS FATURAMENTO_TOTAL
FROM pedido
WHERE status = 'FINALIZADO'
-- TOTAL DE PEDIDOS FINALIZADOS

-- EX 16: GROUP BY - AGRUPAR DADOS

SELECT cidade, COUNT(*) AS QTDE_CIDADES
FROM cliente
GROUP BY cidade;
-- CONSULTA PR GRUPOS DE CIDADES

SELECT id_categoria, COUNT(*) AS QTDE_PRODUTOS
FROM produto
GROUP BY id_categoria;
-- QUANTIDADE DE PRODUTOS POR CATEGORIA

-- EX 17 HAVING - FILTRO POR GRUPO
SELECT cidade, COUNT(*) AS QUANTIDADE_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;
-- DICA: USAR O HAVING E NÃO ESQUECER O GROUP BY

-------------------------------------------------------------------------
-- EX 18: CONSULTA COMPLETA
SELECT colunas
FROM tabela
WHERE condicao
GROUP BY colunas_agrupar
HAVING condicao
ORDER BY colunas
LIMIT quantidade;
-- DICA PARA SEGUIR EM ORDEM LÓGICA PARA UMA CONSULTA PARCIAL OU COMPLETA
-------------------------------------------------------------------------
