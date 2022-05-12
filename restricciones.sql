 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  numero int identity,
  nombre varchar(30),
  edad tinyint,
  domicilio varchar(30),
  ciudad varchar(20),
  montocompra decimal (6,2) not null
 );

alter table visitantes
	add constraint DF_visitantes_ciudad
	default 'Cordoba'
	for ciudad;

alter table visitantes
	add constraint DF_visitantes_montocompra
	default 0
	for montocompra;
