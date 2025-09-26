create or alter procedure spConsultarAlumnos
as
	select *, upper(a.nombre)
	from Alumno as a
	inner join Carrera as c on a.CarreraID = c.CarreraID
	inner join Campus cm on c.CampusID = cm.CampusID
	order by a.Nombre

	select * from Campus
	select * from Carrera 
go

execute spConsultarAlumnos