USE db_bilheteria_digital_cinema;
/*1*/
SELECT f.titulo, group_concat(g.ds_genero) gêneros
FROM tb_filme f 
JOIN rl_filme_genero rfg ON f.id_filme=rfg.fk_filme 
JOIN tb_genero g ON rfg.fk_genero=g.cod_genero 
GROUP BY f.titulo;

/*2*/
SELECT c.nome cinema, e.cep, e.bairro, e.logradouro, e.numero, e.complemento, 
m.nome cidade, es.sigla, es.nome estado, s.tela 
FROM tb_endereco e 
JOIN tb_municipio m ON m.id_municipio=e.fk_municipio 
JOIN tb_estado es ON es.id_estado=m.fk_estado
JOIN tb_cinema c ON e.id_endereco=c.fk_endereco 
JOIN tb_sala s ON c.cnpj=s.fk_cinema;

/*3*/
SELECT c.nome cinema, e.cep, e.bairro, e.logradouro, e.numero, m.nome cidade, 
es.sigla, es.nome, s.tela, se.hr_inicio, se.legendado 
FROM tb_endereco e 
JOIN tb_municipio m ON m.id_municipio=e.fk_municipio 
JOIN tb_estado es ON es.id_estado=m.fk_estado
JOIN tb_cinema c ON e.id_endereco=c.fk_endereco 
JOIN tb_sala s ON c.cnpj=s.fk_cinema 
JOIN tb_sessao se ON s.id_sala=se.fk_sala;

/*4*/
SELECT c.nome cinema, e.cep, e.bairro, e.logradouro, e.numero, m.nome cidade, es.sigla, 
es.nome estado, s.tela, se.hr_inicio, se.legendado, f.titulo, f.classificacao_indicativa, 
f.duracao, f.dt_lancamento, d.ds_idioma
FROM tb_endereco e 
JOIN tb_municipio m ON m.id_municipio=e.fk_municipio 
JOIN tb_estado es ON es.id_estado=m.fk_estado
JOIN tb_cinema c ON e.id_endereco=c.fk_endereco 
JOIN tb_sala s ON c.cnpj=s.fk_cinema 
JOIN tb_sessao se ON s.id_sala=se.fk_sala 
JOIN tb_filme f ON se.fk_filme=f.id_filme 
JOIN tb_idioma d ON se.fk_idioma=d.id_idioma;

/*5*/
SELECT  f.titulo as Filme, COUNT(fk_ingresso) 'Qtd Ingressos Vendidos', 
CONCAT('R$ ',REPLACE(REPLACE(REPLACE(FORMAT(SUM(preco_pago),2), '.', '|'), ',', '.'), '|', ',')) 'Faturamento' 
FROM tb_filme f 
JOIN tb_sessao s ON f.id_filme=s.fk_filme 
JOIN rl_compra_assento_sessao rcas ON rcas.fk_sessao=s.id_sessao 
JOIN tb_compra c ON c.cod_compra=rcas.fk_compra 
JOIN rl_status_compra rsc ON c.cod_compra=rsc.fk_compra 
WHERE fk_status='2' 
GROUP BY Filme 
ORDER BY FIELD(Filme,'O Esquadrão Suicida','Shadow','O Empregado e o Patrão',
'O Poderoso Chefinho 2 - Negócios da Família',
'Um Lugar Silencioso - Parte 2','Jungle Cruise',
'Os Croods 2: Uma Nova Era','Velozes & Furiosos 9',
'Free Guy - Assumindo o Controle','Doutor Gama');

/*6*/
SELECT c.nome Nome, c.cnpj CNPJ, c.email 'E-mail', 
es.nome Estado, m.nome Cidade, 
e.bairro Bairro, e.logradouro Logradouro, e.numero Numero, e.cep CEP, IFNULL(e.complemento, "Não Cadastrado") Complemento, 
CONCAT("(", t.ddd, ") ", t.numero) Telefone, tt.tipo 'Tipo De Telefone' 
FROM tb_endereco e 
JOIN tb_municipio m ON m.id_municipio=e.fk_municipio 
JOIN tb_estado es ON es.id_estado=m.fk_estado
JOIN tb_cinema c ON e.id_endereco=c.fk_endereco
JOIN tb_telefone t ON c.cnpj=t.fk_cinema 
JOIN tb_tipo_telefone tt ON t.fk_tipo_telefone=tt.id_tipo_telefone 
ORDER BY Cidade DESC;

/*7*/
SELECT ds_status 'Status do Pagamento', 
CONCAT('R$ ',REPLACE(REPLACE(REPLACE(FORMAT(SUM(preco_pago),2), '.', '|'), ',', '.'), '|', ',')) 'Montante dos Ingressos', 
COUNT(preco_pago) 'Quantidade de assentos' 
FROM tb_compra c
JOIN rl_status_compra rsc ON c.cod_compra = rsc.fk_compra
JOIN tb_status sta ON sta.cod_status = rsc.fk_status
JOIN rl_compra_assento_sessao rcas ON c.cod_compra = rcas.fk_compra
GROUP BY ds_status
ORDER BY FIELD(ds_status, 'Pagamento Cancelado', 'Pagamento Confirmado', 'Aguardando Pagamento');

/*8*/
SELECT  cod_ingresso,turno,preco_ingresso,tipo_sessao,
CASE
	WHEN e_promocional=0 THEN 'Não'
    WHEN e_promocional THEN 'Sim'
END AS 'Promoção',
IFNULL(ds_promocao,'') as 'Descrição Promoção',
CASE
	WHEN dia_semana='0' THEN 'Segunda-Feira'
    WHEN dia_semana='1' THEN 'Terça-Feira'
    WHEN dia_semana='2' THEN 'Quarta-Feira'
    WHEN dia_semana='3' THEN 'Quinta-Feira'
    WHEN dia_semana='4' THEN 'Sexta-Feira'
    WHEN dia_semana='5' THEN 'Sábado'
    WHEN dia_semana='6' THEN 'Domingo'
END AS 'Dia da Semana'
FROM tb_ingresso i
JOIN tb_dia_semana ds ON i.cod_ingresso=ds.fk_ingresso
WHERE cod_ingresso IN('12','13') OR cod_ingresso='11' AND dia_semana='3'
ORDER BY cod_ingresso;

/*9*/
CREATE VIEW vw_rcas_M AS 
	SELECT 
    CASE
		WHEN sexo = 'M' THEN 'Homem'
	END sexo,
    sum(preco_pago) pagamento, count(co.cod_compra) qtd_compras
    FROM tb_cliente c JOIN tb_compra co ON c.cpf=co.fk_cpf 
    JOIN rl_compra_assento_sessao rcas ON co.cod_compra=rcas.fk_compra
    WHERE sexo='M'
    GROUP BY co.cod_compra;

CREATE VIEW vw_rcas_F AS 
	SELECT 
    CASE
		WHEN sexo = 'F' THEN 'Mulher'
	END sexo,
    sum(preco_pago) pagamento, count(co.cod_compra) qtd_compras
    FROM tb_cliente c JOIN tb_compra co ON c.cpf=co.fk_cpf 
    JOIN rl_compra_assento_sessao rcas ON co.cod_compra=rcas.fk_compra
    WHERE sexo='F'
    GROUP BY co.cod_compra;

SELECT sexo, MAX(pagamento) 'maior compra', MIN(pagamento) 'menor compra', 
FORMAT(AVG(pagamento),2) 'valor médio das compras', COUNT(qtd_compras) 'qtd_compras'
FROM vw_rcas_M GROUP BY sexo
UNION 
SELECT sexo, MAX(pagamento) 'maior compra', MIN(pagamento) 'menor compra', 
FORMAT(AVG(pagamento),2) 'valor médio das compras', COUNT(qtd_compras) 'qtd_compras'
FROM vw_rcas_F GROUP BY sexo;