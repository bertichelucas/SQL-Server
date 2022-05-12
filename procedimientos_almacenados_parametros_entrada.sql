 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

 if OBJECT_ID('pa_empleados_sueldo') is not null
	drop procedure pa_empleados_sueldo;

go

create procedure pa_empleados_sueldo
@sueldobase decimal(6,2)
as  select nombre, apellido, sueldo from empleados
where sueldo>=@sueldobase;

go

exec pa_empleados_sueldo 400;
exec pa_empleados_sueldo 500;

if OBJECT_ID('pa_empleados_actualizar_sueldo') is not null
	drop procedure pa_empleados_actualizar_sueldo;

go

create procedure pa_empleados_actualizar_sueldo
@nuevosueldo decimal(6,2),
@viejosueldo decimal(6,2)
as update empleados set sueldo= @nuevosueldo
where sueldo=@viejosueldo;

go

exec pa_empleados_actualizar_sueldo 350, 300;

select *from empleados;

