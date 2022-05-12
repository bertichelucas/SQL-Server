 if object_id('mujeres') is not null
  drop table mujeres;

 if object_id('varones') is not null
  drop table varones;

 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);

 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

select v.nombre,m.nombre
from varones as v
cross join mujeres as m;