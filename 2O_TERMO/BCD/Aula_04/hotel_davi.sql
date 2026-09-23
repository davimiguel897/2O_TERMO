-- 1
-- COMANDO PARA CRIAR BD
create database if not exists hotel_davi;

-- 2
-- ATUALIZAR SCHEMAS

-- 3
-- COMANDO PARA ATIVAR BD
use hotel_davi;

-- COMANDO PARA CRIAR TABELA
-- 4
create table if not exists clientes (
id_cliente int auto_increment primary key,
nome varchar(40) not null,
data_nascimento date not null,
telefone varchar(15) not null,
endereco varchar(100),
cpf varchar(14) not null unique,
status_clientes enum ('pendente', 'ativo', 'inativo') default "ativo",
data_cadastro timestamp default current_timestamp
);

create table funcionarios (
id_funcionario int auto_increment primary key,
cargo varchar(30) not null,
endereco varchar(60) not null,
nome varchar(40) not null,
cpf varchar(14) not null unique,
data_admissao date not null
email varchar(150) not null unique
);

create table produto (
id produto auto_increment primary key,
categoria varchar(30) not null,
reserva varchar(40) not null,
alimentos enum('comida', 'bebida', 'sobremesa') default "comida",
preco float not null,
nome varchar(40) not null

create table pagamentos
horario_pagamentos date not null
float not null
troco float not null
desconto float not null
forma_pagamento enum('credito', 'debito', 'pix', 'dinheiro') default "pix"


-- comando para apagar bd
-- drop database hotel_davi;

-- COMANDO PARA APAGAR TABELA
-- drop table clientes;

-- COMANDOS PARA ALTERAR E CORRIGIR
-- ADICIONANDO UM CAMPO (ATRIBUTO) NOVO
alter table clientes add email varchar(100);

-- MODIFICAR TIPO DE DADOS OU CAMPOS
ALTER TABLE CLIENTES MODIFY EMAIL(150);

-- RENOMEAR TABELAS
rename table clientes to clients;

-- EXCLUIR ATRIBUTO
alter table clients drop column email;

-- VISUALIZAR TABELAS NO BD
show tables;

-- LIMPAR DADOS DA TABELA
truncate table clients;


