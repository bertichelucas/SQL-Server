 if object_id('empleados')is not null
  drop table empleados;
 if object_id('sucursales')is not null
  drop table sucursales;

 create table sucursales( 
  codigo int identity,
  ciudad varchar(30) not null,
  primary key(codigo)
 );

create table empleados( 
  documento char(8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  codigosucursal int,
  primary key(documento),
  constraint FK_empleados_sucursal
   foreign key (codigosucursal)
   references sucursales(codigo)
   on update cascade
 ); 

 insert into sucursales values('Cordoba');
 insert into sucursales values('Villa Maria');
 insert into sucursales values('Carlos Paz');
 insert into sucursales values('Cruz del Eje');

 insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
 insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
 insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
 insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
 insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
 insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
 insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
 insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

 select e.*, ciudad from empleados as e
 join sucursales
 on e.codigosucursal=codigo;

if OBJECT_ID('secciones') is not null
	drop table secciones;

select distinct seccion as nombre 
into secciones
from empleados;

select *from secciones;
if OBJECT_ID('sueldos_por_seccion') is not null
	drop table sueldos_por_seccion;

select seccion as nombre, sum(sueldo) as sueldototal
into sueldos_por_seccion
from empleados
group by seccion;

select *from sueldos_por_seccion;

if OBJECT_ID('maximos_sueldos') is not null
	drop table maximos_sueldos;

select top 3 *
into maximos_sueldos
from empleados
order by sueldo;

select *from maximos_sueldos;