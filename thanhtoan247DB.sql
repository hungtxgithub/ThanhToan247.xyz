USE [master]
GO
/****** Object:  Database [ThanhToan247]    Script Date: 1/29/2022 11:52:31 AM ******/
CREATE DATABASE [ThanhToan247]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThanhToan247', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ThanhToan247.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ThanhToan247_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ThanhToan247_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ThanhToan247] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThanhToan247].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThanhToan247] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ThanhToan247] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ThanhToan247] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ThanhToan247] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ThanhToan247] SET ARITHABORT OFF 
GO
ALTER DATABASE [ThanhToan247] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ThanhToan247] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ThanhToan247] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ThanhToan247] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ThanhToan247] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ThanhToan247] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ThanhToan247] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ThanhToan247] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ThanhToan247] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ThanhToan247] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ThanhToan247] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ThanhToan247] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ThanhToan247] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ThanhToan247] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ThanhToan247] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ThanhToan247] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ThanhToan247] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ThanhToan247] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ThanhToan247] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ThanhToan247] SET  MULTI_USER 
GO
ALTER DATABASE [ThanhToan247] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ThanhToan247] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ThanhToan247] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ThanhToan247] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ThanhToan247]
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 1/29/2022 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardType](
	[CardTypeID] [int] NOT NULL,
	[cardTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CardTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/29/2022 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/29/2022 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nvarchar](9) NULL,
	[ProductID] [int] NULL,
	[Quantity] [nchar](10) NULL,
	[Time] [nchar](10) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price]    Script Date: 1/29/2022 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NULL,
	[SupplierID] [int] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/29/2022 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SeriCode] [varchar](50) NULL,
	[PinCode] [varchar](50) NULL,
	[PriceID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 1/29/2022 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[supplierName] [nvarchar](50) NULL,
	[CardTypeID] [int] NULL,
	[Image] [nvarchar](550) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 1/29/2022 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Email] [varchar](320) NOT NULL,
	[RemainingMoney] [float] NOT NULL,
	[TotalMoneyLoaded] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Avatar] [varchar](300) NOT NULL,
	[Role] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[TimeCreated] [date] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CardType] ([CardTypeID], [cardTypeName]) VALUES (1, N'GameCard')
INSERT [dbo].[CardType] ([CardTypeID], [cardTypeName]) VALUES (2, N'MobileCard')
SET IDENTITY_INSERT [dbo].[Price] ON 

INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (1, 10000, 1, 1)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (2, 20000, 1, 2)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (3, 30000, 1, 2)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (4, 50000, 1, 3)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (5, 100000, 1, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (6, 200000, 1, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (7, 300000, 1, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (8, 500000, 1, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (9, 1000000, 1, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (10, 10000, 2, 1)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (11, 20000, 2, 2)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (12, 30000, 2, 3)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (13, 50000, 2, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (14, 100000, 2, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (15, 200000, 2, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (16, 300000, 2, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (17, 500000, 2, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (18, 10000, 3, 1)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (19, 20000, 3, 2)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (20, 30000, 3, 3)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (21, 50000, 3, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (22, 100000, 3, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (23, 200000, 3, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (24, 300000, 3, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (25, 500000, 3, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (26, 10000, 4, 1)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (27, 20000, 4, 2)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (28, 50000, 4, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (29, 100000, 4, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (30, 200000, 4, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (31, 500000, 4, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (32, 10000, 5, 1)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (33, 20000, 5, 2)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (34, 30000, 5, 3)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (35, 50000, 5, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (36, 100000, 5, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (37, 200000, 5, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (38, 300000, 5, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (39, 500000, 5, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (40, 10000, 6, 1)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (41, 20000, 6, 2)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (42, 50000, 6, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (43, 100000, 6, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (44, 200000, 6, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (45, 500000, 6, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (46, 1000000, 6, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (52, 2000000, 6, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (53, 5000000, 6, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (54, 50000, 7, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (55, 100000, 7, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (56, 200000, 7, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (57, 500000, 7, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (58, 1000000, 7, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (59, 10000, 8, 1)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (60, 20000, 8, 2)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (61, 50000, 8, 5)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (62, 100000, 8, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (63, 200000, 8, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (64, 500000, 8, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (65, 1000000, 8, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (66, 10000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (67, 20000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (68, 50000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (69, 100000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (70, 200000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (71, 300000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (72, 500000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (73, 1000000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (74, 2000000, 9, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (75, 10000, 10, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (76, 20000, 10, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (77, 50000, 10, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (78, 100000, 10, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (79, 200000, 10, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (80, 500000, 10, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (81, 1000000, 10, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (82, 20000, 11, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (83, 50000, 11, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (84, 100000, 11, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (85, 200000, 11, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (86, 500000, 11, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (87, 10000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (88, 20000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (89, 50000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (90, 100000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (91, 200000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (92, 500000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (93, 1000000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (94, 200000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (95, 600000, 12, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (96, 50000, 13, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (97, 100000, 13, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (98, 200000, 13, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (99, 1000000, 13, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (100, 2000000, 13, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (101, 3000000, 13, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (102, 5000000, 13, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (103, 10000, 14, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (104, 20000, 14, NULL)
GO
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (105, 50000, 14, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (106, 100000, 14, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (107, 200000, 14, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (108, 500000, 14, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (109, 1000000, 14, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (110, 2000000, 14, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (111, 10000, 15, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (112, 20000, 15, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (113, 50000, 15, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (114, 100000, 15, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (115, 200000, 15, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (116, 500000, 15, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (117, 1000000, 15, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (118, 10000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (119, 20000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (120, 50000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (121, 100000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (122, 200000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (123, 500000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (124, 1000000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (125, 2000000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (126, 5000000, 16, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (127, 20000, 17, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (128, 50000, 17, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (129, 60000, 17, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (130, 100000, 17, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (131, 200000, 17, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (132, 300000, 17, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (133, 500000, 17, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (134, 10000, 18, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (135, 20000, 18, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (136, 50000, 18, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (137, 100000, 18, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (138, 200000, 18, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (139, 500000, 18, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (140, 1000000, 18, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (141, 2000000, 18, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (142, 10000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (143, 20000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (144, 30000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (145, 50000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (146, 100000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (147, 200000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (148, 300000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (149, 500000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (150, 1000000, 19, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (151, 10000, 20, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (152, 20000, 20, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (153, 50000, 20, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (154, 100000, 20, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (155, 200000, 20, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (156, 500000, 20, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (157, 20000, 21, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (158, 50000, 21, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (159, 100000, 21, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (160, 200000, 21, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (161, 500000, 21, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (162, 1000000, 21, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (163, 2000000, 21, NULL)
INSERT [dbo].[Price] ([PriceID], [Price], [SupplierID], [Discount]) VALUES (164, 5000000, 21, NULL)
SET IDENTITY_INSERT [dbo].[Price] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (1, N'31482402042', N'456341946353', 1)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (2, N'74929492842', N'365173748562', 2)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (3, N'74929420824', N'264583625475', 3)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (4, N'21939482420', N'374541438495', 4)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (5, N'09492842942', N'275153840384', 5)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (6, N'89042949294', N'736749198366', 6)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (7, N'74628492402', N'276392764625', 7)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (8, N'23929492040', N'172545253749', 8)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (10, N'273846374748', N'484739463726
', 10)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (11, N'927837485623', N'485747463764', 11)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (12, N'283940562415', N'293754738364', 12)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (13, N'293546782918', N'283774836622', 13)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (20, N'374895735263', N'738464736252', 20)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (21, N'374895735263', N'893046573821', 21)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (22, N'784563029362', N'902365879201', 22)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (23, N'846352736251', N'384957389201', 23)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (49, N'36517374', N'1328492056294840', 82)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (50, N'26458362', N'1635663419564782', 82)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (51, N'37454143', N'0982738148592893', 82)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (52, N'27515384', N'4828592053819405', 83)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (53, N'16467848', N'8937174849274724', 84)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (54, N'44458485', N'1428592950259295', 85)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (55, N'52344123', N'7124899204183841', 85)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (56, N'11258864', N'8625183917239301', 86)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (57, N'90236587', N'0624892948940204', 86)
INSERT [dbo].[Product] ([ProductID], [SeriCode], [PinCode], [PriceID]) VALUES (58, N'17254525', N'8728492048402941', 86)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (1, N'VIETTEL', 1, N'https://hqpay.vn/storage/images/wD3OAX53sQ_1625037689.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (2, N'VINAPHONE', 1, N'https://hqpay.vn/storage/images/5oBfqagH5V_1619539822.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (3, N'MOBIFONE', 1, N'https://hqpay.vn/storage/images/iFMbkulr4w_1619540012.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (4, N'GMOBILE', 1, N'https://hqpay.vn/storage/images/EJf2KN04b6_1626426501.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (5, N'VIETNAMOBILE', 1, N'https://hqpay.vn/storage/images/KWPSKsgxdG_1626426621.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (6, N'SOHACOIN', 2, N'https://hqpay.vn/storage/images/uK1M2D5bSv_1619539885.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (7, N'CARROT', 2, N'https://hqpay.vn/storage/images/9UOc6zPMGz_1619539912.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (8, N'ZING', 2, N'https://hqpay.vn/storage/images/sgK6t0HyRw_1619539788.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (9, N'VCOIN', 2, N'https://hqpay.vn/storage/images/HS3qP8bwN9_1625038017.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (10, N'GATE', 2, N'https://hqpay.vn/storage/images/IYno8G2l6t_1625038053.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (11, N'GARENA', 2, N'https://hqpay.vn/storage/images/mepJKk53Xy_1619539541.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (12, N'SCOIN', 2, N'https://hqpay.vn/storage/images/7YPCZMmAde_1619539870.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (13, N'APPOTA', 2, N'https://hqpay.vn/storage/images/m0oI1BgUle_1619539974.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (14, N'FUNCARD', 2, N'https://hqpay.vn/storage/images/vN4hG60byz_1619539768.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (15, N'GOSU', 2, N'https://hqpay.vn/storage/images/xJpX9GoS2j_1625037827.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (16, N'BIT', 2, N'https://hqpay.vn/storage/images/itSNyVmlea_1626426791.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (17, N'ONCASH', 2, N'https://hqpay.vn/storage/images/uz1wCZCiUV_1626426871.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (18, N'KUL', 2, N'https://hqpay.vn/storage/images/cWaSY1lhw2_1626427012.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (19, N'HPCODE', 2, N'https://hqpay.vn/storage/images/CQ32HPZqhv_1626427216.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (20, N'VEGAXU', 2, N'https://hqpay.vn/storage/images/pWayViIYOm_1625037989.png')
INSERT [dbo].[Supplier] ([SupplierID], [supplierName], [CardTypeID], [Image]) VALUES (21, N'ISEC', 2, N'https://hqpay.vn/storage/images/bCcSz3kWJw_1624871623.png')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (37, N'admin', N'admin', N'hungnthe153039@fpt.edu.vn', 10000000, 15000000, 10, N'https://s3.ap-northeast-1.amazonaws.com/h.files/images/1642777165863_idBGvXsiOb.jpg', 1, 1, CAST(N'2022-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (40, N'user', N'user', N'hungnthe153039@fpt.edu.vn', 2500000, 2500000, 3, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 0, 1, CAST(N'2022-01-02' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (41, N'user1', N'123123', N'hung11@gmail.com', 900000, 900000, 1, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 0, 1, CAST(N'2022-01-05' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (42, N'test', N'test123', N'hungnthe150339@fpt.edu.vn', 5500000, 8000000, 5, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 0, 1, CAST(N'2022-01-10' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (45, N'hoangnam', N'Hoangnam1', N'namhdhe152551@fpt.edu.vn', 0, 0, 0, N'http://kenh14cdn.com/thumb_w/660/2019/8/18/img-4243-15660665084761468319593.jpg', 0, 1, CAST(N'2022-01-10' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (46, N'blockdemo', N'12345@', N'okpro@yahoo.com', 0, 0, 0, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 0, 0, CAST(N'2022-01-11' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (47, N'hihi', N'hihi', N'hihi', 0, 0, 0, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 1, 0, CAST(N'2022-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (49, N'hihi1', N'hihi', N'hihi', 0, 0, 0, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 1, 0, CAST(N'2022-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (50, N'testinsertnha', N'test123', N'hungnthe153039@fpt.edu.vn', 0, 0, 0, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 0, 1, CAST(N'2021-01-02' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (51, N'adminok', N'123', N'hungnthe153039@fpt.edu.vn', 0, 0, 0, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 0, 1, CAST(N'2022-01-20' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (52, N'admintest', N'123456', N'hungnthe153039@fpt.edu.vn', 0, 0, 0, N'https://cdn.icon-icons.com/icons2/2438/PNG/512/boy_avatar_icon_148455.png', 0, 1, CAST(N'2022-01-20' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (56, N'test1', N'test2', N'test1', 0, 0, 0, N'test1', 1, 0, CAST(N'2001-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (57, N'test2', N'test1', N'test1', 0, 0, 0, N'test1', 1, 0, CAST(N'2001-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (58, N'test3', N'test1', N'test1', 0, 0, 0, N'test1', 1, 0, CAST(N'2001-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (60, N'test4', N'test1', N'test1', 0, 0, 0, N'test1', 1, 0, CAST(N'2001-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Username], [Password], [Email], [RemainingMoney], [TotalMoneyLoaded], [Discount], [Avatar], [Role], [Status], [TimeCreated]) VALUES (62, N'testest1', N'test132', N'tes23t', 0, 0, 0, N'tes32t', 0, 0, CAST(N'2001-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 1/29/2022 11:52:31 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Price] FOREIGN KEY([PriceID])
REFERENCES [dbo].[Price] ([PriceID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Price]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_CardType] FOREIGN KEY([CardTypeID])
REFERENCES [dbo].[CardType] ([CardTypeID])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_CardType]
GO
USE [master]
GO
ALTER DATABASE [ThanhToan247] SET  READ_WRITE 
GO
