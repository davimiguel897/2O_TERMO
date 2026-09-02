CREATE DATABASE OFICINA_DAVI;
USE OFICINA_DAVI;

CREATE TABLE CLIENTES (
    ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
    TELEFONE CHAR(15) NOT NULL,
    EMAIL VARCHCAR(100) NOT NULL,
    NOME_CLIENTE VARHCAR(60) NOT NULL,
    ENDERECO VARCHAR(100) NOT NULL,
    CPF_CLIENTE CHAR(14) NOT NULL UNIQUE,
    DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

create table if not exists veiculo (
id_veiculo int auto_increment primary key,
modelo_veiculo varchar(30) not null,
placa_veiculo varchar(7) not null,
tipo_veiculo varchar(40) not null,
marca_veiculo varchar(50) not null,
ano_veiculo date not null
);

create table if not exists funcionarios (
id_funcionarios int auto_increment primary key,
nome varchar(50) not null,
telefone varchar(15) not null,
cpf varchar(14) not null unique,
cargo varchar(30) not null,
email varchar(255) not null unique
);

create table if not exists marcas (
id_marcas int auto_increment primary key,
pais_origem varchar(30) not null,
cnpj_marca varchar(14) not null,
nome_marca varchar(50) not null,
contato_marca varchar(19) not null,
tipo_marca varchar(30) not null
);

create table if not exists pagamentos (
id_pagamentos int auto_increment primary key,
horario_pagamentos timestamp default current_timestamp,
pedido varchar(40) not null,
data_pagamento date not null,
preco float not null,
forma_pagamento enum('credito', 'debito', 'pix', 'dinheiro') default "pix"
);

create table if not exists modelos_fab (
id_modelos_fab int auto_increment primary key,
descricao varchar(255) not null,
categoria varchar(40) not null,
tipo_modelo varchar(30) not null,
nome_modelo varchar(50) not null,
motorizacao varchar(30) not null
);

create table servicos (
id_servicos int auto_increment primary key,
prazo_servico date not null,
horario_servico timestamp default current_timestamp,
tipo_servico enum('reparo_pecas', 'eletrica', 'manutencao_preventiva', 'troca_peca') default 'reparo_pecas',
data_servico date not null,
funcionario_responsavel varchar(60) not null
);

CREATE TABLE ordens_servicos (
id_os INT AUTO_INCREMENT PRIMARY KEY,
veiculo_recebido varchar(50) not null,
valor_servico float not null,
tipo_servico varchar(50) not null,
data_servico date not null,
nome_cliente varchar(60) not null
);

create table if not exists pecas (
id_pecas int auto_increment primary key,
preco_custo decimal(2,2) default 0.00,
quantidade_estoque int not null,
preco_venda decimal(2,2) default 0.00,
descricao varchar(255) not null,
nome_peca varchar(60) not null
);

create table if not exists fornecedores (
id_fornecedores int auto_increment primary key,
contato_fornecedor varchar(19) not null,
nome_fornecedor varchar(60) not null,
endereco_fornecedor varchar(255) not null,
email_fornecedor varchar(320) not null,
prazo_entrega date not null
);

create table if not exists categoria (
id_categoria int auto_increment primary key,
nome varchar(40) not null,
observacoes varchar(255) not null,
status_categoria enum('ativo', 'inativo') default 'ativo',
data_criacao timestamp default current_timestamp,
descricao varchar(255) not null
);

drop table categoria