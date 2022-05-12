if object_id('visitantes') is not null
  drop table visitantes;

create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  monto decimal (6,2)
 );

  insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, monto)
  values ('Alejandra Gonzalez','La Falda',28.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail, monto)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);


select *from visitantes;
--Cant visitantes de cada ciudad.
select ciudad, count(*)
from visitantes
group by ciudad;

select *from visitantes;
--Cant visitantes de cada ciudad con telefono no nulo.
select ciudad, count(telefono)
from visitantes
group by ciudad;

select *from visitantes;
--Total del monto de las compras agrupadas por sexo.
select sexo, sum(monto)
from visitantes
group by sexo;

select *from visitantes;
--Max y min valor de compra agrupados por sexo y ciudad.
select sexo, ciudad, max(monto) as Maximo, min(monto) as Minimo
from visitantes
group by sexo, ciudad;

select *from visitantes;
--Promedio del valor de compra agrupados por ciudad.
select ciudad, avg(monto)
from visitantes
group by ciudad;

select *from visitantes;
--Contar y agrupar por ciudad visitantes con mail.
select ciudad, count(mail)
from visitantes
where mail<>'no tiene'
group by ciudad;

select *from visitantes;
--Contar todos incluidos los que tienen null.
select ciudad, count(mail)
from visitantes
where mail<>'no tiene'
group by all ciudad;