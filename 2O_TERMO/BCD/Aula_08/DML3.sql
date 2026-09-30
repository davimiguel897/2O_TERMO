-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Davi Miguel Guerra
-- Turma: 2DEVIE Data: 30/09/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_davi;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Matheus Oliveira', 'matheuso@email.com', '19999999532', 'Piraporinha do Norte', TRUE),
('Felipe Neto', 'felipen@email.com', '19997665567', 'Rio de Janeiro', FALSE);

SELECT * FROM cliente

-- 2. Cadastre a categoria 'Especiais da Casa'.

INSERT INTO categoria (nome) VALUES
('Especiais da Casa');


-- 3. Localize o id da categoria criada e cadastre três produtos nela.

INSERT INTO produto (NOME, PRECO, ATIVO, ID_CATEGORIA) VALUES
('Café Especial', 12.99, TRUE, 6),
('Café com Leite Especial', 14.99, TRUE, 6),
('Cappuccino Especial', 16.99, TRUE, 6);


-- 4. Cadastre um terceiro cliente sem telefone.

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Marcos Teixeira', 'marcost@email.com', '19385838488', 'Lindoya', FALSE)

-- 5. Crie um novo pedido para um dos clientes cadastrados.

INSERT INTO pedido (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES
('2024-06-07 10:00:00', 'FINALIZADO', 20.00, 93),
('2024-06-07 11:30:00', 'ABERTO', 35.00, 94);


-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @PEDIDO = LAST_INSERT_ID();
SELECT @PEDIDO

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:

UPDATE cliente
SET telefone = '1999998896'
WHERE id_cliente = 93;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.

UPDATE cliente
SET telefone = '19998877878',
    cidade = 'São Paulo'
WHERE id_cliente = 94;


-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.

UPDATE produto
SET preco = preco * 0.50
WHERE id_categoria = 6;


-- 10. Altere o status do pedido criado para 'PREPARANDO'.

SELECT * FROM produto

UPDATE pedido
SET status = 'PREPARANDO'
WHERE id_cliente = 93;


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

UPDATE produto
SET `ATIVO` = FALSE
WHERE id_produto = 72


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Arthur Concollato', 'arthurc@email.com', '19999999922', 'Serra Negra', TRUE)

SELECT * FROM cliente

DELETE FROM cliente
WHERE ID_CLIENTE = 95

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:

DELETE FROM cliente
WHERE id_cliente = 94

-- O cliente não pode ser excluído porque existe uma restrição de chave estrangeira (FK) que impede a exclusão de registros que estão sendo referenciados em outras tabelas, como a tabela de pedidos. Isso garante a integridade referencial do banco de dados, evitando que registros órfãos sejam criados.


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta: A FK bloqueo a exclusão porque o cliente possui pedidos associados na tabela de pedidos. A integridade referencial do banco de dados impede que registros que estão sendo referenciados em outras tabelas sejam excluídos, garantindo que não haja inconsistências nos dados.

-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

INSERT INTO categoria (nome) VALUES
('Excluir Depois');

DELETE FROM categoria
WHERE id_categoria = 7
