use cinemas ;

create view Olhar_Atores as select * from atores ;
select * from Olhar_atores;



-- 1 :
create view dados_valores_estudios as 

select  f.idestudios,  f.valor  , e.nome , e.dono , e.datafundacao
from 
faturamentos as f 
Inner join 
estudios as e 
on   f.idestudios = e.idestudios ;

select * from dados_valores_estudios ;

-- 2: 

create view Dados_Atores_filmes as 
select a.idatores , a.nome as nomes_atores , a.sexo , f.idfilmes , f.nome
from
filmes as f 
Inner join 
elenco as e 
on e.idfilmes = f.idfilmes
inner join 
atores as a 
on a.idatores = e.idatores;


select * from Dados_Atores_filmes ;

-- 3 : 
create view Contagem_de_filmes_por_generos as 
select g.nome as generos , count(f.nome) 
from 
categorias as g 
left join 
filmes as f 
on g.idcategorias = f.idcategorias
group by g.nome;

select * from Contagem_de_filmes_por_generos;

-- 4) 


create view filme_estudio_categoria as 
select f.nome as filme , e.nome as estudio, c.nome as categoria, f.tempoproducao , f.ano ,f.copyrigth , f.custo 
from 
filmes as f 
inner join 
estudios as e 
on f.idestudios = e.idestudios 
inner join 
categorias  as c 
on f.idcategorias = c.idcategorias; 
select * from filme_estudio_categoria;


-- 5) 

 
create view custo_filmes as 
SELECT sum(f.custo) , e.nome as estudios from
estudios as e 
inner join 
filmes as f 
on e.idestudios = f.idestudios
group by  e.nome;

select * from custo_filmes;


-- 6) 

 
create view Atores_estudios as 
SELECT a.nome AS ATORES , e.nome as estudios 
from 
atores as a 
inner join elenco as el
on a.idatores =  el.idatores
inner join 
filmes as f 
on f.idfilmes =  el.idfilmes
inner join
estudios as e 
on e.idestudios = e.idestudios;

select * from Atores_estudios;


-- 7 ) 


create view Anos_Atores as 
;

select count(a.nome) as atores , f.ano
from
filmes as f 
inner join 
elenco as e 
on f.idfilmes = e.idfilmes
inner join
atores as a 
on a.idatores = e.idatores group by f.ano;
 select * from Anos_Atores;


-- 8) 

select a.nome as atores , a.segurosocial ,a.idade ,a.nacionalidade , a.sexo , c.nome from 
filmes as f 
inner join 
elenco as e 
on f.idfilmes = e.idfilmes
inner join
atores as a 
on a.idatores = e.idatores
inner join 
categorias as c
on c.idcategorias = f.idcategorias;
select * from categorias_atores ;


-- 9)  
 select * from papeis_atores;

-- 10 ) 

create view caches_filme as
select avg(e.cache) as cache, f.nome as filme 
from 
elenco as e
right join 
filmes as f 
on e.idfilmes = f.idfilmes 
group by f.nome ;
select * from caches_filme ;


-- 11 ) 
create view Caches_filmes_SOma as
SELECT SUM(e.cache), f.nome AS filme
FROM
elenco AS e
RIGHT JOIN 
filmes AS f 
ON e.idfilmes = f.idfilmes
GROUP BY f.nome
ORDER BY SUM(e.cache) ASC; 
select * from Caches_filmes_SOma ;

select * from caches_filme ;




-- 12) 
create view Filmes_anos_caches as
select f.nome as filme , f.custo , f.ano
from 
filmes as f
group by f.ano  
order by f.custo asc ;

select * from Filmes_anos_caches;



