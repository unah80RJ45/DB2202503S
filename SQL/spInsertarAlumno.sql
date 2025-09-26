create or alter procedure spInsertarAlumno @nombre varchar(50), @carrera varchar(50), @direccion varchar(50), @telefono varchar(20), @campus int
as
	declare @carreraid int, @alumnoid int
	select @carreraid = max(CarreraID) from Carrera where Nombre = @carrera
	if @carreraid is null
		begin
			select @carreraid = max(CarreraID) + 1 from Carrera
			insert into Carrera values(@carreraid, @carrera, @campus)
		end
	select @alumnoid = max(AlumnoID) + 1 from Alumno
	insert into Alumno values(@alumnoid, @nombre, @carreraid, @direccion, @telefono)

	select * from Alumno where AlumnoID = @alumnoid
go

select * from Carrera

execute spInsertarAlumno 'Jose Lopez', 'Mecatronica', 'SPS', '5555', 2
