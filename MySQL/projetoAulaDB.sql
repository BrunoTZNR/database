create database PROJETO
default character set utf8mb4
default collate utf8mb4_general_ci;

use PROJETO;

desc tb_produto;
desc tb_distribuidor;
desc TBCLIENTE;
desc TBCONTATO;
desc TBDISTRIBUIDOR;
desc TBDOCUMENTO;
desc TBVENDA;

create table tb_produto(
id_produto smallint(3) auto_increment not null primary key,
nome_produto varchar(45) not null,
dt_fabricacao date not null,
dt_vencimento date not null,
tipo_produto varchar(45),
qtd_produto smallint(3) not null,
valor_produto decimal(5,2) unsigned not null
)engine=InnoDB default charset=utf8mb4;

create table tb_distribuidor(
id_distribuidor smallint(3) auto_increment not null primary key,
nome_distribuidor varchar(45) not null,
cnpj varchar(16) not null,
inscricao_estadual varchar(20) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

create table tb_endereco(
id_endereco smallint(3) auto_increment not null primary key,
cidade varchar(30) not null,
uf char(2) not null,
numero varchar(15) not null,
cep varchar(9) not null,
bairro varchar(40),
quadra varchar(20),
edificio varchar(50),
pais varchar(25)
)engine=InnoDB default charset=utf8mb4;

create table tb_venda(
id_venda smallint(3) auto_increment not null primary key,
dt_venda date not null,
dt_pagamento date not null,
status_venda enum('pendente','aprovado','vencido') not null,
tipo_pagamento enum('crédito','débito','dinheiro','boleto','pix') not null,
valor_venda decimal(6,2) unsigned not null,
percentual_desconto tinyint
)engine=InnoDB default charset=utf8mb4;

create table tb_encomenda(
id_encomenda smallint(3) auto_increment not null primary key,
status_encomenda enum('entregue','encaminhado','') not null,
tipo_entrega enum('expressa','normal') not null,
dt_entrega date not null,
dt_recebimento date not null,
valor_frete decimal(5,2) unsigned not null
)engine=InnoDB default charset=utf8mb4;

create table tb_contato(
id_contato smallint(3) auto_increment not null primary key,
ddd_telefone varchar(3) not null,
telefone varchar(12) not null,
email varchar(120)
)engine=InnoDB default charset=utf8mb4;

create table tb_estoque(
id_estoque smallint(3) auto_increment not null primary key,
nome_estoque varchar(40) not null,
qtd_estoque tinyint not null,
dt_validade date not null,
dt_fabricacao date not null,
marca varchar(45)
)engine=InnoDB default charset=utf8mb4;

create table tb_funcionario(
id_funcionario smallint(3) auto_increment not null primary key,
nome_funcioanrio varchar(25) not null,
sobrenome_funcionario varchar(30) not null,
dt_nasc date,
dt_contratamento date not null,
sexo enum('m','f')
)engine=InnoDB default charset=utf8mb4;

create table tb_documento(
id_documento smallint(3) auto_increment not null primary key,
cpf varchar(11) unique,
rg varchar(10) unique,
cnh varchar(45) unique,
titulo_eleitor varchar(45) unique,
pis varchar(45) unique
)engine=InnoDB default charset=utf8mb4;

create table tb_cliente(
id_cliente smallint(3) auto_increment not null primary key,
nome_cliente varchar(25) not null,
sobrenome_cliente varchar(30) not null,
tipo_cliente enum('pf','pj') not null,
dt_nasc date
)engine=InnoDB default charset=utf8mb4;