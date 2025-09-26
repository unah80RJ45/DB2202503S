create or alter procedure spConsultarFacturas @cliente int
as
	declare @tMarca as Table (MarcaID int, Nombre varchar(50))

	select * into #cliente from Cliente where ClienteID = @cliente
	select * into #factura from Factura where ClienteID = @cliente
	select * into #facturadetalle from FacturaDetalle where FacturaID in(select FacturaID from #factura)
	select * into #articulo from Articulo where ArticuloID in(select ArticuloID from #facturadetalle)
	select * into #marca from Marca where MarcaID in(select MarcaID from #articulo)
	
	insert into @tMarca 
	select * from #marca

	select * from @tMarca

	select f.FacturaID, f.Fecha, f.ClienteID, c.Nombre, a.ArticuloID, a.Nombre, m.Nombre, fd.Cantidad, fd.Precio
	from #factura as f
	inner join #facturadetalle fd on f.facturaid = fd.facturaid
	inner join #articulo a on fd.articuloid = a.articuloid
	inner join #cliente as c on f.ClienteID = c.ClienteID
	inner join #Marca as m on a.MarcaID = m.MarcaID
	where f.ClienteID = @cliente

	select f.FacturaID, f.Fecha, f.ClienteID, c.Nombre, a.ArticuloID, a.Nombre, m.Nombre, fd.Cantidad, fd.Precio
	from factura as f
	inner join facturadetalle fd on f.facturaid = fd.facturaid
	inner join articulo a on fd.articuloid = a.articuloid
	inner join cliente as c on f.ClienteID = c.ClienteID
	inner join Marca as m on a.MarcaID = m.MarcaID
	where f.ClienteID = @cliente

	--select count(*) --* (select count(*) from marca)
	--from #factura, #facturadetalle, #articulo, #cliente, #marca
go

exec spConsultarFacturas 34

--select count(*) from Factura
--select count(*) from FacturaDetalle
--select count(*) from Cliente
--select count(*) from Articulo
--select count(*) from Marca


