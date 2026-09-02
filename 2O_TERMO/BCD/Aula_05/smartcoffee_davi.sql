-- Projeto Smartcoffee --

create database smartcoffee_davi;
use smartcoffee_davi;

create table if not exists clientes (
id_clientes int auto_increment primary key,
nome varchar(50) not null,
telefone varchar(15) not null,
cpf varchar(14) not null unique,
status_cliente enum ('ativo', 'inativo') default "ativo",
data_cadastro timestamp default current_timestamp
);

create table if not exists funcionarios (
id_funcionarios int auto_increment primary key,
nome varchar(50) not null,
telefone varchar(15) not null,
cpf varchar(14) not null unique,
cargo varchar(30) not null,
email varchar(255) not null unique,
);

create table if not exists produto (
id_produto int auto_increment primary key,
categoria varchar(30) not null,
descricao varchar(255) not null,
nome varchar(40) not null,
preco decimal(2,2) default 0.00,
alimentos enum('bebidas', 'salgados', 'doces') default "bebidas"
);

create table if not exists pagamentos (
id_pagamentos int auto_increment primary key,
horario_pagamentos date not null,
preco decimal(3,2) default 0.00,
troco float not null,
desconto float not null,
forma_pagamento enum('credito', 'debito', 'pix', 'dinheiro') default "pix"
);

create table if not exists pedidos (
id_pedidos int auto_increment primary key,
horario_pedidos timestamp default current_timestamp,
quantidade int not null,
produto varchar(40) not null
);

create table categoria (
id_categoria int auto_increment primary key,
nome varchar(40) not null,
observacoes varchar(255) not null,
status_categoria enum('ativo', 'inativo') default 'ativo',
data_criacao timestamp default current_timestamp,
descricao varchar(255) not null
);

create table delivery (
id_delivery int auto_increment primary key,
entregador varchar(50) not null,
horario_entrega timestamp default current_timestamp,
frete enum('gratis', 'pago') default 'pago',
endereco varchar(255) not null,
preco_frete decimal(2,2) default 0.00
);

CREATE TABLE programa_fidelidade (
id_programa_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
cliente INT NOT NULL,
data_cadastro DATE NOT NULL,
pontos INT NOT NULL DEFAULT 0,
historico_transferencias TEXT,
desconto DECIMAL(5,2) DEFAULT 0.00,
);


