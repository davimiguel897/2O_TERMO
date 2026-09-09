-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
id_cliente int auto_increment primary key PRIMARY KEY,
nome_cliente varchar (50)
)

CREATE TABLE Pedido (
id_pedido int auto_increment primary key PRIMARY KEY,
quantidade int,
id_cliente int auto_increment primary key,
FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
)

CREATE TABLE Produtos+Estoque (
id_produto int auto_increment primary key,
nome_produto varchar (50),
id_estoque int auto_increment primary key,
valor decimal (10,2),
PRIMARY KEY(id_produto,id_estoque)
)

CREATE TABLE Fornecedores (
id_fornecedor int auto_increment primary key PRIMARY KEY,
razao_social varchar (100)
)

CREATE TABLE Produtos (
id_produto int auto_increment primary key PRIMARY KEY,
nome_produto varchar (100)
)

CREATE TABLE item_produto (
id_produto int,
id_fornecedor int,
id_item int auto_increment primary keu PRIMARY KEY,
quantidade int/*falha: chave estrangeira*//*falha: chave estrangeira*/
)

