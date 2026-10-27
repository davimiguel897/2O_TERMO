
-- 01. Consulte produto 2 e seu preço.

SELECT * FROM produto where id_produto = 71

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.

START TRANSACTION

UPDATE produto
SET preco = preco + 3.00
where id_produto = 71


-- 03. Consulte dentro da transação.

SELECT * from produto

-- 04. ROLLBACK.
ROLLBACK

-- 05. Consulte e comprove retorno.
SELECT * from produto

-- 06. Repita a alteração e finalize com COMMIT.
START TRANSACTION

UPDATE produto
SET preco = preco + 3.00
where id_produto = 71

SELECT * from produto

COMMIT;

-- 07. START TRANSACTION e aumente produto 3 em 10%.

START TRANSACTION

UPDATE produto
SET preco = preco * 1.10
WHERE `ID_PRODUTO` = 73

-- 08. SAVEPOINT ajuste_produto3.

SAVEPOINT ajuste_produto3

-- 09. Aumente produto 4 em 50%.
UPDATE produto
SET preco = preco * 1.50
WHERE `ID_PRODUTO` = 74

-- 10. Consulte os dois.

select * from produto;

-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.

ROLLBACK TO SAVEPOINT ajuste_produto3

-- 12. COMMIT e explique em comentário qual alteração permaneceu.

COMMIT;
-- Apenas o produto 3 teve seu preço alterado após o comando ROLLBACK

-- 13. START TRANSACTION.

START TRANSACTION

-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.

INSERT 

-- 15. Insira dois itens válidos.

-- 16. Registre pagamento válido.

-- 17. Consulte pedido, itens e pagamento.

-- 18. COMMIT.

-- 19. START TRANSACTION e crie pedido para cliente 2.

-- 20. Salve o id em @pedido_com_erro.

-- 21. Tente inserir item com id_produto inexistente.

-- 22. Após observar a FK, ROLLBACK.

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.