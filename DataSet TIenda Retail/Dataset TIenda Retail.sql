

-- Tabla: Sucursales
CREATE TABLE Sucursales (
    SucursalID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Ciudad NVARCHAR(100),
    Region NVARCHAR(100),
    FechaApertura DATE
);

-- Tabla: Empleados
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Cargo NVARCHAR(50),
    FechaContratacion DATE,
    SucursalID INT FOREIGN KEY REFERENCES Sucursales(SucursalID)
);

-- Tabla: Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Correo NVARCHAR(150),
    Genero CHAR(1),
    FechaRegistro DATE,
    Ciudad NVARCHAR(100),
    NivelFidelidad NVARCHAR(50) -- (Ej: Básico, Plata, Oro, Platino)
);

-- Tabla: Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Categoria NVARCHAR(50),
    Marca NVARCHAR(50),
    Precio DECIMAL(10,2),
    Stock INT
);

-- Tabla: Promociones
CREATE TABLE Promociones (
    PromocionID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Tipo NVARCHAR(50), -- (Ej: Descuento, 2x1, Envío Gratis)
    FechaInicio DATE,
    FechaFin DATE
);

-- Tabla: ProductosPromocion (relación muchos a muchos)
CREATE TABLE ProductosPromocion (
    ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
    PromocionID INT FOREIGN KEY REFERENCES Promociones(PromocionID),
    PRIMARY KEY (ProductoID, PromocionID)
);

-- Tabla: Ventas
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME,
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    EmpleadoID INT FOREIGN KEY REFERENCES Empleados(EmpleadoID),
    Canal NVARCHAR(50), -- (Tienda, Web)
    SucursalID INT FOREIGN KEY REFERENCES Sucursales(SucursalID),
    Total DECIMAL(10,2)
);

-- Tabla: DetalleVentas (relación productos por venta)
CREATE TABLE DetalleVentas (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    VentaID INT FOREIGN KEY REFERENCES Ventas(VentaID),
    ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    Descuento DECIMAL(5,2)
);

-- Tabla: Inventario
CREATE TABLE Inventario (
    InventarioID INT PRIMARY KEY IDENTITY(1,1),
    ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
    SucursalID INT FOREIGN KEY REFERENCES Sucursales(SucursalID),
    FechaActualizacion DATETIME,
    Stock INT
);

-- Tabla: CanalesMarketing
CREATE TABLE CanalesMarketing (
    CanalID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100), -- (Ej: Email, Instagram, Facebook, Google Ads)
    CostoMensual DECIMAL(10,2)
);

-- Tabla: Campañas
CREATE TABLE Campañas (
    CampañaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    CanalID INT FOREIGN KEY REFERENCES CanalesMarketing(CanalID),
    FechaInicio DATE,
    FechaFin DATE,
    Presupuesto DECIMAL(10,2)
);

-- Tabla: Feedback de clientes
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
    Fecha DATE,
    Calificacion INT CHECK (Calificacion BETWEEN 1 AND 5),
    Comentario NVARCHAR(500)
);

--------------------------------------------------------------------------------------


INSERT INTO Sucursales (Nombre, Ciudad, Region, FechaApertura) VALUES ('Sucursal 1', 'Lima', 'Region 1', '2018-05-21');
INSERT INTO Sucursales (Nombre, Ciudad, Region, FechaApertura) VALUES ('Sucursal 2', 'Arequipa', 'Region 2', '2017-01-18');
INSERT INTO Sucursales (Nombre, Ciudad, Region, FechaApertura) VALUES ('Sucursal 3', 'Trujillo', 'Region 3', '2018-01-12');
INSERT INTO Sucursales (Nombre, Ciudad, Region, FechaApertura) VALUES ('Sucursal 4', 'Lima', 'Region 4', '2017-07-18');
INSERT INTO Sucursales (Nombre, Ciudad, Region, FechaApertura) VALUES ('Sucursal 5', 'Piura', 'Region 5', '2017-07-25');
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Pérez', 'Vendedor', '2019-02-13', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Gómez', 'Gerente', '2017-06-13', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Pérez', 'Gerente', '2019-09-16', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Díaz', 'Gerente', '2019-06-15', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Fernández', 'Asistente', '2017-08-26', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Pérez', 'Asistente', '2018-08-18', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Fernández', 'Gerente', '2018-03-21', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Gómez', 'Vendedor', '2019-04-11', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Torres', 'Asistente', '2019-05-11', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Díaz', 'Gerente', '2019-06-17', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Torres', 'Vendedor', '2019-06-23', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Fernández', 'Gerente', '2019-07-19', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Torres', 'Asistente', '2017-05-19', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Fernández', 'Gerente', '2019-02-25', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Fernández', 'Vendedor', '2018-06-10', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Fernández', 'Vendedor', '2019-06-23', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Gómez', 'Gerente', '2018-04-21', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Gómez', 'Gerente', '2017-09-10', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Díaz', 'Vendedor', '2017-03-17', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Torres', 'Gerente', '2019-07-13', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Pérez', 'Asistente', '2018-09-16', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Fernández', 'Gerente', '2017-01-20', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Gómez', 'Vendedor', '2018-01-21', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Díaz', 'Vendedor', '2019-03-17', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Pérez', 'Asistente', '2019-01-13', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Fernández', 'Gerente', '2019-08-18', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Gómez', 'Gerente', '2019-05-20', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Gómez', 'Gerente', '2017-04-16', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Pérez', 'Vendedor', '2017-01-14', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Díaz', 'Gerente', '2017-08-22', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Pérez', 'Asistente', '2017-02-10', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Díaz', 'Asistente', '2019-08-17', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Torres', 'Gerente', '2017-09-16', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Gómez', 'Gerente', '2017-05-18', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Gómez', 'Asistente', '2018-03-27', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Díaz', 'Vendedor', '2018-04-21', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Gómez', 'Gerente', '2018-04-21', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Fernández', 'Vendedor', '2019-09-22', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Torres', 'Gerente', '2017-09-20', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Torres', 'Vendedor', '2018-07-27', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Gómez', 'Gerente', '2017-01-28', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Fernández', 'Asistente', '2018-03-21', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Torres', 'Asistente', '2018-01-27', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Gómez', 'Vendedor', '2017-09-21', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Pérez', 'Asistente', '2018-02-28', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Torres', 'Gerente', '2017-06-14', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Díaz', 'Vendedor', '2019-02-24', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Díaz', 'Vendedor', '2018-07-23', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Gómez', 'Asistente', '2019-02-12', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Torres', 'Asistente', '2018-06-20', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Pérez', 'Vendedor', '2018-04-11', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Gómez', 'Gerente', '2018-02-10', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Pérez', 'Gerente', '2017-05-11', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Torres', 'Gerente', '2019-09-19', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Pérez', 'Vendedor', '2017-01-20', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Gómez', 'Vendedor', '2017-02-20', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Pérez', 'Asistente', '2018-08-15', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Torres', 'Asistente', '2018-09-12', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Gómez', 'Gerente', '2018-07-20', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Gómez', 'Vendedor', '2019-02-26', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Fernández', 'Vendedor', '2018-05-27', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Díaz', 'Asistente', '2018-03-13', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Torres', 'Gerente', '2018-03-10', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Fernández', 'Vendedor', '2017-02-18', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Díaz', 'Vendedor', '2018-05-18', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Fernández', 'Gerente', '2017-03-27', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Gómez', 'Vendedor', '2018-08-28', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Fernández', 'Asistente', '2018-01-26', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Torres', 'Vendedor', '2017-03-11', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Gómez', 'Asistente', '2019-03-12', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Torres', 'Vendedor', '2017-05-14', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Pérez', 'Vendedor', '2019-08-22', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Díaz', 'Gerente', '2019-02-13', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Fernández', 'Gerente', '2019-06-16', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Torres', 'Vendedor', '2018-04-17', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Pérez', 'Asistente', '2018-06-14', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Gómez', 'Asistente', '2018-07-11', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Fernández', 'Gerente', '2019-02-12', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Torres', 'Gerente', '2018-09-16', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Juan', 'Fernández', 'Vendedor', '2018-07-14', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Fernández', 'Asistente', '2019-03-11', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Fernández', 'Vendedor', '2018-08-28', 3);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Díaz', 'Asistente', '2017-01-16', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Fernández', 'Gerente', '2019-07-24', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Gómez', 'Asistente', '2019-06-19', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Torres', 'Vendedor', '2017-03-15', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Gómez', 'Asistente', '2017-07-13', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Pérez', 'Asistente', '2017-05-22', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Gómez', 'Gerente', '2018-03-20', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Gómez', 'Vendedor', '2019-02-23', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Torres', 'Vendedor', '2017-06-20', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Torres', 'Vendedor', '2017-01-16', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Díaz', 'Asistente', '2019-05-20', 5);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Gómez', 'Vendedor', '2017-08-22', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Carlos', 'Gómez', 'Gerente', '2019-02-22', 2);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Gómez', 'Vendedor', '2017-06-14', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Pedro', 'Torres', 'Asistente', '2017-06-16', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Lucía', 'Torres', 'Gerente', '2017-02-20', 1);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('Ana', 'Pérez', 'Asistente', '2017-07-16', 4);
INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaContratacion, SucursalID) VALUES ('María', 'Pérez', 'Asistente', '2017-01-24', 2);
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Torres', 'cliente1@mail.com', 'F', '2020-09-25', 'Cusco', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Torres', 'cliente2@mail.com', 'M', '2020-02-12', 'Arequipa', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Díaz', 'cliente3@mail.com', 'M', '2020-02-22', 'Lima', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Torres', 'cliente4@mail.com', 'M', '2020-01-16', 'Piura', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Fernández', 'cliente5@mail.com', 'M', '2020-07-18', 'Cusco', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Torres', 'cliente6@mail.com', 'F', '2020-09-17', 'Lima', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Fernández', 'cliente7@mail.com', 'M', '2020-03-23', 'Piura', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Díaz', 'cliente8@mail.com', 'F', '2020-01-20', 'Arequipa', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Pérez', 'cliente9@mail.com', 'M', '2020-09-21', 'Trujillo', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Gómez', 'cliente10@mail.com', 'M', '2020-04-25', 'Piura', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Torres', 'cliente11@mail.com', 'M', '2020-08-19', 'Trujillo', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Gómez', 'cliente12@mail.com', 'M', '2020-03-20', 'Cusco', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Fernández', 'cliente13@mail.com', 'F', '2020-03-21', 'Piura', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Pérez', 'cliente14@mail.com', 'M', '2020-08-16', 'Arequipa', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Pérez', 'cliente15@mail.com', 'M', '2020-09-20', 'Piura', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Fernández', 'cliente16@mail.com', 'F', '2020-01-17', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Fernández', 'cliente17@mail.com', 'M', '2020-09-12', 'Piura', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Díaz', 'cliente18@mail.com', 'M', '2020-07-22', 'Cusco', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Gómez', 'cliente19@mail.com', 'M', '2020-04-27', 'Piura', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Gómez', 'cliente20@mail.com', 'M', '2020-03-23', 'Cusco', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Torres', 'cliente21@mail.com', 'M', '2020-09-11', 'Piura', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Pérez', 'cliente22@mail.com', 'M', '2020-02-19', 'Piura', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Torres', 'cliente23@mail.com', 'M', '2020-03-14', 'Lima', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Fernández', 'cliente24@mail.com', 'F', '2020-05-23', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Gómez', 'cliente25@mail.com', 'F', '2020-05-20', 'Piura', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Pérez', 'cliente26@mail.com', 'M', '2020-08-28', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Fernández', 'cliente27@mail.com', 'M', '2020-06-10', 'Cusco', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Torres', 'cliente28@mail.com', 'F', '2020-07-22', 'Piura', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Gómez', 'cliente29@mail.com', 'F', '2020-03-23', 'Trujillo', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Torres', 'cliente30@mail.com', 'F', '2020-01-15', 'Trujillo', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Díaz', 'cliente31@mail.com', 'M', '2020-09-16', 'Piura', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Fernández', 'cliente32@mail.com', 'M', '2020-05-21', 'Cusco', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Gómez', 'cliente33@mail.com', 'F', '2020-04-12', 'Piura', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Torres', 'cliente34@mail.com', 'F', '2020-08-14', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Fernández', 'cliente35@mail.com', 'M', '2020-09-20', 'Trujillo', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Díaz', 'cliente36@mail.com', 'M', '2020-04-24', 'Trujillo', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Pérez', 'cliente37@mail.com', 'F', '2020-03-12', 'Piura', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Díaz', 'cliente38@mail.com', 'F', '2020-09-16', 'Piura', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Díaz', 'cliente39@mail.com', 'M', '2020-09-18', 'Trujillo', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Gómez', 'cliente40@mail.com', 'M', '2020-06-15', 'Trujillo', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Torres', 'cliente41@mail.com', 'F', '2020-04-14', 'Trujillo', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Fernández', 'cliente42@mail.com', 'F', '2020-03-12', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Díaz', 'cliente43@mail.com', 'M', '2020-08-20', 'Cusco', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Díaz', 'cliente44@mail.com', 'M', '2020-02-25', 'Cusco', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Torres', 'cliente45@mail.com', 'M', '2020-08-12', 'Trujillo', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Díaz', 'cliente46@mail.com', 'M', '2020-01-28', 'Trujillo', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Díaz', 'cliente47@mail.com', 'F', '2020-02-18', 'Lima', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Pérez', 'cliente48@mail.com', 'F', '2020-01-14', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Pérez', 'cliente49@mail.com', 'M', '2020-03-22', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Gómez', 'cliente50@mail.com', 'M', '2020-06-11', 'Trujillo', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Fernández', 'cliente51@mail.com', 'M', '2020-09-11', 'Cusco', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Pérez', 'cliente52@mail.com', 'F', '2020-03-13', 'Piura', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Pérez', 'cliente53@mail.com', 'F', '2020-04-10', 'Piura', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Gómez', 'cliente54@mail.com', 'M', '2020-04-22', 'Cusco', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Gómez', 'cliente55@mail.com', 'M', '2020-09-10', 'Piura', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Gómez', 'cliente56@mail.com', 'M', '2020-07-18', 'Lima', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Torres', 'cliente57@mail.com', 'M', '2020-03-18', 'Lima', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Torres', 'cliente58@mail.com', 'M', '2020-08-21', 'Lima', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Pérez', 'cliente59@mail.com', 'M', '2020-06-28', 'Arequipa', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Torres', 'cliente60@mail.com', 'M', '2020-01-27', 'Piura', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Torres', 'cliente61@mail.com', 'M', '2020-05-28', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Pérez', 'cliente62@mail.com', 'M', '2020-06-15', 'Lima', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Pérez', 'cliente63@mail.com', 'M', '2020-03-21', 'Trujillo', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Fernández', 'cliente64@mail.com', 'M', '2020-07-15', 'Lima', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Fernández', 'cliente65@mail.com', 'M', '2020-01-20', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Díaz', 'cliente66@mail.com', 'M', '2020-02-21', 'Lima', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Torres', 'cliente67@mail.com', 'M', '2020-05-18', 'Trujillo', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Díaz', 'cliente68@mail.com', 'F', '2020-08-10', 'Arequipa', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Torres', 'cliente69@mail.com', 'F', '2020-01-23', 'Trujillo', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Torres', 'cliente70@mail.com', 'F', '2020-07-23', 'Piura', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Pérez', 'cliente71@mail.com', 'M', '2020-02-11', 'Trujillo', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Pérez', 'cliente72@mail.com', 'M', '2020-04-19', 'Cusco', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Fernández', 'cliente73@mail.com', 'M', '2020-07-20', 'Piura', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Torres', 'cliente74@mail.com', 'F', '2020-02-13', 'Lima', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Díaz', 'cliente75@mail.com', 'M', '2020-03-10', 'Cusco', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Gómez', 'cliente76@mail.com', 'F', '2020-09-26', 'Arequipa', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Pérez', 'cliente77@mail.com', 'M', '2020-09-22', 'Arequipa', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Pérez', 'cliente78@mail.com', 'M', '2020-03-22', 'Arequipa', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Fernández', 'cliente79@mail.com', 'F', '2020-04-15', 'Arequipa', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Díaz', 'cliente80@mail.com', 'F', '2020-05-24', 'Trujillo', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Pérez', 'cliente81@mail.com', 'F', '2020-07-20', 'Lima', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Ana', 'Gómez', 'cliente82@mail.com', 'F', '2020-08-28', 'Trujillo', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Gómez', 'cliente83@mail.com', 'F', '2020-03-11', 'Cusco', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Gómez', 'cliente84@mail.com', 'M', '2020-07-15', 'Lima', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Torres', 'cliente85@mail.com', 'F', '2020-03-12', 'Lima', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Díaz', 'cliente86@mail.com', 'M', '2020-09-13', 'Arequipa', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Juan', 'Fernández', 'cliente87@mail.com', 'M', '2020-04-16', 'Lima', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Fernández', 'cliente88@mail.com', 'F', '2020-01-10', 'Trujillo', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Pérez', 'cliente89@mail.com', 'M', '2020-02-18', 'Piura', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Gómez', 'cliente90@mail.com', 'M', '2020-07-28', 'Cusco', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Pérez', 'cliente91@mail.com', 'F', '2020-01-10', 'Cusco', 'Platino');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Gómez', 'cliente92@mail.com', 'M', '2020-03-15', 'Lima', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Carlos', 'Gómez', 'cliente93@mail.com', 'F', '2020-07-26', 'Arequipa', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Pérez', 'cliente94@mail.com', 'F', '2020-05-11', 'Lima', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Fernández', 'cliente95@mail.com', 'M', '2020-04-16', 'Lima', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Lucía', 'Gómez', 'cliente96@mail.com', 'M', '2020-03-22', 'Lima', 'Plata');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Torres', 'cliente97@mail.com', 'F', '2020-06-16', 'Trujillo', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('María', 'Torres', 'cliente98@mail.com', 'M', '2020-03-20', 'Cusco', 'Básico');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Torres', 'cliente99@mail.com', 'F', '2020-01-25', 'Piura', 'Oro');
INSERT INTO Clientes (Nombre, Apellido, Correo, Genero, FechaRegistro, Ciudad, NivelFidelidad) VALUES ('Pedro', 'Torres', 'cliente100@mail.com', 'F', '2020-03-15', 'Lima', 'Plata');
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 1', 'Audio', 'Sony', 293.00, 31);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 2', 'Computación', 'HP', 888.00, 78);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 3', 'Accesorios', 'Sony', 560.00, 84);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 4', 'Audio', 'Samsung', 1374.00, 62);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 5', 'Audio', 'LG', 634.00, 94);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 6', 'Computación', 'Apple', 1344.00, 95);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 7', 'Computación', 'HP', 896.00, 51);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 8', 'Computación', 'LG', 817.00, 75);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 9', 'Electrónica', 'Samsung', 196.00, 64);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 10', 'Computación', 'Sony', 1857.00, 46);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 11', 'Accesorios', 'Samsung', 492.00, 98);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 12', 'Accesorios', 'HP', 1067.00, 59);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 13', 'Computación', 'Apple', 341.00, 21);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 14', 'Computación', 'HP', 1243.00, 38);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 15', 'Audio', 'Apple', 1126.00, 91);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 16', 'Electrónica', 'HP', 535.00, 49);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 17', 'Computación', 'Sony', 633.00, 96);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 18', 'Audio', 'Samsung', 323.00, 87);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 19', 'Accesorios', 'Sony', 1922.00, 27);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 20', 'Audio', 'Sony', 895.00, 16);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 21', 'Audio', 'Samsung', 607.00, 34);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 22', 'Electrónica', 'Sony', 1541.00, 36);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 23', 'Computación', 'LG', 541.00, 15);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 24', 'Computación', 'Sony', 936.00, 21);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 25', 'Computación', 'LG', 1786.00, 93);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 26', 'Accesorios', 'Apple', 1204.00, 31);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 27', 'Audio', 'Samsung', 728.00, 31);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 28', 'Audio', 'LG', 1701.00, 77);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 29', 'Audio', 'Apple', 1997.00, 97);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 30', 'Electrónica', 'LG', 176.00, 93);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 31', 'Audio', 'LG', 1359.00, 44);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 32', 'Electrónica', 'Samsung', 1765.00, 25);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 33', 'Accesorios', 'Samsung', 1514.00, 23);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 34', 'Electrónica', 'HP', 840.00, 11);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 35', 'Computación', 'HP', 1360.00, 54);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 36', 'Audio', 'Sony', 1054.00, 23);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 37', 'Audio', 'HP', 192.00, 21);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 38', 'Electrónica', 'Sony', 1287.00, 26);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 39', 'Computación', 'Samsung', 786.00, 23);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 40', 'Computación', 'Sony', 1284.00, 80);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 41', 'Accesorios', 'LG', 1825.00, 62);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 42', 'Accesorios', 'Apple', 890.00, 89);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 43', 'Audio', 'Samsung', 1980.00, 12);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 44', 'Audio', 'HP', 1369.00, 100);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 45', 'Electrónica', 'LG', 1355.00, 91);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 46', 'Electrónica', 'Apple', 1435.00, 71);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 47', 'Audio', 'LG', 360.00, 23);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 48', 'Electrónica', 'Samsung', 1621.00, 65);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 49', 'Electrónica', 'Sony', 1143.00, 41);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 50', 'Computación', 'Apple', 1630.00, 45);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 51', 'Computación', 'Apple', 1859.00, 64);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 52', 'Computación', 'HP', 1263.00, 95);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 53', 'Audio', 'Sony', 173.00, 29);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 54', 'Computación', 'LG', 955.00, 94);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 55', 'Electrónica', 'Sony', 1116.00, 67);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 56', 'Audio', 'Samsung', 369.00, 28);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 57', 'Accesorios', 'Sony', 1520.00, 13);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 58', 'Audio', 'HP', 889.00, 29);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 59', 'Audio', 'Samsung', 737.00, 74);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 60', 'Audio', 'HP', 1883.00, 70);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 61', 'Accesorios', 'LG', 1768.00, 19);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 62', 'Computación', 'Samsung', 617.00, 86);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 63', 'Audio', 'Sony', 976.00, 90);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 64', 'Computación', 'Apple', 545.00, 96);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 65', 'Accesorios', 'HP', 1092.00, 26);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 66', 'Electrónica', 'LG', 1361.00, 24);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 67', 'Accesorios', 'HP', 1585.00, 94);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 68', 'Computación', 'Sony', 1263.00, 71);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 69', 'Accesorios', 'Samsung', 1990.00, 97);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 70', 'Computación', 'Apple', 1636.00, 50);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 71', 'Accesorios', 'Sony', 246.00, 30);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 72', 'Computación', 'LG', 638.00, 66);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 73', 'Audio', 'Samsung', 321.00, 59);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 74', 'Electrónica', 'Sony', 1390.00, 85);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 75', 'Electrónica', 'LG', 1691.00, 42);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 76', 'Accesorios', 'Samsung', 953.00, 97);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 77', 'Computación', 'LG', 472.00, 10);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 78', 'Audio', 'HP', 415.00, 88);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 79', 'Accesorios', 'Apple', 935.00, 45);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 80', 'Audio', 'Samsung', 520.00, 83);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 81', 'Electrónica', 'Sony', 278.00, 53);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 82', 'Computación', 'Apple', 1326.00, 29);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 83', 'Computación', 'LG', 770.00, 41);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 84', 'Electrónica', 'Sony', 1547.00, 53);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Tablet 85', 'Computación', 'Samsung', 965.00, 89);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 86', 'Computación', 'HP', 1931.00, 70);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 87', 'Computación', 'Samsung', 133.00, 46);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 88', 'Audio', 'Sony', 1920.00, 80);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 89', 'Audio', 'LG', 1352.00, 38);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 90', 'Accesorios', 'Sony', 1472.00, 33);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 91', 'Electrónica', 'Samsung', 1029.00, 78);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 92', 'Accesorios', 'LG', 703.00, 70);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Smartphone 93', 'Electrónica', 'HP', 1764.00, 84);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 94', 'Electrónica', 'Samsung', 623.00, 43);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 95', 'Electrónica', 'Apple', 1415.00, 10);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 96', 'Audio', 'Samsung', 470.00, 75);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 97', 'Electrónica', 'Apple', 1821.00, 63);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Auriculares 98', 'Electrónica', 'Sony', 255.00, 40);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Monitor 99', 'Audio', 'LG', 1195.00, 89);
INSERT INTO Productos (Nombre, Categoria, Marca, Precio, Stock) VALUES ('Laptop 100', 'Electrónica', 'Sony', 1962.00, 20);
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 1', 'Descuento', '2023-04-02', '2023-04-14');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 2', '2x1', '2023-04-06', '2023-04-20');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 3', 'Envío Gratis', '2023-12-17', '2023-12-26');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 4', 'Envío Gratis', '2023-01-18', '2023-01-26');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 5', '2x1', '2023-08-20', '2023-09-02');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 6', 'Descuento', '2023-03-07', '2023-03-27');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 7', '2x1', '2023-08-27', '2023-09-02');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 8', 'Descuento', '2023-04-30', '2023-05-19');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 9', 'Descuento', '2023-12-20', '2024-01-06');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 10', '2x1', '2023-05-06', '2023-05-25');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 11', 'Descuento', '2023-05-08', '2023-05-25');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 12', 'Envío Gratis', '2023-03-01', '2023-03-10');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 13', 'Descuento', '2023-05-15', '2023-05-31');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 14', '2x1', '2023-06-27', '2023-07-15');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 15', '2x1', '2023-07-05', '2023-07-17');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 16', '2x1', '2023-07-22', '2023-07-27');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 17', 'Descuento', '2023-01-05', '2023-01-15');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 18', '2x1', '2023-11-17', '2023-12-03');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 19', 'Envío Gratis', '2023-04-04', '2023-04-23');
INSERT INTO Promociones (Nombre, Tipo, FechaInicio, FechaFin) VALUES ('Promo 20', '2x1', '2023-04-25', '2023-05-01');
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (75, 5);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (95, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (45, 12);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (36, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (97, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (61, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (98, 13);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (90, 16);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (1, 5);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (49, 3);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (17, 13);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (31, 8);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (71, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (17, 19);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (50, 12);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (39, 12);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (53, 17);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (48, 9);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (16, 8);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (45, 2);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (86, 19);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (45, 12);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (74, 12);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (90, 10);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (41, 16);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (20, 3);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (19, 9);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (61, 10);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (1, 13);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (67, 10);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (69, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (51, 16);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (53, 2);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (51, 6);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (43, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (54, 16);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (73, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (26, 10);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (6, 19);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (35, 18);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (20, 18);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (11, 7);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (49, 3);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (54, 6);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (80, 9);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (31, 8);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (34, 17);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (98, 15);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (63, 4);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (10, 5);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (36, 5);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (32, 7);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (65, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (90, 2);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (58, 10);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (71, 19);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (29, 6);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (46, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (50, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (13, 2);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (62, 3);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (27, 1);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (28, 5);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (54, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (72, 7);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (97, 14);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (9, 18);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (87, 6);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (27, 9);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (80, 8);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (18, 9);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (19, 8);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (61, 2);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (6, 4);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (45, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (93, 12);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (95, 8);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (8, 18);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (13, 15);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (10, 8);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (37, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (36, 14);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (66, 11);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (6, 2);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (93, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (45, 17);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (57, 16);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (24, 13);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (54, 1);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (8, 15);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (67, 1);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (54, 9);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (72, 5);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (3, 12);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (40, 18);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (34, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (97, 19);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (36, 20);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (90, 14);
INSERT INTO ProductosPromocion (ProductoID, PromocionID) VALUES (58, 6);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-16', 37, 53, 'Tienda', 2, 1184.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-19', 40, 94, 'Tienda', 2, 902.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-20', 68, 67, 'Tienda', 2, 1073.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-25', 84, 30, 'Tienda', 5, 1292.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-05-10', 38, 47, 'Tienda', 3, 2669.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-25', 16, 13, 'Web', 5, 2304.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-16', 77, 49, 'Web', 3, 526.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-11', 59, 40, 'Tienda', 3, 154.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-12', 40, 88, 'Web', 3, 1245.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-19', 13, 61, 'Tienda', 4, 2887.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-23', 28, 62, 'Web', 4, 1530.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-26', 75, 30, 'Web', 5, 792.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-13', 63, 31, 'Web', 4, 2138.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-15', 42, 100, 'Web', 4, 2118.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-20', 6, 2, 'Tienda', 1, 1063.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-16', 7, 90, 'Tienda', 5, 1203.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-21', 41, 88, 'Web', 3, 1659.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-26', 84, 53, 'Tienda', 2, 2238.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-14', 72, 31, 'Tienda', 5, 2366.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-28', 47, 69, 'Tienda', 1, 272.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-25', 29, 91, 'Tienda', 4, 261.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-23', 5, 81, 'Web', 1, 1807.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-26', 68, 12, 'Web', 1, 1992.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-14', 75, 56, 'Web', 2, 524.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-22', 3, 47, 'Web', 3, 1861.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-13', 38, 44, 'Web', 5, 1992.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-16', 71, 81, 'Web', 1, 1073.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-28', 23, 74, 'Web', 3, 1499.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-20', 17, 1, 'Tienda', 1, 1802.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-11', 61, 52, 'Tienda', 3, 2268.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-22', 98, 55, 'Tienda', 4, 1414.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-17', 36, 83, 'Web', 4, 1630.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-21', 54, 73, 'Tienda', 5, 1707.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-05-15', 6, 95, 'Tienda', 2, 2095.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-11', 86, 58, 'Tienda', 1, 2602.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-15', 35, 2, 'Web', 2, 287.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-05-22', 70, 63, 'Web', 3, 341.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-26', 97, 26, 'Tienda', 2, 1656.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-19', 72, 54, 'Web', 5, 1013.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-18', 30, 66, 'Web', 2, 2436.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-21', 61, 69, 'Web', 2, 2530.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-25', 75, 78, 'Tienda', 3, 2060.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-19', 41, 82, 'Tienda', 2, 1019.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-22', 15, 8, 'Tienda', 2, 1460.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-24', 53, 57, 'Tienda', 3, 2899.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-20', 87, 75, 'Tienda', 2, 2315.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-28', 100, 75, 'Tienda', 4, 615.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-20', 14, 26, 'Tienda', 5, 1417.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-27', 69, 49, 'Web', 3, 2191.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-25', 24, 48, 'Tienda', 5, 2339.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-05-24', 39, 83, 'Tienda', 5, 1127.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-22', 95, 59, 'Tienda', 3, 2213.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-10', 40, 95, 'Tienda', 3, 732.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-18', 70, 76, 'Web', 1, 2726.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-18', 65, 66, 'Tienda', 2, 1076.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-13', 39, 69, 'Web', 3, 1680.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-05-25', 36, 12, 'Tienda', 5, 642.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-15', 8, 33, 'Web', 4, 1319.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-07-28', 57, 64, 'Web', 5, 1911.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-05-20', 2, 78, 'Tienda', 2, 2846.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-27', 18, 26, 'Web', 4, 926.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-19', 79, 100, 'Web', 1, 410.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-10', 72, 18, 'Web', 2, 1173.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-19', 14, 35, 'Tienda', 4, 437.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-26', 99, 99, 'Web', 5, 2813.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-14', 40, 37, 'Tienda', 1, 430.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-27', 22, 57, 'Web', 2, 211.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-14', 80, 4, 'Web', 4, 904.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-27', 67, 53, 'Tienda', 1, 1118.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-18', 27, 23, 'Tienda', 4, 354.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-26', 64, 12, 'Tienda', 3, 817.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-23', 78, 94, 'Web', 5, 917.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-19', 1, 33, 'Web', 1, 1037.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-25', 62, 87, 'Tienda', 3, 181.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-18', 40, 100, 'Web', 3, 1039.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-24', 75, 22, 'Tienda', 2, 1507.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-26', 36, 40, 'Tienda', 2, 2991.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-28', 39, 88, 'Tienda', 4, 810.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-06-25', 34, 69, 'Tienda', 2, 638.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-19', 67, 77, 'Web', 1, 251.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-10', 27, 9, 'Web', 1, 1596.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-05-21', 16, 37, 'Web', 4, 1956.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-08-14', 9, 100, 'Tienda', 2, 1675.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-16', 61, 55, 'Tienda', 5, 226.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-26', 84, 15, 'Web', 4, 2749.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-17', 65, 19, 'Web', 4, 1613.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-16', 63, 53, 'Web', 2, 1839.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-11', 61, 19, 'Web', 1, 1526.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-26', 55, 54, 'Web', 4, 454.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-12', 77, 42, 'Tienda', 4, 2174.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-04-25', 3, 22, 'Tienda', 3, 2606.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-02-25', 24, 67, 'Web', 3, 2974.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-03-18', 63, 54, 'Web', 2, 2564.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-15', 4, 56, 'Web', 1, 2923.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-27', 1, 64, 'Web', 4, 2087.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-14', 7, 39, 'Tienda', 5, 1558.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-01-27', 18, 54, 'Tienda', 3, 2772.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-21', 22, 87, 'Web', 5, 1347.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-09-11', 63, 63, 'Tienda', 3, 130.00);
INSERT INTO Ventas (Fecha, ClienteID, EmpleadoID, Canal, SucursalID, Total) VALUES ('2024-05-10', 79, 14, 'Web', 5, 891.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (55, 67, 1, 662.00, 7.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (96, 56, 2, 1251.00, 8.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (53, 83, 5, 686.00, 18.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (72, 33, 1, 856.00, 14.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (58, 82, 1, 261.00, 22.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (16, 54, 2, 602.00, 14.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (41, 97, 5, 1403.00, 1.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (65, 18, 5, 204.00, 19.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (66, 17, 3, 969.00, 18.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (14, 83, 3, 208.00, 29.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (31, 55, 4, 123.00, 7.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (76, 59, 2, 1347.00, 4.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (59, 88, 5, 414.00, 1.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (27, 29, 1, 178.00, 22.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (70, 35, 3, 920.00, 10.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (41, 88, 4, 881.00, 10.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (82, 11, 3, 837.00, 15.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (16, 62, 5, 851.00, 30.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (71, 96, 4, 368.00, 24.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (23, 98, 4, 274.00, 25.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (17, 54, 3, 733.00, 14.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (23, 68, 3, 425.00, 28.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (66, 36, 2, 236.00, 16.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (61, 2, 1, 1317.00, 3.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (45, 38, 2, 244.00, 11.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (100, 93, 2, 423.00, 16.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (90, 36, 4, 498.00, 2.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (47, 32, 2, 449.00, 23.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (89, 44, 2, 1015.00, 10.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (15, 44, 3, 1487.00, 1.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (89, 86, 3, 273.00, 30.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (26, 29, 2, 1051.00, 26.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (6, 18, 3, 1489.00, 28.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (56, 45, 3, 625.00, 12.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (56, 57, 4, 318.00, 17.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (19, 62, 3, 1227.00, 25.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (40, 67, 2, 174.00, 12.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (87, 99, 1, 1418.00, 1.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (6, 6, 2, 534.00, 21.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (86, 63, 3, 1490.00, 11.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (11, 25, 4, 328.00, 11.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (89, 21, 3, 1047.00, 7.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (50, 31, 4, 1047.00, 21.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (2, 47, 2, 1263.00, 17.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (71, 36, 3, 948.00, 26.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (30, 43, 1, 417.00, 2.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (17, 39, 4, 1284.00, 6.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (28, 89, 4, 1268.00, 22.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (1, 12, 1, 281.00, 6.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (29, 78, 1, 295.00, 26.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (63, 11, 3, 1104.00, 24.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (40, 68, 2, 135.00, 19.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (34, 2, 4, 1009.00, 23.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (43, 57, 2, 1405.00, 12.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (34, 96, 3, 898.00, 30.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (59, 12, 4, 384.00, 8.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (67, 87, 2, 224.00, 23.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (28, 71, 3, 753.00, 29.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (44, 83, 4, 802.00, 6.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (67, 61, 4, 1151.00, 18.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (85, 75, 5, 1103.00, 7.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (71, 94, 5, 872.00, 8.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (91, 57, 1, 1201.00, 28.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (7, 3, 2, 1456.00, 13.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (48, 34, 4, 762.00, 29.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (26, 60, 2, 894.00, 30.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (69, 44, 5, 980.00, 19.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (71, 9, 3, 727.00, 26.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (43, 87, 5, 755.00, 0.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (49, 55, 5, 151.00, 3.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (60, 58, 2, 1180.00, 20.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (57, 24, 2, 236.00, 16.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (46, 100, 4, 136.00, 21.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (59, 11, 4, 458.00, 4.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (32, 65, 3, 595.00, 20.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (3, 19, 2, 1126.00, 11.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (64, 78, 3, 1461.00, 8.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (43, 62, 1, 1232.00, 12.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (56, 93, 4, 1199.00, 0.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (40, 19, 2, 1025.00, 21.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (83, 13, 1, 286.00, 7.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (61, 39, 3, 1133.00, 11.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (63, 64, 5, 856.00, 20.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (41, 30, 2, 1367.00, 30.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (90, 66, 4, 1297.00, 11.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (43, 36, 2, 1185.00, 3.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (13, 7, 4, 1432.00, 2.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (38, 16, 5, 588.00, 8.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (43, 5, 1, 763.00, 25.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (47, 24, 2, 1088.00, 6.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (76, 99, 1, 804.00, 2.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (96, 12, 1, 1353.00, 12.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (90, 68, 2, 485.00, 21.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (62, 42, 5, 240.00, 18.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (8, 27, 1, 130.00, 23.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (74, 34, 1, 1270.00, 19.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (53, 5, 1, 775.00, 9.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (65, 10, 1, 1395.00, 11.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (70, 47, 2, 687.00, 20.00);
INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad, PrecioUnitario, Descuento) VALUES (16, 28, 3, 1244.00, 29.00);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (64, 5, '2024-03-26', 164);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (4, 4, '2024-03-20', 178);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (96, 1, '2024-03-25', 148);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (1, 3, '2024-03-14', 58);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (68, 3, '2024-03-20', 74);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (97, 2, '2024-03-10', 60);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (36, 1, '2024-03-26', 151);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (99, 3, '2024-03-16', 167);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (2, 4, '2024-03-22', 96);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (29, 3, '2024-03-24', 174);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (14, 5, '2024-03-27', 76);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (89, 2, '2024-03-10', 51);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (75, 1, '2024-03-12', 43);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (74, 2, '2024-03-19', 83);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (36, 4, '2024-03-15', 190);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (94, 3, '2024-03-23', 22);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (18, 4, '2024-03-18', 171);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (58, 4, '2024-03-10', 94);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (55, 4, '2024-03-13', 118);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (82, 1, '2024-03-26', 78);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (29, 5, '2024-03-25', 54);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (69, 5, '2024-03-15', 70);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (1, 2, '2024-03-14', 11);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (8, 1, '2024-03-20', 38);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (97, 4, '2024-03-13', 130);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (5, 1, '2024-03-18', 20);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (70, 5, '2024-03-26', 60);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (30, 2, '2024-03-12', 200);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (89, 5, '2024-03-28', 24);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (86, 3, '2024-03-11', 144);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (18, 3, '2024-03-28', 46);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (47, 3, '2024-03-23', 151);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (96, 3, '2024-03-14', 16);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (94, 3, '2024-03-28', 61);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (13, 5, '2024-03-21', 194);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (95, 5, '2024-03-16', 12);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (39, 3, '2024-03-17', 123);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (16, 3, '2024-03-15', 140);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (16, 3, '2024-03-23', 156);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (100, 5, '2024-03-21', 41);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (39, 2, '2024-03-24', 105);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (69, 4, '2024-03-26', 124);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (6, 2, '2024-03-26', 96);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (67, 2, '2024-03-13', 190);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (71, 3, '2024-03-17', 172);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (92, 2, '2024-03-26', 96);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (13, 3, '2024-03-15', 186);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (70, 3, '2024-03-17', 91);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (49, 3, '2024-03-11', 60);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (11, 5, '2024-03-25', 17);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (15, 3, '2024-03-16', 199);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (19, 5, '2024-03-11', 104);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (22, 4, '2024-03-17', 78);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (76, 3, '2024-03-22', 115);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (87, 2, '2024-03-18', 33);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (97, 4, '2024-03-13', 50);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (22, 2, '2024-03-19', 149);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (26, 4, '2024-03-12', 123);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (60, 4, '2024-03-18', 134);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (49, 4, '2024-03-22', 119);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (11, 3, '2024-03-10', 158);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (69, 1, '2024-03-26', 153);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (65, 3, '2024-03-10', 71);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (23, 5, '2024-03-21', 96);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (100, 2, '2024-03-23', 151);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (72, 3, '2024-03-13', 103);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (36, 1, '2024-03-11', 99);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (2, 3, '2024-03-18', 101);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (3, 3, '2024-03-14', 132);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (87, 4, '2024-03-22', 102);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (85, 1, '2024-03-18', 114);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (11, 1, '2024-03-12', 80);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (6, 2, '2024-03-27', 144);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (47, 1, '2024-03-21', 86);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (74, 2, '2024-03-12', 14);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (25, 5, '2024-03-13', 134);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (59, 3, '2024-03-26', 24);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (87, 3, '2024-03-11', 86);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (82, 1, '2024-03-17', 195);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (37, 1, '2024-03-19', 157);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (71, 5, '2024-03-12', 21);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (3, 1, '2024-03-28', 25);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (85, 1, '2024-03-25', 46);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (25, 1, '2024-03-28', 123);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (1, 5, '2024-03-22', 94);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (9, 4, '2024-03-20', 78);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (37, 1, '2024-03-23', 136);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (46, 4, '2024-03-28', 180);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (63, 4, '2024-03-24', 37);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (65, 5, '2024-03-13', 191);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (7, 5, '2024-03-19', 149);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (21, 2, '2024-03-17', 172);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (7, 2, '2024-03-24', 36);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (24, 5, '2024-03-21', 57);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (43, 2, '2024-03-16', 192);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (48, 2, '2024-03-20', 171);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (41, 3, '2024-03-27', 77);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (71, 3, '2024-03-26', 199);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (32, 5, '2024-03-15', 43);
INSERT INTO Inventario (ProductoID, SucursalID, FechaActualizacion, Stock) VALUES (39, 2, '2024-03-23', 115);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Google Ads', 1183.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Email', 885.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Email', 1906.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Google Ads', 1050.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Email', 756.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Email', 1903.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Email', 1396.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Instagram', 1260.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Instagram', 925.00);
INSERT INTO CanalesMarketing (Nombre, CostoMensual) VALUES ('Instagram', 1964.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 1', 8, '2024-03-13', '2024-04-05', 3412.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 2', 6, '2024-11-18', '2024-12-16', 7900.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 3', 10, '2024-05-09', '2024-06-06', 6779.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 4', 5, '2024-01-22', '2024-02-15', 7775.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 5', 4, '2024-07-14', '2024-07-29', 5308.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 6', 6, '2024-07-05', '2024-07-12', 4627.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 7', 6, '2024-02-18', '2024-03-12', 3410.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 8', 9, '2024-07-15', '2024-07-22', 4379.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 9', 5, '2024-03-10', '2024-04-09', 7257.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 10', 4, '2024-08-27', '2024-09-10', 7131.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 11', 6, '2024-09-11', '2024-09-18', 5750.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 12', 4, '2024-11-22', '2024-12-06', 6623.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 13', 4, '2024-11-06', '2024-11-24', 2256.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 14', 2, '2024-01-12', '2024-02-11', 6432.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 15', 3, '2024-07-03', '2024-07-22', 7366.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 16', 5, '2024-06-30', '2024-07-10', 6187.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 17', 5, '2024-01-05', '2024-01-19', 4001.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 18', 3, '2024-12-03', '2024-12-28', 2777.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 19', 8, '2024-05-25', '2024-06-23', 5090.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 20', 7, '2024-06-26', '2024-07-17', 1638.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 21', 10, '2024-07-14', '2024-07-23', 9589.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 22', 5, '2024-01-23', '2024-02-05', 2281.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 23', 4, '2024-03-14', '2024-03-27', 2687.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 24', 9, '2024-10-23', '2024-11-11', 9694.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 25', 10, '2024-10-07', '2024-10-19', 1459.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 26', 1, '2024-10-15', '2024-11-07', 8045.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 27', 2, '2024-10-12', '2024-10-20', 8007.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 28', 6, '2024-05-03', '2024-05-15', 4602.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 29', 1, '2024-07-09', '2024-07-16', 2209.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 30', 9, '2024-11-21', '2024-12-17', 8556.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 31', 7, '2024-05-16', '2024-06-06', 2413.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 32', 2, '2024-09-24', '2024-10-11', 4922.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 33', 8, '2024-01-31', '2024-02-10', 9419.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 34', 3, '2024-08-21', '2024-09-19', 9348.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 35', 1, '2024-06-27', '2024-07-17', 5424.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 36', 2, '2024-08-24', '2024-09-18', 8486.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 37', 5, '2024-06-24', '2024-07-07', 7250.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 38', 10, '2024-09-03', '2024-09-26', 3743.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 39', 7, '2024-07-13', '2024-07-24', 7335.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 40', 1, '2024-05-04', '2024-05-16', 9261.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 41', 3, '2024-06-28', '2024-07-14', 5722.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 42', 4, '2024-07-31', '2024-08-09', 8206.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 43', 1, '2024-03-21', '2024-04-17', 5208.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 44', 10, '2024-05-17', '2024-06-13', 4116.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 45', 6, '2024-04-08', '2024-05-03', 9868.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 46', 7, '2024-08-21', '2024-09-14', 3923.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 47', 6, '2024-06-05', '2024-06-28', 3209.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 48', 1, '2024-10-15', '2024-10-20', 3929.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 49', 2, '2024-02-05', '2024-03-02', 3160.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 50', 7, '2024-05-07', '2024-05-13', 4067.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 51', 6, '2024-12-20', '2025-01-05', 2435.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 52', 1, '2024-05-29', '2024-06-09', 3876.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 53', 5, '2024-01-17', '2024-02-01', 8447.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 54', 3, '2024-01-31', '2024-02-06', 5037.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 55', 1, '2024-12-10', '2025-01-06', 1089.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 56', 10, '2024-08-18', '2024-08-31', 7924.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 57', 8, '2024-01-25', '2024-02-11', 7813.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 58', 10, '2024-05-03', '2024-05-11', 7725.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 59', 5, '2024-12-25', '2025-01-12', 7365.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 60', 2, '2024-05-14', '2024-05-19', 9823.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 61', 9, '2024-05-31', '2024-06-10', 5348.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 62', 6, '2024-05-31', '2024-06-15', 1040.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 63', 1, '2024-06-09', '2024-06-26', 9049.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 64', 9, '2024-01-30', '2024-02-26', 9468.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 65', 5, '2024-12-10', '2024-12-30', 3136.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 66', 3, '2024-11-17', '2024-12-08', 1957.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 67', 6, '2024-10-03', '2024-10-10', 1042.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 68', 2, '2024-10-13', '2024-10-26', 3328.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 69', 9, '2024-04-23', '2024-04-29', 3015.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 70', 8, '2024-09-18', '2024-10-11', 7960.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 71', 5, '2024-12-15', '2025-01-07', 8057.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 72', 9, '2024-09-20', '2024-10-11', 6738.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 73', 4, '2024-12-03', '2024-12-13', 4232.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 74', 2, '2024-01-29', '2024-02-20', 9717.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 75', 5, '2024-06-27', '2024-07-02', 8465.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 76', 10, '2024-12-14', '2025-01-01', 1293.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 77', 10, '2024-05-26', '2024-06-24', 3410.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 78', 9, '2024-07-27', '2024-08-08', 2314.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 79', 8, '2024-11-18', '2024-12-06', 3082.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 80', 10, '2024-10-05', '2024-11-02', 1453.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 81', 4, '2024-11-02', '2024-11-18', 5892.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 82', 2, '2024-09-25', '2024-10-13', 8823.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 83', 4, '2024-10-01', '2024-10-23', 7310.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 84', 3, '2024-02-10', '2024-02-29', 9865.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 85', 1, '2024-07-10', '2024-07-25', 5344.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 86', 9, '2024-11-23', '2024-12-20', 6716.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 87', 7, '2024-10-04', '2024-10-23', 5371.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 88', 9, '2024-10-18', '2024-11-09', 6036.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 89', 6, '2024-09-23', '2024-09-28', 9154.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 90', 8, '2024-02-08', '2024-03-02', 3251.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 91', 8, '2024-02-08', '2024-03-01', 7754.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 92', 6, '2024-08-04', '2024-08-30', 5470.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 93', 2, '2024-08-23', '2024-09-06', 9389.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 94', 9, '2024-02-16', '2024-03-08', 5670.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 95', 7, '2024-08-05', '2024-08-23', 8058.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 96', 8, '2024-10-06', '2024-10-19', 9404.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 97', 2, '2024-10-05', '2024-11-04', 1772.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 98', 9, '2024-01-25', '2024-02-03', 4147.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 99', 4, '2024-09-18', '2024-10-18', 9197.00);
INSERT INTO Campañas (Nombre, CanalID, FechaInicio, FechaFin, Presupuesto) VALUES ('Campaña 100', 8, '2024-04-06', '2024-05-02', 4155.00);
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (20, 83, '2024-06-27', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (8, 20, '2024-03-16', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (49, 2, '2024-08-22', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (42, 88, '2024-08-10', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (89, 75, '2024-09-22', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (55, 3, '2024-06-11', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (83, 48, '2024-05-27', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (60, 20, '2024-04-23', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (1, 51, '2024-02-10', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (58, 1, '2024-05-13', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (67, 26, '2024-03-27', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (92, 5, '2024-06-10', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (3, 45, '2024-04-22', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (40, 81, '2024-06-19', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (60, 82, '2024-09-23', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (74, 32, '2024-03-19', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (12, 91, '2024-02-25', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (39, 52, '2024-03-25', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (91, 71, '2024-01-28', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (27, 100, '2024-06-20', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (67, 15, '2024-03-18', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (63, 78, '2024-01-19', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (70, 81, '2024-09-21', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (20, 89, '2024-02-26', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (9, 15, '2024-03-26', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (32, 15, '2024-04-12', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (12, 64, '2024-03-26', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (9, 53, '2024-01-28', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (64, 92, '2024-07-15', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (84, 97, '2024-01-12', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (84, 57, '2024-09-24', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (99, 71, '2024-02-17', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (91, 72, '2024-09-26', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (90, 77, '2024-07-22', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (13, 16, '2024-07-16', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (20, 96, '2024-06-11', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (42, 4, '2024-04-24', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (32, 68, '2024-09-14', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (57, 72, '2024-04-23', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (73, 64, '2024-01-25', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (76, 57, '2024-05-10', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (58, 75, '2024-09-24', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (22, 60, '2024-07-23', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (71, 64, '2024-04-15', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (25, 12, '2024-05-10', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (43, 44, '2024-05-21', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (47, 82, '2024-06-20', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (12, 53, '2024-07-12', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (53, 27, '2024-03-14', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (85, 79, '2024-08-14', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (46, 29, '2024-04-19', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (51, 95, '2024-05-27', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (99, 6, '2024-09-15', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (7, 36, '2024-04-20', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (53, 2, '2024-06-20', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (62, 66, '2024-05-21', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (97, 48, '2024-06-14', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (14, 54, '2024-06-11', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (9, 40, '2024-02-13', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (25, 87, '2024-07-25', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (72, 11, '2024-01-19', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (67, 42, '2024-07-25', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (4, 92, '2024-06-11', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (54, 20, '2024-03-15', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (99, 85, '2024-06-18', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (35, 43, '2024-02-10', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (58, 94, '2024-01-28', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (93, 52, '2024-05-10', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (4, 1, '2024-09-23', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (90, 64, '2024-09-10', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (42, 95, '2024-05-17', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (76, 70, '2024-08-20', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (5, 91, '2024-01-24', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (69, 8, '2024-09-25', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (86, 92, '2024-01-23', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (50, 16, '2024-05-13', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (27, 44, '2024-07-25', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (83, 79, '2024-09-17', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (77, 41, '2024-09-10', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (6, 5, '2024-01-16', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (34, 97, '2024-08-21', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (19, 23, '2024-08-18', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (68, 10, '2024-09-15', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (20, 16, '2024-08-17', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (31, 97, '2024-07-12', 5, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (62, 14, '2024-02-14', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (5, 80, '2024-06-17', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (88, 54, '2024-03-18', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (34, 23, '2024-06-16', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (84, 79, '2024-04-28', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (96, 83, '2024-06-16', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (95, 97, '2024-03-27', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (82, 56, '2024-05-10', 2, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (69, 16, '2024-06-15', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (35, 55, '2024-03-13', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (13, 43, '2024-08-24', 3, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (95, 50, '2024-01-18', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (43, 1, '2024-04-28', 1, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (69, 22, '2024-08-23', 4, 'Buen producto');
INSERT INTO Feedback (ClienteID, ProductoID, Fecha, Calificacion, Comentario) VALUES (54, 77, '2024-05-20', 1, 'Buen producto');


-----------------------------------------------------------------------------------

select * from Sucursales;
select * from Ventas;
select * from Empleados;
select * from Inventario;
select * from ProductosPromocion;
select * from Campañas;



SELECT 
    P.Nombre,
    SUM(DV.Cantidad) AS UnidadesVendidas
FROM DetalleVentas DV
JOIN Productos P ON DV.ProductoID = P.ProductoID
GROUP BY P.Nombre
ORDER BY UnidadesVendidas DESC

------

SELECT 
    S.Nombre AS Sucursal,
    SUM(V.Total) AS TotalVentas
FROM Ventas V
JOIN Sucursales S ON V.SucursalID = S.SucursalID
GROUP BY S.Nombre
ORDER BY TotalVentas DESC;


------------

SELECT 
    NivelFidelidad,
    COUNT(*) AS CantClientes
FROM Clientes
GROUP BY NivelFidelidad;

-------------


SELECT 
    C.Nombre + ' ' + C.Apellido AS Cliente,
    COUNT(V.VentaID) AS NumCompras,
    SUM(V.Total) AS TotalGastado
FROM Ventas V
JOIN Clientes C ON V.ClienteID = C.ClienteID
GROUP BY C.Nombre, C.Apellido
ORDER BY TotalGastado DESC;


----------

SELECT 
    P.Nombre,
    S.Nombre AS Sucursal,
    I.Stock
FROM Inventario I
JOIN Productos P ON I.ProductoID = P.ProductoID
JOIN Sucursales S ON I.SucursalID = S.SucursalID
WHERE I.Stock < 20
ORDER BY I.Stock ASC;

-------------

SELECT 
    P.Nombre,
    COUNT(PP.PromocionID) AS NumPromociones
FROM ProductosPromocion PP
JOIN Productos P ON PP.ProductoID = P.ProductoID
GROUP BY P.Nombre
ORDER BY NumPromociones DESC;

---------------

SELECT 
    C.Nombre,
    CM.Nombre AS Canal,
    C.Presupuesto
FROM Campañas C
JOIN CanalesMarketing CM ON C.CanalID = CM.CanalID
ORDER BY C.Presupuesto DESC;

----------------

SELECT 
    P.Nombre,
    AVG(F.Calificacion) AS PromedioCalificacion
FROM Feedback F
JOIN Productos P ON F.ProductoID = P.ProductoID
GROUP BY P.Nombre
ORDER BY PromedioCalificacion DESC;

---------------

SELECT 
    C.Nombre + ' ' + C.Apellido AS Cliente,
    P.Nombre AS Producto,
    F.Calificacion,
    F.Comentario
FROM Feedback F
JOIN Clientes C ON F.ClienteID = C.ClienteID
JOIN Productos P ON F.ProductoID = P.ProductoID
WHERE F.Calificacion <= 2;
