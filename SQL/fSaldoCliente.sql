create or alter function dbo.fSaldoCliente(@cliente int) returns float
as
	begin
		declare @saldo float
		declare @factura table (FacturaID int)
		declare @fDetalle table (FacturaID int, Cantidad int, Precio float, ISV float)
		declare @carrera table (CarreraID int, Nombre varchar(50))

		insert into @carrera values(1, 'Carrera Prueba')

		insert into @factura
		select FacturaID from Factura where ClienteID = @cliente

		insert into @fDetalle
		select FacturaID, Cantidad, Precio, ISV
		from FacturaDetalle
		where FacturaID in(select FacturaID from @factura)

		select @saldo = sum(fd.cantidad * fd.Precio * (1 + fd.isv))
		from @factura f
		inner join @fDetalle fd on f.FacturaID = fd.FacturaID

		return @saldo
	end
go

print dbo.fSaldoCliente(34)

select *, dbo.fSaldoCliente(ClienteID)
from Cliente