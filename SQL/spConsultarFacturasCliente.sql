
create or alter procedure spConsultarFacturasCliente @clientes Clientes readonly
as
	select * from @clientes
	select *
	from Factura f
	inner join @clientes c on f.ClienteID = c.clienteid
go


create or alter procedure spPruebaConsultarFacturasCliente @ciudad varchar(50)
as
	declare @clientes as Clientes

	insert into @clientes
	select clienteid, nombre, Direccion from Cliente where Direccion = @ciudad

	exec spConsultarFacturasCliente @clientes
go


