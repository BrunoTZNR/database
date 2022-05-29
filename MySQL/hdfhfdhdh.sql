create database aula2
default character set utf8mb4
default collate utf8mb4_general_ci;
use aula2;
create table if not exists tbcliente(
	id int(5) primary key auto_increment,
    nome varchar(45) not null,
    dtnasc date
)engine=InnoDB, default charset=utf8mb4;

create table if not exists tbdocumento(
	coddoc int(5) primary key auto_increment,
    cnh varchar(11) not null unique,
    codcli int(5),
    constraint fk_codcli_id foreign key (codcli) references tbcliente(id)
);

create table if not exists tbendereco(
	codend int(5) primary key auto_increment,
    endereco varchar(60) not null,
    bairro varchar(35) not null,
    cidade varchar(12) not null,
    uf varchar(2),
    codcli int(5),
    constraint fk_codcliend_id foreign key (codcli) references tbcliente(id)
)engine=InnoDB, default charset=utf8mb4;

create table if not exists tbtelefone(
	codtel int(5) primary key auto_increment,
    celular varchar(12) not null unique,
    codcli int(5),
    constraint fk_codclitel_id foreign key (codcli) references tbcliente(id)
)engine=InnoDB, default charset=utf8mb4;

create table if not exists tbaluguel(
	codalug int(5) primary key auto_increment,
    dtlocacao date not null,
    dtentrega date not null,
    codcli int(5),
    codcar int(5),
    constraint fk_codclialu_id foreign key (codcli) references tbcliente(id),
    constraint fk_codcaralu_id foreign key (codcar) references tbcarro(codcar)
)engine=InnoDB, default charset=utf8mb4; 

create table if not exists tbcarro(
	codcar int(5) primary key auto_increment,
    placa varchar(8) unique not null,
    cor varchar(15) not null,
    modelo varchar(20) not null,
    ano year(4) unsigned not null
)engine=InnoDB, default charset=utf8mb4;

create table if not exists tbtipo(
	codtipo int(5) primary key auto_increment,
    tipo varchar(10) not null,
    codcar int(5),
    constraint fk_codcartipo_codcar foreign key (codcar) references tbcarro(codcar)
)engine=InnoDB, default charset=utf8mb4;

desc tbaluguel;
select * from tbaluguel;
desc tbcarro;
select * from tbcarro;
desc tbcliente;
select * from tbcliente;
desc tbdocumento;
select * from tbdocumento;
desc tbendereco;
select * from tbendereco;
desc tbtelefone;
select * from tbtelefone;
desc tbtipo;
select * from tbtipo;

insert into tbcliente values (default,'Claudia','1998-02-29');
insert into tbcarro values (default,'GRJ4R85','Azul','Bmw330e','2021');
insert into tbaluguel values (default,'2016-03-03','2016-03-06','6','1'),(default,'2019-03-03','2019-03-06','6','3');

select dtlocacao, dtentrega, modelo from tbaluguel, tbcarro where tbcarro.codcar = tbaluguel.codcar;
select nome, dtlocacao, dtentrega from tbcliente c join tbaluguel a on c.id = a.codcli;

select codalug, dtlocacao, dtentrega, modelo, ano, placa, nome from tbaluguel al join tbcarro c on al.codcar = c.codcar join tbcliente cli on cli.id = al.codcli order by codalug;
