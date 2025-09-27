-- alter table Factura add Valor float
create procedure spCalcularValorFactura @facturaid int
as
	declare @valor as float

	select @valor = sum(cantidad * precio) from FacturaDetalle
	where facturaid = @facturaid

	update Factura set valor = @valor where FacturaID = @facturaid
go

execute spCalcularValorFactura 22906

select * from Factura
