 if object_id('clientes') is not null
  drop table clientes;
 if object_id('provincias') is not null
  drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values('Garcia Juan','Sucre 345','Cordoba',1);
 insert into clientes values('Lopez Susana','Caseros 998','Posadas',3);
 insert into clientes values('Marcelo Moreno','Peru 876','Viedma',4);
 insert into clientes values('Lopez Sergio','Avellaneda 333','La Plata',5);

--Funciona igual que el resto de las restricciones

alter table clientes
add constraint FK_clientes_codigoprovincia
foreign key(codigoprovincia)
references provincias(codigo)
on update cascade
on delete cascade;
--No funciona, hay un registro que no cumple con la restriccion

alter table clientes
with nocheck
add constraint FK_clientes_codigoprovincia
foreign key(codigoprovincia)
references provincias(codigo)
on update cascade
on delete cascade;

exec sp_helpconstraint clientes;

exec sp_helpconstraint provincias;

alter table clientes
nocheck constraint FK_clientes_codigoprovincia;
--Deshabilitada la restriccion

exec sp_helpconstraint clientes;

exec sp_helpconstraint provincias;


