create or alter trigger trgComprasDelete on Compras for Delete
as
	declare @compraid int, @proveedorid int, @total float

	select @compraid = CompraID, @proveedorid = ProveedorID, @total = Total
	from deleted

	update Proveedores set Saldo = Saldo - @total
	where ProveedorID = @proveedorid

	insert into Bitacora values('Compra', @compraid, 'D', getdate())
	insert into Bitacora values('Proveedores', @proveedorid, 'U', getdate())
go
