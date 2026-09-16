CREATE TABLE Programa_fidelidade (
id_programa_finalidade INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
data_ultima_atualizacao DATE NOT NULL,
saldo_pontos INT NOT NULL DEFAULT 0,
historico_transferencias TEXT,
desconto DECIMAL(5,2) NOT NULL,
cliente INT NOT NULL,
)

CREATE TABLE Categoria (
id_categoria INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
nome VARCHAR(100) NOT NULL UNIQUE,
observacoes varchar(300) not null,
descricao VARCHAR(255),
data_criacao DATE NOT NULL,
status_pedido BOOLEAN NOT NULL
)

CREATE TABLE Produtos (
categoria VARCHAR(100) NOT NULL,
validade DATE,
preco_unitario DECIMAL(10,2) NOT NULL,
nome VARCHAR(150) NOT NULL,
id_produtos INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
descricao VARCHAR(255)
)

CREATE TABLE Estoque (
id_insumo INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
quantidade_atual INT NOT NULL DEFAULT 0,
unidade_medida int not null,
quantidade_minima INT NOT NULL DEFAULT 0,
nome_insumo varchar(80) not null
)

CREATE TABLE Fornecedor (
id_fornecedor INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
contato varchar(40),
nome VARCHAR(150) NOT NULL,
telefone VARCHAR(20) NOT NULL,
endereco VARCHAR(255) NOT NULL,
cnpj CHAR(14) NOT NULL UNIQUE,
prazo_entrega INT NOT NULL,
local_pedido VARCHAR(100),
email INT NOT NULL
)

CREATE TABLE Clientes (
id_clientes INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
email VARCHAR(150) UNIQUE,
data_cadastro datetime,
CPF CHAR(11) NOT NULL UNIQUE,
endereco VARCHAR(255),
telefone VARCHAR(20) not null
)

CREATE TABLE Funcionarios (
salario DECIMAL(10,2) NOT NULL,
telefone VARCHAR(20),
turno VARCHAR(30) NOT NULL,
cargo VARCHAR(100) NOT NULL,
id_funcionarios INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
email VARCHAR(150) NOT NULL UNIQUE,
CPF CHAR(11) NOT NULL UNIQUE,
data_admissao DATE NOT NULL
)

CREATE TABLE Pedidos (
nome_produto VARCHAR(150) NOT NULL,
status_pedido BOOLEAN NOT NULL,
tipo_pedido varchar(60) not null,
valor_total DECIMAL(10,2) NOT NULL,
id_pedidos INT AUTO_INCREMENT PRIMARY KEY,
data_hora datetime NOT NULL,
)

CREATE TABLE Pagamentos (
id_pagamentos INT AUTO_INCREMENT PRIMARY KEY,
status_pagamento INT NOT NULL,
Pix BOOLEAN DEFAULT FALSE,
cheque BOOLEAN DEFAULT FALSE,
dinheiro BOOLEAN DEFAULT FALSE,
debito BOOLEAN DEFAULT FALSE,
credito BOOLEAN DEFAULT FALSE,
vale_alimentacao BOOLEAN DEFAULT FALSE,
data_hora_pagamento DATE NOT NULL,
valor_pago DECIMAL(10,2) NOT NULL,
PRIMARY KEY(id_pedidos,id_pagamentos),
FOREIGN KEY(id_clientes) REFERENCES Clientes (id_clientes),
FOREIGN KEY(id_funcionarios) REFERENCES Funcionarios (id_funcionarios)
)

CREATE TABLE Delivery (
id_delivery INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
entregador VARCHAR(100) NOT NULL,
data_entrega DATETIME,
status_entrega BOOLEAN NOT NULL,
endereco_entrega  VARCHAR(255) NOT NULL,
taxa_entrega DECIMAL(10,2) NOT NULL,
data_hora_saida DATETIME NOT NULL
)

CREATE TABLE Contem (
id_produtos int,
id_pedidos int,
id_contem INT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY(id_produtos) REFERENCES Produtos (id_produtos),
FOREIGN KEY(id_pedidos) REFERENCES Pedidos (id_pedidos)
)

CREATE TABLE Fornece (
id_fornecedor int,
id_produtos int,
id_fornece INT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY(id_fornecedor) REFERENCES Fornecedor (id_fornecedor),
FOREIGN KEY(id_produtos) REFERENCES Produtos (id_produtos)
)

CREATE TABLE Difere (
id_categoria INT,
id_produtos INT,
id_difere int auto_increment primary key PRIMARY KEY,
FOREIGN KEY(id_categoria) REFERENCES Categoria (id_categoria)
)

CREATE TABLE Consome (
id_produtos int,
id_insumo int,
id_consome int auto_increment primary key PRIMARY KEY,
FOREIGN KEY(id_produtos) REFERENCES Produtos (id_produtos),
FOREIGN KEY(id_insumo) REFERENCES Insumos (id_insumo)
)

CREATE TABLE Gera (
id_delivery INT,
id_pedidos INT,
id_pagamentos INT,
id_gera int auto_increment primary key PRIMARY KEY
)

CREATE TABLE Entrega (
id_delivery INT,
id_funcionarios INT,
id_entrega int auto_increment primary key PRIMARY KEY,
FOREIGN KEY(id_delivery) REFERENCES Delivery (id_delivery),
FOREIGN KEY(id_funcionarios) REFERENCES Funcionarios (id_funcionarios)
)

ALTER TABLE Programa_fidelidade ADD FOREIGN KEY(id_clientes) REFERENCES Clientes (id_clientes)
