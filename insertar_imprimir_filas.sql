if object_id('usuarios') is not null
	drop table usuarios;

create table usuarios(
	nombre varchar(20),
	clave varchar(10)
	);

insert into usuarios(nombre, clave) values('Lucas','123123');

select *from usuarios;

insert into usuarios(nombre, clave) values('Maria','3123123123');

select *from usuarios;