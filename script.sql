USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 5/24/2021 11:05:52 AM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookStore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 5/24/2021 11:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[discountID] [varchar](10) NOT NULL,
	[discountDescription] [varchar](50) NULL,
	[percentDiscount] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblDiscount] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 5/24/2021 11:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [nchar](10) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 5/24/2021 11:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nchar](30) NOT NULL,
	[discountID] [varchar](10) NULL,
	[date] [date] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 5/24/2021 11:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nchar](10) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productImg] [varchar](max) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryID] [nchar](10) NOT NULL,
	[description] [nvarchar](200) NULL,
	[author] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 5/24/2021 11:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 5/24/2021 11:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tlbCategories]    Script Date: 5/24/2021 11:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tlbCategories](
	[categoryID] [nchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tlbCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'FALL', N'discount 40', 0.40000000596046448, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'OUT', N'giam gia 50 phan tram', 0.5, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SPRING', N'giam gia 15 phan tram', 0.15, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SUM', N'giam gia 20 phan tram', 0.2, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SUMM', N'giam gia 50', 0.5, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'VND', N'giam gia 50', 0.5, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1, 1, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (2, 2, N'P01       ', 180, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (3, 2, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (4, 2, N'P02       ', 222, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (5, 2, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (6, 2, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (7, 3, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (8, 3, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (9, 4, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (10, 4, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (11, 5, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (12, 5, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (13, 6, N'P03       ', 300, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (14, 6, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (15, 6, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (16, 7, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (17, 7, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (18, 7, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (19, 8, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (20, 9, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (21, 9, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (22, 9, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (23, 10, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (24, 13, N'P04       ', 400, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (1, N'khoa1                         ', NULL, CAST(N'2021-05-16' AS Date), 222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (2, N'khoa1                         ', NULL, CAST(N'2021-05-16' AS Date), 1824)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (3, N'khoa1                         ', NULL, CAST(N'2021-05-21' AS Date), 104.40000152587891)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (4, N'khoa1                         ', NULL, CAST(N'2021-05-21' AS Date), 522)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (5, N'khoa2                         ', N'SUM', CAST(N'2021-05-21' AS Date), 124.40000152587891)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (6, N'khoa1                         ', NULL, CAST(N'2021-05-23' AS Date), 1222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (7, N'khoa3                         ', NULL, CAST(N'2021-05-23' AS Date), 922)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (8, N'khoa3                         ', NULL, CAST(N'2021-05-23' AS Date), 300)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (9, N'khoa4                         ', N'SUM', CAST(N'2021-05-24' AS Date), 737.5999755859375)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (10, N'khoa1                         ', NULL, CAST(N'2021-05-24' AS Date), 222)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (13, N'khoa4                         ', N'OUT', CAST(N'2021-05-24' AS Date), 200)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P01       ', N'Không Gia Đình', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_223588.jpg', 180, 0, N'C01       ', N'Cuốn sách dành cho những bạn trẻ chênh vênh và đầy hoang mang nhưng không ngừng theo đuổi sự nỗ lực', N'Bạch Tô')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P02       ', N'Tiếng Gọi Hoang Dã', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_223386.jpg', 222, 0, N'C01       ', N'Cơ Thể Tuổi Dậy Thì Một phút trước bạn vẫn còn là chú vịt con “xấu xí”, đến phút thứ hai thì đã biến thành nàng thiên nga xinh đẹp', N'Sonya Renee Taylor')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P03       ', N'Cánh Buồn Đỏ Thắm', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_223385.jpg', 300, 0, N'C01       ', N'Thì thầm chuyện nhỏ chuyện to là cuốn sách tập hợp những bài viết và những lời “tâm sự mỏng” từ những năm tháng tác giả ', N'Nguyễn Lan Hải')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P04       ', N'Tây Du Ký', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_221561.jpg', 400, 24, N'C02       ', N'Quan tâm đến một chế độ ăn uống lành mạnh, đầy đủ dưỡng chất cho cơ thể', N'Dragana Vilinac')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P05       ', N'Búp Bê', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/8/9/8935212346740.jpg', 500, 39, N'C02       ', N'Từ Vựng Tiếng Nhật Qua Hội Thoại Giao Tiếp Bạn yêu thích văn hóa Nhật Bản', N'Saiwai Hoàng Quỳnh')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P06       ', N'Thần Thoại Hy Lạp', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_175281.jpg', 600, 50, N'C02       ', N' Tiếng Anh là ngôn ngữ toàn cầu và đã gần như phổ biến với mọi người', N'Mẹ Tưởng')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P07       ', N'ENGLISH BUSINESS', N'https://newshop.vn/public/uploads/products/40631/sach-song-sot-noi-cong-so-english-business-conversation-noi-sao-cho-ngau_L.jpg', 700, 70, N'C03       ', N'Step by step guidance to achieving the IELTS score you need Build up to IELTS is a compact IELTS course designed for students who want to achieve a score of 5.5-6.0 in the Academic IELTS test.', N'Lewis Richards')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P08       ', N'Chữ Hán', N'https://newshop.vn/public/uploads/products/40572/sach-tu-hoc-chu-han_L.jpg', 800, 80, N'C03       ', N'Giáo sư, Tiến sĩ Mai Ngọc Chừ là nhà ngôn ngữ học. Ông dạy tiếng Việt và Ngôn ngữ học tại Đại học Tổng hợp Hà Nội từ năm 1974', N'Giáo Sư')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P09       ', N'Thành Ngữ Anh Việt', N'https://newshop.vn/public/uploads/products/39784/sach-chuyen-ke-thanh-ngu-anh-viet_L.jpg', 900, 90, N'C03       ', N'Đừng Sợ Lỡ Cuộc Chơi Cứ năm phút, bạn lại kiểm tra Facebook để chắc chắn rằng mình không bỏ lỡ một sự kiện nào đó hay một thái độ, comment của ai đó trên dòng trạng thái của bạn', N'PATRICK J. McGINNIS')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P10       ', N'Sống Ảo Đi Thật', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_232601.jpg', 1000, 100, N'C03       ', N'Sống Ảo Đi Thật Mở đầu cuốn sách tác giả nêu ra một vấn đề, đó là con người trong xã hội hiện đại trở nên phụ thuộc vào chiếc smartphone', N'Ngọc Lâm Phan Lâm')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P11       ', N'SaiKi', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/s/a/saiki-ke-sieu-nang-khon-kho---tap-8.jpg', 100, 10, N'C03       ', N'Ngã Ở Đâu Đứng Lên Ở Đó “Một ngày thường bắt đầu bằng ánh bình minh, một năm thường bắt đầu bằng mùa xuân ấm áp và một đời người thường bắt đầu bằng những lần tự đứng lên sau vấp ngã.”', N'Trang Peace')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P12       ', N'Một Vòng Thời Gian', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/h/o/horimiya-3---bia-1.jpg', 200, 20, N'C03       ', N'Một Vòng Thời Gian “Một vòng thời gian” là cuốn sách được tác giả Thiện Nhân ấp ủ từ từ khi còn ở độ tuổi đôi mươi', N'Thiện Nhân')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P13       ', N'Hành Trang Lập Trình', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/d/o/doi-quan-nhi-nho---tap-23.jpg', 300, 30, N'C04       ', N'Phần này trình bày những suy nghĩ và kĩ năng mềm cần thiết để bạn có thể hòa nhập và tiến xa được trong lĩnh vực công nghệ phần mềm', N'Vũ Công Tấn Tài')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P14       ', N'Tự Động Hóa ', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/n/x/nxbtre_full_18282021_042854.jpg', 400, 40, N'C04       ', N'Tự Động Hóa PLC S7-1200 Với Tia Portal Trong lần tái bản mới này, tác giả dành nhiều thời gian chỉnh sửa lỗi chính tả, một số sai sót khác và bổ sung thêm nội dung', N'Trần Văn Hiếu')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P15       ', N'Lanh Quy', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/n/x/nxbtre_full_18262021_042619.jpg', 500, 50, N'C04       ', N'Grammar Gateway Intermediate là sách ngữ pháp Tiếng Anh trung cấp giúp người học có thể nâng cao trình độ của mình thông qua các bài tập ngữ pháp chuyên sâu', N'Đăng Khoa')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P16       ', N'Kimetsu', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/b/l/bleach-49_the-lost-agent.jpg', 600, 60, N'C04       ', N'Lập Trình Viên - Phù Thủy Thế Giới Mạng "...Khi viết mã, thích nhất là ta có thể nắm thế kiểm soát', N'Jane (J.M) Bedell')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P44       ', N'ReactJS', N'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_184063.jpg', 200, 0, N'C01       ', N'reactjs', N'Binz')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'GU', N'guest')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa                          ', N'khoa', N'123/456', N'1234567890', N'AD', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa1                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa2                         ', N'khoa', N'123/456', N'1231232312', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa3                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'khoa4                         ', N'khoa', N'123/456', N'1234567890', N'GU', N'1')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C01       ', N'Văn Học')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C02       ', N'Truyện Tranh')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C03       ', N'Ngoại Ngữ')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C04       ', N'Tin Học')
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblDiscount] FOREIGN KEY([discountID])
REFERENCES [dbo].[tblDiscount] ([discountID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblDiscount]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tlbCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tlbCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tlbCategories]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
