create database EC02DWH_MIGUEL
Use EC02DWH_MIGUEL

CREATE TABLE [Master_Data] (
    [País id] float,
    [Unidades Vendidas] float,
    [Precio de Fabricación] money,
    [IdProducto] nvarchar(255),
    [Precio de Venta] money,
    [Ventas Brutas] money,
    [Descuentos] money,
    [Ventas] money,
    [CBV] money,
    [Profit] money,
    [Fecha] datetime,
    [Número de Mes] float,
    [Nombre del Mes] nvarchar(255),
    [Año] nvarchar(255)
)

select * from Master_Data

CREATE TABLE [DataPais] (
    [País id] float,
    [PAÍS] nvarchar(255),
    [CONTINENTE] nvarchar(255)
Constraint PKEPS primary key("País id")
)
Select * from DataPais


CREATE TABLE [DataProducto] (
    [IDPRODUCTO] nvarchar(255),
    [PRODUCTO] nvarchar(255),
    [Precio de Venta] money
Constraint PKPRO primary key("IDPRODUCTO")
)

select * from DataProducto

-----------------------------------------------------------------------------------------------------------------

CREATE TABLE [DIMPAIS] (
    [IDPAIS] int,
    [PAÍS] nvarchar(255),
    [CONTINENTE] nvarchar(255),
    [FechaCarga] datetime
)

CREATE TABLE [DIMPRODUCTO] (
    [IDPRODUCTO] nvarchar(255),
    [PRODUCTO] nvarchar(255),
    [PRECIO] money
)

CREATE TABLE [DIMTIEMPO] (
     [IDTIEMPO] INT IDENTITY(1,1) PRIMARY KEY,
    [Año] nvarchar(255),
    [TRIMESTRE] varchar(17),
    [SEMESTRE] varchar(16)
)

-----------------------------------------------------------------------------------------------------------------------------------


--Pais

SELECT 
    dp.[País id] AS IDPAIS,
    dp.[PAÍS],
    dp.[CONTINENTE],
    CAST(CONVERT(VARCHAR(10), md.[Fecha], 120) AS DATETIME) AS FechaCarga
FROM 
    DataPais dp
JOIN
    Master_Data md ON dp.[País id] = md.[País id];


--Producto
SELECT 
    dp.[IDPRODUCTO],
    dp.[PRODUCTO],
    dp.[Precio de Venta] AS PRECIO
FROM 
    DataProducto dp;

--Tiempo

SELECT 
    [Año],
    CASE 
        WHEN [Nombre del Mes] IN ('January', 'February', 'March') THEN 'Primer Trimestre'
        WHEN [Nombre del Mes] IN ('April', 'May', 'June') THEN 'Segundo Trimestre'
        WHEN [Nombre del Mes] IN ('July', 'August', 'September') THEN 'Tercer Trimestre'
        WHEN [Nombre del Mes] IN ('October', 'November', 'December') THEN 'Cuarto Trimestre'
    END AS TRIMESTRE,
    CASE 
        WHEN [Nombre del Mes] IN ('January', 'February', 'March', 'April', 'May', 'June') THEN 'Primer Semestre'
        WHEN [Nombre del Mes] IN ('July', 'August', 'September', 'October', 'November', 'December') THEN 'Segundo Semestre'
    END AS SEMESTRE
FROM 
    Master_Data;