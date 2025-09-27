create or alter procedure spCalcularValorFacturasCliente @clienteid int
as
	declare @factura int 

	declare crsFacturas cursor for
	select FacturaID from Factura where ClienteID = @clienteid

	open crsFacturas

	fetch next from crsFacturas into @factura; 

	while @@fetch_status = 0 
		begin
			execute spCalcularValorFactura @factura 
			fetch next from crsFacturas into @factura;
		end

	deallocate crsFacturas
go

select * from Factura where ClienteID = 34
exec spCalcularValorFacturasCliente 34