-- PARTE A
-- 1
SELECT * FROM cliente

-- 2
SELECT nome, cidade, email FROM cliente;

-- 3
SELECT DISTINCT cidade AS Cidade FROM cliente 
WHERE cidade IS NOT NULL;

-- 4
SELECT nome, preco
FROM produto
ORDER BY preco ASC;

-- 5
SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 5;

-- PARTE B

-- 6
SELECT preco 
FROM produto
WHERE preco BETWEEN 8 AND 15;

-- 7
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Americana';

-- 8
SELECT nome
FROM produto
WHERE nome LIKE 'Café%';

-- 9
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL

-- 10 (status = FINALIZADO, valor_total >= 20, ORDER BY DESC)
SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE status = 'FINALIZADO'
AND valor_total >= 20
ORDER BY valor_total DESC;

-- PARTE C

-- 11
SELECT id_categoria, COUNT(*) AS QTDE_PRODUTOS
FROM produto
GROUP BY id_categoria;

-- 12
SELECT MIN(preco) AS MENOR, MAX(preco) AS MAIOR, AVG(preco) AS MÉDIA
FROM produto;

-- 13
SELECT cidade, COUNT(*) AS QTDE_CIDADES
FROM cliente
GROUP BY cidade;

-- 14
SELECT cidade, COUNT(*) AS QUANTIDADE_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

--15
SELECT SUM(valor_total) AS FATURAMENTO_TOTAL
FROM pedido
WHERE status = 'FINALIZADO'