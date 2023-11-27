Delimiter //
CREATE TRIGGER trigger1
AFTER INSERT ON clubedapizza.itens
FOR EACH ROW
BEGIN

declare preso int ;

select  preco into preso from pizzas where idpizzas = new.idpizzas;  
   update  pedidos set valor_total = (valor_total + new.quantidade * preso)  where idpedidos = new.idpedidos; 
   
END;
//delimiter ;

insert into itens values (3,8,2,2);



CREATE TABLE `logsatendentes` (
  `idLOGSAtendentes` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `idpedido` int(11) NOT NULL,
  `valorPedido` double NOT NULL,
  PRIMARY KEY (`idLOGSAtendentes`),
  KEY `idpedido` (`idpedido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Delimiter //
CREATE TRIGGER trigger2
AFTER INSERT ON clubedapizza.pedidos 
FOR EACH ROW
BEGIN
declare dada date ;
declare preso int;
select datapedido into dada from pedidos where idpedidos = new.idpedidos;
select valor_total into preso from pedidos where idpedidos = new.idpedidos;

Insert into logsatendentes values (default ,dada,new.idpedidos,preso);

END;
//delimiter ;

INsert into pedidos values (101,2,3,2225-22-22,123);


Delimiter //
CREATE TRIGGER trigger3
before Delete ON clubedapizza.pedidos 
FOR EACH ROW
BEGIN
 delete from logsatendentes where idpedido = OLD.idpedidos;
END;
//delimiter ;

drop trigger trigger6; 
delete from pedidos where idpedidos = 101;


Delimiter //
CREATE TRIGGER trigger4
before update ON clubedapizza.pedidos 
FOR EACH ROW
BEGIN
declare dada date ;
declare preso int;
select datapedido into dada from pedidos where idpedidos = new.idpedidos;
select valor_total into preso from pedidos where idpedidos = new.idpedidos;

Update  logsatendentes set data = dada, idpedido=new.idpedidos ,valorPedido=preso
where idpedido = new.idpedidos;

END;
//delimiter ;


update pedidos set idatendentes=2, idsocios=1 ,datapedido=2, valor_total=2 where idpedidos = 100;


CREATE TABLE `logsocios` (
  `idLOGSOCIOS` int(11) NOT NULL AUTO_INCREMENT,
  `nomesocios` varchar(90) NOT NULL,
  `idsocios_fk` int(11) NOT NULL,
  `datahora` datetime NOT NULL,
  PRIMARY KEY (`idLOGSOCIOS`),
  KEY `idsocios_fk` (`idsocios_fk`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Delimiter //
CREATE TRIGGER trigger5
AFTER INSERT ON clubedapizza.socios
FOR EACH ROW
BEGIN
declare nome varchar(100);
declare id int;

select nomesocio into nome from socios where idsocios = new.idsocios;
select idsocios into id from socios where idsocios = new.idsocios; 

Insert into logsocios values (default , nome , id, 2002-22-12 );
END;
//delimiter ;

insert into socios values (default ,"Pedro", 123,123213,1);


Delimiter //
CREATE TRIGGER trigger6
before Delete ON clubedapizza.socios 
FOR EACH ROW
BEGIN
 delete from logsocios where idsocios_fk= OLD.idsocios;
END;
//delimiter ;


delete from socios where idsocios = 13;


Delimiter //
CREATE TRIGGER trigger7
before update ON clubedapizza.socios
FOR EACH ROW
BEGIN
declare nome varchar(100);
declare id int;

select nomesocio into nome from socios where idsocios = new.idsocios;



Update  logsocios set nomesocios = nome 
where idsocios_fk = new.idsocios;

END;
//delimiter ;

drop trigger trigger7;
update socios set nomesocio = "PAula"  where idsocios = 14;