USE ProyectoBasesPrimos
GO

-- Crear tabla "Clientes"
CREATE TABLE Clientes (
  ID_cliente INT IDENTITY PRIMARY KEY,
  Nombre VARCHAR(100),
  Apellido VARCHAR(100),
  Direccion VARCHAR(200),
  Telefono VARCHAR(20),
  CorreoElectronico VARCHAR(100)
);

-- Crear tabla "Vehículos"
CREATE TABLE Vehiculos (
  ID_vehiculo INT IDENTITY PRIMARY KEY,
  Marca VARCHAR(100),
  Modelo VARCHAR(100),
  TipoVehiculo VARCHAR(50),
  Descripcion VARCHAR(200),
  Precio DECIMAL(10, 2)
);

-- Crear tabla "Pedidos"
CREATE TABLE Pedidos (
  ID_pedido INT IDENTITY PRIMARY KEY,
  ID_cliente INT,
  ID_vehiculo INT,
  FechaPedido DATETIME,
  EstadoPedido VARCHAR(50),
  FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
  FOREIGN KEY (ID_vehiculo) REFERENCES Vehiculos(ID_vehiculo)
);

-- Crear tabla "Financiamientos"
CREATE TABLE Financiamientos (
  ID_financiamiento INT IDENTITY PRIMARY KEY,
  ID_pedido INT,
  MontoFinanciado DECIMAL(10, 2),
  PlazoFinanciamiento INT,
  TasaInteres DECIMAL(5, 2),
  CuotasMensuales DECIMAL(10, 2),
  EstadoFinanciamiento VARCHAR(50),
  FOREIGN KEY (ID_pedido) REFERENCES Pedidos(ID_pedido)
);

-- Crear tabla "Inventario"
CREATE TABLE Inventario (
  ID_vehiculo INT,
  TipoVehiculo VARCHAR(50),
  CantidadDisponible INT,
   FOREIGN KEY (ID_vehiculo) REFERENCES Vehiculos(ID_vehiculo)
);

--////////////////////////////////////////

CREATE TABLE DetallesFinanciamiento (
  ID_detalleFinanciamiento INT IDENTITY PRIMARY KEY,
  ID_financiamiento INT,
  FechaPago DATE,
  MontoPagado DECIMAL(10, 2),
  FOREIGN KEY (ID_financiamiento) REFERENCES Financiamientos(ID_financiamiento)
);


CREATE TABLE Empresa (
  ID_empresa INT IDENTITY PRIMARY KEY,
  NombreEmpresa VARCHAR(100),
  Direccion VARCHAR(200),
  Telefono VARCHAR(20),
  CorreoElectronico VARCHAR(100)
);


CREATE TABLE Empleados (
  ID_empleado INT IDENTITY PRIMARY KEY,
  Nombre VARCHAR(100),
  Apellido VARCHAR(100),
  Telefono VARCHAR(20),
  CorreoElectronico VARCHAR(100),
);


CREATE TABLE Usuarios (
  ID_usuario INT IDENTITY PRIMARY KEY,
  NombreUsuario VARCHAR(100),
  Contraseña VARCHAR(100),
);

CREATE PROCEDURE InsertarUsuarios
    @nombreUsuario varchar(100),
    @contraseña varchar(100)
AS
BEGIN
    INSERT INTO Usuarios (NombreUsuario, Contraseña)
    VALUES (@nombreUsuario, @contraseña)
END

EXEC InsertarUsuarios 'Gerson', 'Gerson123'
SELECT * FROM Usuarios


--CREATE PROCEDURE VerificarCredenciales
--  @nombreUsuario VARCHAR(100),
--  @contraseña VARCHAR(100),
--  @resultado BIT OUTPUT
--AS
--BEGIN
--  SET NOCOUNT ON;

--  DECLARE @valido BIT;

--  -- Verificar si existe una tupla con el nombre de usuario y contraseña proporcionados
--  IF EXISTS (SELECT 1 FROM Usuarios WHERE NombreUsuario = @nombreUsuario AND Contraseña = @contraseña)
--    SET @valido = 1;
--  ELSE
--    SET @valido = 0;

--  SET @resultado = @valido;
--END

--DECLARE @resultado BIT;  -- Ejecutar el procedimiento almacenado EXEC VerificarCredenciales 'nombre_de_usuario', 'contraseña', @resultado OUTPUT;  -- @resultado contendrá el valor booleano (0 o 1) que indica si las credenciales son válidas o no SELECT @resultado AS CredencialesValidas;
--EXEC VerificarCredenciales 'Gerson', 'Gerson123' 
 --////////////////////////////////////////////////////


CREATE TABLE ServicioMantenimiento (
  ID_servicioMantenimiento INT IDENTITY PRIMARY KEY,
  Descripcion VARCHAR(200),
  Costo DECIMAL(10, 2),
);


CREATE TABLE VentaRepuestos (
  ID_ventaRepuestos INT IDENTITY PRIMARY KEY,
  Descripcion VARCHAR(200),
  Precio DECIMAL(10, 2),
);


CREATE TABLE Capacitaciones (
  ID_capacitacion INT IDENTITY PRIMARY KEY,
  Tema VARCHAR(100),
  Fecha DATE,
  Lugar VARCHAR(200),
);


CREATE TABLE PedidoVehiculo (
  ID_pedidoVehiculo INT IDENTITY PRIMARY KEY,
  ID_pedido INT,
  ID_vehiculo INT,
  FOREIGN KEY (ID_pedido) REFERENCES Pedidos(ID_pedido),
  FOREIGN KEY (ID_vehiculo) REFERENCES Vehiculos(ID_vehiculo)
);

--/////////////////////////////////////////////
CREATE TABLE Reservas (
  ID_reserva INT IDENTITY PRIMARY KEY,
  ID_cliente INT,
  ID_vehiculo INT,
  FechaReserva DATETIME,
  EstadoReserva VARCHAR(50),
  FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
  FOREIGN KEY (ID_vehiculo) REFERENCES Vehiculos(ID_vehiculo)
);

CREATE TABLE DetallesReserva (
  ID_detalleReserva INT IDENTITY PRIMARY KEY,
  ID_reserva INT,
  Descripcion VARCHAR(200),
  Precio DECIMAL(10, 2),
  FOREIGN KEY (ID_reserva) REFERENCES Reservas(ID_reserva)
);

CREATE TABLE Dudas (
    ID_dudas INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    CorreoElectronico VARCHAR(100),
    Mensaje VARCHAR(MAX)
);

CREATE PROCEDURE InsertarDudas
    @Nombre varchar(100),
    @CorreoElectronico varchar(100),
	@Mensaje varchar(max)
AS
BEGIN
    INSERT INTO Dudas (Nombre, CorreoElectronico, Mensaje )
    VALUES (@Nombre, @CorreoElectronico, @Mensaje)
END

EXEC InsertarDudas 'Gerson', 'gerson@gmail.com', 'Qué tan potente es el segundo vehículo de la lista?'
SELECT * FROM Dudas



