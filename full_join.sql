 if (object_id('deportes')) is not null
  drop table deportes;

 if (object_id('inscriptos')) is not null
  drop table inscriptos;

 create table deportes(
  codigo tinyint identity,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte tinyint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );

 insert into deportes values('tenis','Marcelo Roca');
 insert into deportes values('natacion','Marta Torres');
 insert into deportes values('basquet','Luis Garcia');
 insert into deportes values('futbol','Marcelo Roca');
 
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 
 insert into inscriptos values('22222222',5,'n'); 

 select i.documento,matricula,d.nombre
 from inscriptos as i
 join deportes as d
 on i.codigodeporte=d.codigo;

 select i.documento,matricula,d.nombre
 from inscriptos as i
 left join deportes as d
 on i.codigodeporte=d.codigo;

  select i.documento,matricula,d.nombre
 from deportes as d
 right join inscriptos as i
 on i.codigodeporte=d.codigo;

 select i.documento,matricula,d.nombre
 from deportes as d 
 left join inscriptos as i
 on i.codigodeporte=d.codigo
 where i.codigodeporte is NULL;

  select i.documento,matricula,d.nombre
 from inscriptos as i
 left join deportes as d
 on i.codigodeporte=d.codigo
 where d.codigo is NULL;

select i.documento,matricula,d.nombre
from inscriptos as i
full join deportes as d
on i.codigodeporte=d.codigo;