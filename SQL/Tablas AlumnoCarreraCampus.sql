create table Campus
(
	CampusID	int not null primary key,
	Nombre		varchar(50)
)
create table Carrera
(
	CarreraID	int not null primary key,
	Nombre		varchar(50) not null,
	CampusID	int not null
)
create table Alumno 
(
	AlumnoID	int not null primary key,
	Nombre		varchar(50),
	CarreraID	int not null
)

insert into Campus values(1, 'CU'), (2, 'VS'), (3, 'CURC')
insert into Carrera values(1, 'Periodismo', 1), (2, 'Medicina', 3), (3, 'Derecho', 2)
insert into Alumno values(1, 'Juan', 2), (2, 'Maria', 1), (3, 'Jose', 1)
