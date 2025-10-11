--drop view vAlumnoCarreraCampus

create or alter view vAlumnoCarreraCampus
with encryption
as
	select a.AlumnoID, a.Nombre NombreAlumno, a.CarreraID, c.Nombre NombreCarrera, a.Direccion, c.CampusID, cm.Nombre NombreCampus
	from Alumno as a
	inner join Carrera as c on a.CarreraID = c.CarreraID
	inner join Campus as cm on c.CampusID = cm.CampusID
go

create or alter view vAlumnosPorCarrera
as
	select NombreCarrera, count(*) as Alumnos
	from vAlumnoCarreraCampus
	group by NombreCarrera
	having count(*) > 1
go

select * from vAlumnosPorCarrera
