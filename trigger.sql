use clubedapizza;


-- 1 - Cria uma Trigger que:
-- 1.1 - Na tabela clubedapizza.itens
-- 1.2 - Depois que inserir um registro
-- 1.3 - Acumule a quantidade de itens inseridos “set @sum = @sum + NEW.quantidade;”


Delimiter //
CREATE TRIGGER trigger1
AFTER INSERT ON clubedapizza.itens
FOR EACH ROW
BEGIN
    SET @sum = @sum + NEW.quantidade;
END;
//delimiter ;

SET @sum = 0;

select @sum;

Insert into itens values (83,2, 49 , 1);


-- 2 - Criar uma trigger que:
-- 2.1 - Na tabela clubedapizza.itens
-- 2.2 - Antes que inserir um registro
-- 2.3 - Valide que a quantidade é maior que zero, se não, atualize para zero “SET NEW.quantidade = 0;”


Delimiter //
CREATE TRIGGER trigger2
before Insert ON clubedapizza.itens
FOR EACH ROW
BEGIN
   SET  NEW.quantidade = 0;
END;
//delimiter ;


select * from itens;

-- 3 - Cria uma Trigger que:
-- 3.1 - Na tabela clubedapizza.pedidos
-- 3.2 - Antes de deletar um pedido
-- 3.3 - Delete os registros na tabela itens, relacionados ao pedido excluido 
-- “delete from itens where idpedidos = OLD.idpedidos;”

Delimiter //
CREATE TRIGGER trigger3
before delete ON clubedapizza.pedidos
FOR EACH ROW
BEGIN
   delete from itens where idpedidos = OLD.idpedidos;
END;
//delimiter ;

delete from pedidos where idpedidos=83;

select * from pedidos;