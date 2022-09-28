create database if not exists projeto_doce
default character set utf8mb4
default collate utf8mb4_general_ci;

use projeto_doce;
drop database projeto_doce;

/* tbpessoa */
desc tbpessoa;
select * from tbpessoa;

create table if not exists tbpessoa(
	idpessoa int primary key not null auto_increment,
    nome varchar(25) not null,
    sobrenome varchar(25) not null,
    nome_social varchar(25),
    dt_nasc date,
    sexo enum('f','m','o')
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbpessoa values
(default,'ésoj','airam',null,'1999-06-12','m'),
(default,'bruno','marco',null,'2020-08-15','m'),
(default,'douglas','dieter',null,'2021-09-09','m'),
(default,'renan','lira','joana','2001-07-17','o'),
(default,'renan','rodrigues',null,'2000-04-15','m'),
(default,'bianca','chagas','paulo','2021-07-15','o'),
(default,'italo','oliveira',null,'1998-07-17','m'),
(default,'dara','rodrigues',null,'1999-06-24','f'),
(default,'carlos','rodrigues',null,'2000-09-29','m'),
(default,'eduardo','alves',null,'2001-08-05','m'),
(default,'eduarda','souza','eduardo','1998-12-12','o'),
(default,'joyce','elen','junior','1999-02-28','o'),
(default,'ihasmin','sonie',null,'2005-03-15','f'),
(default,'laisa','daniele',null,'2006-08-17','f'),
(default,'marta','alves',null,'2004-12-28','f'),
(default,'josé','souza',null,'2003-05-16','m'),
(default,'pedro','perreira','peitra','2000-09-12','o'),
(default,'joão','perreira',null,'2005-03-04','m'),
(default,'pedro','cabral',null,'2001-12-22','m'),
(default,'felipe','alves','felipa','2002-03-17','o'),
(default,'xand','dieter',null,'1998-10-23','m'),
(default,'claudio','silva','claudia','1999-06-26','o'),
(default,'joão','roberto',null,'2000-07-20','m'),
(default,'roberta','pires',null,'2009-08-22','f'),
(default,'juliana','pires','juliano','2006-09-25','o'),
(default,'isabela','rodrigues',null,'2008-04-04','f'),
(default,'marcos','borges',null,'2008-06-26','m'),
(default,'davi','silva',null,'2007-03-11','m'),
(default,'bruna','rocha',null,'2002-01-24','f'),
(default,'arthur','assunsão',null,'2003-10-18','m'),
(default,'humberto','figueredo',null,'2002-11-15','m'),
(default,'cristiano','rocha','cristina','2005-04-29','o'),
(default,'gabriela','fernandes',null,'1997-03-17','f'),
(default,'gabriela','vasconcelos',null,'1997-09-16','f');

/* tbcliente */
desc tbcliente;
select * from tbcliente;

create table if not exists tbcliente(
	idcliente int primary key not null auto_increment,
    tipo_cliente enum('pf','pj') not null,
    id_pessoa int not null,
    constraint tbcliente_tbpessoa foreign key (id_pessoa) references tbpessoa(idpessoa)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbcliente values
(default,'pj','34'),
(default,'pj','33'),
(default,'pj','32'),
(default,'pj','31'),
(default,'pf','30'),
(default,'pf','29'),
(default,'pf','28'),
(default,'pj','27'),
(default,'pf','26'),
(default,'pf','25'),
(default,'pj','24'),
(default,'pj','23'),
(default,'pj','22'),
(default,'pf','21'),
(default,'pf','20'),
(default,'pj','19'),
(default,'pf','18');

/* tbfuncionario */
desc tbfuncionario;
select * from tbfuncionario;

create table if not exists tbfuncionario(
	idfuncionario int primary key not null auto_increment,
    dt_contratamento date not null,
    carga_horaria char(1) not null,
    numero_cracha tinyint unsigned unique not null,
    funcao varchar(15),
    id_pessoa int not null,
    constraint tbfuncionario_tbpessoa foreign key (id_pessoa) references tbpessoa(idpessoa)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbfuncionario values
(default,'2021-06-10','4','100','padeiro','9'),
(default,'2021-12-04','8','99','caixa','8'),
(default,'2021-05-04','8','12','caixa','7'),
(default,'2020-06-07','8','41','padeiro','6'),
(default,'2020-07-06','8','45','doceiro','5'),
(default,'2021-07-06','8','64','doceiro','4'),
(default,'2021-06-02','7','255','açoqueiro','3'),
(default,'2021-10-05','7','200','caixa','2'),
(default,'2021-10-04','7','132','cobrador','1'),
(default,'2020-11-22','5','231','doceiro','10'),
(default,'2021-04-18','5','253','repositor','17'),
(default,'2021-02-20','5','56','repositor','16'),
(default,'2022-01-01','5','14','gerente','11'),
(default,'2022-01-04','4','254','assistente','12'),
(default,'2022-10-27','4','65','padeiro','13'),
(default,'2022-12-28','4','57','doceiro','14'),
(default,'2020-11-29','4','78','limpeza','15');

/* tbdistribuidor */
desc tbdistribuidor;
select * from tbdistribuidor;

create table if not exists tbdistribuidor(
	iddistribuidor int primary key not null auto_increment,
    nome_dist varchar(40) not null,
    observacao text
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbdistribuidor values
(default,'Garoto','Chocolate'),
(default,'Lacta',null),
(default,'Nestle',null),
(default,'Dolly','Refrigente'),
(default,'Arco','Chocolate'),
(default,'Fini','Balinhas'),
(default,'Pepsico',null),
(default,'Atacado','Atacadão de produtos'),
(default,'Coca-Cola',null),
(default,'Sobramel','Balinhas'),
(default,'Tia Neide','Doces variados'),
(default,'Distribuidoras Céu',null),
(default,'Copenhage','Doces Premium'),
(default,'Embalagens tudo','Embalagens'),
(default,'Cacau Show',null),
(default,'Leite Bom','Lacticineos'),
(default,'João Salgados','Aqui não tem doce');

/* tbproduto */
desc tbproduto;
select * from tbproduto;

create table if not exists tbproduto(
	idproduto int primary key not null auto_increment,
    nome_prod varchar(30) not null,
    valor_prod decimal(5,2) not null,
    dt_validade date not null,
    dt_fabricacao date not null,
    descricao_prod text
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbproduto values
(default,'Bis','2.00','2022-08-24','2022-05-10',null),
(default,'Coca-Cola','10.00','2022-09-01','2022-03-18',null),
(default,'Doritos','7.00','2022-09-01','2022-03-18',null),
(default,'Loló','1.50','2022-08-24','2022-05-10',null),
(default,'Diamanete Negro','4.75','2022-08-24','2022-05-10',null),
(default,'M&M','18.85','2022-08-24','2022-05-10',null),
(default,'Embalagem média','6.25','2022-06-19','2024-06-19',null),
(default,'Emabalagem pequena','5.00','2022-06-19','2024-06-19',null),
(default,'Enrolado de salsicha','1.00','2022-06-20','2022-06-19','Qualidade duvidosa'),
(default,'Beijinho','3.50','2022-06-20','2022-06-19',null),
(default,'Doce de Leite','6.00','2022-06-20','2022-06-19',null),
(default,'KitKat','4.00','2022-06-30','2022-02-06',null),
(default,'Ferreiro Rocher','50.00','2022-07-15','2022-05-01',null),
(default,'Leite','4.99','2022-01-01','2021-09-01','1 litro'),
(default,'Chocolate em pó','9.30','2022-12-31','2022-03-01',null),
(default,'Sacola plastica','0.50','2022-06-19','2024-06-19','1 unidade'),
(default,'dedo de anão','630.00','2022-08-19','2004-06-19','idade de 18 anos');


/* tbdistribuidor_tbproduto */
desc tbdistribuidor_tbproduto;
select * from tbdistribuidor_tbproduto;

create table if not exists tbdistribuidor_tbproduto(
	iddist_prod int primary key not null auto_increment,
    id_distribuidor int not null,
    id_produto int not null,
    valor_custo decimal(6,2) not null,
    dt_compra date not null,
    qtd_estoque tinyint not null,
    constraint tbdistribuidor_tbproduto foreign key (id_produto) references tbproduto(idproduto),
    constraint tbproduto_tbdistribuidor foreign key (id_distribuidor) references tbdistribuidor(iddistribuidor)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbdistribuidor_tbproduto values
(default,'2','1','1.25','2022-05-15','15'),
(default,'9','2','6','2022-04-01','13'),
(default,'7','3','5','2022-04-01','20'),
(default,'3','4','0.50','2022-05-15','25'),
(default,'2','5','1.99','2022-05-15','23'),
(default,'17','6','12.89','2022-05-15','7'),
(default,'14','7','3','2022-07-01','19'),
(default,'14','8','2.50','2022-07-01','30'),
(default,'17','9','1.00','2022-06-19','36'),
(default,'11','10','2.00','2022-06-19','30'),
(default,'11','11','4.10','2022-06-19','30'),
(default,'3','12','1.75','2022-02-12','40'),
(default,'10','13','6.25','2022-05-30','3'),
(default,'12','14','2.50','2021-09-02','10'),
(default,'8','15','5','2022-04-04','6'),
(default,'14','16','0.10','2022-07-01','20'),
(default,'17','17','420','2022-06-19','2');

/* venda */
desc tbvenda;
select * from tbvenda;

create table if not exists tbvenda(
	idvenda int primary key not null auto_increment,
    dt_venda date not null,
    dt_pagamento date not null,
    valor_total decimal(6,2) not null,
    status_venda enum('pendente', 'aprovado', 'vencido') not null,
    tipo_pagamento enum('crédito', 'débito', 'dinheiro', 'boleto', 'pix') not null,
    percent_desconto char(3),
    id_cliente int not null,
    constraint tbcliente_tbvenda foreign key (id_cliente) references tbcliente(idcliente)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbvenda values
(default,'2019-01-01','2019-02-02','10','aprovado','crédito','10','1'),
(default,'2019-01-04','2019-02-05','70','aprovado','crédito','20','3'),
(default,'2020-10-11','2020-11-02','7','pendente','débito','30','5'),
(default,'2021-11-11','2021-11-16','30','pendente','débito','40','7'),
(default,'2020-12-05','2020-12-22','16','vencido','pix','50','9'),
(default,'2019-08-09','2019-08-28','18','aprovado','pix','60','11'),
(default,'2020-01-01','2020-05-02','42','vencido','crédito','70','13'),
(default,'2022-02-03','2022-02-28','40','vencido','crédito','90','15'),
(default,'2021-03-21','2021-06-07','15','aprovado','boleto','80','17'),
(default,'2022-05-11','2022-05-11','57','aprovado','boleto','100','2'),
(default,'2019-01-15','2019-01-15','30','pendente','dinheiro','15','4'),
(default,'2020-03-13','2020-05-17','44','pendente','dinheiro','25','6'),
(default,'2018-04-16','2018-05-26','150','pendente','débito','45','8'),
(default,'2018-06-29','2018-07-17','32','pendente','débito','77','10'),
(default,'2017-08-28','2017-08-29','9','vencido','crédito','35','12'),
(default,'2017-05-27','2017-05-28','3','vencido','crédito','55','14'),
(default,'2016-10-21','2016-11-21','630','aprovado','débito','65','16');

/* tbproduto_tbvenda */
desc tbproduto_tbvenda;
select * from tbproduto_tbvenda;
drop table tbproduto_tbvenda;

create table if not exists tbproduto_tbvenda(
	idprod_venda int primary key not null auto_increment,
	id_produto int not null,
    id_venda int not null,
    qtd_produto tinyint unsigned not null,
    constraint tbprduto_tbvenda foreign key (id_venda) references tbvenda(idvenda),
    constraint tbvenda_tbprduto foreign key (id_produto) references tbproduto(idproduto)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbproduto_tbvenda values
(default,'1','1','5'),
(default,'2','2','3'),
(default,'3','3','10'),
(default,'4','4','7'),
(default,'5','5','4'),
(default,'6','6','1'),
(default,'7','7','7'),
(default,'8','8','8'),
(default,'9','9','15'),
(default,'10','10','19'),
(default,'11','11','5'),
(default,'12','12','11'),
(default,'13','13','3'),
(default,'14','14','8'),
(default,'15','15','1'),
(default,'16','16','6'),
(default,'17','17','1');

/* tbentrega */
desc tbentrega;
select * from tbentrega;

create table if not exists tbentrega(
	identrega int primary key not null auto_increment,
    status_entrega enum('entregue', 'encaminhado','preparando') not null,
    tipo_entrega enum('expressa', 'normal') not null,
    dt_saida date,
    dt_recebimento date,
    tipo_encomenda enum('frágil','liquido','sólido') not null,
    id_venda int not null,
    constraint tbentrega_tbvenda foreign key (id_venda) references tbvenda(idvenda)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbentrega values
(default,'entregue','expressa','2019-02-02','2019-02-04','frágil','1'),
(default,'encaminhado','normal','2019-02-02',null,'sólido','2'),
(default,'entregue','expressa','2020-11-02','2020-11-04','frágil','3'),
(default,'encaminhado','normal','2021-11-06',null,'liquido','4'),
(default,'entregue','expressa','2020-12-05','2020-12-05','sólido','5'),
(default,'encaminhado','normal','2019-08-28',null,'frágil','6'),
(default,'entregue','expressa','2020-05-02','2020-05-15','liquido','7'),
(default,'encaminhado','normal','2022-02-28',null,'sólido','8'),
(default,'preparando','normal',null,null,'frágil','9'),
(default,'entregue','expressa','2022-05-11','2022-05-11','liquido','10'),
(default,'preparando','normal',null,null,'sólido','11'),
(default,'encaminhado','normal','2020-05-17',null,'frágil','12'),
(default,'entregue','expressa','2018-05-26','2018-05-27','liquido','13'),
(default,'entregue','expressa','2018-07-17','2018-05-30','sólido','14'),
(default,'encaminhado','normal','2017-08-29',null,'frágil','15'),
(default,'entregue','expressa','2017-05-28','2017-06-01','liquido','16'),
(default,'preparando','expressa',null,null,'sólido','17');

/* tbendereco */
desc tbendereco;
select * from tbendereco;
drop table tbendereco;

create table if not exists tbendereco(
	idendereco int primary key not null auto_increment,
	cidade varchar(30) not null,
    uf char(2),
	numero varchar(15) not null,
	cep varchar(8) not null,
	bairro varchar (30),
	quadra varchar(20),
	edificio varchar(40),
	pais varchar(25) default 'Brasil',
    id_funcionario int,
    id_distribuidor int,
    id_cliente int,
    id_entrega int,
    constraint tbendereco_tbfuncionario foreign key (id_funcionario) references tbfuncionario(idfuncionario),
    constraint tbendereco_tbdistribuidor foreign key (id_distribuidor) references tbdistribuidor(iddistribuidor),
    constraint tbendereco_tbcliente foreign key (id_cliente) references tbcliente(idcliente),
    constraint tbendereco_tbentrega foreign key (id_entrega) references tbentrega(identrega)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbendereco values
(default,'Brasília','DF','32','13243521','Sobradinho','3','Palio',default,null,'7',null,'1'),
(default,'Brasília','DF','3','12345678',null,'20',null,default,null,'2',null,'3'),
(default,'Mendoza',null,'132','M5500','Brócolis','43',null,'Argentina',null,'9',null,'4'),
(default,'Mendoza',null,'35','M5502','Repolho','63','Palio','Argentina',null,'10',null,'5'),
(default,'Buenos Aires',null,'64','B1603','Rabanete','78','Gol','Argentina',null,'6',null,'6'),
(default,'Braga',null,'34','98560000',null,'53',null,'Portugal',null,null,'4','7'),
(default,'Braga',null,'643','87428329',null,'55',null,'Portugal',null,null,'5','8'),
(default,'Aveiro',null,'123','3800-012','Repolho','33',null,'Portugal',null,null,'7','9'),
(default,'Las Vegas',null,'54','2314252',null,'31',null,'EUA',null,null,'15','10'),
(default,'Buenos Aires',null,'64','B1406','Ábobora','10',null,'Argentina',null,null,'12','11'),
(default,'Chicago',null,'1','1242535','Maça','29',null,'EUA','12',null,null,'12'),
(default,'Maiami',null,'42','63431243',null,'53','Uno','EUA','16',null,null,'13'),
(default,'Aveiro',null,'5','3800-008','Mandioca','43','Uno','Portugal','10',null,null,'14'),
(default,'Lisboa',null,'53','3425635',null,'23',null,'Portugal','3',null,null,'15'),
(default,'Blumenal',null,'46','23431234',null,'5','Corsa',default,'6',null,null,'17'),
(default,'Piauí','PI','75','53643132','LaFont','14','Camaro',default,null,null,null,'2'),
(default,'Piauí','PI','86','12344523',null,'25',null,default,null,null,null,'16'),
(default,'Maranhão','MA','80','15445140',null,'20',null,default,null,null,'2',null);

/* tbcontato */
desc tbcontato;
select * from tbcontato;

create table if not exists tbcontato(
	idcontato int primary key not null auto_increment,
    ddd_telefone char(3) not null,
    telefone varchar(9) not null,
    email varchar(120),
    fax varchar(40),
    linkedin varchar(25),
    id_funcionario int,
    id_distribuidor int,
    id_cliente int,
    constraint tbcontato_tbfuncionario foreign key (id_funcionario) references tbfuncionario(idfuncionario),
    constraint tbcontato_tbdistribuidor foreign key (id_distribuidor) references tbdistribuidor(iddistribuidor),
    constraint tbcontato_tbcliente foreign key (id_cliente) references tbcliente(idcliente)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbcontato values
(default,'99','999999999',null,null,'dararodrigues02',2,null,null),
(default,'99','888888888',null,null,'renanrodrigues05',5,null,null),
(default,'99','777777777',null,null,'douglasdieter07',7,null,null),
(default,'99','666666666','esojairam@exemplo.com',null,null,9,null,null),
(default,'99','555555555','pedropereira@exemplo.com',null,null,11,null,null),
(default,'99','444444444',null,'545842185',null,null,2,null),
(default,'99','333333333',null,'44158544',null,null,5,null),
(default,'99','222222222','pepsico@exemplo.com','44544445',null,null,7,null),
(default,'99','111111111','cocacola@exemplo.com',null,null,null,9,null),
(default,'99','121212121','tianeide@exemplo.com','85565649','tianiedeconfeccoes',null,11,null),
(default,'99','131313131',null,null,null,null,null,2),
(default,'99','141414141',null,null,null,null,null,5),
(default,'99','151515151','italooliveira@exemplo.com',null,null,null,null,7),
(default,'99','161616161','joyceelen@exemplo.com',null,null,null,null,9),
(default,'99','171717171',null,null,null,null,null,11),
(default,'99','181818181','josesouza@exemplo.com',null,null,null,null,13),
(default,'99','191919191',null,null,null,null,null,17);

/* tbdocumento */
desc tbdocumento;
select * from tbdocumento;

create table if not exists tbdocumento(
	iddoc int primary key not null auto_increment,
    cpf varchar(11) unique,
    rg varchar(10) unique,
    cnpj varchar(14), /* o cnpj e a inscrição estadual não podem ser unicos pois no df o nº do cnpj é o mesmo para a inscrição estadual */
    inscricao_estadual varchar(14),
    pis_pasep varchar(11) unique,
    id_funcionario int,
    id_distribuidor int,
    id_cliente int,
    constraint tbdocumento_tbfuncionario foreign key (id_funcionario) references tbfuncionario(idfuncionario),
    constraint tbdocumento_tbdistribuidor foreign key (id_distribuidor) references tbdistribuidor(iddistribuidor),
    constraint tbdocumento_tbcliente foreign key (id_cliente) references tbcliente(idcliente)
)engine=InnoDB default charset=utf8mb4 collate utf8mb4_general_ci;

insert into tbdocumento values
(default,null,null,'29843212746386','11122233344455',null,null,'11',null),
(default,null,null,'98763748987621','98763748987621',null,null,'6',null),
(default,null,null,'34859765728654','34859765728654',null,null,'8',null),
(default,null,null,'87462765452434','87998833221122',null,null,'14',null),
(default,null,null,'28765678983412','43676555654371',null,null,'16',null),
(default,'09878656728','9876514',null,null,'87667376526','3',null,null),
(default,'12387626354','9873988',null,null,'84765637898','5',null,null),
(default,'09877867776','2348726',null,null,'98776253612','7',null,null),
(default,'32873649818','4249858',null,null,'32176537487','9',null,null),
(default,'09876543210','9387466',null,null,'11222333456','11',null,null),
(default,'98738475898','4765987',null,null,null,null,null,'13'),
(default,'39487567231',null,null,null,null,null,null,'14'),
(default,'34958732475',null,null,null,null,null,null,'17'),
(default,'18376475321','9876541',null,null,null,null,null,'16'),
(default,'43873766552','1233344',null,null,null,null,null,'3'),
(default,'27364845897',null,null,null,null,null,null,'5'),
(default,'34324747234','9876456',null,null,null,null,null,'6');

/* update */
-- documento
select * from tbdocumento;
update tbdocumento set rg='5415618' where id_cliente='5';
update tbdocumento set rg='3657345' where id_cliente='14';
update tbdocumento set rg='8785220' where id_cliente='17';

-- endereco
select * from tbendereco;
update tbendereco set uf='AV' where idendereco='13';
update tbendereco set cidade='New York' where idendereco='12';
update tbendereco set quadra='8' where idendereco='6';

-- entrega
select * from tbentrega;
update tbentrega set tipo_encomenda='sólido' where identrega='1';
update tbentrega set status_entrega='preparando' where identrega='8';
update tbentrega set dt_saida=null where identrega='8';

-- produto_venda
select * from tbproduto_tbvenda;
update tbproduto_tbvenda set qtd_produto='4' where idprod_venda='1';
update tbproduto_tbvenda set qtd_produto='16' where idprod_venda='9';
update tbproduto_tbvenda set qtd_produto='21' where idprod_venda='10';

-- venda
select * from tbvenda;
update tbvenda set percent_desconto='10' where idvenda='9';
update tbvenda set dt_venda='2017-06-20' where idvenda='15';
update tbvenda set status_venda='pendente' where idvenda='7';

-- cliente
select * from tbcliente;
update tbcliente set tipo_cliente='pf' where idcliente='2';
update tbcliente set tipo_cliente='pf' where idcliente='4';
update tbcliente set tipo_cliente='pj' where idcliente='15';

-- contato
select * from tbcontato;
update tbcontato set telefone='654654418' where idcontato='1';
update tbcontato set email='joseaocontrario@gmail.com' where idcontato='3';
update tbcontato set linkedin='tianeidedoces' where idcontato='10';

-- distribuidor
select * from tbdistribuidor;
update tbdistribuidor set observacao='produtos de chocolate' where iddistribuidor='2';
update tbdistribuidor set nome_dist='João salgados e doces' where iddistribuidor='17';
update tbdistribuidor set observacao='Aqui não tem doce nem salgado' where iddistribuidor='17';

-- distribuidor_produto
select * from tbdistribuidor_tbproduto;
update tbdistribuidor_tbproduto set dt_compra='2022-05-16' where iddist_prod='5';
update tbdistribuidor_tbproduto set valor_custo='440.00' where iddist_prod='17';
update tbdistribuidor_tbproduto set qtd_estoque='32' where iddist_prod='9';

-- funcionario
select * from tbfuncionario;
update tbfuncionario set carga_horaria='6' where idfuncionario='1';
update tbfuncionario set funcao='balconista' where idfuncionario='7';
update tbfuncionario set numero_cracha='151' where idfuncionario='11';

-- pessoa
select * from tbpessoa;
update tbpessoa set nome='ze', sobrenome='ninguem' where idpessoa='4';
update tbpessoa set nome_social='carla' where idpessoa='9';
update tbpessoa set dt_nasc='1998-01-23' where idpessoa='11';

-- produto
select * from tbproduto;
update tbproduto set dt_fabricacao='2020-10-13' where idproduto='7';
update tbproduto set dt_fabricacao='2020-10-13' where idproduto='8';
update tbproduto set dt_fabricacao='2020-10-13' where idproduto='16';

/* delete */
-- documento
delete from tbdocumento where iddoc='15';

-- endereco
select * from tbendereco;
delete from tbendereco where idendereco='16';
delete from tbendereco where idendereco='7';
delete from tbendereco where idendereco='9';

-- entrega
delete from tbentrega where identrega='2';
delete from tbentrega where identrega='8';

-- produto_venda
delete from tbproduto_tbvenda where idprod_venda='2';
delete from tbproduto_tbvenda where idprod_venda='8';

-- venda
delete from tbvenda where idvenda='2';
delete from tbvenda where idvenda='8';

-- cliente
delete from tbcliente where idcliente='3';
delete from tbcliente where idcliente='15';

/* selects/joins */

SELECT nome, sobrenome, sexo, nome_social FROM tbpessoa;
SELECT p.nome, c.idcliente, p.idpessoa FROM tbpessoa p, tbcliente c WHERE p.idpessoa=c.id_pessoa ORDER BY idcliente;
SELECT nome,sobrenome FROM tbpessoa WHERE nome LIKE 'J%';
SELECT COUNT(idcliente), tipo_cliente FROM tbcliente WHERE tipo_cliente='pj';
SELECT DISTINCT tipo_pagamento FROM tbvenda;
SELECT SUM(valor_total) FROM tbvenda;
SELECT AVG(valor_total)FROM tbvenda;
SELECT cnpj,inscricao_estadual FROM tbdocumento WHERE cnpj=inscricao_estadual;
SELECT telefone, linkedin FROM tbcontato WHERE telefone LIKE '1%' AND linkedin LIKE '%';
SELECT dt_venda,dt_pagamento,tipo_pagamento FROM tbvenda WHERE tipo_pagamento='crédito' ORDER BY dt_venda;
SELECT DISTINCT nome_prod FROM tbproduto ORDER BY nome_prod;
SELECT MIN(valor_total) FROM tbvenda;
SELECT nome_social,sobrenome, sexo FROM tbpessoa WHERE sexo='o';
SELECT dt_saida,status_entrega,tipo_entrega FROM tbentrega WHERE dt_saida BETWEEN '2020-01-01' AND '2022-01-01';
SELECT nome_prod, dt_validade FROM tbproduto WHERE nome_prod LIKE 'C%';
SELECT cidade,uf,numero,pais FROM tbendereco WHERE numero>'10';
SELECT nome,sobrenome,nome_social,carga_horaria,dt_contratamento FROM tbpessoa p JOIN tbfuncionario f ON p.idpessoa=f.id_pessoa ORDER BY nome;
SELECT email, ddd_telefone, telefone, nome_dist, observacao FROM tbdistribuidor d JOIN tbcontato c ON d.iddistribuidor=c.id_distribuidor;
SELECT tipo_entrega,dt_saida,dt_recebimento FROM tbentrega GROUP BY dt_recebimento HAVING dt_recebimento>'2020-01-01';
SELECT nome_prod,valor_prod,qtd_produto,dt_venda,status_venda FROM tbproduto_tbvenda pv JOIN tbproduto p ON pv.id_produto=p.idproduto JOIN tbvenda v ON pv.id_venda=v.idvenda ORDER BY nome_prod;
SELECT nome_dist, nome_prod, valor_custo FROM tbdistribuidor_tbproduto dp JOIN tbdistribuidor d ON dp.id_distribuidor=d.iddistribuidor JOIN tbproduto p ON dp.id_produto=p.idproduto ORDER BY nome_dist;
SELECT nome,sobrenome,sexo,dt_contratamento,carga_horaria FROM tbpessoa p JOIN tbfuncionario f ON p.idpessoa=f.id_pessoa WHERE carga_horaria>'5';
SELECT nome_prod,valor_custo,qtd_estoque,dt_validade,
	CASE
		WHEN idproduto='17' THEN 'ele tá chorando até agora'
		WHEN dt_validade < '2022-06-20' THEN 'vai vencer(repor)'
        WHEN qtd_estoque < '15' THEN 'tem pouco (repor)'
        WHEN valor_custo <(SELECT AVG(valor_custo) FROM tbdistribuidor_tbproduto) THEN 'aproveita que ta baratinho'
		ELSE 'ta de boa ainda'
    END AS reposicao
FROM tbproduto p JOIN tbdistribuidor_tbproduto dp ON p.idproduto=dp.id_produto;
SELECT nome, sobrenome, sexo, dt_nasc,
	CASE
		WHEN sexo IN ('o','m') THEN 'não é mulher'
		WHEN dt_nasc>'2004-01-01' THEN 'jovem de mais'
        ELSE 'pode dirigir'
	END AS status
FROM tbpessoa ORDER BY status= 'pode dirigir' DESC;
select pv.id_venda, p.nome, p.nome_social, pv.qtd_produto, v.dt_venda, v.valor_total, v.percent_desconto from tbproduto_tbvenda pv join tbvenda v on pv.id_venda=v.idvenda join tbcliente c on v.id_cliente=c.idcliente join tbpessoa p on c.id_pessoa=p.idpessoa;
select p.nome_prod, p.valor_prod, dp.qtd_estoque, p.dt_validade, d.nome_dist, p.descricao_prod from tbdistribuidor_tbproduto dp join tbproduto p on dp.id_produto=p.idproduto join tbdistribuidor d on dp.id_distribuidor=d.iddistribuidor order by dp.qtd_estoque desc;
SELECT nome, sobrenome, funcao FROM tbpessoa p JOIN tbfuncionario f ON p.idpessoa=f.id_pessoa ORDER BY nome DESC;
select v.idvenda, en.status_entrega, en.tipo_entrega, en.tipo_encomenda, e.uf, e.cidade, e.numero, e.cep, e.bairro, e.quadra, e.edificio, e.pais from tbendereco e  join tbentrega en on e.id_entrega=en.identrega join tbvenda v on en.id_venda=v.idvenda;
select f.idfuncionario, p.nome, p.nome_social, f.dt_contratamento, f.numero_cracha, f.funcao, c.linkedin, c.ddd_telefone, c.telefone from tbcontato c right join tbfuncionario f on c.id_funcionario=f.idfuncionario join tbpessoa p on f.id_pessoa=p.idpessoa;
select d.iddistribuidor, d.nome_dist, e.uf, e.cidade, e.numero, e.cep, e.bairro, e.quadra, e.edificio, e.pais, doc.cnpj, doc.inscricao_estadual, c.ddd_telefone, c.telefone, c.email, c.fax, c.linkedin from tbdistribuidor d left join tbendereco e on e.id_distribuidor=d.iddistribuidor left join tbdocumento doc on doc.id_distribuidor=d.iddistribuidor left join tbcontato c on c.id_distribuidor=d.iddistribuidor;
SELECT AVG(valor_custo), nome_prod, qtd_estoque FROM tbdistribuidor_tbproduto dp JOIN tbproduto p ON dp.id_produto=p.idproduto GROUP BY dp.valor_custo HAVING dp.valor_custo < (SELECT AVG(valor_custo) FROM tbdistribuidor_tbproduto) AND dp.qtd_estoque <'20';
SELECT nome,sobrenome,nome_social, tipo_cliente,cpf FROM tbpessoa p JOIN tbcliente c ON p.idpessoa=c.id_pessoa JOIN tbdocumento d ON c.idcliente=d.id_cliente WHERE cpf LIKE '3%';