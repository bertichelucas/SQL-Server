 if object_id('vehiculos') is not null
  drop table vehiculos;

 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron;
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo;
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2;

create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

go

create rule RG_patente_patron
as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';
go

exec sp_bindrule RG_patente_patron, 'vehiculos.patente';
go

create rule RG_vehiculos_tipo
as @tipo in ('a','m');
go 

exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo';
go

create rule RG_vehiculos_tipo2
as @tipo in ('a','c','m');
go 

exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo';
go

drop rule RG_vehiculos_tipo;

exec sp_unbindrule 'vehiculos.patente';

exec sp_help

drop rule RG_patente_patron;

exec sp_help