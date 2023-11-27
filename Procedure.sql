use cinemas ;


-- Insira dados em um estudio 

 delimiter //
 create procedure insert_estudios (nome varchar(100) , dono varchar(250), datafundacao date)
 begin 
 insert into estudios (nome , dono , datafundacao) values (nome , dono , datafundacao);
 end 
 delimiter ;

 call insert_estudios('ASSSS' , 'PEDRO' , "1908-01-31");
 
 
delimiter //

 create procedure deletar_faturamento(in estudios int, anofat int)
 begin 
delete from faturamentos  where f.idfaturamentos = estudios and ano = anofat;
 end //
 delimiter ;

 call deletar_faturamento(11,2002);
 select * from faturamentos;
 
 
 
 -- 3 - Modifique os dados de um ator [ up idade ]


delimiter //
create procedure ator_birthday (idatores int)
begin
    update atores as a set idade = idade + 1 where a.idatores = idatores;
end //

delimiter ;
select * from atores ;
call ator_birthday(6); 


 -- 3 - Modifique os dados de um ator 
delimiter //


create procedure ator_change_segurosocial (idatores int, segurosocial varchar(255))
begin
    update atores as a set segurosocial = segurosocial where a.idatores = idatores;
end //

delimiter ;

select * from atores ;
call ator_change_segurosocial(1, 1111);

-- 4 - Adicione os tipos de papéis de um ator


delimiter //
create procedure insert_tipos_papeis(nome varchar(255) , id int)
begin
    insert into tipos_papeis(descricao,idatores) values (nome,id) ;
end //

delimiter ;


select * from tipos_papeis ;
call insert_tipos_papeis('Vilao',2);