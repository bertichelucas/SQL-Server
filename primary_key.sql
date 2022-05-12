if OBJECT_ID('libros') is not null
	drop table libros;

create table libros(
	codigo int not null,
	titulo varchar(20) not null,
	autor varchar(20),
	editorial varchar(15),
	primary key(codigo)
	);

--Creacion de una tabla de libros cuya primary key es el codigo del libro,