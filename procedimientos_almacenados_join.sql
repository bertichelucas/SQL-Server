if (object_id('libros')) is not null
  drop table libros;
 if (object_id('ventas')) is not null
  drop table ventas;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(6,2),
  cantidad int,
  primary key (codigo)
 );

 create table ventas(
  numero int identity,
  codigo int not null,
  preciounitario decimal(6,2),
  cantidad int, 
  constraint PK_ventas primary key (numero),
  constraint FK_ventas_codigolibro
   foreign key (codigo)
   references libros(codigo)
   on update cascade
 );

 insert into libros values('Uno','Richard Bach','Planeta',15,100);
 insert into libros values('Ilusiones','Richard Bach','Planeta',18,150);
 insert into libros values('El aleph','Borges','Emece',25,200);
 insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',20,300);
 insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45,200);
 
 insert into ventas values(1,15,1);
 insert into ventas values(2,18,1);
 insert into ventas values(3,25,100);
 insert into ventas values(1,15,50);

if OBJECT_ID('pa_ventas') is not null
	drop procedure pa_ventas;

go

create procedure pa_ventas
as select v.numero, l.titulo, l.autor, l.editorial, v.preciounitario, v.cantidad from libros as l
join ventas as v
on v.codigo=l.codigo;

exec pa_ventas;

go 

if OBJECT_ID('pa_vender') is not null
	drop procedure pa_vender;

go

create procedure pa_vender
@codigo int,
@cantidad int
as
if ( select cantidad from libros where codigo=@codigo)- @cantidad < 0 or (select codigo from libros where codigo=@codigo) is null
	select 'cantidad insuficiente/libro inexistente';
else
	begin
	insert into ventas values (@codigo, (select precio from libros where codigo=@codigo), @cantidad);
	update libros set cantidad= cantidad - @cantidad;
	end


exec pa_vender 15, 100;
select *from libros;
select *from ventas;