USE [master]
GO
/****** Object:  Database [ProyectoProg3]    Script Date: 3/12/2021 17:42:22 ******/
CREATE DATABASE [ProyectoProg3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoProg3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoProg3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoProg3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoProg3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProyectoProg3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoProg3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoProg3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProyectoProg3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoProg3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoProg3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoProg3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoProg3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoProg3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoProg3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoProg3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoProg3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoProg3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoProg3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoProg3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoProg3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoProg3] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoProg3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoProg3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoProg3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoProg3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoProg3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoProg3] SET QUERY_STORE = OFF
GO
USE [ProyectoProg3]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[CodArticulo] [int] IDENTITY(1,1) NOT NULL,
	[NombreArticulo] [varchar](25) NULL,
	[Descripcion] [varchar](50) NULL,
	[PrecioUnitario] [decimal](10, 2) NULL,
	[Estado] [bit] NULL,
	[CodCategoria] [int] NULL,
	[Stock] [int] NULL,
	[ImagenUrl] [varchar](50) NULL,
	[CodProveedor] [int] NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[CodArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carritos]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carritos](
	[CodCarrito] [int] IDENTITY(1,1) NOT NULL,
	[CodUsuario] [int] NOT NULL,
	[CodArticulo] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[SubTotal] [decimal](10, 2) NOT NULL,
	[Comprado] [bit] NOT NULL,
 CONSTRAINT [PK_Carritos] PRIMARY KEY CLUSTERED 
(
	[CodCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[CodCategoria] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](50) NULL,
	[Descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[CodCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleDeVentas]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleDeVentas](
	[Cod_DetalleVenta_DV] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Venta_DV] [int] NOT NULL,
	[Cod_Articulo_DV] [int] NOT NULL,
	[Cantidad_DV] [int] NOT NULL,
	[PrecioUnitario_DV] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_DetalleDeVentas] PRIMARY KEY CLUSTERED 
(
	[Cod_DetalleVenta_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[IdLocalidad] [int] NOT NULL,
	[NombreLocalidad] [varchar](30) NOT NULL,
	[IdProvincia] [int] NOT NULL,
 CONSTRAINT [PK_LOCALIDAD] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Cod_Proveedor_Pr] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial_Pr] [varchar](25) NULL,
	[Marca_Pr] [varchar](25) NULL,
	[Direccion_Pr] [varchar](25) NULL,
	[Ciudad_Pr] [varchar](25) NULL,
	[Provincia_Pr] [varchar](25) NULL,
	[Cuit_Pr] [varchar](25) NULL,
	[Telefono_Pr] [varchar](25) NULL,
	[Contacto_Pr] [varchar](25) NULL,
	[Web_Pr] [varchar](25) NULL,
	[Email_Pr] [varchar](25) NULL,
	[CBU_Pr] [varchar](25) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Cod_Proveedor_Pr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[IdProvincia] [int] NOT NULL,
	[NombreProvincia] [varchar](25) NOT NULL,
 CONSTRAINT [PK_PROVINCIAS] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
	[Apellido] [varchar](25) NOT NULL,
	[Provincia] [varchar](25) NOT NULL,
	[Celular] [varchar](25) NOT NULL,
	[Dni] [varchar](25) NOT NULL,
	[Direccion] [varchar](25) NOT NULL,
	[Email] [varchar](50) NULL,
	[Contrasena] [varchar](50) NULL,
	[TipoUsuario] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Cod_Venta_V] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Cliente_V] [int] NOT NULL,
	[TotalFactura_V] [decimal](10, 2) NULL,
	[FechaFactura_V] [datetime] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Cod_Venta_V] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (1, N'RAM', N'MEMORIA 4GB DDR4 2666 KINGSTON FURY BEAST', CAST(3550.00 AS Decimal(10, 2)), 1, 1, 179, N'/Imagenes/img1.jpg', 2)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (2, N'Monitor', N'MONITOR 24" SAMSUNG CF390 CURVO FREESYNC', CAST(29000.00 AS Decimal(10, 2)), 1, 2, 212, N'/Imagenes/img2.jpg', 3)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (3, N'Auriculares', N'AURICULARES HYPERX CLOUD FLIGHT WIRELESS', CAST(12800.00 AS Decimal(10, 2)), 1, 3, 170, N'/Imagenes/img3.jpg', 1)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (4, N'Memoria RAM', N'MEMORIA 32GB (2x16GB) DDR4 4000 NEO FORZA BLACK', CAST(43000.00 AS Decimal(10, 2)), 1, 1, 120, N'/Imagenes/img4.jpg', 2)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (5, N'Monitor', N'MONITOR 27" HP P27V HDMI IPS', CAST(31000.00 AS Decimal(10, 2)), 1, 2, 200, N'/Imagenes/img5.jpg', 5)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (6, N'Memoria RAM', N'MEMORIA 16GB (2X8GB) DDR4 4000MHZ PNY EPIC X RGB', CAST(19000.00 AS Decimal(10, 2)), 1, 1, 120, N'/Imagenes/img6.jpg', 3)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (7, N'Teclado', N'Teclado 70%', CAST(15999.00 AS Decimal(10, 2)), 1, 7, 200, N'/Imagenes/img7.jpg', 5)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (8, N'MICROFONO', N'MICROFONO RGB', CAST(15999.00 AS Decimal(10, 2)), 1, 6, 5000, N'/Imagenes/img8.jpg', 8)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (9, N'MotherBoard', N'MotherBoard TX', CAST(20456.00 AS Decimal(10, 2)), 1, 5, 250, N'/Imagenes/img9.jpg', 4)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (10, N'Mouse', N'Mouse Razer', CAST(4600.00 AS Decimal(10, 2)), 1, 4, 100, N'/Imagenes/img10.jpg', 2)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (11, N'Monitor t32', N'Monitor 4k', CAST(29999.00 AS Decimal(10, 2)), 1, 2, 200, N'/Imagenes/img11.jpg', 1)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (12, N'Auriculares', N'AURICULARES GAMING GXT', CAST(4500.00 AS Decimal(10, 2)), 1, 3, 300, N'/Imagenes/img12.jpg', 4)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (13, N'RAM', N'MEMORIA SODIMM 16GB DDR4 3200 KINGSTON', CAST(10600.00 AS Decimal(10, 2)), 1, 1, 240, N'/Imagenes/img13.jpg', 1)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (14, N'Mouse', N'MOUSE TRUST YVI WIRELESS RED', CAST(1200.00 AS Decimal(10, 2)), 1, 4, 200, N'/Imagenes/img14.jpg', 3)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Descripcion], [PrecioUnitario], [Estado], [CodCategoria], [Stock], [ImagenUrl], [CodProveedor]) VALUES (15, N'Auriculares', N'AURICULARES TRUST GXT 310 RADIUS', CAST(3000.00 AS Decimal(10, 2)), 1, 3, 250, N'/Imagenes/img15.jpg', 2)
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Carritos] ON 

INSERT [dbo].[Carritos] ([CodCarrito], [CodUsuario], [CodArticulo], [Descripcion], [Precio], [Cantidad], [SubTotal], [Comprado]) VALUES (17, 6, 1, N'MEMORIA 4GB DDR4 2666 KINGSTON FURY BEAST', CAST(3550.00 AS Decimal(10, 2)), 10, CAST(35500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Carritos] ([CodCarrito], [CodUsuario], [CodArticulo], [Descripcion], [Precio], [Cantidad], [SubTotal], [Comprado]) VALUES (21, 6, 2, N'MONITOR 24" SAMSUNG CF390 CURVO FREESYNC', CAST(29000.00 AS Decimal(10, 2)), 1, CAST(29000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Carritos] ([CodCarrito], [CodUsuario], [CodArticulo], [Descripcion], [Precio], [Cantidad], [SubTotal], [Comprado]) VALUES (22, 6, 1, N'MEMORIA 4GB DDR4 2666 KINGSTON FURY BEAST', CAST(3550.00 AS Decimal(10, 2)), 1, CAST(3550.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Carritos] ([CodCarrito], [CodUsuario], [CodArticulo], [Descripcion], [Precio], [Cantidad], [SubTotal], [Comprado]) VALUES (23, 6, 3, N'AURICULARES HYPERX CLOUD FLIGHT WIRELESS', CAST(12800.00 AS Decimal(10, 2)), 4, CAST(51200.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Carritos] ([CodCarrito], [CodUsuario], [CodArticulo], [Descripcion], [Precio], [Cantidad], [SubTotal], [Comprado]) VALUES (24, 6, 2, N'MONITOR 24" SAMSUNG CF390 CURVO FREESYNC', CAST(29000.00 AS Decimal(10, 2)), 1, CAST(29000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Carritos] ([CodCarrito], [CodUsuario], [CodArticulo], [Descripcion], [Precio], [Cantidad], [SubTotal], [Comprado]) VALUES (25, 6, 3, N'AURICULARES HYPERX CLOUD FLIGHT WIRELESS', CAST(12800.00 AS Decimal(10, 2)), 1, CAST(12800.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[Carritos] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (1, N'Memorias RAM', N'Contiene los tipos de memorias ram')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (2, N'Monitores', N'Contiene los tipos de monitores')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (3, N'AURICULARES', N'Contiene los tipos de auriculares')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (4, N'Mouse', N'Contiene todo tipo de mouse')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (5, N'MotherBoard', N'contiene todo tipo de MotherBoard')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (6, N'Microfonos', N'Contiene todos los tipos de microfonos')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (7, N'Teclado', N'Contiene todo tipo de teclados')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleDeVentas] ON 

INSERT [dbo].[DetalleDeVentas] ([Cod_DetalleVenta_DV], [Cod_Venta_DV], [Cod_Articulo_DV], [Cantidad_DV], [PrecioUnitario_DV]) VALUES (25, 36, 1, 10, CAST(3550.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleDeVentas] ([Cod_DetalleVenta_DV], [Cod_Venta_DV], [Cod_Articulo_DV], [Cantidad_DV], [PrecioUnitario_DV]) VALUES (26, 37, 2, 1, CAST(29000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleDeVentas] ([Cod_DetalleVenta_DV], [Cod_Venta_DV], [Cod_Articulo_DV], [Cantidad_DV], [PrecioUnitario_DV]) VALUES (27, 37, 1, 1, CAST(3550.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleDeVentas] ([Cod_DetalleVenta_DV], [Cod_Venta_DV], [Cod_Articulo_DV], [Cantidad_DV], [PrecioUnitario_DV]) VALUES (28, 38, 3, 4, CAST(12800.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleDeVentas] ([Cod_DetalleVenta_DV], [Cod_Venta_DV], [Cod_Articulo_DV], [Cantidad_DV], [PrecioUnitario_DV]) VALUES (29, 39, 2, 1, CAST(29000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleDeVentas] ([Cod_DetalleVenta_DV], [Cod_Venta_DV], [Cod_Articulo_DV], [Cantidad_DV], [PrecioUnitario_DV]) VALUES (30, 39, 3, 1, CAST(12800.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetalleDeVentas] OFF
GO
INSERT [dbo].[Localidades] ([IdLocalidad], [NombreLocalidad], [IdProvincia]) VALUES (1, N'CABA', 1)
INSERT [dbo].[Localidades] ([IdLocalidad], [NombreLocalidad], [IdProvincia]) VALUES (2, N'Mar del Plata', 1)
INSERT [dbo].[Localidades] ([IdLocalidad], [NombreLocalidad], [IdProvincia]) VALUES (3, N'Cordoba', 2)
INSERT [dbo].[Localidades] ([IdLocalidad], [NombreLocalidad], [IdProvincia]) VALUES (4, N'Rio Cuarto', 2)
INSERT [dbo].[Localidades] ([IdLocalidad], [NombreLocalidad], [IdProvincia]) VALUES (5, N'Rosario', 3)
INSERT [dbo].[Localidades] ([IdLocalidad], [NombreLocalidad], [IdProvincia]) VALUES (6, N'Ciudad de Santa Fe', 3)
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Cod_Proveedor_Pr], [RazonSocial_Pr], [Marca_Pr], [Direccion_Pr], [Ciudad_Pr], [Provincia_Pr], [Cuit_Pr], [Telefono_Pr], [Contacto_Pr], [Web_Pr], [Email_Pr], [CBU_Pr]) VALUES (1, N'Logitech Srl', N'Logitech', N'Corrientes 156', N'CABA', N'Córdoba', N'3045987', N'13', N'1', N'www.Logitech.com', N'lg@gmail.com', N'888888888')
INSERT [dbo].[Proveedores] ([Cod_Proveedor_Pr], [RazonSocial_Pr], [Marca_Pr], [Direccion_Pr], [Ciudad_Pr], [Provincia_Pr], [Cuit_Pr], [Telefono_Pr], [Contacto_Pr], [Web_Pr], [Email_Pr], [CBU_Pr]) VALUES (2, N'Kingston SA', N'Kingston', N'berutti 552', N'CABA', N'Buenos Aires', N'30741589246', N'1545635214', N'Daniel Perez', N'www.kingston.com', N'kingston@gmail.com', N'9999999999')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (2, N'Cordoba')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (3, N'Santa Fe')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (5, N'Pedro', N'Perez', N'Buenos Aires', N'1234567', N'1111', N'Calle 1234', N'PP@gmail.com', N'1234', 1)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (6, N'Juan', N'Rodriguez', N'Calle 4253', N'415236', N'2222', N'Sarmiento 4596', N'JORGE@gmail.com', N'4567', 0)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (7, N'Daniel', N'Gomez', N'Cordoba', N'3333', N'123456789', N'Mendoza 123', N'mj@gmail.com', N'mj@gmail.com', 0)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (8, N'Juan Carlos', N'Daniel', N'Chubut', N'9999', N'666', N'Madrid 456', N'daniel@gmail.com', N'daniel@gmail.com', 1)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (10, N'Marcelo', N'Perez', N'Buenos Aires', N'1523589657', N'88ds', N'cazon 456', N'mp@fakemail.com', N'mp@fakemail.com', 0)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (11, N'Andrea', N'Arana', N'Neuquen', N'1165452341', N'42456789', N'Peron 4569', N'aa@gmail.com', N'aa@gmail.com', 1)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (12, N'nombre', N'asdsds', N'asasa', N'dsds', N'8899', N'asasa', N'sdsds@gmail.com', N'1111', 0)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (13, N'pedro', N'rodriguez', N'', N'1245362', N'2222', N'calle 1', N'dd@gmail.com', N'1111', 0)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (14, N'pedro', N'rodriguez', N'2', N'1245362', N'2222', N'calle 1', N'dd@gmail.com', N'2525', 0)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (15, N'pedro', N'rodriguez', N'1', N'1245362', N'2222', N'calle 1', N'dd@gmail.com', N'2525', 1)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (16, N'pedro', N'rodriguez', N'Cordoba', N'1245362', N'1523', N'calle 1235', N'dd@gmail.com', N'12', 0)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (17, N'pedro', N'rodriguez', N'Santa Fe', N'1245362', N'2222222', N'calle 1', N'sdsds@gmail.com', N'12', 0)
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Provincia], [Celular], [Dni], [Direccion], [Email], [Contrasena], [TipoUsuario]) VALUES (18, N'pedro', N'rodriguez', N'Santa Fe', N'1245362', N'11223344', N'calle 1', N'dd@gmail.com', N'11', 0)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([Cod_Venta_V], [Cod_Cliente_V], [TotalFactura_V], [FechaFactura_V]) VALUES (36, 6, CAST(35500.00 AS Decimal(10, 2)), CAST(N'2021-11-26T10:05:56.000' AS DateTime))
INSERT [dbo].[Ventas] ([Cod_Venta_V], [Cod_Cliente_V], [TotalFactura_V], [FechaFactura_V]) VALUES (37, 6, CAST(32550.00 AS Decimal(10, 2)), CAST(N'2021-11-26T10:09:13.000' AS DateTime))
INSERT [dbo].[Ventas] ([Cod_Venta_V], [Cod_Cliente_V], [TotalFactura_V], [FechaFactura_V]) VALUES (38, 6, CAST(51200.00 AS Decimal(10, 2)), CAST(N'2021-11-29T08:36:36.000' AS DateTime))
INSERT [dbo].[Ventas] ([Cod_Venta_V], [Cod_Cliente_V], [TotalFactura_V], [FechaFactura_V]) VALUES (39, 6, CAST(41800.00 AS Decimal(10, 2)), CAST(N'2021-12-03T11:17:09.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
ALTER TABLE [dbo].[DetalleDeVentas]  WITH CHECK ADD  CONSTRAINT [FK_DetalleDeVentas_Articulos] FOREIGN KEY([Cod_Articulo_DV])
REFERENCES [dbo].[Articulos] ([CodArticulo])
GO
ALTER TABLE [dbo].[DetalleDeVentas] CHECK CONSTRAINT [FK_DetalleDeVentas_Articulos]
GO
ALTER TABLE [dbo].[DetalleDeVentas]  WITH CHECK ADD  CONSTRAINT [FK_DetalleDeVentas_Ventas] FOREIGN KEY([Cod_Venta_DV])
REFERENCES [dbo].[Ventas] ([Cod_Venta_V])
GO
ALTER TABLE [dbo].[DetalleDeVentas] CHECK CONSTRAINT [FK_DetalleDeVentas_Ventas]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Usuarios] FOREIGN KEY([Cod_Cliente_V])
REFERENCES [dbo].[Usuarios] ([IdCliente])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[ReporteDetalleDeVentasRangoDeFechas]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteDetalleDeVentasRangoDeFechas]
@FECHA_INICIO DATETIME,
@FECHA_FINAL DATETIME,
@COD_VENTA int
AS
	SELECT Cod_DetalleVenta_DV AS 'Código detalle', Cod_Venta_DV AS 'Código venta',
	Articulos.Descripcion AS 'Articulo', Cantidad_DV AS 'Cantidad', PrecioUnitario_DV AS 'Precio unitario'
	FROM DetalleDeVentas
	INNER JOIN Ventas ON Ventas.Cod_Venta_V = @COD_VENTA
	INNER JOIN Articulos ON Articulos.CodArticulo = DetalleDeVentas.Cod_Articulo_DV
	WHERE DetalleDeVentas.Cod_Venta_DV = @COD_VENTA
GO
/****** Object:  StoredProcedure [dbo].[ReporteVentasRangoDeFechas]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteVentasRangoDeFechas]
@FECHA_INICIO DATETIME,
@FECHA_FINAL DATETIME
AS
	SELECT DISTINCT Ventas.Cod_Venta_V AS 'Código de venta',Ventas.FechaFactura_V AS 'Fecha', Usuarios.Nombre AS 'Nombre', 
	Usuarios.Apellido AS 'Apellido', Ventas.TotalFactura_V AS 'Total'
	FROM Ventas
	INNER JOIN Usuarios ON Usuarios.IdCliente = Ventas.Cod_Cliente_V
	INNER JOIN DetalleDeVentas ON DetalleDeVentas.Cod_Venta_DV = Ventas.Cod_Venta_V
	--INNER JOIN Articulos ON Articulos.CodArticulo = DetalleDeVentas.Cod_Articulo_DV
	WHERE Ventas.FechaFactura_V BETWEEN @FECHA_INICIO AND @FECHA_FINAL
GO
/****** Object:  StoredProcedure [dbo].[spActualizarArticulo]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarArticulo]
(	
	@CODART INT,
	@NOMART VARCHAR(25),
	@DESC VARCHAR(50),
	@PU DECIMAL (8,2),
	@ESTADO BIT,
	@CODCAT INT,
	@STOCK INT,
	@CODPROV INT
)
AS
UPDATE Articulos
SET
NombreArticulo = @NOMART,
Descripcion = @DESC,
PrecioUnitario= @PU,
Estado = @ESTADO,
CodCategoria = @CODCAT, 
Stock = @STOCK, 
CodProveedor = @CODPROV
WHERE CodArticulo = @CODART
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCarrito]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarCarrito]
(
	@COD_CARRITO INT,
	@CANTIDAD INT
)
AS
	UPDATE Carritos 
	SET Cantidad = @CANTIDAD, SubTotal = Precio * @CANTIDAD
	WHERE CodCarrito = @COD_CARRITO
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCategoria]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarCategoria]
(	
	@CODCAT INT,
	@NOMCAT VARCHAR(50),
	@DESC VARCHAR(100)
)
AS
UPDATE Categorias set
NombreCategoria = @NOMCAT,
Descripcion = @DESC
WHERE CodCategoria = @CODCAT
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spActualizarProveedor]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spActualizarProveedor]
(
	@CODPROV INT,
	@RSOCIAL VARCHAR(25),
	@MARCA VARCHAR(25),
	@DIRECCION VARCHAR(25),
	@CIUDAD VARCHAR(25),
	@PROV VARCHAR(25),
	@CUIT VARCHAR(25),
	@TELEFONO VARCHAR(25),
	@CONTACTO VARCHAR(25),
	@WEB VARCHAR(25),
	@EMAIL VARCHAR(25),
	@CBU VARCHAR(25)
)
AS
	UPDATE Proveedores SET
	RazonSocial_Pr = @RSOCIAL,
	Marca_Pr = @MARCA,
	Direccion_Pr = @DIRECCION,
	Ciudad_Pr = @CIUDAD,
	Provincia_Pr = @PROV,
	Cuit_Pr = @CUIT,
	Telefono_Pr = @TELEFONO,
	Contacto_Pr = @CONTACTO,
	Web_Pr = @WEB,
	Email_Pr = @EMAIL,
	CBU_Pr = @CBU
WHERE Cod_Proveedor_Pr = @CODPROV
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsuario]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarUsuario]
(
	@IDCLIENTE INT,
	@NOMBRE VARCHAR(25),
	@APELLIDO VARCHAR(25),
	@PROVINCIA VARCHAR(25),
	@CELULAR VARCHAR(25),
	@DNI VARCHAR(25),
	@DIRECCION VARCHAR(25),
	@EMAIL VARCHAR(50),
	@CONTRASENA VARCHAR(50),
	@TIPOU BIT
)
AS
UPDATE Usuarios 
SET
Nombre = @NOMBRE,
Apellido = @APELLIDO,
Provincia = @PROVINCIA,
Celular = @CELULAR,
Dni = @DNI,
Direccion = @DIRECCION,
Email = @EMAIL,
Contrasena = @CONTRASENA,
TipoUsuario = @TIPOU
WHERE IdCliente = @IDCLIENTE
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spActualizarVenta]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarVenta]
(
	@CODVENTA INT,
	@CODCLIENTE INT,
	@TOTALFACT DECIMAL,
	@FECHAVTA DATE
)
AS
UPDATE Ventas
SET
TotalFactura_V = @TOTALFACT,
FechaFactura_V = @FECHAVTA
WHERE Cod_Venta_V = @CODVENTA AND Cod_Cliente_V = @CODCLIENTE
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spAgregarArticulo]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarArticulo]
(
	@NOMBREARTICULO varchar(25),
	@DESCRIPCION VARCHAR(25),
	@PRECIOUNITARIO DECIMAL(8,2),
	@ESTADO BIT = true,
	@IDCATEGORIA INT,
	@STOCK INT,
	@CODPROVEEDOR INT
)
AS
	INSERT INTO Articulos(NombreArticulo,Descripcion,PrecioUnitario,Estado,CodCategoria,Stock,CodProveedor)
	VALUES(@NOMBREARTICULO,@DESCRIPCION,@PRECIOUNITARIO,@ESTADO,@IDCATEGORIA,@STOCK,@CODPROVEEDOR)
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCarrito]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarCarrito]
(
	@USUARIO INT,
	@ARTICULO INT,
	@DESCRIPCION VARCHAR(50),
	@PRECIO DECIMAL(10,2),
	@CANTIDAD INT,
	@SUBTOTAL DECIMAL(10,2),
	@COMPRADO BIT
)
AS
	INSERT INTO Carritos (CodUsuario,CodArticulo,Descripcion,Precio,Cantidad,SubTotal,Comprado)
	SELECT @USUARIO,@ARTICULO,@DESCRIPCION,@PRECIO,@CANTIDAD,@SUBTOTAL,@COMPRADO
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCategoria]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAgregarCategoria]
(
	@NOMCAT VARCHAR(50),
	@DESCRIPCION VARCHAR(100)
)
AS

INSERT INTO Categorias(NombreCategoria,Descripcion)
	VALUES(@NOMCAT,@DESCRIPCION)
GO
/****** Object:  StoredProcedure [dbo].[spAgregarDetalleDeVenta]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarDetalleDeVenta]
(
	@CodVenta INT,
	@CodArticulo INT,
	@Cantidad INT,
	@PU DECIMAL(10,2)
)
AS
	INSERT INTO DetalleDeVentas(Cod_Venta_DV,Cod_Articulo_DV,Cantidad_DV,PrecioUnitario_DV)
	SELECT @CodVenta,@CodArticulo,@Cantidad,@PU
GO
/****** Object:  StoredProcedure [dbo].[spAgregarProveedor]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarProveedor]
@RazonSocial varchar(25),
@Marca varchar(25),
@Direccion varchar(25),
@Ciudad varchar(25),
@Provincia varchar(25),
@Cuit varchar(25),
@Telefono varchar(25),
@Contacto varchar(25),
@Web varchar(25),
@Email varchar(25),
@Cbu varchar(25)
AS
	INSERT INTO Proveedores(RazonSocial_Pr,Marca_Pr,Direccion_Pr,Ciudad_Pr,Provincia_Pr,Cuit_Pr,Telefono_Pr,Contacto_Pr,Web_Pr,Email_Pr,CBU_Pr)
	VALUES (@RazonSocial, @Marca, @Direccion,@Ciudad,@Provincia,@Cuit,@Telefono,@Contacto,@Web,@Email,@Cbu)
GO
/****** Object:  StoredProcedure [dbo].[spAgregarUsuario]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarUsuario]
(
	@NOMBRE VARCHAR (25),
	@APELLIDO VARCHAR (25),
	@PROVINCIA VARCHAR (25),
	@CELULAR VARCHAR (25),
	@DNI VARCHAR (25),
	@DIRECCION VARCHAR (25),
	@EMAIL VARCHAR (50),
	@CONTRASENA VARCHAR (50),
	@TIPOUSUARIO BIT
)
AS
INSERT INTO Usuarios (Nombre,Apellido,Provincia,Celular,Dni,Direccion,Email,Contrasena,TipoUsuario)
 VALUES (@NOMBRE,@APELLIDO,@PROVINCIA,@CELULAR,@DNI,@DIRECCION,@EMAIL,@CONTRASENA,@TIPOUSUARIO)
GO
/****** Object:  StoredProcedure [dbo].[spAgregarVenta]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarVenta]
(
	@CodCliente int,
	@TotalFactura decimal(8,2),
	@FechaFactura datetime
)
AS
	INSERT INTO Ventas (Cod_Cliente_V, TotalFactura_V, FechaFactura_V)
	VALUES (@CodCliente,@TotalFactura,@FechaFactura)
GO
/****** Object:  StoredProcedure [dbo].[spBuscarArticulo]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarArticulo]
(
	@CODARTICULO INT
)
AS
BEGIN
	SELECT * FROM Articulos WHERE  CodArticulo = @CODARTICULO
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarArticuloConFiltro]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarArticuloConFiltro]
@DescripcionART varchar(50)
AS
BEGIN
	SELECT * FROM Articulos WHERE Estado = '1' AND Descripcion LIKE '%' + @DescripcionART + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarCategoria]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarCategoria]
(
	@NOMBRECATEGORIA NVARCHAR(20)
)
AS
BEGIN
	SELECT * FROM Categorias WHERE NombreCategoria = @NOMBRECATEGORIA
END
GO
/****** Object:  StoredProcedure [dbo].[spDarDeBajaCarrito]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDarDeBajaCarrito]
(
	@CodUsuario INT,
	@CodArt INT
)
AS
	UPDATE Carritos SET Comprado = 1 WHERE CodUsuario = @CodUsuario AND CodArticulo = @CodArt
GO
/****** Object:  StoredProcedure [dbo].[spEliminarArticulo]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarArticulo]
(
	@CODCARTICULO INT
)
AS
BEGIN
	delete from Articulos where CodArticulo = @CODCARTICULO
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCarrito]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarCarrito]
(
	@COD_CARRITO int
)
AS
	DELETE FROM Carritos WHERE CodCarrito = @COD_CARRITO
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCategoria]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarCategoria]
(
	@CODCATEGORIA INT
)
AS
BEGIN
	DELETE FROM Categorias WHERE CodCategoria = @CODCATEGORIA
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarProveedor]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEliminarProveedor]
(
	@CodProveedor int
)
AS
	DELETE FROM Proveedores where Cod_Proveedor_Pr = @CodProveedor
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEliminarUsuario]
(
	@IdCliente int
)
AS
	DELETE FROM Usuarios where IdCliente = @IdCliente
GO
/****** Object:  StoredProcedure [dbo].[spEliminarVenta]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarVenta]
(
	@CodVenta int
)
AS
	DELETE FROM Ventas where Cod_Venta_V = @CodVenta
GO
/****** Object:  Trigger [dbo].[TR_PedidoStockAgregar]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TR_PedidoStockAgregar]
ON [dbo].[Articulos]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @STOCK INT, @CodArt INT
	SELECT @CodArt = CodArticulo FROM Articulos WHERE CodArticulo = (SELECT CodArticulo FROM inserted)
	SELECT @STOCK = Stock FROM Articulos WHERE CodArticulo = @CodArt
	IF @STOCK < 100
	UPDATE Articulos SET Stock = Stock + 100
	WHERE CodArticulo = @CodArt
END
GO
ALTER TABLE [dbo].[Articulos] ENABLE TRIGGER [TR_PedidoStockAgregar]
GO
/****** Object:  Trigger [dbo].[TR_ActualizarStock]    Script Date: 3/12/2021 17:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_ActualizarStock]
ON [dbo].[DetalleDeVentas]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Articulos SET Stock = Stock - (SELECT Cantidad_DV FROM INSERTED)
	WHERE CodArticulo = (SELECT Cod_Articulo_DV FROM INSERTED)
END
GO
ALTER TABLE [dbo].[DetalleDeVentas] ENABLE TRIGGER [TR_ActualizarStock]
GO
USE [master]
GO
ALTER DATABASE [ProyectoProg3] SET  READ_WRITE 
GO
