create or alter function dbo.fValoresFacturasCliente() returns @saldo table (ClienteID int, SubTotal float, Impuesto float, Total float)
as 
	begin
		declare @facturadetalle table (FacturaID int, SubTotal float, Impuesto float, Total float)

		insert into @facturadetalle
		select facturaid, cast(sum(Cantidad * Precio) as numeric(11,2)), cast(sum(Cantidad * Precio * ISV) as numeric(11,2)), 
		cast(sum(Cantidad * Precio * ( 1 + ISV)) as numeric(11,2))
		from FacturaDetalle
		group by FacturaID

		insert into @saldo
		select f.ClienteID, sum(fd.SubTotal), sum(fd.Impuesto), sum(fd.Total)
		from Factura f
		inner join @facturadetalle fd on f.FacturaID = fd.FacturaID
		group by f.ClienteID

		return
	end
go

select *
from cliente as c 
inner join dbo.fValoresFacturasCliente() s on c.ClienteID = s.ClienteID

select * from Cliente where ClienteID in(select ClienteID from dbo.fValoresFacturasCliente())