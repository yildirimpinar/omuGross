USE [master]
GO
/****** Object:  Database [omuGross]    Script Date: 8.01.2023 22:06:19 ******/
CREATE DATABASE [omuGross]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'omuGross', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\omuGross.mdf' , SIZE = 262144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'omuGross_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\omuGross_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [omuGross] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [omuGross].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [omuGross] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [omuGross] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [omuGross] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [omuGross] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [omuGross] SET ARITHABORT OFF 
GO
ALTER DATABASE [omuGross] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [omuGross] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [omuGross] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [omuGross] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [omuGross] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [omuGross] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [omuGross] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [omuGross] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [omuGross] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [omuGross] SET  DISABLE_BROKER 
GO
ALTER DATABASE [omuGross] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [omuGross] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [omuGross] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [omuGross] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [omuGross] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [omuGross] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [omuGross] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [omuGross] SET RECOVERY FULL 
GO
ALTER DATABASE [omuGross] SET  MULTI_USER 
GO
ALTER DATABASE [omuGross] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [omuGross] SET DB_CHAINING OFF 
GO
ALTER DATABASE [omuGross] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [omuGross] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [omuGross] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [omuGross] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'omuGross', N'ON'
GO
ALTER DATABASE [omuGross] SET QUERY_STORE = OFF
GO
USE [omuGross]
GO
/****** Object:  Table [dbo].[cariSatis]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cariSatis](
	[satisID] [int] NOT NULL,
	[satisTarih] [smalldatetime] NOT NULL,
	[satisMiktar] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[irsaliye]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[irsaliye](
	[irsaliyeNo] [int] NOT NULL,
	[urunID] [int] NOT NULL,
	[tedarikciID] [int] NOT NULL,
	[urunGirdiMiktar] [int] NOT NULL,
	[urunGirdiFiyat] [int] NOT NULL,
 CONSTRAINT [PK_irsaliye] PRIMARY KEY CLUSTERED 
(
	[irsaliyeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[market]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[market](
	[musteriID] [int] NULL,
	[tedarikciID] [int] NULL,
	[satisID] [int] NULL,
	[urunID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteri]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteri](
	[musteriID] [int] NOT NULL,
	[ad] [nchar](50) NOT NULL,
	[soyad] [nchar](50) NOT NULL,
	[sifre] [binary](64) NOT NULL,
 CONSTRAINT [PK_musteri] PRIMARY KEY CLUSTERED 
(
	[musteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteriBorc]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteriBorc](
	[musteriID] [int] NOT NULL,
	[borcMiktari] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteriOdeme]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteriOdeme](
	[id] [int] NOT NULL,
	[odemeMiktari] [int] NOT NULL,
	[odemeTarihi] [date] NOT NULL,
	[musteriID] [int] NOT NULL,
 CONSTRAINT [PK_musteriOdeme] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perakendeSatis]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perakendeSatis](
	[id] [int] NOT NULL,
	[urunID] [int] NOT NULL,
	[satisTarih] [smalldatetime] NOT NULL,
	[satisMiktar] [int] NOT NULL,
 CONSTRAINT [PK_perakendeSatis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[satis]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[satis](
	[satisID] [int] NOT NULL,
	[satisTarih] [date] NULL,
	[satisMiktar] [int] NOT NULL,
 CONSTRAINT [PK_satis] PRIMARY KEY CLUSTERED 
(
	[satisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tedarikci]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tedarikci](
	[tedarikciID] [int] NOT NULL,
	[ad] [nchar](50) NOT NULL,
 CONSTRAINT [PK_tedarikci] PRIMARY KEY CLUSTERED 
(
	[tedarikciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tedarikciBorc]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tedarikciBorc](
	[tedarikciID] [int] NOT NULL,
	[borcMiktar] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tedarikciOdeme]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tedarikciOdeme](
	[tedarikciID] [int] NOT NULL,
	[odemeMiktar] [int] NOT NULL,
	[odemeTarih] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urun]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urun](
	[urunID] [int] NOT NULL,
	[urunAd] [nchar](100) NOT NULL,
	[urunFiyat] [int] NOT NULL,
	[barkodNo] [int] NOT NULL,
 CONSTRAINT [PK_urun] PRIMARY KEY CLUSTERED 
(
	[urunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urunStokDurum]    Script Date: 8.01.2023 22:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunStokDurum](
	[id] [int] NOT NULL,
	[urunID] [int] NOT NULL,
	[stokMiktar] [int] NOT NULL,
 CONSTRAINT [PK_urunStokDurum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cariSatis]  WITH CHECK ADD  CONSTRAINT [FK_cariSatis_satis] FOREIGN KEY([satisID])
REFERENCES [dbo].[satis] ([satisID])
GO
ALTER TABLE [dbo].[cariSatis] CHECK CONSTRAINT [FK_cariSatis_satis]
GO
ALTER TABLE [dbo].[irsaliye]  WITH CHECK ADD  CONSTRAINT [FK_irsaliye_tedarikci] FOREIGN KEY([tedarikciID])
REFERENCES [dbo].[tedarikci] ([tedarikciID])
GO
ALTER TABLE [dbo].[irsaliye] CHECK CONSTRAINT [FK_irsaliye_tedarikci]
GO
ALTER TABLE [dbo].[irsaliye]  WITH CHECK ADD  CONSTRAINT [FK_irsaliye_urun] FOREIGN KEY([urunID])
REFERENCES [dbo].[urun] ([urunID])
GO
ALTER TABLE [dbo].[irsaliye] CHECK CONSTRAINT [FK_irsaliye_urun]
GO
ALTER TABLE [dbo].[market]  WITH CHECK ADD  CONSTRAINT [FK_market_musteri] FOREIGN KEY([musteriID])
REFERENCES [dbo].[musteri] ([musteriID])
GO
ALTER TABLE [dbo].[market] CHECK CONSTRAINT [FK_market_musteri]
GO
ALTER TABLE [dbo].[market]  WITH CHECK ADD  CONSTRAINT [FK_market_satis] FOREIGN KEY([satisID])
REFERENCES [dbo].[satis] ([satisID])
GO
ALTER TABLE [dbo].[market] CHECK CONSTRAINT [FK_market_satis]
GO
ALTER TABLE [dbo].[market]  WITH CHECK ADD  CONSTRAINT [FK_market_tedarikci] FOREIGN KEY([tedarikciID])
REFERENCES [dbo].[tedarikci] ([tedarikciID])
GO
ALTER TABLE [dbo].[market] CHECK CONSTRAINT [FK_market_tedarikci]
GO
ALTER TABLE [dbo].[market]  WITH CHECK ADD  CONSTRAINT [FK_market_urun] FOREIGN KEY([urunID])
REFERENCES [dbo].[urun] ([urunID])
GO
ALTER TABLE [dbo].[market] CHECK CONSTRAINT [FK_market_urun]
GO
ALTER TABLE [dbo].[musteriBorc]  WITH CHECK ADD  CONSTRAINT [FK_musteriBorc_musteri] FOREIGN KEY([musteriID])
REFERENCES [dbo].[musteri] ([musteriID])
GO
ALTER TABLE [dbo].[musteriBorc] CHECK CONSTRAINT [FK_musteriBorc_musteri]
GO
ALTER TABLE [dbo].[musteriOdeme]  WITH CHECK ADD  CONSTRAINT [FK_musteriOdeme_musteri1] FOREIGN KEY([musteriID])
REFERENCES [dbo].[musteri] ([musteriID])
GO
ALTER TABLE [dbo].[musteriOdeme] CHECK CONSTRAINT [FK_musteriOdeme_musteri1]
GO
ALTER TABLE [dbo].[perakendeSatis]  WITH CHECK ADD  CONSTRAINT [FK_perakendeSatis_urun] FOREIGN KEY([urunID])
REFERENCES [dbo].[urun] ([urunID])
GO
ALTER TABLE [dbo].[perakendeSatis] CHECK CONSTRAINT [FK_perakendeSatis_urun]
GO
ALTER TABLE [dbo].[tedarikciBorc]  WITH CHECK ADD  CONSTRAINT [FK_tedarikciBorc_tedarikci] FOREIGN KEY([tedarikciID])
REFERENCES [dbo].[tedarikci] ([tedarikciID])
GO
ALTER TABLE [dbo].[tedarikciBorc] CHECK CONSTRAINT [FK_tedarikciBorc_tedarikci]
GO
ALTER TABLE [dbo].[tedarikciOdeme]  WITH CHECK ADD  CONSTRAINT [FK_tedarikciOdeme_tedarikci] FOREIGN KEY([tedarikciID])
REFERENCES [dbo].[tedarikci] ([tedarikciID])
GO
ALTER TABLE [dbo].[tedarikciOdeme] CHECK CONSTRAINT [FK_tedarikciOdeme_tedarikci]
GO
ALTER TABLE [dbo].[urunStokDurum]  WITH CHECK ADD  CONSTRAINT [FK_urunStokDurum_urun] FOREIGN KEY([urunID])
REFERENCES [dbo].[urun] ([urunID])
GO
ALTER TABLE [dbo].[urunStokDurum] CHECK CONSTRAINT [FK_urunStokDurum_urun]
GO
USE [master]
GO
ALTER DATABASE [omuGross] SET  READ_WRITE 
GO
