USE [master]
GO
/****** Object:  Database [EduCamp]    Script Date: 4/10/2021 11:02:01 PM ******/
CREATE DATABASE [EduCamp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EduCamp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EduCamp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EduCamp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EduCamp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EduCamp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EduCamp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EduCamp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EduCamp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EduCamp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EduCamp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EduCamp] SET ARITHABORT OFF 
GO
ALTER DATABASE [EduCamp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EduCamp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EduCamp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EduCamp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EduCamp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EduCamp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EduCamp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EduCamp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EduCamp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EduCamp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EduCamp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EduCamp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EduCamp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EduCamp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EduCamp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EduCamp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EduCamp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EduCamp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EduCamp] SET RECOVERY FULL 
GO
ALTER DATABASE [EduCamp] SET  MULTI_USER 
GO
ALTER DATABASE [EduCamp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EduCamp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EduCamp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EduCamp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EduCamp', N'ON'
GO
USE [EduCamp]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_username] [nvarchar](50) NOT NULL,
	[admin_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admission_Headers]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admission_Headers](
	[ah_id] [int] IDENTITY(1,1) NOT NULL,
	[ah_course] [nvarchar](50) NOT NULL,
	[ah_sem] [int] NOT NULL,
	[ah_fees] [int] NOT NULL,
	[ah_startdate] [date] NOT NULL,
	[ah_enddate] [date] NOT NULL,
	[ah_start_termdate] [date] NOT NULL,
	[ah_end_termdate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ah_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admissions]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admissions](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[ad_ah] [int] NOT NULL,
	[ad_course] [int] NOT NULL,
	[ad_sem] [int] NOT NULL,
	[ad_student] [int] NOT NULL,
	[ad_rollno] [int] NOT NULL,
	[ad_fees] [int] NOT NULL,
	[ad_payment] [nvarchar](50) NOT NULL,
	[ad_date] [date] NOT NULL,
	[ad_status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[assignments]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignments](
	[a_id] [int] IDENTITY(1,1) NOT NULL,
	[a_title] [nvarchar](550) NOT NULL,
	[a_file] [nchar](150) NOT NULL,
	[a_sdate] [date] NOT NULL,
	[a_edate] [date] NOT NULL,
	[a_ah_id] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[courses]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](50) NOT NULL,
	[c_maxsem] [int] NOT NULL,
	[c_fees] [int] NOT NULL,
	[c_status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[faculty]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faculty](
	[f_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [nvarchar](50) NOT NULL,
	[f_dob] [nvarchar](50) NOT NULL,
	[f_gender] [nvarchar](50) NOT NULL,
	[f_mobile] [nvarchar](50) NOT NULL,
	[f_email] [nvarchar](50) NOT NULL,
	[f_address] [nvarchar](150) NOT NULL,
	[f_city] [nvarchar](50) NOT NULL,
	[f_pincode] [nvarchar](50) NOT NULL,
	[f_image] [nvarchar](50) NOT NULL,
	[f_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fine]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fine](
	[f_id] [int] IDENTITY(1,1) NOT NULL,
	[f_student] [nvarchar](50) NOT NULL,
	[f_title] [nvarchar](50) NOT NULL,
	[f_amount] [int] NOT NULL,
	[f_status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notice]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notice](
	[n_id] [int] IDENTITY(1,1) NOT NULL,
	[n_title] [nvarchar](50) NOT NULL,
	[n_desc] [nvarchar](1200) NOT NULL,
	[n_file] [nvarchar](150) NULL,
	[n_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[students]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[s_name] [nvarchar](50) NOT NULL,
	[s_fathername] [nvarchar](50) NOT NULL,
	[s_dob] [date] NOT NULL,
	[s_gender] [nvarchar](50) NOT NULL,
	[s_mobile] [bigint] NOT NULL,
	[s_email] [nvarchar](50) NOT NULL,
	[s_address] [nvarchar](250) NOT NULL,
	[s_city] [nvarchar](50) NOT NULL,
	[s_pincode] [int] NOT NULL,
	[s_image] [nvarchar](50) NOT NULL,
	[s_course] [int] NOT NULL,
	[s_gr] [nvarchar](50) NOT NULL,
	[s_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[submissions]    Script Date: 4/10/2021 11:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[submissions](
	[sub_id] [int] IDENTITY(1,1) NOT NULL,
	[sub_file] [nvarchar](50) NULL,
	[sub_a_id] [int] NOT NULL,
	[sub_user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Admissions] ADD  DEFAULT ('Pending') FOR [ad_status]
GO
ALTER TABLE [dbo].[assignments] ADD  DEFAULT ('no assignmets available') FOR [a_title]
GO
ALTER TABLE [dbo].[assignments] ADD  DEFAULT ('no assignmets available') FOR [a_file]
GO
ALTER TABLE [dbo].[assignments] ADD  DEFAULT (getdate()) FOR [a_sdate]
GO
ALTER TABLE [dbo].[assignments] ADD  DEFAULT (getdate()) FOR [a_edate]
GO
ALTER TABLE [dbo].[courses] ADD  DEFAULT ((1)) FOR [c_status]
GO
ALTER TABLE [dbo].[faculty] ADD  DEFAULT ('photo.png') FOR [f_image]
GO
ALTER TABLE [dbo].[faculty] ADD  DEFAULT ('') FOR [f_password]
GO
ALTER TABLE [dbo].[fine] ADD  DEFAULT ('Pending') FOR [f_status]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ('photo.png') FOR [s_image]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ((0)) FOR [s_course]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ('') FOR [s_gr]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ('') FOR [s_password]
GO
USE [master]
GO
ALTER DATABASE [EduCamp] SET  READ_WRITE 
GO
