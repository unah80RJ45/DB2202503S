drop table Materia 

create table Materia
(
	MateriaID	int not null primary key,
	Nombre		varchar(50) not null
)
go
drop rule rMateria 
go
create rule rMateria as @col > 0
go
exec sp_bindrule 'rMateria', 'Materia.MateriaID'

insert into Materia values(1, 'DB1')
insert into Materia values(2, 'DB2')
insert into Materia values(3, 'POO')
insert into Materia values(4, 'Gerencia Informatica')
select * from Materia

delete from Materia 
