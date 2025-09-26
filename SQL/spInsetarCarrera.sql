create or alter procedure spInsetarCarrera @nombre varchar(50), @campus int
as
	declare @codigo int

	select @codigo = max(CarreraID) + 1 from Carrera

	insert into Carrera values(@codigo, @nombre, @campus)
	select * from Carrera where CarreraID = @codigo
go

exec spInsetarCarrera @campus = 1, @nombre = 'Ing.Mecanica'
