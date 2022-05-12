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
 insert into empleados values('22333333','Luis','Lopez',350,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',null,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',460,3,'Secretaria');
 insert into empleados values('22777777','Andres','Perez',580,3,'Sistemas');
 insert into empleados values('22888888','Laura','Garcia',400,3,'Secretaria');

if OBJECT_ID('pa_seccion') is not null
	drop procedure pa_seccion;

go

create procedure pa_seccion
@nombreseccion varchar(20),
@promedio decimal(6,2) output,
@sueldomaximo decimal(6,2) output
as select @promedio= avg(sueldo), @sueldomaximo= max(sueldo) from empleados
where seccion like @nombreseccion;

go

declare @p decimal(6,2), @m decimal(6,2);
exec pa_seccion 'Contaduria', @p output, @m output;

select  @p as promedio, @m as mayor;

if OBJECT_ID('pa_sueldototal') is not null
	drop procedure pa_sueldototal;

go

create procedure pa_sueldototal
@documento char(8),
@sueldototal decimal(6,2) output
as select @sueldototal= sueldo + case 
when sueldo < 500 then 200 * cantidadhijos
else 100* cantidadhijos end from empleados
where documento=@documento;

go

declare @s decimal(6,2);
exec pa_sueldototal '22777777', @s output;
select @s as sueldo_total;