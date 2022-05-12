if object_id('empleados') is not null
  drop table empleados;

create table empleados(
  documento char(8) not null,
  apellido varchar(30) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(30),
  fechanacimiento datetime,
  constraint PK_empleados
   primary key(documento)
 );

 insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
 insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
 insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
 insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');


  if object_id('f_empleados') is not null
  drop function f_empleados;

go

create function f_empleados
(@tipo varchar(10))
returns @lista_empleados table
(documento char(8), nombre varchar(60), domicilio varchar(60), nacimiento varchar(12))
as 
begin
if @tipo = 'total'
	insert @lista_empleados
	select documento, (apellido + ' ' + nombre), (domicilio + ' ' + ciudad), cast(fechanacimiento as varchar(12))
	from empleados;
else
	insert @lista_empleados
	select documento, apellido, ciudad, cast(datepart(year,fechanacimiento) as char(4))
	from empleados;
return
end;

go

select *from dbo.f_empleados('total');
select *from dbo.f_empleados('');
select *from dbo.f_empleados('parcial');