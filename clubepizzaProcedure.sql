use clubedapizza;

-- procedure 

-- 1 - Adicionar uma pizza(id) a um pedido(id)
-- Verificar se a existe um item ( count(*) )
-- se SIM add um na coluna 'quantidade' ( UPDATE ) / * se NAO inserir um item ( INSERT ) 'quantidade' = 1 e 'tipo' = 1


select * from itens;

delimiter //

create procedure ADD_pizza (  pizzaid int , pedidoid int )  
begin
declare temPEdido int ;
select count(*) into temPEdido from itens where idpedidos = pedidoid and idpizzas = pizzaid;

if temPedido > 0  then

update itens set quantidade =+ 1 where pedidoid;

else 

insert into itens values (idpedidos = pedidoid,idpizzas = pizzaid );

end if ;
end //
delimiter ;

call ADD_pizza(10,10);

--   2 - Fechar um pedido ( calculando o valor_total ) usando while
  
  
delimiter //
  
create procedure fechar_pedido(pedido int)
begin 

declare myIndex int ;

declare totalItem int ;

declare sumItem int ;

set myIndex = 0 ;

update pedidos set valor_total = 0 where idpedidos = pedido  ;

select count(*) into totalitem from itens where where idpedidos = pedido;

while myIndex < totalItem do 
select (i.quantidade * p.preco) into sumItem from itens as i 
join pizzas as p on p.idpizzas = i.dpizzas 
where i.idpedidos = pedido 
limited myIndex,1;

set myIndex = myIndex +1 ;

uptade pedidos set valor_total + sumItem where idpedidos = pedido ;
end while;
end ;
  
delimiter ;
  
  