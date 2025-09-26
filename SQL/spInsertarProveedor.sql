create or alter procedure spInsertarProveedor @nom varchar(50), @pro int output, @dir varchar(50) = 'SPS'
as 
	select @pro = max(ProveedorID) from Proveedor where Nombre = @nom

	if @pro is null
		begin
			select @pro = isnull(max(ProveedorID), 0) + 1 from Proveedor
			insert into Proveedor values(@pro, @nom, @dir)
		end
go

--exec spInsertarProveedor 'Ferreteria ABC'

select * from Proveedor
