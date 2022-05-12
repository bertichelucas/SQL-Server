if OBJECT_ID('agenda') is not null
	drop table agenda;

create table agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
	);

exec sp_columns agenda;

insert into agenda(apellido, nombre, domicilio, telefono) values ('Acosta', 'Ana', 'Colon 123', '423457');

insert into agenda(apellido, nombre, domicilio, telefono) values ('Bustamante', 'Betina', 'Avellaneda 135', '4458787');

insert into agenda(apellido, nombre, domicilio, telefono) values ('Lopez', 'Hector', 'Salta 545', '4887788');

insert into agenda(apellido, nombre, domicilio, telefono) values ('Lopez', 'Luis', 'Urquiza 333', '4545454');

insert into agenda(apellido, nombre, domicilio, telefono) values ('Lopez', 'Marisa', 'Urquiza 333', '4545454');

select *from agenda;

select *from agenda where nombre='marisa';

select nombre, domicilio from agenda where apellido='Lopez';

select nombre from agenda where telefono='4545454';

delete from agenda where nombre='betina';

update agenda set telefono='4445566', domicilio='Urquiza 334' where telefono='4545454';

select *from agenda where telefono='4445566';