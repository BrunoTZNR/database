use cadastro;
select * from cursos;
select * from gafanhotos;
show character set;

/* exercicios 01 */

select nome from gafanhotos where sexo='F';
/* selecione o atributo nome da entidade gafanhotos onde o sexo é = F */

select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31';
/* selecione todos atributos da entidade gafanhotos onde nacismento está entre 2000-01-01 a 2015-12-31 */

select nome from gafanhotos where sexo='M' and profissao='Programador';
/* selecione o atributo nome da entidade gafanhotos onde o sexo é = M e profissao = Programador */

select * from gafanhotos where sexo='F' and nacionalidade='Brasil' and nome like 'J%';
/* selecione todos atributos da entidade gafanhotos onde o sexo é = F e a nacionalidade = Brasil e que tenha nome começado com J */

select nome, nacionalidade from gafanhotos where sexo='M' and nome like '%Silva%' and nacionalidade != 'Brasil' and peso < '100';
/* selecione o atributo nome, nacionalidade da entidade gafanhotos onde o sexo é = m e que o nome contenha Silva em qualquer parte e que nacionalidade seja diferente a Brasil e peso seja menor que 100 */

select MAX(altura) from gafanhotos where nacionalidade='Brasil';
/* selecione o valor maximo atributo altura da entidade gafanhotos onde a nacionalidade = Brasil */

select AVG(peso) from gafanhotos;
/* selecione a media do atributo peso da entidade gafanhotos */

select MIN(peso) from gafanhotos where sexo='F' and nacionalidade <> 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';
/* selecione o valor minimo atributo peso da entidade gafanhotos onde o sexo é = F e nacionalidade diferente de Brasil e nacimento esteja entre 1990-01-01 a 2000-12-31 */

select COUNT(*) from gafanhotos where sexo='F' and altura > '1.90';
/* selecione o contagem de todos atributos da entidade gafanhotos onde o sexo é = F e a altura é maior que 1.90 */

/* exercicios 02 */

select profissao, count(*) as qtd from gafanhotos group by profissao order by qtd desc, profissao;
select sexo, count(*) as qtd from gafanhotos where nascimento > '2005-01-01' group by sexo;
select nacionalidade, count(*) as qtd from gafanhotos where nacionalidade != 'Brasil' group by nacionalidade having qtd >= 3 order by qtd desc, nacionalidade;
select altura from gafanhotos where peso >= '100' group by altura having altura > (select avg(altura) from gafanhotos) order by altura desc;

