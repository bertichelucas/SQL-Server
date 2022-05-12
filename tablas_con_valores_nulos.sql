if OBJECT_ID('medicamentos') is not null
	drop table medicamentos;

create table medicamentos(
	codigo integer not null,
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer not null
	);

exec sp_columns medicamentos;

insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values (1, 'Sertal gotas', null, null, 100);

insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values (2, 'Sertal compuesto', null, 8.90, 150);

insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values (3, 'Buscapina', 'Roche', null, 200);
/*
select *from medicamentos;

select *from medicamentos where laboratorio is null;
select *from medicamentos where laboratorio='';

select *from medicamentos where precio is null;
select *from medicamentos where precio=0;
*/
select *from medicamentos where laboratorio<>'';
select *from medicamentos where laboratorio is not null;

select *from medicamentos where precio<>0;
select *from medicamentos where precio is not null;
