create or alter view vCarreraSinALumno
as
	select CarreraID, Nombre, CampusID from Carrera
	where CarreraID not in(select carreraid from alumno)
go

select * from vCarreraSinALumno
select * from vAlumnosPorCarrera

select * from Carrera
select * from Alumno

insert into Alumno values(7, 'Raul', 3)
