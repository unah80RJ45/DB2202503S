create or alter trigger trgComprasUpdateMismoProveedor on Compras for update
as
	declare @compraid int, @proveedorid int = 0, @cambio float

	select @compraid = i.CompraID, @proveedorid = i.ProveedorID, @cambio = i.Total - d.Total 
	from inserted i 
	inner join deleted d on i.CompraID = d.CompraID and i.ProveedorID = d.ProveedorID

	if isnull(@proveedorid, 0) > 0
		begin
			update Proveedores set Saldo = Saldo + @cambio

			insert into Bitacora values('Compra', @compraid, 'U', getdate())
			insert into Bitacora values('Proveedor', @proveedorid, 'U', getdate())
		end
go
