create or alter view vCompras
as
	select c.CompraID, c.Fecha, p.ProveedorID, p.Nombre, c.SubTotal, c.Impuesto, c.SubTotal + c.Impuesto as Total
	from Compra as c
	inner join Proveedor as p on c.PoveedorID = p.ProveedorID
go

select * from vCompras
