USE [master]
GO
/****** Object:  Database [PerfumeShop]    Script Date: 05.11.2022 11:22:34 ******/
CREATE DATABASE [PerfumeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PerfumeShop', FILENAME = N'C:\Users\marat\PerfumeShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PerfumeShop_log', FILENAME = N'C:\Users\marat\PerfumeShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PerfumeShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PerfumeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PerfumeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PerfumeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PerfumeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PerfumeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PerfumeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PerfumeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PerfumeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PerfumeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PerfumeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PerfumeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PerfumeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PerfumeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PerfumeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PerfumeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PerfumeShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PerfumeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PerfumeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PerfumeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PerfumeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PerfumeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PerfumeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PerfumeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PerfumeShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PerfumeShop] SET  MULTI_USER 
GO
ALTER DATABASE [PerfumeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PerfumeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PerfumeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PerfumeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PerfumeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PerfumeShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PerfumeShop] SET QUERY_STORE = OFF
GO
USE [PerfumeShop]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 05.11.2022 11:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [int] NOT NULL,
	[Order_date] [datetime] NOT NULL,
	[Delivery_date] [datetime] NOT NULL,
	[Client_FIO] [nvarchar](100) NULL,
	[Receipt_Code] [int] NOT NULL,
	[Status] [nvarchar](12) NOT NULL,
	[PointOfIssue_id] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersComposition]    Script Date: 05.11.2022 11:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersComposition](
	[Id_composition] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrdersComposition] PRIMARY KEY CLUSTERED 
(
	[Id_composition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointOfIssue]    Script Date: 05.11.2022 11:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointOfIssue](
	[Point_id] [int] IDENTITY(1,1) NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PointOfIssue] PRIMARY KEY CLUSTERED 
(
	[Point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05.11.2022 11:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Vendor_code] [nvarchar](6) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[Cost] [int] NOT NULL,
	[MaxDiscount] [int] NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Provider] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Discount] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05.11.2022 11:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Middlename] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](75) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (1, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'Новиков Матвей Маркович', 201, N'Новый ', 24)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (2, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'', 202, N'Новый ', 25)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (3, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), N'Соловьев Пётр Никитич', 203, N'Новый ', 26)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (4, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), N'', 204, N'Новый ', 27)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (5, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), N'Васильева Софья Глебовна', 205, N'Новый ', 28)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (6, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), N'', 206, N'Новый ', 29)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (7, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), N'', 207, N'Новый ', 30)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (8, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), N'', 208, N'Новый ', 31)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (9, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), N'Львов Роман Павлович', 209, N'Новый ', 32)
INSERT [dbo].[Orders] ([Order_ID], [Order_date], [Delivery_date], [Client_FIO], [Receipt_Code], [Status], [PointOfIssue_id]) VALUES (10, CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'', 210, N'Завершен', 33)
GO
SET IDENTITY_INSERT [dbo].[OrdersComposition] ON 

INSERT [dbo].[OrdersComposition] ([Id_composition], [ProductID], [Count], [OrderID]) VALUES (1, 1, 2, 1)
INSERT [dbo].[OrdersComposition] ([Id_composition], [ProductID], [Count], [OrderID]) VALUES (2, 4, 1, 2)
INSERT [dbo].[OrdersComposition] ([Id_composition], [ProductID], [Count], [OrderID]) VALUES (3, 6, 1, 3)
SET IDENTITY_INSERT [dbo].[OrdersComposition] OFF
GO
SET IDENTITY_INSERT [dbo].[PointOfIssue] ON 

INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (1, N'344288, г. Ангарск, ул. Чехова, 1')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (2, N'614164, г.Ангарск,  ул. Степная, 30')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (3, N'394242, г. Ангарск, ул. Коммунистическая, 43')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (4, N'660540, г. Ангарск, ул. Солнечная, 25')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (5, N'125837, г. Ангарск, ул. Шоссейная, 40')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (6, N'125703, г. Ангарск, ул. Партизанская, 49')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (7, N'625283, г. Ангарск, ул. Победы, 46')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (8, N'614611, г. Ангарск, ул. Молодежная, 50')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (9, N'454311, г.Ангарск, ул. Новая, 19')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (10, N'660007, г.Ангарск, ул. Октябрьская, 19')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (11, N'603036, г. Ангарск, ул. Садовая, 4')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (12, N'450983, г.Ангарск, ул. Комсомольская, 26')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (13, N'394782, г. Ангарск, ул. Чехова, 3')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (14, N'603002, г. Ангарск, ул. Дзержинского, 28')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (15, N'450558, г. Ангарск, ул. Набережная, 30')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (16, N'394060, г.Ангарск, ул. Фрунзе, 43')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (17, N'410661, г. Ангарск, ул. Школьная, 50')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (18, N'625590, г. Ангарск, ул. Коммунистическая, 20')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (19, N'625683, г. Ангарск, ул. 8 Марта')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (20, N'400562, г. Ангарск, ул. Зеленая, 32')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (21, N'614510, г. Ангарск, ул. Маяковского, 47')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (22, N'410542, г. Ангарск, ул. Светлая, 46')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (23, N'620839, г. Ангарск, ул. Цветочная, 8')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (24, N'443890, г. Ангарск, ул. Коммунистическая, 1')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (25, N'603379, г. Ангарск, ул. Спортивная, 46')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (26, N'603721, г. Ангарск, ул. Гоголя, 41')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (27, N'410172, г. Ангарск, ул. Северная, 13')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (28, N'420151, г. Ангарск, ул. Вишневая, 32')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (29, N'125061, г. Ангарск, ул. Подгорная, 8')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (30, N'630370, г. Ангарск, ул. Шоссейная, 24')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (31, N'614753, г. Ангарск, ул. Полевая, 35')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (32, N'426030, г. Ангарск, ул. Маяковского, 44')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (33, N'450375, г. Ангарск ул. Клубная, 44')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (34, N'625560, г. Ангарск, ул. Некрасова, 12')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (35, N'630201, г. Ангарск, ул. Комсомольская, 17')
INSERT [dbo].[PointOfIssue] ([Point_id], [Adress]) VALUES (36, N'190949, г. Ангарск, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PointOfIssue] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (1, N'А112Т4', N'Одеколон', N'шт.', 660, 30, N'Dragon', N'Летуаль', N'Мужской парфюм', 5, 6, N'Одеколон Dragon Parfums Dragon Noir, 100 мл', N'А112Т4.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (2, N'F893T5', N'Туалетная вода', N'шт.', 327, 15, N'Paris Line', N'Рив Гош', N'Женский парфюм', 2, 14, N'Туалетная вода Paris Line Parfums Cosa Nostra Platinum, 100 мл', N'F893T5.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (3, N'G832G6', N'Туалетная вода', N'шт.', 368, 10, N'Paris Line', N'Рив Гош', N'Женский парфюм', 4, 7, N'Туалетная вода Paris Line Parfums Vodka Extreme, 100 мл', N'G832G6.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (4, N'E530Y6', N'Парфюмерная вода', N'шт.', 519, 15, N'Parfums Constantine', N'Летуаль', N'Женский парфюм', 3, 9, N'Парфюмерная вода Parfums Constantine Mademoiselle 5, 50 мл', N'E530Y6.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (5, N'F346G5', N'Туалетная вода', N'шт.', 450, 5, N'Today Parfum', N'Рив Гош', N'Женский парфюм', 3, 18, N'Туалетная вода Today Parfum G-Club Egoist, 100 мл', N'F346G5.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (6, N'J432E4', N'Туалетная вода', N'шт.', 341, 5, N'Paris Line', N'Рив Гош', N'Женский парфюм', 2, 4, N'Туалетная вода Paris Line Parfums Dollar, 100 мл', N'J432E4.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (7, N'D344Y7', N'Парфюмерная вода', N'шт.', 223, 10, N'Today Parfum', N'Летуаль', N'Женский парфюм', 5, 16, N'Парфюмерная вода Today Parfum Prestige №6 Eclat, 17 мл', N'D344Y7.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (8, N'V324R5', N'Парфюмерная вода', N'шт.', 519, 5, N'Parfums Constantine', N'Летуаль', N'Женский парфюм', 3, 5, N'Парфюмерная вода Parfums Constantine Mademoiselle 7, 50 мл', N'V324R5.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (9, N'E245R5', N'Туалетная вода', N'шт.', 1000, 15, N'Dilis Parfum', N'Рив Гош', N'Женский парфюм', 5, 2, N'Туалетная вода Dilis Parfum Mila, 100 мл', N'E245R5.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (10, N'D378D3', N'Туалетная вода', N'шт.', 1500, 10, N'Dilis Parfum', N'Летуаль', N'Женский парфюм', 3, 16, N'Духи Dilis Parfum Classic Collection №18, 30 мл', N'D378D3.jpg')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (11, N'C323R4', N'Парфюмерная вода', N'шт.', 4100, 25, N'TRUSSARDI', N'Летуаль', N'Мужской парфюм', 4, 8, N'Парфюмерная вода TRUSSARDI Donna Trussardi (2011), 50 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (12, N'H732R5', N'Туалетная вода', N'шт.', 500, 15, N'Paris Line', N'Рив Гош', N'Женский парфюм', 5, 7, N'Туалетная вода Paris Line Parfums Cosa Nostra, 100 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (13, N'R464G6', N'Духи', N'шт.', 290, 5, N'Dilis Parfum', N'Летуаль', N'Женский парфюм', 2, 11, N'Духи Dilis Parfum Ночная Фиалка, 9.5 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (14, N'S346H6', N'Туалетная вода', N'шт.', 1000, 10, N'Dilis Parfum', N'Летуаль', N'Мужской парфюм', 4, 12, N'Туалетная вода Dilis Parfum Steelman Zone, 100 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (15, N'K535G6', N'Парфюмерная вода', N'шт.', 1200, 15, N'Yves de Sistelle', N'Рив Гош', N'Женский парфюм', 2, 5, N'Парфюмерная вода Yves de Sistelle Incidence pour Femme, 65 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (16, N'G532R5', N'Парфюмерная вода', N'шт.', 640, 10, N'Parfums Constantine', N'Летуаль', N'Мужской парфюм', 3, 16, N'Парфюмерная вода Parfums Constantine New York Perfume Six, 50 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (17, N'K742T5', N'Туалетная вода', N'шт.', 900, 15, N'Dilis Parfum', N'Летуаль', N'Мужской парфюм', 4, 6, N'Туалетная вода Dilis Parfum Cool&Grey, 100 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (18, N'R563E3', N'Туалетная вода', N'шт.', 418, 5, N'Today Parfum', N'Летуаль', N'Мужской парфюм', 4, 9, N'Туалетная вода Today Parfum G-Club Millioner, 100 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (19, N'E573G6', N'Духи', N'шт.', 1087, 15, N'Dilis Parfum', N'Рив Гош', N'Женский парфюм', 5, 13, N'Духи Dilis Parfum Classic Collection №34, 30 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (20, N'H647R5', N'Туалетная вода', N'шт.', 555, 10, N'Parfums Constantine', N'Рив Гош', N'Женский парфюм', 4, 6, N'Туалетная вода Parfums Constantine Gentleman №3, 100 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (21, N'F344S4', N'Туалетная вода', N'шт.', 546, 5, N'Today Parfum', N'Рив Гош', N'Женский парфюм', 2, 9, N'Туалетная вода Today Parfum Cola Cherry, 50 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (22, N'L533E4', N'Туалетная вода', N'шт.', 3900, 15, N'HUGO BOSS', N'Рив Гош', N'Мужской парфюм', 4, 15, N'Туалетная вода HUGO BOSS Boss Bottled, 50 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (23, N'D526R4', N'Парфюмерная вода', N'шт.', 3600, 10, N'DOLCE & GABBANA', N'Летуаль', N'Женский парфюм', 3, 6, N'Парфюмерная вода DOLCE & GABBANA Dolce&Gabbana pour', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (24, N'S753T5', N'Парфюмерная вода', N'шт.', 5200, 5, N'DOLCE & GABBANA', N'Летуаль', N'Женский парфюм', 4, 3, N'Парфюмерная вода DOLCE & GABBANA Dolce Shine, 75 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (25, N'D634D4', N'Туалетная вода', N'шт.', 367, 15, N'Paris Line', N'Рив Гош', N'Мужской парфюм', 2, 14, N'Туалетная вода Paris Line Parfums Dollar Diamond, 100 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (26, N'V472S3', N'Парфюмерная вода', N'шт.', 2640, 30, N'LACOSTE', N'Рив Гош', N'Мужской парфюм', 4, 7, N'Парфюмерная вода LACOSTE Lacoste pour Femme, 30 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (27, N'A436H7', N'Туалетная вода', N'шт.', 1000, 15, N'Dilis Parfum', N'Летуаль', N'Мужской парфюм', 4, 12, N'Туалетная вода Dilis Parfum Aqua Cool, 100 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (28, N'O875F6', N'Парфюмерная вода', N'шт.', 600, 10, N'Dilis Parfum', N'Рив Гош', N'Мужской парфюм', 2, 5, N'Dilis Parfum Мужской Walker Breeze', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (29, N'E479G6', N'Туалетная вода', N'шт.', 6100, 25, N'HUGO BOSS', N'Рив Гош', N'Мужской парфюм', 5, 3, N'Туалетная вода HUGO BOSS Boss Bottled, 100 мл', N'')
INSERT [dbo].[Product] ([Product_id], [Vendor_code], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Provider], [Category], [Discount], [Quantity], [Description], [Image]) VALUES (30, N'V493E3', N'Туалетная вода', N'шт.', 3200, 10, N'DOLCE & GABBANA', N'Летуаль', N'Женский парфюм', 2, 8, N'Туалетная вода DOLCE & GABBANA 3 L''Imperatrice, 50 мл', N'')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (23, N'Администратор', N'Федоров', N'Глеб', N'Михайлович', N'o@outlook.com', N'2L6KZG')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (24, N'Администратор', N'Семенова', N'Софья', N'Дмитриевна', N'hr6zdl@yandex.ru', N'uzWC67')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (25, N'Администратор', N'Васильев', N'Егор', N'Германович', N'kaft93x@outlook.com', N'8ntwUp')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (26, N'Менеджер', N'Смирнова', N'Ирина', N'Александровна', N'dcu@yandex.ru', N'YOyhfR')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (27, N'Менеджер', N'Петров', N'Андрей', N'Владимирович', N'19dn@outlook.com', N'RSbvHv')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (28, N'Менеджер', N'Егоров', N'Максим', N'Андреевич', N'pa5h@mail.ru', N'rwVDh9')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (29, N'Клиент', N'Никитин', N'Артур', N'Алексеевич', N'281av0@gmail.com', N'LdNyos')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (30, N'Клиент', N'Киселев', N'Максим', N'Сергеевич', N'8edmfh@outlook.com', N'gynQMT')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (31, N'Клиент', N'Борисов', N'Тимур', N'Егорович', N'sfn13i@mail.ru', N'AtnDjr')
INSERT [dbo].[Users] ([User_ID], [Role], [Surname], [Name], [Middlename], [Login], [Password]) VALUES (32, N'Клиент', N'Климов', N'Арсений', N'Тимурович', N'g0orc3x1@outlook.com', N'JlFRCZ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PointOfIssue] FOREIGN KEY([PointOfIssue_id])
REFERENCES [dbo].[PointOfIssue] ([Point_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PointOfIssue]
GO
ALTER TABLE [dbo].[OrdersComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrdersComposition_Orders] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Orders] ([Order_ID])
GO
ALTER TABLE [dbo].[OrdersComposition] CHECK CONSTRAINT [FK_OrdersComposition_Orders]
GO
ALTER TABLE [dbo].[OrdersComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrdersComposition_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[OrdersComposition] CHECK CONSTRAINT [FK_OrdersComposition_Product]
GO
USE [master]
GO
ALTER DATABASE [PerfumeShop] SET  READ_WRITE 
GO
