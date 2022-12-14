USE [master]
GO
/****** Object:  Database [cellshop]    Script Date: 10/9/2022 9:17:53 PM ******/
CREATE DATABASE [cellshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cellshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cellshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cellshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cellshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cellshop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cellshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cellshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cellshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cellshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cellshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cellshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [cellshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cellshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cellshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cellshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cellshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cellshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cellshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cellshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cellshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cellshop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cellshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cellshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cellshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cellshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cellshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cellshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cellshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cellshop] SET RECOVERY FULL 
GO
ALTER DATABASE [cellshop] SET  MULTI_USER 
GO
ALTER DATABASE [cellshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cellshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cellshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cellshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cellshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cellshop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'cellshop', N'ON'
GO
ALTER DATABASE [cellshop] SET QUERY_STORE = OFF
GO
USE [cellshop]
GO
/****** Object:  Table [dbo].[cellphones]    Script Date: 10/9/2022 9:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cellphones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brandNam] [varchar](60) NULL,
	[model] [varchar](60) NULL,
	[storage] [varchar](30) NULL,
	[price] [int] NULL,
	[imgUrl] [varchar](800) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cellphones] ON 

INSERT [dbo].[cellphones] ([id], [brandNam], [model], [storage], [price], [imgUrl]) VALUES (1, N'iphone', N'xspromax', N'128gb', 30000, N'https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge30-neo-1.jpg')
INSERT [dbo].[cellphones] ([id], [brandNam], [model], [storage], [price], [imgUrl]) VALUES (5, N'Motorola', N'Edge30', N'128gb', 50000, N'https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge30-neo-1.jpg')
INSERT [dbo].[cellphones] ([id], [brandNam], [model], [storage], [price], [imgUrl]) VALUES (8, N'Xiaomi', N'12T Pro', N'128gb', 50000, N'https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-12t-pro-01.jpg')
INSERT [dbo].[cellphones] ([id], [brandNam], [model], [storage], [price], [imgUrl]) VALUES (10, N'Sony Xperia ', N'5 III', N'128gb', 17000, N'https://fdn2.gsmarena.com/vv/pics/sony/sony-xperia-5-iii-02.jpg')
INSERT [dbo].[cellphones] ([id], [brandNam], [model], [storage], [price], [imgUrl]) VALUES (11, N'Infinix', N'Zero Ultra', N'64gb', 65000, N'https://fdn2.gsmarena.com/vv/pics/infinix/infinix-zero-ultra-1.jpg')
SET IDENTITY_INSERT [dbo].[cellphones] OFF
GO
/****** Object:  StoredProcedure [dbo].[_cellAdd]    Script Date: 10/9/2022 9:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_cellAdd] (
@Brandname varchar(60),
@Model varchar(60),
@Storage varchar(30),
@Price int,
@ImgUrl varchar(800)

)

as
begin

 insert into cellphones(brandNam,model,storage,price,imgUrl) values(@Brandname,@Model,@Storage,@Price,@ImgUrl)

end

GO
/****** Object:  StoredProcedure [dbo].[_cellDel]    Script Date: 10/9/2022 9:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_cellDel](
@Id int
)
as
begin

delete from cellphones where id = @Id

end
GO
/****** Object:  StoredProcedure [dbo].[_cellGet]    Script Date: 10/9/2022 9:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_cellGet](
@Id int
)
as
begin

select * from cellphones where id = @Id

end
GO
/****** Object:  StoredProcedure [dbo].[_cellList]    Script Date: 10/9/2022 9:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[_cellList] 

as 

begin 

select * from cellphones

end

GO
/****** Object:  StoredProcedure [dbo].[_cellUpdate]    Script Date: 10/9/2022 9:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[_cellUpdate] (
@Id int,
@Brandname varchar(60),
@Model varchar(60),
@Storage varchar(30),
@Price int,
@ImgUrl varchar(800)

)

as

begin

update cellphones set brandNam = @Brandname, model = @Model,storage = @Storage, price = @Price,imgUrl = @ImgUrl

where id = @Id

end
GO
USE [master]
GO
ALTER DATABASE [cellshop] SET  READ_WRITE 
GO
