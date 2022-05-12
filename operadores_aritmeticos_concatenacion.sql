if OBJECT_ID('articulos') is not null
	drop table articulos;

create table articulos(
	codigo int identity,
	nombre varchar(20),
	descripcion varchar(30),
	precio smallmoney,
	cantidad tinyint default 0,
	primary key(codigo)
	);

insert into articulos(nombre, descripcion, precio,cantidad) values('Impresora','Epson Stylus C45', 400.80,20);

insert into articulos(nombre, descripcion, precio) values('Impresora','Epson Stylus C85', 500);

insert into articulos(nombre, descripcion, precio) values('Monitor','Samsung 14', 800);

insert into articulos(nombre, descripcion, precio,cantidad) values('Teclado','Ingles Biswal',100,50);

update articulos set precio= precio * 1.15;

select *from articulos;

select nombre + ', ' + descripcion as Producto from articulos;

update articulos set cantidad= cantidad - 5 where nombre='Teclado';

select *from articulos;