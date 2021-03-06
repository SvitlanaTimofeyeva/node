USE [master]
GO
/****** Object:  Database [uploads]    Script Date: 10/31/2016 10:37:27 AM ******/
CREATE DATABASE [uploads]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'uploads', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\uploads.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'uploads_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\uploads_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [uploads] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [uploads].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [uploads] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [uploads] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [uploads] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [uploads] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [uploads] SET ARITHABORT OFF 
GO
ALTER DATABASE [uploads] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [uploads] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [uploads] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [uploads] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [uploads] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [uploads] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [uploads] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [uploads] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [uploads] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [uploads] SET  DISABLE_BROKER 
GO
ALTER DATABASE [uploads] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [uploads] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [uploads] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [uploads] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [uploads] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [uploads] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [uploads] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [uploads] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [uploads] SET  MULTI_USER 
GO
ALTER DATABASE [uploads] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [uploads] SET DB_CHAINING OFF 
GO
ALTER DATABASE [uploads] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [uploads] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [uploads] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [uploads] SET QUERY_STORE = OFF
GO
USE [uploads]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [uploads]
GO
/****** Object:  User [demo_user]    Script Date: 10/31/2016 10:37:27 AM ******/
CREATE USER [demo_user] FOR LOGIN [demo_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [demo_user]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [demo_user]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [demo_user]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [demo_user]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [demo_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [demo_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [demo_user]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [demo_user]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [demo_user]
GO
/****** Object:  Table [dbo].[images]    Script Date: 10/31/2016 10:37:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[src] [text] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [uploads] SET  READ_WRITE 
GO
