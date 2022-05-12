 if object_id ('empleados') is not null
  drop table empleados;
 if object_id ('clientes') is not null
  drop table clientes;

if exists(select name from systypes
	where name='tipo_a�o')
	exec sp_droptype tipo_a�o;

exec sp_addtype tipo_a�o, 'int', 'null';

exec sp_help tipo_a�o;

create table empleados(
	documento char(8),
	nombre varchar(30),
	a�oingreso tipo_a�o
);

if OBJECT_ID ('RG_a�o') is not null
	drop rule RG_a�o;

go 

create rule RG_a�o
as @a�o between 1990 and datepart(year,getdate());

go

exec sp_bindrule RG_a�o, 'tipo_a�o','futureonly';

create table clientes(
	documento char(8),
	nombre varchar(30),
	a�oingreso tipo_a�o
);

exec sp_helpconstraint clientes;