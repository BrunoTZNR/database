create database if not exists db_biblioteca
default character set utf8mb4
default collate utf8mb4_general_ci;
use db_biblioteca;
create table if not exists tbl_livro(
	id_livro smallint auto_increment primary key,
    nome_livro varchar(50) not null,
    isbn varchar(30) not null,
);