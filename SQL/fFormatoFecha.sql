create or alter function dbo.fFormatoFecha(@fecha datetime) returns varchar(50)
as
	begin
		declare @formato varchar(50)
		declare @dia int, @mes int, @ano int, @nombre varchar(50)

		select @dia = day(@fecha), @mes = month(@fecha), @ano = year(@fecha)
		select @nombre = case @mes
								when 1 then 'Enero' when 2 then 'Febrero' when 3 then 'Marzo' when 4 then 'Abril'
								when 5 then 'Mayo' when 6 then 'Junio' when 7 then 'Julio' when 8 then 'Agosto'
								when 9 then 'Septiembre' when 10 then 'Octubre' when 11 then 'Noviembre' else 'Diciembre'
							end
		select @formato = concat(@dia, ' de ', @nombre, ' de ', @ano)

		return @formato
	end
go

-- Escribir una funcion que reciba como parametro el ano y el mes de forma entera y me diga la cantidad de dias en entero que tiene ese mes
