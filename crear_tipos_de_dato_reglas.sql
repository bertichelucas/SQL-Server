 if object_id ('empleados') is not null
  drop table empleados;
 if object_id ('clientes') is not null
  drop table clientes;

if exists(select name from systypes
	where name='tipo_año')
	exec sp_droptype tipo_año;

exec sp_addtype tipo_año, 'int', 'null';

exec sp_help tipo_año;

create table empleados(
	documento char(8),
	nombre varchar(30),
	añoingreso tipo_año
);

if OBJECT_ID ('RG_año') is not null
	drop rule RG_año;

go 

create rule RG_año
as @año between 1990 and datepart(year,getdate());

go

exec sp_bindrule RG_año, 'tipo_año','futureonly';

create table clientes(
	documento char(8),
	nombre varchar(30),
	añoingreso tipo_año
);

exec sp_helpconstraint clientes;