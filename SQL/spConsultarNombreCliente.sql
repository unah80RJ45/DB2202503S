create or alter procedure spConsultarNombreCliente 
as
	declare @nombre varchar(50) 

	declare crsClientes cursor scroll for
	select Nombre from Cliente where Direccion = 'tela'

	open crsClientes

	fetch last from crsClientes into @nombre; 

	while @@fetch_status = 0 
		begin
			print @nombre
			fetch prior from crsClientes into @nombre;
		end

	deallocate crsClientes
go

exec spConsultarNombreCliente

select * from cliente where direccion = 'tela'
