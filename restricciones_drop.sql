 if object_id('vehiculos') is not null
  drop table vehiculos;


 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

 alter table vehiculos
 add constraint CK_vehiculos_tipo_unicos
 check (tipo in ('a', 'm'));

 alter table vehiculos 
 add constraint DF_vehiculos_tipo
 default 1
 for tipo;

 alter table vehiculos
 add constraint CK_vehiculos_patente_patron
 check(patente like'[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

 alter table vehiculos
 add constraint PK_vehiculos_patentellegada
 primary key(patente, horallegada);

 exec sp_helpconstraint vehiculos;

 alter table vehiculos
 drop DF_vehiculos_tipo, PK_vehiculos_patentellegada;

 exec sp_helpconstraint vehiculos;