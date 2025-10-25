create or alter trigger trgComprasInsert on Compras for Insert 
as
	declare @compraid int, @proveedorid int, @total float

	declare crsCompras cursor for
	select compraid, ProveedorID, SubTotal + Impuesto  from inserted

	open crsCompras; fetch next from crsCompras into @compraid, @proveedorid, @total

	while @@FETCH_STATUS = 0
		begin
			update Compras set Total = @total
			where CompraID = @compraid

			update Proveedores set Saldo = Saldo + @total
			where ProveedorID = @proveedorid

			insert into Bitacora values('Compra', @compraid, 'I', getdate())

			fetch next from crsCompras into @compraid, @proveedorid, @total
		end
	deallocate crsCompras;
go
