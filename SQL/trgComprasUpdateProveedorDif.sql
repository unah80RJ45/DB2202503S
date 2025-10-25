create or alter trigger trgComprasUpdateProveedorDif on Compras for update 
as
	declare @compraid int, @iProveedorID int, @dProveedorID int, @iTotal float, @dTotal float

	select @compraid = CompraID, @iProveedorID = ProveedorID, @iTotal = Total from inserted
	select @dProveedorID = ProveedorID, @dTotal = Total from deleted

	if @dProveedorID != @iProveedorID
		begin
			update Proveedores set Saldo = Saldo + @iTotal where ProveedorID = @iProveedorID
			update Proveedores set Saldo = Saldo - @dTotal where ProveedorID = @dProveedorID

			insert into Bitacora values('Compra', @compraid, 'U', getdate())
			insert into Bitacora values('Proveedor', @dProveedorID, 'U', getdate())
			insert into Bitacora values('Proveedor', @iProveedorID, 'U', getdate())
		end
go
