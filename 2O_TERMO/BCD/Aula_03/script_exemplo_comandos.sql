-- comentários
-- O ícone de relâmpago executa o script
-- O ícone de relâmpago com linha executa o script apenas na linha selecionada pelo mouse
-- O ícone de relâmpago com lupa abre uma explicação sobre o comandocpf

-- Comando pra criar banco de dados
create database exemplo;

-- Comando pra apagar banco de dados
-- drop database exemplo;

-- Comando para ativar o banco de dados
use exemplo;

-- COmando para criar tabelas
create table clientes (
id_cliente int auto_increment primary key,
nome varchar(60) not null,
cpf varchar(14) not null unique,
telefone varchar(15) not null,
endereco varchar(60) not null,
email varchar (100) not null
);

-- Comando para apagar tabelas do banco
-- drop table clientes;