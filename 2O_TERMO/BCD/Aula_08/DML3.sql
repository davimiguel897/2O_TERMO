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
-- Resposta: A FK bloqueou a exclusão porque o cliente possui pedidos associados na tabela de pedidos. A integridade referencial do banco de dados impede que registros que estão sendo referenciados em outras tabelas sejam excluídos, garantindo que não haja inconsistências nos dados.

-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
create table Excluir_depois (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
drop TABLE Excluir_depois

-- Parte D - Integridade e validação

-- 17. Tente inserir um produto usando uma tabela inexistente.
INSERT INTO categoria_cafe (nome) VALUES
('Café Especial');
-- O erro informado indica que a tabela 'categoria_cafe' não existe no banco de dados. Certifique-se de que a tabela foi criada corretamente antes de tentar inserir dados nela.

-- 18. Tente cadastrar um cliente com um e-mail que já existe.
Insert INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Daniela Martins', 'daniela@email.com', '19999999999', 'São Paulo', TRUE);
-- O erro informado indica que a tentativa de inserir um cliente com um e-mail que já existe na tabela 'cliente' violou a restrição de unicidade (UNIQUE) definida para a coluna 'email'. Isso garante que cada cliente tenha um endereço de e-mail único no banco de dados, evitando duplicidades.

-- 19. Tente criar um pedido para um cliente que não existe.
INSERT INTO pedido (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES
('2024-06-07 12:00:00', 'ABERTO', 50.00, 999);
-- O erro informado indica que a tentativa de criar um pedido para um cliente que não existe violou a restrição de chave estrangeira (FK) definida para a coluna 'ID_CLIENTE'. Isso garante que apenas clientes existentes possam ter pedidos associados.

-- 20. Para cada erro, identifique qual restrição foi responsável

-- Parte E - Desafio Completo

-- 21. Inicie uma transação.
START TRANSACTION

-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.

UPDATE cliente
SET cidade = 'Limeira'
WHERE id_cliente = 3;

INSERT INTO pedido (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES
('2024-06-07 13:00:00', 'ABERTO', 30.00, 3);

Insert into produto (NOME, PRECO, ATIVO, ID_CATEGORIA) VALUES
('Guarana', 6.00, TRUE, 1);


-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.

SELECT p.id_pedido, c.nome AS cliente, i.id_produto, i.quantidade, i.preco_unitario
FROM pedido as p
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
INNER JOIN item_pedido i ON p.id_pedido = i.id_pedido;

-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.

ROLLBACK;
SELECT * FROM pedido

-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos.


-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE
--     ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.