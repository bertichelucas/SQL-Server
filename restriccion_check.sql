if object_id('empleados') is not null
  drop table empleados;

 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento datetime,
  cantidadhijos tinyint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

alter table empleados
add constraint CK_empleados_sueldo_positivo
check(sueldo>=0);

insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

delete from empleados where sueldo>5000;

alter table empleados
add constraint CK_empleados_sueldo_maximo
check(sueldo <=5000);

alter table empleados
add constraint CK_empleados_fechanacimiento_actual
check(fechanacimiento<getdate());


alter table empleados
add constraint CK_empleados_seccion_lista
check(seccion in ('Sistemas', 'Administracion','Contaduría'));

alter table empleados
add constraint CK_empleados_cantidadhijos_entre
check (cantidadhijos between 0 and 15);

exec sp_helpconstraint empleados;