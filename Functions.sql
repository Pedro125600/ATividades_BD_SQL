use clubedapizza;


-- 1 - Cria uma função que receba o nome de uma atendente, e retorne o valor total dos seus pedidos
select * from atendentes; 

select sum( p.valor_total) from 
pedidos as p 
inner join 
atendentes as a 
on a.idatendentes = p.idatendentes 
where a.nomeatendente = "jorge";

Delimiter //
create function function1(nome varchar(40))
returns float
BEGIN

declare pedidos float;

 select sum( p.valor_total) into pedidos  from 
pedidos as p 
inner join 
atendentes as a 
on a.idatendentes = p.idatendentes 
where a.nomeatendente = nome
;
return pedidos;
END
//
delimiter ;
select function1('Jorge');


-- 2 - Crie uma função que ao receber o tipo de sócio, retorne a quantidade de sócios para aquele tipo

select  count(s.nomesocio) from 
socios as s 
inner join 
tiposocios as t 
on t.idtiposocio = s.idtiposocio where tipo_socio = 'ouro';

Delimiter //
create function function2(tipo varchar(40))
returns int

BEGIN
declare total int;
select  count(s.nomesocio) into total from 
socios as s 
inner join 
tiposocios as t 
on t.idtiposocio = s.idtiposocio where t.tipo_socio = tipo
;
return total ;
END
//
delimiter ;

select function2('ouro');

-- 3 - Cria uma função que ao receber duas datas retorne o valor total recebido dos pedidos para aquela data

select sum(valor_total) from 
pedidos where  datapedido = '2016-01-01' || datapedido = '2016-02-06';

Delimiter //
create function function3(data1 date , data2 date)
returns float
BEGIN
declare total float;
select sum(p.valor_total) into total from 
pedidos as p  where  p.datapedido >= data1 and p.datapedido <= data2
;
return total;
END
//
delimiter ;

select function3('2016-01-02','2016-01-17');

-- 4 - Crie uma função que retorne o valor total das comissões de 10% ( do valor dos pedidos ) recebidas por um Atendente. A função deverá receber o nome do atendente, um ano.

select sum(p.valor_total) from 
pedidos as p 
inner join
atendentes as a 
on a.idatendentes = p.idatendentes
where nomeatendente = 'Jorge' and datapedido ='2016-02-06';


Delimiter //
create function function4(nome varchar(40),data1 date)
returns float
BEGIN
declare total float;
declare porcent float;
select sum(p.valor_total)  into total from 
pedidos as p 
inner join
atendentes as a 
on a.idatendentes = p.idatendentes
where nomeatendente = nome and datapedido = data1;

select total * 0.1 into porcent ;

return porcent;
END
//
delimiter ;
select function4('Jorge','2016-02-06');
-- 5 - Crie uma função que retorne o nome do sócio com maior número de pedidos. Receba como parâmetro um ano de referência

select count(p.idsocios),s.nomesocio from 
socios as s
inner join 
pedidos as p 
on p.idsocios = s.idsocios 
where  datapedido = '2016-02-06'
group by  p.idsocios 
order by count(p.idsocios) desc limit 1
;

Delimiter //
create function function5(data1 date)
returns varchar(40)

BEGIN
declare nome varchar(40);

select s.nomesocio into nome from 
socios as s
inner join 
pedidos as p 
on p.idsocios = s.idsocios 
where  datapedido = data1
group by  p.idsocios 
order by count(p.idsocios) desc limit 1
;
return nome ;

END
//
delimiter ;

select function5('2016-02-06');



-- 6 - Crie uma função que retorne o total de pedidos em que um sabor de pizza (passado como parâmetro) esteve.


select count(p.idpedidos) from 
pedidos as p 
inner join  
itens as i 
on i.idpedidos = p.idpedidos
inner join 
pizzas as pz 
on pz.idpizzas = i.idpizzas
where sabor="Mussarela"
;

Delimiter //

create function function6(sabor varchar(40))
returns int
BEGIN
declare total int;
select count(p.idpedidos) into total from 
pedidos as p 
inner join  
itens as i 
on i.idpedidos = p.idpedidos
inner join 
pizzas as pz 
on pz.idpizzas = i.idpizzas
where pz.sabor=sabor
;
return total;

END
//
delimiter ;

select function6("Mussarela") ;

-- 7 - Crie uma função que retorne o preço médio de pizzas que já estiveram em pedidos

 
 select  avg(p.valor_total) 
 from pedidos as p 
 where datapedido <'2016-01-01';
 
Delimiter //

create function function7(data1 date)
returns float
BEGIN
declare total float;

 select  avg(p.valor_total) into total 
 from pedidos as p 
 where datapedido < data1;

return total;

END
//
delimiter ;

select function7('2016-01-01')