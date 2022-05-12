if object_id('libros') is not null
	drop table libros;

exec sp_tables @table_owner='dbo';

create table libros(
	titulo varchar(20),
	autor varchar(30),
	editorial varchar(15)
	);

exec sp_tables @table_owner='dbo';

if object_id('libros') is not null
	drop table libros;

