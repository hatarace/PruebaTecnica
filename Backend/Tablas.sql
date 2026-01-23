create database Geneses

create table Cliente(
id int identity,
primerNombre varchar(25),
segundoNombre varchar(25),
tercerNombre varchar(25),
PrimerApellido varchar(25),
SegundoApellido varchar(25),
ApellidoCasada varchar(25),
FechaNacimiento datetime,
EstadoCivil char(1),
Domicilio varchar(200)
Primary key (id)
)

create table Producto(
id int identity,
nombre varchar(20),
descripcion varchar(100),
estado char(1),
primary key(id)
)

create table Prestamo(
id int identity,
idProducto int,
moneda int,
FechaCrea datetime,
FechaFinaliza datetime,
monto money,
montoPendiente money,
estado char(1)
primary key(id)
foreign key(idProducto) references Producto(id)
)

create table TipoCuenta(
id int identity,
descripcion varchar(100),
primary key(id)
)

create table Cuenta(
id int,
idCliente int,
idTipoCuenta int,
descripcion varchar(50),
Disponible money,
Moneda int,
primary key(id),
foreign key(idCliente) references cliente(id),
foreign key(idTipoCuenta) references Tipocuenta(id)
)

create table TipoTransaccion(
id int identity,
Descripcion varchar(50),
primary key(id)
)

create table Transaccion(
id int identity,
idTipoTransaccion int,
moneda int,
monto money,
idCuenta int,
Fecha datetime,
primary key(id),
foreign key(idTipoTransaccion) references TipoTransaccion(id),
foreign key(idCuenta) references Cuenta(id)
)

create table Tarjeta(
id bigint,
idCliente int,
moneda money,
montoMaximo money,
FechaEmision datetime,
FechaVencimiento datetime
primary key(id),
foreign key(idCliente) references Cliente(id)
)

create table TipoTarjetaTran(
id int identity,
descripcion varchar(150),
primary key(id)
)

create table TransaccionTarjeta(
id int identity,
TipoTransaccion int,
monto money, 
moneda int,
fecha datetime,
primary key(id),
foreign key(TipoTransaccion) references TipoTarjetaTran(id)
)

