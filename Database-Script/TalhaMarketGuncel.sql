USE [master]
GO
/****** Object:  Database [TalhaMarket]    Script Date: 18.12.2021 16:12:40 ******/
CREATE DATABASE [TalhaMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TalhaMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TalhaMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TalhaMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TalhaMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TalhaMarket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TalhaMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TalhaMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TalhaMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TalhaMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TalhaMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TalhaMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TalhaMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TalhaMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TalhaMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TalhaMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TalhaMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TalhaMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TalhaMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TalhaMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TalhaMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TalhaMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TalhaMarket] SET RECOVERY FULL 
GO
ALTER DATABASE [TalhaMarket] SET  MULTI_USER 
GO
ALTER DATABASE [TalhaMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TalhaMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TalhaMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TalhaMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TalhaMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TalhaMarket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TalhaMarket', N'ON'
GO
ALTER DATABASE [TalhaMarket] SET QUERY_STORE = OFF
GO
USE [TalhaMarket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF;
GO
USE [TalhaMarket]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18.12.2021 16:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[displayName] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertedUser] [int] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updatedUser] [int] NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.12.2021 16:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[displayName] [varchar](50) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertedUser] [int] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updatedUser] [int] NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18.12.2021 16:12:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surName] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (1, N'Elektronik', N'Elektronik Aletler', 1, 0, 1, CAST(N'2021-12-14T16:41:51.533' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (2, N'Temizlik', N'Temizlik Ürünleri', 1, 0, 1, CAST(N'2021-12-15T16:04:45.597' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (3, N'Bilgisayar', N'Bilgisayar ve Donanım', 1, 0, 1, CAST(N'2021-12-15T16:05:46.600' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (4, N'Ev Aletleri', N'Ev ve Mutfak Aletleri', 0, 0, 1, CAST(N'2021-12-15T16:06:03.363' AS DateTime), 1, CAST(N'2021-12-15T16:13:54.957' AS DateTime))
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (5, N'Oyuncak', N'Oyuncaklar', 1, 0, 1, CAST(N'2021-12-15T16:14:11.627' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (6, N'Temizlik', N'Temizlik Malzemeleri', 1, 0, 2, CAST(N'2021-12-18T14:38:00.547' AS DateTime), 2, CAST(N'2021-12-18T14:38:58.770' AS DateTime))
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (7, N'İçecekler', N'Sıcak-Soğuk İçecekler', 1, 0, 2, CAST(N'2021-12-18T15:18:02.223' AS DateTime), 1, CAST(N'2021-12-18T15:19:01.707' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (1, 1, N'Xiaomi', N'Xiaomi Mi10', N'30 mpixel 2 adet arka kamera', CAST(12300.00 AS Decimal(18, 2)), 500, 1, 0, 1, CAST(N'2021-12-14T16:44:44.447' AS DateTime), 1, CAST(N'2021-12-15T16:15:22.300' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (2, 1, N'Iphone', N'Iphone XS Pro Max', N'5.6inch ekrran. 40 mpixel 3 adet arka kamera', CAST(18500.00 AS Decimal(18, 2)), 100, 1, 0, 1, CAST(N'2021-12-14T16:49:27.183' AS DateTime), 1, CAST(N'2021-12-15T16:15:48.650' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (3, 1, N'Samsung', N'Samsung Galaxy Ultra', N'5.6inch ekrran. 40 mpixel 3 adet arka kamera', CAST(19500.00 AS Decimal(18, 2)), 200, 1, 0, 1, CAST(N'2021-12-14T21:11:24.430' AS DateTime), 2, CAST(N'2021-12-14T21:22:09.610' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (4, 1, N'Xiaomi', N'Xiaomi Mi10S', N'Ucuz ve kaliteli', CAST(8000.00 AS Decimal(18, 2)), 500, 1, 0, 2, CAST(N'2021-12-14T21:20:41.663' AS DateTime), 1, CAST(N'2021-12-15T16:16:19.353' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (5, 1, N'Huawei', N'Huawei Lite 9', N'40x zoom', CAST(7600.00 AS Decimal(18, 2)), 750, 1, 0, 1, CAST(N'2021-12-14T22:46:35.490' AS DateTime), 1, CAST(N'2021-12-15T16:16:51.543' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (6, 3, N'Kingston', N'Kingston 8GB Ram', N'2600mhz 8gb sodim ram', CAST(550.00 AS Decimal(18, 2)), 250, 1, 0, 1, CAST(N'2021-12-15T18:37:02.430' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (7, 3, N'Samsung', N'Samsung Monitör', N'24.5 inch', CAST(1800.00 AS Decimal(18, 2)), 60, 1, 0, 1, CAST(N'2021-12-15T18:38:07.643' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (9, 3, N'Monster', N'Monster Abra A5', N'15.6 inch intel core 11. nesil i7 işlemci, 16gb ram', CAST(18000.00 AS Decimal(18, 2)), 50, 1, 0, 1, CAST(N'2021-12-15T19:06:37.807' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (10, 2, N'Cif', N'Cif', N'1600 ml Cif Temizleyici', CAST(35.90 AS Decimal(18, 2)), 800, 0, 0, 1, CAST(N'2021-12-15T19:07:29.830' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (11, 2, N'Selpak', N'Selpak Islak Mendil', N'500 lü Selpak Islak Mendil', CAST(120.00 AS Decimal(18, 2)), 250, 1, 0, 2, CAST(N'2021-12-15T19:09:08.450' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (12, 1, N'Televizyon', N'LG Smart TV', N'55inch 4k Smart LED TV', CAST(9650.00 AS Decimal(18, 2)), 75, 1, 0, 1, CAST(N'2021-12-15T19:10:17.593' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (13, 1, N'Televizyon', N'Samsung LED TV', N'65inch', CAST(12600.00 AS Decimal(18, 2)), 40, 1, 0, 2, CAST(N'2021-12-15T19:10:55.143' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (14, 5, N'Drone', N'250gr Basit Drone', N'ehliyet gerekmez', CAST(1250.00 AS Decimal(18, 2)), 678, 0, 0, 2, CAST(N'2021-12-15T19:12:44.237' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (15, 5, N'Puzzle', N'1000 Parça Yapboz ', N'İstanbul manzaları Orta seviye 1000 parçalı yapboz', CAST(200.00 AS Decimal(18, 2)), 40, 0, 0, 1, CAST(N'2021-12-15T19:17:54.590' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (17, 1, N'Samsung', N'Samsung Galaxy A5 2017 Telefon', N'Samsung Galaxy A5 2017 Akıllı Telefon 3GB Ram 16mpixel arka kamera', CAST(1650.00 AS Decimal(18, 2)), 150, 1, 0, 1, CAST(N'2021-12-15T19:19:01.973' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (18, 4, N'Bosch', N'Buzdolabı', N'Bosch marka buzdolabı', CAST(5400.00 AS Decimal(18, 2)), 400, 1, 0, 2, CAST(N'2021-12-15T19:20:07.087' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (19, 4, N'Bosch', N'Fırın', N'Bosch Fırın 10 yıl garantili', CAST(7000.00 AS Decimal(18, 2)), 216, 0, 0, 2, CAST(N'2021-12-15T19:20:42.300' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (20, 4, N'Arçelik', N'Çamaşır Makinesi', N'Arçelik çamaşır makinesi 5 yıl garantili beyaz', CAST(5400.00 AS Decimal(18, 2)), 401, 1, 0, 1, CAST(N'2021-12-15T19:21:32.713' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (21, 2, N'Solo', N'Tuvalet Kağıdı', N'Solo tuvalet kağıdı 32li', CAST(160.00 AS Decimal(18, 2)), 12, 1, 0, 2, CAST(N'2021-12-15T19:22:14.253' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (22, 1, N'Samsung', N'Samsung Telefon', N'Samsung galaxy m31 6000mAh 6gb ram', CAST(5921.00 AS Decimal(18, 2)), 456, 1, 0, 1, CAST(N'2021-12-15T19:27:17.803' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (23, 4, N'Tornavida', N'Tornavida', N'Tornavida 8li', CAST(123.00 AS Decimal(18, 2)), 542, 0, 0, 1, CAST(N'2021-12-15T19:28:01.160' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (24, 4, N'Bant', N'16 lı para bandı', N'şeffaf 16 lı para bandı', CAST(59.00 AS Decimal(18, 2)), 493, 0, 0, 2, CAST(N'2021-12-15T19:28:44.557' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (25, 5, N'Oyuncak Araba', N'Hot Wheels Oyuncak Araba', N'8 adet Hot Wheels yeni arabalar', CAST(381.00 AS Decimal(18, 2)), 380, 1, 0, 2, CAST(N'2021-12-15T19:29:29.840' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (27, 5, N'Yugioh Kartları', N'Yugioh Kartları 2. seri', N'500 adet karışık Yu-Gi-Oh! kartları', CAST(421.00 AS Decimal(18, 2)), 281, 1, 0, 1, CAST(N'2021-12-15T19:41:24.990' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (28, 4, N'Vestel', N'Kahve Makinesi', N'2 yıl garantili Vestel Kahve Makinesi. 2 programlı otomatik', CAST(6032.00 AS Decimal(18, 2)), 302, 1, 0, 2, CAST(N'2021-12-15T19:43:34.510' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (29, 1, N'Oppo', N'Oppo Telefon', N'6 yıl garantili', CAST(602.00 AS Decimal(18, 2)), 401, 0, 0, 1, CAST(N'2021-12-16T00:12:45.650' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (30, 1, N'General Mobile', N'General Mobile GM20', N'2 yıl garantili', CAST(5500.00 AS Decimal(18, 2)), 402, 0, 0, 2, CAST(N'2021-12-16T00:14:43.157' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (31, 1, N'General Mobile', N'General Mobile GM30', N'4 yıl garantili', CAST(5600.00 AS Decimal(18, 2)), 5000, 0, 0, 1, CAST(N'2021-12-16T23:30:21.977' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (32, 1, N'Vestel', N'Vestel venüş', N'Yerli Malı', CAST(2000.00 AS Decimal(18, 2)), 17000, 0, 0, 2, CAST(N'2021-12-16T23:31:50.857' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (33, 1, N'Nokia', N'Nokia 3310', N'Tuğla, taş, çelik, efsane', CAST(220.90 AS Decimal(18, 2)), 2100, 1, 0, 1, CAST(N'2021-12-18T14:54:10.110' AS DateTime), 1, CAST(N'2021-12-18T14:55:00.890' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (34, 1, N'Xiaomi', N'Xiaomi Mi9 Lite', N'40mpixel çift arka kamera', CAST(6900.00 AS Decimal(18, 2)), 200, 1, 0, 1, CAST(N'2021-12-18T15:15:18.700' AS DateTime), 2, CAST(N'2021-12-18T15:16:58.780' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (1, N'Talha', N'Ekrem', N'talhaekrem', N'talha.ekrem.99@gmail.com', N'123456789', 1, 0, CAST(N'2021-12-14T16:41:51.533' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (2, N'Elon', N'Musk', N'spaceboy', N'elon@spacex.com', N'spacemylove', 1, 0, CAST(N'2021-12-14T21:19:16.353' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (4, N'Bill', N'Gates', N'richman', N'billgates@microsoft.net', N'microsoftmylove', 1, 0, CAST(N'2021-12-18T14:45:17.060' AS DateTime), CAST(N'2021-12-18T14:46:06.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User] FOREIGN KEY([insertedUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([insertedUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
USE [master]
GO
ALTER DATABASE [TalhaMarket] SET  READ_WRITE 
GO
