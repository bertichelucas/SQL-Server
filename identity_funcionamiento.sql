if OBJECT_ID('medicamentos') is not null
	drop table medicamentos;

create table medicamentos(
	codigo int identity,
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad int,
	);

exec sp_columns medicamentos;

insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);

insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);

insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);

select *from medicamentos;

select ident_seed('medicamentos');

select ident_incr('medicamentos');

set identity_insert medicamentos on;

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(4, 'Paracetamol','Bayer',3,300);

select *from medicamentos;

-- Se genera el codigo de manera automatica. No puede haber codigos repetidos.
/*
codigo int identity(100, 2) esto lo que hace es inicializar el valor en 100 e incrementarlo de 2 en 2.
*/