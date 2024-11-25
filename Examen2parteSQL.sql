
CREATE DATABASE Empresa;
GO

USE Empresa;
GO

CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    CorreoElectronico NVARCHAR(150) NOT NULL UNIQUE,
    Telefono NVARCHAR(80) NOT NULL
);

CREATE TABLE Equipos (
    EquipoID INT PRIMARY KEY IDENTITY(1,1),
    TipoEquipo NVARCHAR(100) NOT NULL,
    Modelo NVARCHAR(50) NOT NULL,
    UsuarioID INT NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Reparaciones (
    ReparacionID INT PRIMARY KEY IDENTITY(1,1),
    EquipoID INT NOT NULL,
    FechaSolicitud DATE NOT NULL,
    Estado NVARCHAR(30) NOT NULL,
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);

CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Especialidad NVARCHAR(60) NOT NULL
);

CREATE TABLE Asignacion (
    AsignacionID INT PRIMARY KEY IDENTITY(1,1),
    ReparacionID INT NOT NULL,
    TecnicoID INT NOT NULL,
    FechaAsignacion DATE NOT NULL,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)
);

CREATE TABLE DetallesReparacion (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    ReparacionID INT NOT NULL,
    Descripcion TEXT NOT NULL,
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);
GO


CREATE PROCEDURE InsertarUsuario
    @Nombre NVARCHAR(50),
    @CorreoElectronico NVARCHAR(150),
    @Telefono NVARCHAR(80)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (@Nombre, @CorreoElectronico, @Telefono);
END;
GO


CREATE PROCEDURE ConsultarUsuarios
AS
BEGIN
    SELECT * FROM Usuarios;
END;
GO


CREATE PROCEDURE ModificarUsuario
    @UsuarioID INT,
    @Nombre NVARCHAR(50),
    @CorreoElectronico NVARCHAR(150),
    @Telefono NVARCHAR(80)
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono
    WHERE UsuarioID = @UsuarioID;
END;
GO

CREATE PROCEDURE EliminarUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios
    WHERE UsuarioID = @UsuarioID;
END;
GO


CREATE PROCEDURE InsertarEquipo
    @TipoEquipo NVARCHAR(100),
    @Modelo NVARCHAR(50),
    @UsuarioID INT
AS
BEGIN
    INSERT INTO Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (@TipoEquipo, @Modelo, @UsuarioID);
END;
GO


CREATE PROCEDURE ConsultarEquipos
AS
BEGIN
    SELECT * FROM Equipos;
END;
GO


CREATE PROCEDURE ModificarEquipo
    @EquipoID INT,
    @TipoEquipo NVARCHAR(100),
    @Modelo NVARCHAR(50),
    @UsuarioID INT
AS
BEGIN
    UPDATE Equipos
    SET TipoEquipo = @TipoEquipo,
        Modelo = @Modelo,
        UsuarioID = @UsuarioID
    WHERE EquipoID = @EquipoID;
END;
GO


CREATE PROCEDURE EliminarEquipo
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos
    WHERE EquipoID = @EquipoID;
END;
GO


CREATE PROCEDURE InsertarTecnico
    @Nombre NVARCHAR(50),
    @Especialidad NVARCHAR(60)
AS
BEGIN
    INSERT INTO Tecnicos (Nombre, Especialidad)
    VALUES (@Nombre, @Especialidad);
END;
GO


CREATE PROCEDURE ConsultarTecnicos
AS
BEGIN
    SELECT * FROM Tecnicos;
END;
GO


CREATE PROCEDURE ModificarTecnico
    @TecnicoID INT,
    @Nombre NVARCHAR(50),
    @Especialidad NVARCHAR(60)
AS
BEGIN
    UPDATE Tecnicos
    SET Nombre = @Nombre,
        Especialidad = @Especialidad
    WHERE TecnicoID = @TecnicoID;
END;
GO


CREATE PROCEDURE EliminarTecnico
    @TecnicoID INT
AS
BEGIN
    DELETE FROM Tecnicos
    WHERE TecnicoID = @TecnicoID;
END;
GO

-- Insertar datos en Usuarios
EXEC InsertarUsuario @Nombre = 'Juan Pérez', @CorreoElectronico = 'juan@example.com', @Telefono = '123456789';

-- Insertar datos en Equipos
EXEC InsertarEquipo @TipoEquipo = 'Laptop', @Modelo = 'Dell Inspiron', @UsuarioID = 1;

-- Insertar datos en Tecnicos
EXEC InsertarTecnico @Nombre = 'Carlos López', @Especialidad = 'Reparación de Hardware';

EXEC ConsultarUsuarios;
EXEC ConsultarEquipos;
EXEC ConsultarTecnicos;

EXEC ModificarUsuario @UsuarioID = 1, @Nombre = 'Juan Actualizado', @CorreoElectronico = 'juan.nuevo@example.com', @Telefono = '987654321';
EXEC ModificarEquipo @EquipoID = 1, @TipoEquipo = 'Tablet', @Modelo = 'iPad Pro', @UsuarioID = 1;
EXEC ModificarTecnico @TecnicoID = 1, @Nombre = 'Carlos Actualizado', @Especialidad = 'Software y Hardware';

EXEC EliminarUsuario @UsuarioID = 1;
EXEC EliminarEquipo @EquipoID = 1;
EXEC EliminarTecnico @TecnicoID = 1;
