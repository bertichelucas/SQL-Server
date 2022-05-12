 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
 if object_id('profesores') is not null
  drop table profesores;
 if object_id('deportes') is not null
  drop table deportes;

/*
- un socio puede inscribirse en varios deportes, pero no dos veces en el mismo.
- un socio tiene un documento único y un número de socio único.
- el documento del socio debe contener 8 dígitos.
- un deporte debe tener asignado un profesor que exista en "profesores" o "null" si aún no tiene un 
instructor definido.
- el campo "dia" de "deportes" puede ser: lunes, martes, miercoles, jueves, viernes o sabado.
- el campo "dia" de "deportes" por defecto debe almacenar 'sabado'.
- un profesor puede ser instructor de varios deportes o puede no dictar ningún deporte.
- un profesor no puede estar repetido en "profesores".
- el documento del profesor debe contener 8 dígitos.
- un inscripto debe ser socio, un socio puede no estar inscripto en ningún deporte.
- una inscripción debe tener un valor en socio existente en "socios" y un deporte que exista en 
"deportes".
- el campo "matricula" de "inscriptos" debe aceptar solamente los caracteres 's' o 'n'.
*/

create table profesores(
	documento varchar(8) not null,
	nombre varchar(30),
	domicilio varchar(30),
	constraint PK_profesores_documento
	primary key (documento),
	constraint CK_profesores_documento_patron
	check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	);


create table deportes(
	codigo int identity,
	nombre varchar(20),
	dia varchar (10)
	constraint DF_deportes_dia 
	default('sabado'),
	documento_profesor varchar(8),
	constraint PK_deportes_codigo
	primary key (codigo),
	constraint CK_deportes_dias_validos
	check (dia in ('lunes','martes','miercoles','jueves','viernes','sabado')),
	);

create table socios(
	documento varchar(8) not null,
	numero int identity,
	nombre varchar(30),
	domicilio varchar(30),
	constraint UQ_socios_documento
	unique(documento),
	constraint PK_socios_numero
	primary key(numero),
	constraint CK_socios_documento_patron
	check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	);

create table inscriptos(
	numero_socio int,
	codigo_deporte int,
	matricula char(1), --'s' o 'n'
	constraint FK_inscriptos_socios
	foreign key(numero_socio)
	references socios(numero)
	on update cascade,
	constraint FK_inscriptos_deporte
	foreign key(codigo_deporte)
	references deportes(codigo)
	on update cascade,
	constraint CK_inscriptos_matricula
	check(matricula in ('s', 'n'))
	);

 insert into profesores values('21111111','Andres Acosta','Avellaneda 111');
 insert into profesores values('22222222','Betina Bustos','Bulnes 222');
 insert into profesores values('23333333','Carlos Caseros','Colon 333');

  insert into deportes values('basquet','lunes',null);
 insert into deportes values('futbol','lunes','23333333');
 insert into deportes values('natacion',null,'22222222');
 insert into deportes values('padle',default,'23333333');
 insert into deportes (nombre,dia) values('tenis','jueves');

 insert into socios values('30111111','Ana Acosta','America 111');
 insert into socios values('30222222','Bernardo Bueno','Bolivia 222');
 insert into socios values('30333333','Camila Conte','Caseros 333');
 insert into socios values('30444444','Daniel Duarte','Dinamarca 444');

 insert into inscriptos values(1,3,'s');
 insert into inscriptos values(1,5,'s');
 insert into inscriptos values(2,1,'s');
 insert into inscriptos values(4,1,'n');
 insert into inscriptos values(4,4,'s');

select sc.documento,sc.nombre,sc.domicilio,numero,d.nombre as nombre_deporte,
d.dia,p.nombre as nombre_profesor
from socios as sc
left join inscriptos as i
on sc.numero=i.numero_socio
left join deportes as d
on d.codigo=i.codigo_deporte
left join profesores as p
on d.documento_profesor=p.documento;