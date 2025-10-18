create or alter function dbo.fConfigura() returns @config table (Columna1 int, Columna2 varchar(50), Columna float)
as
	begin
		insert into @config values(1, 'Excento', 0.15)
		insert into @config values(2, 'ISV', 0.18)
		insert into @config values(2, 'Lujo', 0.18)

		return
	end
go

select * from dbo.fConfigura()

--insert into dbo.fConfigura() values(3, 'otra prueba', 0.2)
