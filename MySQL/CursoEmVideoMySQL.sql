use cadastro;
select * from cursos;
select * from gafanhotos;
/* exercicios 01 */
select nome from gafanhotos where sexo='F';
select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31';
select nome from gafanhotos where sexo='M' and profissao='Programador';
select * from gafanhotos where sexo='F' and nacionalidade='Brasil' and nome like 'J%';
select nome, nacionalidade from gafanhotos where sexo='M' and nome like '%Silva%' and nacionalidade != 'Brasil' and peso < '100';
select MAX(altura) from gafanhotos where nacionalidade='Brasil';
select AVG(peso) from gafanhotos;
select MIN(peso) from gafanhotos where sexo='F' and nacionalidade <> 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';
select COUNT(*) from gafanhotos where sexo='F' and altura > '1.90';

/* exercicios 02 */

select ano, count(*) from cursos where totaulas >'30' group by ano having ano > '2013' order by count(*) desc;
select carga, count(nome) from cursos where totaulas='30' group by carga;
select carga, count(nome) from cursos where totaulas='30' group by carga having count(nome)>3;
select carga, count(*) from cursos where ano > '2015' group by carga having carga > (select avg(carga) from cursos);