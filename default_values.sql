 if object_id ('libros') is not null
  drop table libros;

 if object_id ('VP_cero') is not null
   drop default VP_cero;
 if object_id ('VP_desconocido') is not null
   drop default VP_desconocido;
 if object_id ('RG_positivo') is not null
   drop rule RG_positivo;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  cantidad smallint
 );
 go

 create rule RG_positivo
 as @valor>=0;
 go

 exec sp_bindrule RG_positivo, 'libros.precio';
 exec sp_bindrule RG_positivo, 'libros.cantidad';
go

create default VP_cero
as 0
go

exec sp_bindefault VP_cero, 'libros.precio';
exec sp_bindefault VP_cero, 'libros.cantidad';
go

create default VP_desconocido
as 'Desconocido';
go

exec sp_bindefault VP_desconocido, 'libros.autor';
exec sp_bindefault VP_desconocido, 'libros.editorial';

exec sp_helpconstraint libros

insert into libros(titulo)  values('Prueba');

select *from libros;

exec sp_unbindefault 'libros.precio';

insert into libros(titulo)  values('Prueba2');
select *from libros;


