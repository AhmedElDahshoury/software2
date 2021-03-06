USE [master]
GO
/****** Object:  Database [CoffeeShopChristou]    Script Date: 05/04/2020 17:29:44 ******/
CREATE DATABASE [CoffeeShopChristou]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeeShopChristou', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CoffeeShopChristou.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoffeeShopChristou_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CoffeeShopChristou_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoffeeShopChristou] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeShopChristou].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeShopChristou] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeShopChristou] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeShopChristou] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoffeeShopChristou] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeShopChristou] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoffeeShopChristou] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeShopChristou] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeShopChristou] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeShopChristou] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeShopChristou] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoffeeShopChristou] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeeShopChristou] SET QUERY_STORE = OFF
GO
USE [CoffeeShopChristou]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 05/04/2020 17:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[id] [numeric](2, 0) IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[middleName] [varchar](20) NULL,
	[lastName] [varchar](20) NOT NULL,
	[phone] [varchar](8) NOT NULL,
	[fax] [varchar](8) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/04/2020 17:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [numeric](3, 0) IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[quantityPerBox] [varchar](10) NOT NULL,
	[vatid] [numeric](3, 0) NOT NULL,
	[price] [numeric](6, 2) NOT NULL,
	[supplierId] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vat]    Script Date: 05/04/2020 17:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vat](
	[id] [numeric](3, 0) IDENTITY(1,1) NOT NULL,
	[vatType] [varchar](20) NOT NULL,
	[vatPercentage] [numeric](3, 2) NOT NULL,
 CONSTRAINT [PK_Vat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 05/04/2020 17:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[supplierId] [numeric](2, 0) NOT NULL,
	[productId] [numeric](3, 0) NOT NULL,
	[vatid] [numeric](3, 0) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 05/04/2020 17:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Suppliers.id, dbo.Suppliers.name, dbo.Suppliers.middleName, dbo.Suppliers.lastName, dbo.Products.name AS Expr1, dbo.Products.quantityPerBox, dbo.Products.price, dbo.Vat.vatPercentage, 
                         dbo.PurchaseOrders.date
FROM            dbo.Products INNER JOIN
                         dbo.PurchaseOrders ON dbo.Products.id = dbo.PurchaseOrders.productId INNER JOIN
                         dbo.Suppliers ON dbo.Products.supplierId = dbo.Suppliers.id AND dbo.Products.supplierId = dbo.Suppliers.id AND dbo.PurchaseOrders.supplierId = dbo.Suppliers.id INNER JOIN
                         dbo.Vat ON dbo.PurchaseOrders.vatid = dbo.Vat.id
WHERE        (dbo.Suppliers.id = 2)
GO
/****** Object:  View [dbo].[Supplier-Products]    Script Date: 05/04/2020 17:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Supplier-Products]
AS
SELECT        dbo.Products.*, dbo.Suppliers.id AS Expr1
FROM            dbo.Suppliers INNER JOIN
                         dbo.Products ON dbo.Suppliers.id = dbo.Products.supplierId AND dbo.Suppliers.id = dbo.Products.supplierId
WHERE        (dbo.Suppliers.id = 1)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [quantityPerBox], [vatid], [price], [supplierId]) VALUES (CAST(1 AS Numeric(3, 0)), N'Vodka', N'6', CAST(1 AS Numeric(3, 0)), CAST(5.65 AS Numeric(6, 2)), CAST(1 AS Numeric(2, 0)))
INSERT [dbo].[Products] ([id], [name], [quantityPerBox], [vatid], [price], [supplierId]) VALUES (CAST(2 AS Numeric(3, 0)), N'Carrots', N'12', CAST(2 AS Numeric(3, 0)), CAST(6.50 AS Numeric(6, 2)), CAST(2 AS Numeric(2, 0)))
INSERT [dbo].[Products] ([id], [name], [quantityPerBox], [vatid], [price], [supplierId]) VALUES (CAST(4 AS Numeric(3, 0)), N'Bananas', N'5', CAST(2 AS Numeric(3, 0)), CAST(1.20 AS Numeric(6, 2)), CAST(3 AS Numeric(2, 0)))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[PurchaseOrders] ON 

INSERT [dbo].[PurchaseOrders] ([id], [supplierId], [productId], [vatid], [date]) VALUES (CAST(1 AS Numeric(5, 0)), CAST(1 AS Numeric(2, 0)), CAST(2 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)), CAST(N'2020-02-15' AS Date))
INSERT [dbo].[PurchaseOrders] ([id], [supplierId], [productId], [vatid], [date]) VALUES (CAST(2 AS Numeric(5, 0)), CAST(2 AS Numeric(2, 0)), CAST(2 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)), CAST(N'2019-09-15' AS Date))
INSERT [dbo].[PurchaseOrders] ([id], [supplierId], [productId], [vatid], [date]) VALUES (CAST(3 AS Numeric(5, 0)), CAST(3 AS Numeric(2, 0)), CAST(4 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)), CAST(N'2020-03-21' AS Date))
SET IDENTITY_INSERT [dbo].[PurchaseOrders] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([id], [name], [middleName], [lastName], [phone], [fax], [address], [email]) VALUES (CAST(1 AS Numeric(2, 0)), N'Ahmed', NULL, N'Georgiou', N'99123456', N'22669988', N'Somewhere', N'ahmedgamal@gmail.com')
INSERT [dbo].[Suppliers] ([id], [name], [middleName], [lastName], [phone], [fax], [address], [email]) VALUES (CAST(2 AS Numeric(2, 0)), N'Kostis', N'From', N'Kazia', N'99662211', N'21446877', N'Latsia', N'latsia@boom93.com')
INSERT [dbo].[Suppliers] ([id], [name], [middleName], [lastName], [phone], [fax], [address], [email]) VALUES (CAST(3 AS Numeric(2, 0)), N'Jessie', N'White', N'Pinkman', N'97885522', N'22114455', N'BlueStaff', N'methl@mine.com')
INSERT [dbo].[Suppliers] ([id], [name], [middleName], [lastName], [phone], [fax], [address], [email]) VALUES (CAST(4 AS Numeric(2, 0)), N'Evagoras', N'Tree', N'Pelekanou', N'12345678', N'87654321', N'pst', N'whit')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Vat] ON 

INSERT [dbo].[Vat] ([id], [vatType], [vatPercentage]) VALUES (CAST(1 AS Numeric(3, 0)), N'Liquids', CAST(0.19 AS Numeric(3, 2)))
INSERT [dbo].[Vat] ([id], [vatType], [vatPercentage]) VALUES (CAST(2 AS Numeric(3, 0)), N'Food', CAST(0.20 AS Numeric(3, 2)))
INSERT [dbo].[Vat] ([id], [vatType], [vatPercentage]) VALUES (CAST(3 AS Numeric(3, 0)), N'Water', CAST(0.05 AS Numeric(3, 2)))
INSERT [dbo].[Vat] ([id], [vatType], [vatPercentage]) VALUES (CAST(4 AS Numeric(3, 0)), N'Drugs', CAST(0.05 AS Numeric(3, 2)))
SET IDENTITY_INSERT [dbo].[Vat] OFF
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers1] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Vat] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Vat]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_PurchaseOrders_Products]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_Suppliers] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_PurchaseOrders_Suppliers]
GO
ALTER TABLE [dbo].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrders_Vat] FOREIGN KEY([vatid])
REFERENCES [dbo].[Vat] ([id])
GO
ALTER TABLE [dbo].[PurchaseOrders] CHECK CONSTRAINT [FK_PurchaseOrders_Vat]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Suppliers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Supplier-Products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Supplier-Products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "PurchaseOrders"
            Begin Extent = 
               Top = 10
               Left = 261
               Bottom = 140
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Suppliers"
            Begin Extent = 
               Top = 0
               Left = 466
               Bottom = 130
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vat"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [CoffeeShopChristou] SET  READ_WRITE 
GO
