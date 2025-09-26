create table Proveedor
(
	ProveedorID		int not null,
	Nombre			varchar(50)
)

alter table Proveedor add Direccion varchar(50)

create table Compra
(
	CompraID		int not null,
	Fecha			datetime not null,
	PoveedorID		int not null,
	SubTotal		float not null,
	Impuesto		float not null
)
