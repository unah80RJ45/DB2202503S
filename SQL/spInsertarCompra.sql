create or alter procedure spInsertarCompra @fecha datetime = '2025-09-20', @proveedor varchar(50), @subTotal float, @total float
as
	declare @compraid int, @proveedorid int

	select @compraid = isnull(max(CompraID), 0) + 1 from Compra

	exec spInsertarProveedor @proveedor, @proveedorid output

	insert into Compra values(@compraid, @fecha, @proveedorid , @subTotal, @total)

	select *
	from vCompras
go

execute spInsertarCompra @proveedor = 'Farmacia XYZ', @subTotal = 2000, @total = 250, @fecha = '2025-09-19'

select * from Proveedor
select * from Compra

