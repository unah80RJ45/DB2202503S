drop table Asignatura 

create table Asignatura
(
	AsignaturaID	int not null,
	Nombre			varchar(50) not null,
	UV				int not null,
	Laboratorio		bit not null,
	RequisitoID		int null
)

create or alter procedure spSelectAsignatura @req int = 0
as
	select * from Asignatura where RequisitoID = @req or @req = 0
go

create or alter procedure spInsertAsignatura @asi int output, @nom varchar(50), @unidades int, @lab bit, @req int
as
	select @asi = max(AsignaturaID) + 1 from Asignatura
	insert into Asignatura values(@asi, @nom, @unidades, @lab, @req)
go

create or alter procedure spUpdateAsignatura @asignaturaid int, @nombre varchar(50), @uv int, @laboratorio bit, @RequisitoID int
as
	update Asignatura
	   set Nombre = @nombre, UV = @uv, Laboratorio = @laboratorio, RequisitoID = @RequisitoID
	 where AsignaturaID = @asignaturaid
go

create or alter procedure spDeleteAsignatura @asignaturaid int
as
	delete from Asignatura where AsignaturaID = @asignaturaid
go

update Asignatura set RequisitoID = 1 where AsignaturaID = 5
