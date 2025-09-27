drop type Clientes

create type Clientes as table
(
	ClienteID	int,
	Nombre		varchar(50),
	Direccion	varchar(50)
)