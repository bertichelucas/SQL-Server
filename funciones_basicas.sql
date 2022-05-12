if OBJECT_ID('empleados') is not null
	drop table empleados;

create table empleados(
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	documento char(8),
	fecha_nacimiento datetime,
	fecha_ingreso datetime,
	sueldo decimal(6,2),
	primary key(documento)
	);

 insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
 insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
 insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
 insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
 insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

 select nombre + ' ' +upper(apellido) as NombreCompleto, 
		'Dni: ' + documento as Documento,  
		'$' + str(sueldo,6,2) as Sueldo from empleados;

 select 'Dni: ' + documento as Documento,
		'$' + str(ceiling(sueldo),6) as Sueldo from empleados;

 select nombre + ' ' +upper(apellido) as NombreCompleto from empleados where month(fecha_nacimiento)=10;

 select nombre + ' ' +upper(apellido) as NombreCompleto from empleados where year(fecha_ingreso)=2000;

