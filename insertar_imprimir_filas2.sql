if object_id('libros') is not null
	drop table libros;

create table libros(
	titulo varchar(80),
	autor varchar(30),
	editorial varchar(30),
	precio float,
	cantidad integer
	);

exec sp_columns libros;

insert into libros(titulo, autor, editorial, precio, cantidad) values('El Aleph', 'Borges','Emece',20.51,200);

insert into libros(titulo, autor, editorial, precio, cantidad) values('Hola', 'que','tal',30.10,100);

select titulo,autor from libros;
