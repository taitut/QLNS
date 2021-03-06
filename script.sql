USE [master]
GO
/****** Object:  Database [lab6]    Script Date: 6/20/2020 11:11:19 AM ******/
CREATE DATABASE [lab6]


GO
ALTER DATABASE [lab6] SET COMPATIBILITY_LEVEL = 120
GO

ALTER DATABASE [lab6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lab6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lab6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lab6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lab6] SET ARITHABORT OFF 
GO
ALTER DATABASE [lab6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lab6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lab6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lab6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lab6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lab6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lab6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lab6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lab6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lab6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lab6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lab6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lab6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lab6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lab6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lab6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lab6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lab6] SET RECOVERY FULL 
GO
ALTER DATABASE [lab6] SET  MULTI_USER 
GO
ALTER DATABASE [lab6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lab6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lab6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lab6] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [lab6] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'lab6', N'ON'
GO
USE [lab6]
GO
/****** Object:  Table [dbo].[deadline]    Script Date: 6/20/2020 11:11:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deadline](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HanChot] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departs]    Script Date: 6/20/2020 11:11:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departs](
	[ID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Records]    Script Date: 6/20/2020 11:11:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Records](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [bit] NULL,
	[Reason] [nvarchar](200) NULL,
	[Ngay] [date] NULL,
	[StaffID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 6/20/2020 11:11:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staffs](
	[ID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Birthday] [date] NULL,
	[Photo] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [varchar](10) NULL,
	[Salary] [money] NULL,
	[Level] [int] NULL,
	[Notes] [nvarchar](500) NULL,
	[DepartID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/20/2020 11:11:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[deadline] ON 

INSERT [dbo].[deadline] ([id], [HanChot]) VALUES (1, N'04/07/2020 21:17:00')
SET IDENTITY_INSERT [dbo].[deadline] OFF
INSERT [dbo].[Departs] ([ID], [Name]) VALUES (N'BA', N'Phân tích kinh doanh')
INSERT [dbo].[Departs] ([ID], [Name]) VALUES (N'IT', N'Phòng IT')
INSERT [dbo].[Departs] ([ID], [Name]) VALUES (N'KD', N'Phòng Kinh Doanh')
INSERT [dbo].[Departs] ([ID], [Name]) VALUES (N'KT', N'Phòng Kinh Tế')
SET IDENTITY_INSERT [dbo].[Records] ON 

INSERT [dbo].[Records] ([ID], [Type], [Reason], [Ngay], [StaffID]) VALUES (3, 1, N'Đúng giờ', CAST(N'2020-12-09' AS Date), N'PS103')
INSERT [dbo].[Records] ([ID], [Type], [Reason], [Ngay], [StaffID]) VALUES (4, 1, N'Đúng giờ', CAST(N'2020-01-11' AS Date), N'PS103')
INSERT [dbo].[Records] ([ID], [Type], [Reason], [Ngay], [StaffID]) VALUES (5, 1, N'Ði dúng', CAST(N'2019-12-20' AS Date), N'PS104')
INSERT [dbo].[Records] ([ID], [Type], [Reason], [Ngay], [StaffID]) VALUES (7, 1, N'uuu', CAST(N'2020-02-22' AS Date), N'PS102')
SET IDENTITY_INSERT [dbo].[Records] OFF
INSERT [dbo].[Staffs] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Level], [Notes], [DepartID]) VALUES (N'PS102', N'Ngô Tuấn Đứcc', 1, CAST(N'1999-12-30' AS Date), N'yukinon.jpg', N'duc@gmail.com', N'0903594750', 600.0000, 6, N'Đức', N'IT')
INSERT [dbo].[Staffs] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Level], [Notes], [DepartID]) VALUES (N'PS103', N'Yuki', 0, CAST(N'2000-04-29' AS Date), N'yui.jpg', N'chickendje02@gmail.com', N'0938432601', 1000.0000, 7, N'Abc', N'KD')
INSERT [dbo].[Staffs] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Level], [Notes], [DepartID]) VALUES (N'PS104', N'Phạmm Thanh Hằng', 0, CAST(N'2000-12-10' AS Date), N'shizuka.jpg', N'hang@gmail.com', N'0909013788', 8.0000, 5, N'Hằng', N'KD')
INSERT [dbo].[Staffs] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Level], [Notes], [DepartID]) VALUES (N'PS105', N'Nguyễn Minh Ý', 1, CAST(N'2000-05-05' AS Date), N'ibi.jpg', N'y@gmai.com', N'0985647597', 700.0000, 9, N'Ý', N'IT')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'abc', N'abc', N'abc')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'u', N'u', N'u')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Yui', N'123', N'Yuigahama Yui')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Yukinon', N'123456', N'Yukinoshita Yukino')
ALTER TABLE [dbo].[Records]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staffs] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([DepartID])
REFERENCES [dbo].[Departs] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [lab6] SET  READ_WRITE 
GO
