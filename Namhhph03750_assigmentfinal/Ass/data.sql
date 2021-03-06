USE [master]
GO
/****** Object:  Database [Ass_GD2]    Script Date: 8/12/2016 11:37:00 PM ******/
CREATE DATABASE [Ass_GD2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ass_GD2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ass_GD2.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ass_GD2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ass_GD2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ass_GD2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ass_GD2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ass_GD2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ass_GD2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ass_GD2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ass_GD2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ass_GD2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ass_GD2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ass_GD2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Ass_GD2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ass_GD2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ass_GD2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ass_GD2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ass_GD2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ass_GD2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ass_GD2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ass_GD2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ass_GD2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ass_GD2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ass_GD2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ass_GD2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ass_GD2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ass_GD2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ass_GD2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ass_GD2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ass_GD2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ass_GD2] SET  MULTI_USER 
GO
ALTER DATABASE [Ass_GD2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ass_GD2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ass_GD2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ass_GD2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Ass_GD2]
GO
/****** Object:  Table [dbo].[category]    Script Date: 8/12/2016 11:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NULL,
	[parent_id] [int] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[news]    Script Date: 8/12/2016 11:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[images] [nvarchar](100) NULL,
	[content] [nvarchar](4000) NULL,
	[posting_datetime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 8/12/2016 11:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[recipient_name] [nvarchar](100) NULL,
	[recipient_phone] [int] NULL,
	[recipient_add] [nvarchar](200) NULL,
	[sender_name] [nvarchar](100) NULL,
	[bank] [nvarchar](20) NULL,
	[pay_num] [nvarchar](20) NULL,
	[status] [int] NULL,
	[order_price] [int] NULL,
	[notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 8/12/2016 11:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NULL,
	[category_id] [int] NULL,
	[description] [nvarchar](500) NULL,
	[price] [int] NULL,
	[product_img] [nvarchar](100) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_bills]    Script Date: 8/12/2016 11:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_bills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_num] [int] NULL,
 CONSTRAINT [PK_product_bills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_img]    Script Date: 8/12/2016 11:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_img](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[product_img] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_product_img] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 8/12/2016 11:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[passwd] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[phone] [int] NULL,
	[address] [nvarchar](200) NULL,
	[lv] [int] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name], [parent_id]) VALUES (1, N'Điện thoại', 0)
INSERT [dbo].[category] ([category_id], [category_name], [parent_id]) VALUES (2, N'Laptop', 0)
INSERT [dbo].[category] ([category_id], [category_name], [parent_id]) VALUES (3, N'Nokia', 1)
INSERT [dbo].[category] ([category_id], [category_name], [parent_id]) VALUES (4, N'SamSung', 1)
INSERT [dbo].[category] ([category_id], [category_name], [parent_id]) VALUES (5, N'iPhone', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([id], [title], [images], [content], [posting_datetime]) VALUES (1, N'Khuyến mãi tháng 2', N'upload/Chrysanthemum.jpg', N'nội dung vớ vẩn', CAST(0x0000A50700A4CB80 AS DateTime))
INSERT [dbo].[news] ([id], [title], [images], [content], [posting_datetime]) VALUES (2, N'khuyến mãi tiếp', N'upload/Koala.jpg', N'nội dung ca cốc', CAST(0x0000A52400000000 AS DateTime))
INSERT [dbo].[news] ([id], [title], [images], [content], [posting_datetime]) VALUES (4, N'test tin tức ca cốc', N'upload/Tulips.jpg', N'ca cốc Administrator', CAST(0x0000A43C0126A15E AS DateTime))
SET IDENTITY_INSERT [dbo].[news] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [user_id], [recipient_name], [recipient_phone], [recipient_add], [sender_name], [bank], [pay_num], [status], [order_price], [notes]) VALUES (54, 0, N'Tâm Bô', 974095295, N'gần nhà vũ', N'tâm bô', N'Vietcombank', N'123456', 1, 52000000, N'xuống dồng
test nãy giờ ko
được')
INSERT [dbo].[orders] ([order_id], [user_id], [recipient_name], [recipient_phone], [recipient_add], [sender_name], [bank], [pay_num], [status], [order_price], [notes]) VALUES (55, 0, N'Trương Công Tâm', 0, N'CNTT K37 ĐH ĐỒNG NAI', N'Công tâm', N'', N'', 1, 52000000, N'thanh toán tại quầy')
INSERT [dbo].[orders] ([order_id], [user_id], [recipient_name], [recipient_phone], [recipient_add], [sender_name], [bank], [pay_num], [status], [order_price], [notes]) VALUES (56, 0, N'Nguyễn Văn Ca', 956465, N'ktx', N'Nguyễn văn ca', N'132123', N'123132', 1, 12000000, N'ca mua iphone 6')
INSERT [dbo].[orders] ([order_id], [user_id], [recipient_name], [recipient_phone], [recipient_add], [sender_name], [bank], [pay_num], [status], [order_price], [notes]) VALUES (57, 1, N'Tâm Bô', 974095295, N'gần nhà vũ', N'tâm bô', N'Vietcombank', N'123456', 1, 12000001, N'11111111111')
INSERT [dbo].[orders] ([order_id], [user_id], [recipient_name], [recipient_phone], [recipient_add], [sender_name], [bank], [pay_num], [status], [order_price], [notes]) VALUES (58, 1, N'Tâm bô', 123456789, N'bô tâm', N'tâm bô', N'bô tâm', N'123456', 1, 12000000, N'nokia')
INSERT [dbo].[orders] ([order_id], [user_id], [recipient_name], [recipient_phone], [recipient_add], [sender_name], [bank], [pay_num], [status], [order_price], [notes]) VALUES (59, 1, N'Công Tâm', 123456789, N'nhà', N'Đức Tâm', N'Vietcombank', N'123456789', 1, 104000000, N'tặng sinh nhật')
INSERT [dbo].[orders] ([order_id], [user_id], [recipient_name], [recipient_phone], [recipient_add], [sender_name], [bank], [pay_num], [status], [order_price], [notes]) VALUES (60, 10, N'123', 132, N'123', N'123', N'132', N'123', 1, 72000000, N'132')
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (1, N'iPhone 6', 5, N'Sản Phẩm của Apple', 20000000, N'upload/iphone6.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (2, N'Nokia 1202', 3, N'Sản Phẩm Của Nokia', 400000, N'upload/no1202.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (3, N'Nokia 1080', 3, N'Sản Phẩm Của Nokia', 600000, N'upload/no1080.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (4, N'Lumia 530', 3, N'Sản Phẩm Của Nokia', 3000000, N'upload/lu530.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (5, N'iPhone 6 Plus', 5, N'Sản Phẩm của Apple', 22000000, N'upload/iphone6plus.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (6, N'Galaxy Not3', 4, N'Sản Phẩm của SamSung', 10000000, N'upload/galaxynote3.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (7, N'SamSung S3', 4, N'Sản Phẩm của SamSung', 12000000, N'upload/galaxys3.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (60, N'Asus zen 2', 3, N'Asus zenfone', 5500000, N'upload/Lighthouse.jpg', 1)
INSERT [dbo].[product] ([product_id], [product_name], [category_id], [description], [price], [product_img], [user_id]) VALUES (61, N'Asus zen 3', 1, N'Asus Zenfone 3', 7500000, N'upload/Koala.jpg', 1)
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[product_bills] ON 

INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (13, 54, 4, 2)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (14, 54, 7, 2)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (15, 54, 5, 1)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (16, 55, 4, 2)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (17, 55, 7, 2)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (18, 55, 5, 1)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (19, 56, 7, 1)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (20, 57, 7, 1)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (21, 57, 22, 1)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (22, 58, 4, 4)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (23, 59, 7, 5)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (24, 59, 5, 2)
INSERT [dbo].[product_bills] ([id], [order_id], [product_id], [product_num]) VALUES (25, 60, 7, 6)
SET IDENTITY_INSERT [dbo].[product_bills] OFF
SET IDENTITY_INSERT [dbo].[product_img] ON 

INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (1, 1, N'/upload/iphone1.jpg')
INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (2, 1, N'/upload/iphone2.jpg')
INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (3, 1, N'/upload/iphone3.jpg')
INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (4, 1, N'/upload/iphone4.jpg')
INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (5, 1, N'/upload/iphone5.jpg')
INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (6, 2, N'')
INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (7, 2, N'/upload/iphone1.jpg')
INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (8, 2, N'/upload/iphone1.jpg')
INSERT [dbo].[product_img] ([id], [product_id], [product_img]) VALUES (9, 2, N'/upload/iphone1.jpg')
SET IDENTITY_INSERT [dbo].[product_img] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (1, N'vinhgvph03806@fpt.edu.vn', N'1234', N'Vĩnh', 983357291, N'Hoa Bằng', 1)
INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (2, N'Giang@fpt.edu.vn', N'1234', N'giang', 123, N'123', 0)
INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (4, N'dung@fpt.edu.vn', N'1234', N'dung', 123456789, N'gần nhà tâm bô', 0)
INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (5, N'chung@fpt.edu.vn', N'1234', N'chung', 123456, N'khác tâm bô', 0)
INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (6, N'nam@fpt.edu.vn', N'1234', N'nam', 123123, N'123', 0)
INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (7, N'tan@fpt.edu.vn', N'1234', N'tan', 123, N'123', 0)
INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (8, N'duc@fpt.edu.vn', N'1234', N'duc', 1212345488, N'a203', 0)
INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (9, N'thao@fpt.edu.vn', N'1234', N'tiep', 123456, N'bienhoa', 0)
INSERT [dbo].[user] ([user_id], [email], [passwd], [name], [phone], [address], [lv]) VALUES (10, N'tiep6@fpt.edu.vn', N'1234', N'tiep', 123456, N'bienhoa', 0)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_img]  WITH CHECK ADD  CONSTRAINT [FK_product_img_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_img] CHECK CONSTRAINT [FK_product_img_product]
GO
USE [master]
GO
ALTER DATABASE [Ass_GD2] SET  READ_WRITE 
GO
