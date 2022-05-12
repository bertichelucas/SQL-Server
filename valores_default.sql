if OBJECT_ID('visitantes') is not null
	drop table visitantes;

create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	ciudad varchar(20) default 'Cordoba',
	telefono varchar(11),
	mail varchar(30) default 'No tiene',
	monto_compra decimal(6,2)
	);

exec sp_columns visitantes;

insert into visitantes(nombre, domicilio, monto_compra) values ('Susana Molina','Colon 123', 59.80);

insert into visitantes(nombre,edad,ciudad,mail) values('Marcos Torres',29,'Rosario','marcostorres@gmail.com');

select * from visitantes;

insert into visitantes default values;

insert into visitantes values('Cait',19,default, 'Piltover', default, '12312312',default, 324.25);

select * from visitantes;