create DATABASE castellovers;
use castellovers;

create table if not exists alunos (
    id_aluno BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(60) not null,
    cpf char(14) not null UNIQUE,
    status_aluno enum('ativo', 'inativo', 'concluído') default 'ativo',
    data_cadastro timestamp default CURRENT_TIMESTAMP
);

-- VISUALIZAR TODOS OS BD

SHOW SCHEMAS;

-- VISUALIZAR TABELAS DO BD

SHOW TABLES;

-- DESCRIÇÃO DE ATRIBUTOS DA TABELA ALUNO

DESCRIBE alunos;

-- APAGAR BD

DROP DATABASE CASTELLOVERS;