create or alter view vAlumnoCarrera
as
	select a.AlumnoID, a.NOmbre, a.CarreraID, a.Direccion, c.nombre nombreCarrera
	from Alumno as a
	inner join Carrera as c on a.carreraid = c.carreraid
go

select * from vAlumnoCarreraCampus
update vAlumnoCarreraCampus set NombreAlumno = 'Xerapio', CarreraID = 3 where AlumnoID = 7

