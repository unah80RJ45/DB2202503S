drop table Compras

create table Proveedores
(
	ProveedorID int not null,
	Nombre		varchar(50) not null,
	Limite		float not null,
	Saldo		float not null,
	constraint pkProveedorID primary key (ProveedorID),
	constraint chkLimiteSaldo check ( Limite > Saldo )
)
create table Compras
(
	CompraID	int not null,
	Fecha		datetime not null,
	ProveedorID	int not null,
	SubTotal	float not null,
	Impuesto	float not null,
	Total		float not null,

	constraint pkCompras primary key (CompraID),
	constraint fkComprasProveedores foreign key (ProveedorID) references Proveedores
)
create table Bitacora
(
	BitacoraID	int identity(1, 1),
	Tabla		varchar(50) not null,
	Registro	int not null,
	Accion		varchar not null,
	Fecha		datetime not null,
	constraint pkBitacora primary key (BitacoraID)
)
insert into Proveedores values(1, 'Proveedor ABC', 10000, 0)
insert into Proveedores values(2, 'Proveedor XYZ', 10000, 0)
insert into Proveedores values(3, 'Proveedor KLM', 20000, 0)
insert into Proveedores values(4, 'Proveedor FM', 20000, 0)

insert into Compras values(1, '2025-10-01', 1, 1000, 150, 0)
insert into Compras values(2, '2025-10-02', 1, 2000, 200, 2200)
insert into Compras values(3, '2025-10-02', 'Proveedor XYX', 3000, 300, 0)
insert into Compras values(4, '2025-10-02', 'Proveedor KLM', 4000, 350, 0)
insert into Compras values(5, '2025-10-03', 'Proveedor FM', 5000, 300, 0), (6, '2025-10-03', 'Proveedor FM', 6000, 400, 0), (7, '2025-10-04', 'Proveedor FM', 7000, 500, 0)
insert into Compras values(8, '2025-10-04', 'Proveedor ABC', 8000, 600, 0), (9, '2025-10-04', 'Proveedor ABC', 6000, 400, 0), (10, '2025-10-04', 'Proveedor FM', 7000, 500, 0)
insert into Compras values(11, '2025-10-05', 'Proveedor ABC', 10000, 700, 0), (12, '2025-10-05', 'Proveedor ABC', 10000, 400, 0), (13, '2025-10-05', 'Proveedor FM', 7000, 500, 0)

delete from Compras where CompraID = 2
update Compras set SubTotal = 2500, Impuesto = 250, Total = 2750 where CompraID = 2
update Proveedores set saldo = 0 where ProveedorID > 1
update Compras set ProveedorID = 2, SubTotal = 1500, Impuesto = 100, Total = 1600 where CompraID = 1

select * from Proveedores
select * from Compras
select * from Bitacora
