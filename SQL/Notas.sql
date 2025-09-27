alter table Alumno add Promedio float

create table Notas
(
	AlumnoID	int not null,
	MateriaID	int not null,
	Valor		int not null,

	constraint pkNotas primary key (AlumnoID, MateriaID)
)

create table Aprobados
(
	MateriaID	int not null,
	ALumnos		int not null
)

select * from Alumno
select * from notas 
select * from aprobados 