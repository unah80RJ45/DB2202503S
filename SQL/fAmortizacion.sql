create or alter function dbo.fAmortizacion(@capital float, @tasa float, @tiempo int) returns @amortiza 
table (CuotaID int, Inicial float, Interes float, Abono float, Saldo float)
as
	begin
		declare @cuotaid int = 0, @interes float, @saldo float = @capital, @abono float = cast(@capital / @tiempo as numeric(11,2))

		while @cuotaid < @tiempo
			begin
				select @cuotaid = @cuotaid + 1, @interes = cast(@saldo * @tasa /12 as numeric(11,2)), @saldo = cast(@saldo - @abono as numeric(11,2))

				insert into @amortiza (CuotaID, Inicial, Interes, Abono, Saldo)
				values(@cuotaid, @saldo + @abono, @interes, @abono, @saldo)

			end

		return
	end
go

select *
from dbo.fAmortizacion(10000, 0.1, 12)