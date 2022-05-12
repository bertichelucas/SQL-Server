 if object_id('consultas') is not null
  drop table consultas;
 if object_id('medicos') is not null
  drop table medicos;

 create table medicos (
  documento char(8) not null,
  nombre varchar(30),
  constraint PK_medicos 
   primary key clustered (documento)
 );

 create table consultas(
  fecha datetime,
  medico char(8) not null,
  paciente varchar(30),
  constraint PK_consultas
   primary key (fecha,medico),
  constraint FK_consultas_medico
   foreign key (medico)
   references medicos(documento)
   on update cascade
   on delete cascade
 );

 insert into medicos values('22222222','Alfredo Acosta');
 insert into medicos values('23333333','Pedro Perez');
 insert into medicos values('24444444','Marcela Morales');

 insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
 insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
 insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
 insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
 insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');

 if OBJECT_ID('f_nombreDia') is not null
	drop function dbo.f_nombreDia;

go

create function f_nombreDia
(@fecha datetime)
returns varchar(15)
begin
	declare @resultado varchar(15);
	set @resultado=
	case datename(weekday, @fecha)
	when'Monday' then 'Lunes'
	when 'Tuesday' then 'Martes'
	when 'Wednesday' then 'Miercoles'
	when 'Thursday' then 'Jueves'
	when  'Friday' then 'Viernes'
	when 'Saturday' then 'Sabado'
	else 'Domingo'
	end;
return @resultado;
end;


go 

select dbo.f_nombreDia('2007/03/24 8:30');
