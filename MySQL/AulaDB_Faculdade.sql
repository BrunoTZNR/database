create database aula
default character set utf8
default collate utf8_general_ci;
use aula;
create table if not exists TBALUNO (
	idAluno int unsigned primary key not null auto_increment,
    matricula mediumint unsigned not null,
    nome varchar(30) not null,
    sexo enum('M','F'),
    dtNasc date not null,
    dtIniCurso date,
    curso varchar(45) not null,
    cpf varchar(15) not null unique,
    notaA1 decimal(4,2) unsigned not null,
    notaA2 decimal(4,2) unsigned not null,
    media decimal(4,2) unsigned not null
)default charset=utf8;
create table if not exists TBPRODUTO (
	idProduto int unsigned primary key not null auto_increment,
    descricao text not null,
    qtd smallint unsigned not null,
    precoUnit decimal(7,2) not null,
    precoVenda decimal(7,2) not null,
    lucro decimal(5,2) not null,
    statusProduto enum('DISPONIVEL','EXGOTADO','ENVIADO','ENTREGUE','EM ROTA')
)default charset=utf8;
desc tbaluno;
desc tbproduto;
alter table tbaluno modify notaA1 decimal(4,2) not null default '00,00';
alter table tbaluno modify notaA2 decimal(4,2) not null default '00,00';
alter table tbaluno modify media decimal(4,2) not null default '00,00';
alter table tbproduto modify statusProduto enum('DISPONIVEL','EXGOTADO','ENVIADO','ENTREGUE','EM ROTA') not null;
select * from tbaluno;
select * from tbproduto;