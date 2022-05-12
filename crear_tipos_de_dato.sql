 if object_id ('empleados') is not null
  drop table empleados;

 if exists (select name from systypes
  where name = 'tipo_legajo')
  exec sp_droptype tipo_legajo
 
exec sp_addtype tipo_legajo, 'char(4)', 'not null';

exec sp_help tipo_legajo;

create table empleaados(
	legajo tipo_legajo,
	documento char(8),
	nombre varchar(30)
);

exec sp_columns empleaados;