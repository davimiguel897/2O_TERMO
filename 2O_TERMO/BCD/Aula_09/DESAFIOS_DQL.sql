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

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
select p.id_pedido, p.data_pedido, c.nome AS nome_cliente, p.status, p.valor_total
from pedido p
inner join cliente c on p.id_cliente = c.id_cliente;

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT p.nome AS nome_produto, c.nome AS nome_categoria
FROM produto p
INNER JOIN categoria c ON p.id_categoria = c.id_categoria;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H %i') AS DATA, C.NOME AS CLIENTE, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME;


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS = 'PREPARANDO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT COUNT(PR.ID_PRODUTO) AS PRODUTOS, ROUND(AVG(PR.PRECO),2) AS PRECO_MEDIO
FROM CATEGORIA AS CA
INNER JOIN PRODUTO AS PR
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA
ORDER BY PRECO_MEDIO DESC;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT NOME, PRECO
FROM PRODUTO
WHERE PRECO > (SELECT AVG(PRECO)
FROM PRODUTO
)
ORDER BY PRECO DESC;


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
SELECT NOME, PRECO,
CASE
    WHEN PRECO < 8.00 THEN 'Econômico'
    WHEN PRECO < 15.00 THEN 'Intermediário'
    ELSE 'Premium'
END AS CLASSIFICAÇÃO
FROM PRODUTO
ORDER BY PRECO;

-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
-- 25 - Mostre os produtos que nunca foram vendidos, ou seja, que não possuem nenhum item de pedido associado.

SELECT P.NOME AS PRODUTO, C.NOME AS CATEGORIA
FROM PRODUTO AS P
LEFT JOIN ITEM_PEDIDO AS IP
ON IP.ID_PRODUTO = P.ID_PRODUTO
LEFT JOIN CATEGORIA AS C
ON C.ID_CATEGORIA = P.ID_CATEGORIA
WHERE IP.ID_PRODUTO IS NULL

--
-- Por que essa informação é útil?
-- Pois permite identificar produtos que não estão gerando receita, ajudando na tomada de decisões sobre estoque, marketing e promoções. 

-- Consulta:
-- Aula_09