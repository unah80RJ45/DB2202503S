create or alter function dbo.getDiasMes(@ano int, @mes int) returns int
as
	begin
		declare @fecha datetime

		select @fecha = DATEFROMPARTS(@ano, @mes, 1)
		select @fecha = dateadd(mm, 1, @fecha)
		select @fecha = dateadd(dd, -1, @fecha)

		return day(@fecha)
	end
go

print dbo.getDiasMes(2024, 2)