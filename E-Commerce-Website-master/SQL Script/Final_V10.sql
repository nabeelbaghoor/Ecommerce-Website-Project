/**************************************NOTE******************************************
We extracted this file from our Database.

This file contains all the shema,stored procedures,data to be inserted and the 
required triggers.
*/
USE [master]
GO
/****** Object:  Database [Ecommerce1]    Script Date: 5/29/2020 6:39:00 PM ******/
CREATE DATABASE [Ecommerce1]
 USE [Ecommerce1]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[custID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[custID] ASC,
	[productID] ASC,
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
	[Picture1] [varchar](255) NULL,
	[Picture2] [varchar](250) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[city] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[Age] [int] NULL,
	[Picture] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genMainSlider]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genMainSlider](
	[MainSliderID] [int] IDENTITY(1,1) NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](255) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[BtnText] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genMainSlider] PRIMARY KEY CLUSTERED 
(
	[MainSliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genPromoRight]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genPromoRight](
	[PromoRightID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](500) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genPromoRight] PRIMARY KEY CLUSTERED 
(
	[PromoRightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[orderId] [int] NOT NULL,
	[payment_type] [int] NOT NULL,
	[total_amount] [int] NOT NULL,
	[total_discount] [int] NULL,
	[date] [date] NOT NULL,
	[total_items] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] NOT NULL,
	[custId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[isCompleted] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[DIspatched] [bit] NULL,
	[DispatchedDate] [datetime] NULL,
	[Shipped] [bit] NULL,
	[ShippingDate] [datetime] NULL,
	[Deliver] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[CancelOrder] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[sellerID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[discount] [int] NOT NULL,
	[details] [varchar](50) NULL,
	[price] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
	[ProductAvailable] [bit] NULL,
	[Weight] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[ShortDescription] [varchar](300) NULL,
	[LongDescription] [varchar](2000) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[Picture3] [varchar](500) NULL,
	[Picture4] [varchar](500) NULL,
	[ImageURL] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[productID] [int] NOT NULL,
	[custId] [int] NOT NULL,
	[rating] [float] NOT NULL,
	[comment] [varchar](100) NULL,
	[date] [date] NOT NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[custId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[city] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[Age] [int] NULL,
	[PhotoPath] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Description] [varchar](250) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 2, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 3, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 6, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 7, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 8, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 10, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 12, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 16, 4, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 25, 7, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 26, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 30, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (1, 31, 1, 1)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 2, 2, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 3, 1, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 4, 3, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 5, 1, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 6, 1, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 9, 1, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 13, 1, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 25, 1, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (2, 29, 2, 2)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (3, 3, 3, 3)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (4, 2, 1, 7)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (4, 3, 2, 7)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (8, 2, 7, 11)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (8, 2, 1, 12)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (8, 11, 2, 10)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (8, 25, 1, 12)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (8, 26, 1, 12)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (8, 29, 3, 10)
GO
INSERT [dbo].[Cart] ([custID], [productID], [quantity], [orderId]) VALUES (8, 29, 1, 12)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, N'Men', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, N'Women', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, N'Kids', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, N'Sports', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, N'Phones', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, N'Computing', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, N'Appliances', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, N'Beauty & Perfumes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (9, N'TVs,Audio & Video', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (10, N'Accessories', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [PostalCode], [Country], [State], [Gender], [Age], [Picture]) VALUES (1, N'Zulfiqar', N'Akram', N'IamZulfiqar', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Majeed SRE Dalmain karachi', N'Karachi', N'75300', N'Pakistan', N'Sindh', N'Male', 42, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [PostalCode], [Country], [State], [Gender], [Age], [Picture]) VALUES (2, N'Ali', N'Sultan', N'Ali-Sultan', N'ali123@gmail.com', N'03441234567', N'karachi', NULL, NULL, N'Pakistan', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [PostalCode], [Country], [State], [Gender], [Age], [Picture]) VALUES (3, N'Faraz', N'Ali', N'FarazAli', N'faraz@hotmail.com', N'03441234567', N'karachi', NULL, NULL, N'China', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [PostalCode], [Country], [State], [Gender], [Age], [Picture]) VALUES (4, N'inzi', N'mam', N'inzi', N'inzi@gmail.com', N'+923448127902', N'cpo14-1', NULL, NULL, N'USA', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [PostalCode], [Country], [State], [Gender], [Age], [Picture]) VALUES (5, N'Mosa', N'Khan', N'Mosa', N'mosa123@gmail.com', N'+923448127902', N'Dalmain karachi', NULL, NULL, N'India', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [PostalCode], [Country], [State], [Gender], [Age], [Picture]) VALUES (6, N'Sajjad', N'Akram', N'zulfi', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi', NULL, NULL, N'India', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [PostalCode], [Country], [State], [Gender], [Age], [Picture]) VALUES (7, N'Zulfiqar', N'Akram', N'zulfiqarAkram', N'zulfiqar.akram366@yahoo.com', N'03441234567', N'Dalmain karachi', N'Karachi', N'75300', N'Pakistan', N'sindh', N'Male', 42, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [PostalCode], [Country], [State], [Gender], [Age], [Picture]) VALUES (8, N'Ali', N'Khan', N'AliKhan', N'ali123@gmail.com', N'03441234567', N'karachi', NULL, NULL, N'India', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[genMainSlider] ON 
GO
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (1, N'/Content/img/slider/1.jpg', N'Men slide img', N'Save Up to 75% Off', N'Men Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
GO
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (2, N'/Content/img/slider/2.jpg', N'Wristwatch slide img', N'Save Up to 40% Off', N'Wristwatch Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
GO
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (3, N'/Content/img/slider/3.jpg', N'Women Jeans slide img', N'Save Up to 75% Off', N'Jeans Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
GO
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (4, N'/Content/img/slider/4.jpg', N'Shoes slide img', N'Save Up to 75% Off', N'Exclusive Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
GO
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (5, N'/Content/img/slider/5.jpg', N'Male Female slide img', N'Save Up to 50% Off', N'Best Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
GO
SET IDENTITY_INSERT [dbo].[genMainSlider] OFF
GO
SET IDENTITY_INSERT [dbo].[genPromoRight] ON 
GO
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (0, 1, N'/Content/img/promo-banner-mens.jpg', N'img', N'Exclusive Item', N'For Men', 0)
GO
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (1, 5, N'/Content/img/promo-banner-phones.jpg', N'img', N'Sales off', N'On Phones', 0)
GO
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (2, 3, N'/Content/img/promo-banner-kids.jpg', N'img', N'New Arrivals', N'For Kids', 0)
GO
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (3, 4, N'/Content/img/promo-banner-sports.jpg', N'img', N'25% off', N'On Sports', 0)
GO
SET IDENTITY_INSERT [dbo].[genPromoRight] OFF
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'Ali-Sultan', N'123456', N'Customer')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'AliKhan', N'123456', N'Customer')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'fakhar', N'1234', N'Seller')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'FarazAli', N'123456', N'Customer')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'Hamza123', N'123456', N'Customer')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'IamZulfiqar', N'123456', N'Customer')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'inzi', N'123456', N'Customer')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'kamran', N'1234', N'Seller')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'Mosa', N'123456', N'Customer')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'talha', N'1234', N'Seller')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'zulfi', N'123456', N'Customer')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'Zulfiqar', N'123456', N'Seller')
GO
INSERT [dbo].[Login] ([username], [password], [type]) VALUES (N'zulfiqarAkram', N'123456', N'Customer')
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (1, 1, 450, 0, CAST(N'2020-05-25' AS Date), 1)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (2, 1, 1800, 0, CAST(N'2020-05-25' AS Date), 4)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (3, 1, 1350, 0, CAST(N'2020-05-25' AS Date), 3)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (4, 1, 450, 0, CAST(N'2020-05-25' AS Date), 1)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (5, 1, 450, 0, CAST(N'2020-05-25' AS Date), 1)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (6, 1, 1400, 0, CAST(N'2020-05-25' AS Date), 4)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (7, 1, 700, 0, CAST(N'2020-05-25' AS Date), 1)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (8, 1, 3850, 0, CAST(N'2020-05-25' AS Date), 7)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (9, 1, 700, 0, CAST(N'2020-05-25' AS Date), 1)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (10, 1, 2750, 0, CAST(N'2020-05-25' AS Date), 5)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (11, 3, 4900, 0, CAST(N'2020-05-26' AS Date), 7)
GO
INSERT [dbo].[orderDetails] ([orderId], [payment_type], [total_amount], [total_discount], [date], [total_items]) VALUES (12, 1, 3000, 0, CAST(N'2020-05-29' AS Date), 4)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (1, 1, 1, 1, CAST(N'2016-09-09T20:54:32.980' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (2, 2, 1, 1, CAST(N'2016-09-11T17:57:16.727' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (3, 3, 1, 1, CAST(N'2016-09-11T18:01:33.653' AS DateTime), 1, NULL, 0, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (4, 1, 1, 1, CAST(N'2016-09-11T18:07:10.180' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (5, 2, 1, 1, CAST(N'2016-09-12T11:48:10.897' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (6, 2, 1, 1, CAST(N'2016-09-12T11:49:50.607' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (7, 4, 1, 1, CAST(N'2016-09-12T13:15:02.647' AS DateTime), 1, NULL, 1, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (8, 1, 1, 1, CAST(N'2016-09-16T22:47:37.677' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (9, 1, 1, 1, CAST(N'2016-09-17T15:47:05.120' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (10, 8, 1, 1, CAST(N'2016-09-17T22:33:22.687' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (11, 8, 0, 1, CAST(N'2020-05-26T18:27:33.793' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([ID], [custId], [Status], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [CancelOrder]) VALUES (12, 8, 0, 1, CAST(N'2020-05-29T18:24:03.530' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 
GO
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (1, N'Cash on Delivery', NULL)
GO
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (2, N'Paypal', NULL)
GO
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (3, N'Master Card', NULL)
GO
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (4, N'Easypaisa', NULL)
GO
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (1, N'Polo T-Shirt', 4, 6, 0, NULL, 550, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/man/polo-shirt-2.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (2, N'T-Shirt', 4, 7, 0, NULL, 700, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/man/t-shirt-1.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (3, N'Polo T-Shirt', 4, 9, 0, NULL, 450, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/man/polo-shirt-1.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (4, N'New Polo T-Shirt', 4, 48, 0, NULL, 800, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/man/polo-shirt-4.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (5, N'New T-Shirt', 4, 51, 0, NULL, 700, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/man/polo-shirt-5.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (6, N'Star T-Shirt', 4, 99, 0, NULL, 700, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/man/polo-shirt-6.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (7, N'Polo T-Shirt', 4, 20, 0, NULL, 700, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/man/polo-shirt-2.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (8, N'T-Shirt', 4, 0, 0, NULL, 700, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/man/t-shirt-1.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (9, N'Girl-1', 4, 0, 0, NULL, 550, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/women/girl-1.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (10, N'Girl-2', 4, 8, 0, NULL, 850, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/women/girl-2.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (11, N'Girl-3', 4, 25, 0, NULL, 750, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/women/girl-3.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (12, N'Girl-4', 4, 2, 0, NULL, 550, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/women/girl-4.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (13, N'Girl-5', 4, 8, 0, NULL, 900, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/women/girl-5.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (14, N'Girl-6', 4, 0, 0, NULL, 550, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/women/girl-6.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (15, N'Girl-7', 4, 16, 0, NULL, 550, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/women/girl-7.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (16, N'Girl-8', 4, 18, 0, NULL, 1500, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/women/girl-1.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (17, N'sport-1', 4, 45, 0, NULL, 550, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/sports/sport-1.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (18, N'sport-2', 4, 50, 0, NULL, 850, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/sports/sport-2.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (19, N'sport-3', 4, 33, 0, NULL, 750, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/sports/sport-3.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (20, N'sport-4', 4, 0, 0, NULL, 550, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/sports/sport-4.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (21, N'sport-5', 4, 0, 0, NULL, 900, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/sports/sport-5.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (22, N'sport-6', 4, 0, 0, NULL, 550, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/sports/sport-6.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (23, N'sport-7', 4, 8, 0, NULL, 550, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/sports/sport-7.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (24, N'sport-8', 4, 3, 0, NULL, 1500, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/sports/sport-1.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (25, N'electronic-1', 4, 29, 0, NULL, 550, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/electronics/electronic-1.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (26, N'electronic-2', 4, 28, 0, NULL, 850, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/electronics/electronic-2.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (27, N'electronic-3', 4, 21, 0, NULL, 750, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/electronics/electronic-3.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (28, N'electronic-4', 4, 19, 0, NULL, 550, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/electronics/electronic-4.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (29, N'electronic-5', 4, 8, 0, NULL, 900, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/electronics/electronic-5.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (30, N'electronic-6', 4, 4, 0, NULL, 550, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/electronics/electronic-6.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (31, N'electronic-7', 4, 2, 0, NULL, 550, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/electronics/electronic-7.png')
GO
INSERT [dbo].[Products] ([ID], [name], [sellerID], [quantity], [discount], [details], [price], [CategoryID], [SubCategoryID], [ProductAvailable], [Weight], [Size], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [ImageURL]) VALUES (32, N'electronic-8', 4, 11, 0, NULL, 1500, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/electronics/electronic-1.png')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Review] ([productID], [custId], [rating], [comment], [date], [isDelete]) VALUES (3, 3, 4, N'Good Product.', CAST(N'2016-08-11' AS Date), NULL)
GO
INSERT [dbo].[Review] ([productID], [custId], [rating], [comment], [date], [isDelete]) VALUES (3, 4, 5, N'Nice', CAST(N'2016-08-11' AS Date), NULL)
GO
INSERT [dbo].[Review] ([productID], [custId], [rating], [comment], [date], [isDelete]) VALUES (3, 5, 5, N'Excellent product. thank you', CAST(N'2016-08-11' AS Date), NULL)
GO
INSERT [dbo].[Review] ([productID], [custId], [rating], [comment], [date], [isDelete]) VALUES (3, 6, 2, N'bad', CAST(N'2015-09-23' AS Date), NULL)
GO
INSERT [dbo].[Review] ([productID], [custId], [rating], [comment], [date], [isDelete]) VALUES (3, 7, 4, N'Good Product', CAST(N'2016-09-17' AS Date), NULL)
GO
INSERT [dbo].[Review] ([productID], [custId], [rating], [comment], [date], [isDelete]) VALUES (3, 8, 4, N'Good Product', CAST(N'2016-09-17' AS Date), NULL)
GO
INSERT [dbo].[Review] ([productID], [custId], [rating], [comment], [date], [isDelete]) VALUES (5, 8, 4, N'Nice Product', CAST(N'2016-09-17' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Sellers] ON 
GO
INSERT [dbo].[Sellers] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [CompanyName], [Gender], [Age], [PhotoPath]) VALUES (4, N'Zulfiqar', N'Ali', N'Zulfiqar', N'Zulfiqar@gmail.com', N'03441234567', N'Orangi town', N'karachi', N'Pavlova Ltd', N'Male', 24, NULL)
GO
INSERT [dbo].[Sellers] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [CompanyName], [Gender], [Age], [PhotoPath]) VALUES (14, N'kamran', N'abbas', N'kamran', N'nabeelbaghoor@gmail.com', N'3074314019', N'H/n#14,2nd floor,Madni street ,shahjamal colony,', N'Lahore', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sellers] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [CompanyName], [Gender], [Age], [PhotoPath]) VALUES (15, N'talha', N'shabirr', N'talha', N'Nabeelbaghoor@gmail.com', N'3074314019', N'H/n#14,2nd floor,Madni street ,shahjamal colony,', N'Lahore', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sellers] ([ID], [Fname], [Lname], [username], [email], [phone], [address], [city], [CompanyName], [Gender], [Age], [PhotoPath]) VALUES (16, N'Fakhar', N'Abbas', N'fakhar', N'fakhar@gmail.com', N'3074314019', N'H/n#14,2nd floor,Madni street ,shahjamal colony,', N'', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sellers] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, 1, N'T-Shirts            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, 1, N'Shirts              ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, 1, N'Polo Shirts         ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, 1, N'Jeans               ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, 1, N'Kurtas              ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, 1, N'Shalwar Kameez      ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, 1, N'Casual Shoes        ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, 1, N'Formal Shoes        ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (9, 1, N'Boots               ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (10, 1, N'Hoodies             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (11, 1, N'Sweaters            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (12, 1, N'Watches             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (13, 1, N'Wallets             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (14, 1, N'Ties                ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (15, 1, N'Cufflinks           ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (16, 1, N'Sunglasses          ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (17, 2, N'Kurtas              ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (18, 2, N'Shalwar Kameez      ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (19, 2, N'Fabric              ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (20, 2, N'Tops                ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (21, 2, N'Pants               ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (22, 2, N'Innerwear           ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (23, 2, N'Flats & Sandals     ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (24, 2, N'Heels               ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (25, 2, N'Jewellery           ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (26, 2, N'Watches             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (27, 2, N'Bags                ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (28, 2, N'Sunglasses          ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (29, 3, N'Baby Care           ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (30, 3, N'Baby Feeding        ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (31, 3, N'Baby Bottles        ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (32, 3, N'Educational Toys    ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (33, 3, N'Remote Control Cars ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (34, 3, N'All Toys            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (35, 4, N'Men Wear            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (36, 4, N'Women Wear          ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (37, 4, N'Kids Wear           ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (38, 4, N'Fitness equipments  ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (39, 4, N'Fitness Nutrition   ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (40, 5, N'All Brands          ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (41, 5, N'IPhone              ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (42, 5, N'Samsung             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (43, 5, N'Nokia               ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (44, 5, N'QMobile             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (45, 5, N'Infinix             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (46, 6, N'Desktop Computer    ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (47, 6, N'Laptop              ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (48, 6, N'Printers            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (49, 6, N'Hard Drives         ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (50, 6, N'USB Drives          ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (51, 6, N'Scanners            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (52, 6, N'Accessories         ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (53, 7, N'Cooling & Heating   ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (54, 7, N'Refrigerators       ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (55, 7, N'Washers             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (56, 7, N'Cooking Appliances  ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (57, 7, N'Blenders            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (58, 7, N'Ironing             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (59, 7, N'Beverage Preparation', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (60, 8, N'Face                ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (61, 8, N'Eyes                ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (62, 8, N'Lips                ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (63, 8, N'Men Perfumes        ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (64, 8, N'Women Perfumes      ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (65, 8, N'Hair Care           ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (66, 9, N'LED & LCD           ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (67, 9, N'DVD Player          ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (68, 9, N'Speakers            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (69, 9, N'Headphones          ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (70, 9, N'MP3 Players         ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (71, 10, N'Wifi                ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (72, 10, N'Furniture           ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (73, 10, N'Lighting            ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (74, 10, N'Cameras             ', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (75, 10, N'Videos Games        ', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 
GO
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (9, 5, 4, NULL)
GO
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (10, 1, 6, NULL)
GO
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (11, 1, 5, NULL)
GO
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (12, 1, 2, NULL)
GO
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (13, 7, 30, NULL)
GO
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (1004, 8, 6, NULL)
GO
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (1005, 8, 2, NULL)
GO
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (1006, 8, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Login__F3DBC572FF48381B]    Script Date: 5/29/2020 6:39:01 PM ******/
ALTER TABLE [dbo].[Login] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_DIspatched]  DEFAULT ((0)) FOR [DIspatched]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_Shipped]  DEFAULT ((0)) FOR [Shipped]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_Deliver]  DEFAULT ((0)) FOR [Deliver]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_CancelOrder]  DEFAULT ((0)) FOR [CancelOrder]
GO
ALTER TABLE [dbo].[Wishlist] ADD  CONSTRAINT [DF_Wishlist_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([custID])
REFERENCES [dbo].[Customer] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Orders]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Login] FOREIGN KEY([username])
REFERENCES [dbo].[Login] ([username])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Login]
GO
ALTER TABLE [dbo].[genPromoRight]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([payment_type])
REFERENCES [dbo].[PaymentType] ([PayTypeID])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD  CONSTRAINT [FK_orderDetails_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderDetails] CHECK CONSTRAINT [FK_orderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([custId])
REFERENCES [dbo].[Customer] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sellers] FOREIGN KEY([sellerID])
REFERENCES [dbo].[Sellers] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sellers]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customer] FOREIGN KEY([custId])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customer]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Products]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Login] FOREIGN KEY([username])
REFERENCES [dbo].[Login] ([username])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Login]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK__Wishlist__Produc__534D60F1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK__Wishlist__Produc__534D60F1]
GO
/****** Object:  StoredProcedure [dbo].[add_review]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[add_review]
	@productID int,
	@custId int,
	@rating float,
	@comment varchar(100)
	--@date date 
	--we will set it as current date
	as
	begin
		Insert into Review(productID,custId,rating,comment,date)
		values (@productID,@custId,@rating,@comment,GETDATE())
	end
--------------------------
GO
/****** Object:  StoredProcedure [dbo].[add_to_cart]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--it will add single product to cart
create procedure [dbo].[add_to_cart]
	@custID int,
	@productID int,
	@quantity int,
	@orderID int
	as
	begin
		Insert into Cart
		values (@custID,@productID,@quantity,@orderId)
end
GO
/****** Object:  StoredProcedure [dbo].[check_login]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[check_login]
	@username varchar(10),
	@password varchar(20),
	@flag int output
	as
	begin
		--both of following ifs will work...
			--if exists(select * from [login] where username = @username and password = @password)
		if (@username in  (select username from login)) and (@password in (select password from login))
			begin
				set @flag = 1
				print 'Login Exists'
			end
		else
			begin
				set @flag = 0
				print 'Login does not Exists'
			end
			return @flag
	end
GO
/****** Object:  StoredProcedure [dbo].[get_Average_rating]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Average_rating]
	@productId int
	as
	begin
		select Products.name,avg(rating) as Average_Rating from
		(select * from review where review.productID = @productId) as temp
		join Products on Products.ID = @productId
		group by Products.ID,Products.name
	end
-----------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[get_invoice]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--to get invoice
create procedure [dbo].[get_invoice]		
@custID int,
@total_amount int output,
@total_discount int output,
@total_items int output
	as
	begin
		select ProductId,name,quantity,price,Discounted_Price from
		(select productID,name,price,discount,r.quantity,(r.quantity*(price-discount))as Discounted_Price
		from ((select distinct productID,quantity from Cart
		where cart.custID = @custID) as r
		join products 
		on products.id = r.productID)) as temp 
		join Orders on orders.custID = @custID

		set @total_amount=(select orderDetails.total_amount from 
		(select * 
		from Orders 
		where custId=@custID)x join orderDetails on x.ID=orderDetails.orderId) 

		
		set @total_discount=(select orderDetails.total_discount from 
		(select * 
		from Orders 
		where custId=@custID)x join orderDetails on x.ID=orderDetails.orderId) 

		
		set @total_items=(select orderDetails.total_items from 
		(select * 
		from Orders 
		where custId=@custID)x join orderDetails on x.ID=orderDetails.orderId) 

	end

-----------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[get_product]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_product]
	@productId int
	as
	begin
		select * from Products where Products.ID = 	@productId
	end
------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[get_TopRated_Products]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--it is used to display top rated products on Home screen
--gives all info of top rated products
create procedure [dbo].[get_TopRated_Products]
	@noOfProducts int
	as
	begin
		select * from 
		(select top (@noOfProducts) Review.productID,Review.rating from Review
		order by rating desc)x--mb
		join Products on x.productID=Products.ID
	end
-----------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[give_search_suggestions]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--updated
create procedure [dbo].[give_search_suggestions]
	@word varchar(50)
	as
	begin
		select top 3 name from Products
		where name like '%'+@word+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[place_order]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--it will add a new order
create procedure [dbo].[place_order]
	--@custId int,
	@orderId int,
	@payment_type int
	as
	begin
		--declare @OrderId int
		--we will calculate them...
		declare @total_amount int
		declare @total_discount int
		declare @total_items int
		
		--calculate @total_amount
		set @total_amount=( select sum(Total) from
		(select productID,price,r.quantity,(r.quantity*price)as Total 
		from ((select distinct productID,quantity from Cart
		where cart.orderId = @orderId ) as r
		join products 
		on products.ID = r.productID))as temp)

		--calculate @total_discount
		set @total_discount=( select sum(Total) from
		(select productID,name,discount,r.quantity,(r.quantity*discount)as Total 
		from ((select productID,quantity from Cart--mb it should not be distinct
		where cart.orderId = @orderId) as r
		join products 
		on products.ID = r.productID))as temp)

		--calculate @total_items
		set @total_items=(select sum(x.quantity) from
		(select productID,quantity from Cart
		where cart.orderId = @orderId)x)

		--insert into orderDetails
		Insert orderDetails(orderId,payment_type,total_amount,total_discount,date,total_items)
		values (@OrderId,@payment_type,@total_amount,@total_discount,GETDATE(),@total_items)
	end
GO
/****** Object:  StoredProcedure [dbo].[post_product]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--updated
create procedure [dbo].[post_product]
	@name varchar(50),
	@sellerID int,
	@quantity int,
	@discount int,
	@details varchar(50),
	@price int,
	@categoryID int,
	@subCategoryID int null,
	@ProductAvailable bit null,
	@Weight varchar(50) NULL,
	@Size varchar(50) NULL,
	@ShortDescription varchar(300) NULL,
	@LongDescription varchar(2000) NULL,
	@Picture1 varchar(500) NULL,
	@Picture2 varchar(500) NULL,
	@Picture3 varchar(500) NULL,
	@Picture4 varchar(500) NULL,
	@ImageURL varchar(500) NULL
		
	as
	begin
	--no ID ,as it will auto inrement
	
		insert [dbo].[Products] ([Name], [sellerID],[Quantity],[discount],[details], [price], [CategoryID], [SubCategoryID],[ProductAvailable],[Weight],[Size],[ShortDescription],[LongDescription],[Picture1],[Picture2],[Picture3],[Picture4],[ImageURL])
		values (@name,@sellerID,@quantity,@discount,@details,@price,@categoryID,@subCategoryID,@ProductAvailable,@Weight,@Size,@ShortDescription,@LongDescription,@Picture1,@Picture2,@Picture3,@Picture4,@ImageURL)
	end
GO
/****** Object:  StoredProcedure [dbo].[remove_from_cart]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--updated
--it will remove single product from cart
create procedure [dbo].[remove_from_cart]
	@CustID int,
	@productID int,
	@orderID int
	as
	begin
	--no ID ,as it will auto inrement
		delete from Cart
		where Cart.custID=@CustID and Cart.productID=@productID and Cart.orderId=@orderID
	end
GO
/****** Object:  StoredProcedure [dbo].[search_product]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--updated
create procedure [dbo].[search_product]		--6th
	@key varchar(50)
	as
	begin
		select * from Products
		where Products.name like '%'+@key+'%'
	end
GO
/****** Object:  StoredProcedure [dbo].[sign_up]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sign_up]
@username varchar(10),
@password varchar(20),
@Fname varchar (50),
@Lname varchar (50),
@email varchar(50),
@phone varchar(50),
@address varchar(50),
@city varchar(50) null,
@type varchar(50),
@flag int output

As
Begin
	if exists (select * From Login where Login.username=@username)
	Begin
		set @flag=0		 --username already taken
		return @flag
	return
	End
	--insert data in Login
	Insert into [Login] 
	values(@username,@password,@type)

	--insert data in Seller/Customer
	--generate x
	if @type='Seller'
		begin	
		
		--no ID ,as it will auto inrement
		Insert into Sellers(Fname,Lname,username,email,phone,address,city)
		values (@Fname,@Lname,@username,@email,@phone,@address,@city)
		end
	else if @type ='Customer'
		begin
		
		--no ID ,as it will auto inrement
		Insert into Customer(Fname,Lname,username,email,phone,address,city)
		values (@Fname,@Lname,@username,@email,@phone,@address,@city)
		end
  set @flag=1 --signup successful
  return @flag

End
GO
/****** Object:  StoredProcedure [dbo].[ViewCustomer]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ViewCustomer]
As
Begin
Select * From Customer
End
GO
/****** Object:  StoredProcedure [dbo].[ViewSellers]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ViewSellers]
As
Begin
Select * From Sellers
End
GO
/****** Object:  StoredProcedure [dbo].[whole_review]    Script Date: 5/29/2020 6:39:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[whole_review]		--7th
	@productId int--get productId
	as
	begin
		select Products.name,custId,temp.rating,temp.comment,temp.date
		from
		((select * from review where review.productID=@productId) as temp
		join Products on Products.ID = @productId)
	end
-----------------------------------------------------------------------------------------------------------------------
GO
USE [master]
GO
ALTER DATABASE [Ecommerce1] SET  READ_WRITE 
GO

/**************************SQL Triggers***************************************************/
-----------------------------------------------------------------------------------------------------------------------
GO
Create Trigger update_Product_Quantity
on Cart
For Insert
AS

Begin
declare @ordered_productID int
declare @ordered_quantity int
declare @old_quantity int

Select @ordered_productID=[productID] from Inserted
Select @ordered_quantity=[quantity] from Inserted
select @old_quantity=[quantity] from Products where Products.ID=@ordered_productID

--check validation
if @ordered_quantity > @old_quantity
	Begin
	rollback
	print('Cannot Proceed,Requested Product Quantity is Unavailable!')
	End
else if @ordered_productID = @old_quantity		--set productAvailable = 0
	Begin
	update Products
	set	Products.quantity = Products.quantity - @ordered_quantity,
	Products.ProductAvailable = 0
	where Products.ID=@ordered_productID
	End
else
	Begin 
	update Products
	set Products.quantity = Products.quantity - @ordered_quantity
	where Products.ID=@ordered_productID
	End
End
-----------------------------------------------------------------------------------------------------------------------
GO
Create Trigger help_post_product
on products
For Insert
AS
Begin
declare @name varchar(50)
declare @sellerID int
declare @quantity int
declare @price int
Select @name=name from Inserted
Select @sellerID=sellerID from Inserted
Select @quantity=quantity from Inserted
Select @price=price from Inserted
if @name is NULL or @sellerID is NULL or @quantity is NULL or @price is NULL 
Begin
rollback
print('Cannot insert, Required parameter is null!')
End
End
-----------------------------------------------------------------------------------------------------------------------

