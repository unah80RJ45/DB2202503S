create or alter procedure spAgregarNotas @alumnoid int, @materiaid int, @valor int
as
	begin transaction
		declare @materias int, @notas int, @miError as int = 0

		select @materias = isnull(count(*), 0) + 1, @notas = isnull(sum(valor), 0) + @valor
		from Notas where Alumnoid = @alumnoid

		update Alumno set Promedio = cast(@notas / @materias as int) where AlumnoID = @alumnoid
		if @@ERROR != 0 select @miError = 1

		insert into Notas values(@alumnoid, @materiaid, @valor)
		if @@ERROR != 0 select @miError = 1

		if exists(select * from aprobados where materiaid = @materiaid)
			begin
				update aprobados set alumnos = alumnos + 1
				if @@ERROR != 0 select @miError = 1
			end
		else
			begin
				insert into aprobados values(@materiaid, 1)
				if @@ERROR != 0 select @miError = 1
			end

	if @miError = 0
		commit
	else
		rollback
go

exec spAgregarNotas 2, 1, 80


