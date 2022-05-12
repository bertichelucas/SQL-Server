if object_id('clientes') is not null
  drop table clientes;
 if object_id('provincias') is not null
  drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint
 );

 create table provincias(
  codigo tinyint not null,
  nombre varchar(20)
 );

 alter table provincias
 add constraint PK_provincias_codigo
 primary key(codigo);

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);
 insert into clientes values('Luisa Lopez','Juarez 555','La Plata',6);

 alter table clientes
 add constraint FK_clientes_codigoprovincia
 foreign key (codigoprovincia)
 references provincias(codigo);

 exec sp_helpconstraint provincias;

 delete from clientes where codigoprovincia=6;

 alter table clientes
 add constraint FK_clientes_codigoprovincia
 foreign key (codigoprovincia)
 references provincias(codigo);