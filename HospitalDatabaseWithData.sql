USE [master]
GO
/****** Object:  Database [HospitalFinalProject]    Script Date: 12/15/2024 9:20:37 PM ******/
CREATE DATABASE [HospitalFinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalFinalProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HospitalFinalProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalFinalProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HospitalFinalProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HospitalFinalProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalFinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalFinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalFinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalFinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalFinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalFinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalFinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalFinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalFinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalFinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalFinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalFinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalFinalProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HospitalFinalProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [HospitalFinalProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HospitalFinalProject]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[Appointment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
	[Appointment_date_time] [datetime] NOT NULL,
	[Appointment_cost] [money] NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[Appointment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Payment_Method] [varchar](50) NOT NULL,
	[Bill_date] [date] NOT NULL,
	[Appointment_ID] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_ID] [int] IDENTITY(1,1) NOT NULL,
	[Department_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Doctor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Specialization] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Doctor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Person_ID] [int] NOT NULL,
	[Department_ID] [int] NOT NULL,
	[Position] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medication]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medication](
	[Medication_ID] [int] IDENTITY(1,1) NOT NULL,
	[Medication_name] [varchar](50) NOT NULL,
	[ShelfLife] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Medication] PRIMARY KEY CLUSTERED 
(
	[Medication_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_ID] [int] IDENTITY(1,1) NOT NULL,
	[Person_ID] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Person_ID] [int] IDENTITY(1,1) NOT NULL,
	[fName] [varchar](50) NOT NULL,
	[lName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[Title] [varchar](10) NULL,
	[Suffix] [varchar](10) NULL,
	[DOB] [date] NOT NULL,
	[Gender] [char](1) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 12/15/2024 9:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[Prescription_ID] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_ID] [int] NOT NULL,
	[Medication_ID] [int] NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Date_issued] [date] NOT NULL,
	[Refill_amount] [int] NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[Prescription_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (1, 3, 6, CAST(N'2024-01-04T07:30:00.000' AS DateTime), 400.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (3, 7, 7, CAST(N'2024-03-15T13:00:00.000' AS DateTime), 250.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (4, 1, 12, CAST(N'2024-04-20T12:00:00.000' AS DateTime), 150.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (5, 2, 13, CAST(N'2024-05-08T08:15:00.000' AS DateTime), 300.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (6, 4, 14, CAST(N'2024-05-28T06:30:00.000' AS DateTime), 350.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (7, 10, 15, CAST(N'2024-06-15T17:30:00.000' AS DateTime), 575.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (8, 11, 3, CAST(N'2024-06-30T00:00:01.000' AS DateTime), 1215.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (9, 9, 17, CAST(N'2024-07-22T07:15:00.000' AS DateTime), 150.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (10, 5, 5, CAST(N'2024-08-11T00:01:17.000' AS DateTime), 2345.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (11, 2, 16, CAST(N'2024-09-09T09:00:00.000' AS DateTime), 792.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (12, 6, 20, CAST(N'2024-10-17T14:30:00.000' AS DateTime), 215.0000)
INSERT [dbo].[Appointments] ([Appointment_ID], [Patient_ID], [Doctor_ID], [Appointment_date_time], [Appointment_cost]) VALUES (13, 6, 20, CAST(N'2024-11-15T14:30:00.000' AS DateTime), 215.0000)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (1, 3, N'Check', CAST(N'2024-01-04' AS Date), 1)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (6, 7, N'Credit Card', CAST(N'2024-03-15' AS Date), 3)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (7, 1, N'Credit Card', CAST(N'2024-04-20' AS Date), 4)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (8, 2, N'Check', CAST(N'2024-05-08' AS Date), 5)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (9, 4, N'Credit Card', CAST(N'2024-05-28' AS Date), 6)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (10, 10, N'Credit Card', CAST(N'2024-06-15' AS Date), 7)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (11, 11, N'Unfulfilled', CAST(N'2024-06-30' AS Date), 8)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (12, 9, N'Credit Card', CAST(N'2024-07-22' AS Date), 9)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (13, 5, N'Credit Card', CAST(N'2024-08-11' AS Date), 10)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (14, 2, N'Unfulfilled', CAST(N'2024-09-09' AS Date), 11)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (15, 6, N'Credit Card', CAST(N'2024-10-17' AS Date), 12)
INSERT [dbo].[Bill] ([Bill_ID], [Patient_ID], [Payment_Method], [Bill_date], [Appointment_ID]) VALUES (16, 6, N'Unfulfilled', CAST(N'2024-11-15' AS Date), 13)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (1, N'Emergency Department')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (2, N'Intensive Care Unit')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (3, N'Surgery Department')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (4, N'Pediatrics')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (5, N'Obstetrics and Gynecology')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (6, N'Cardiology')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (7, N'Neurology')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (8, N'Radiology')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (9, N'Anesthesiology')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (10, N'Oncology')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (11, N'Internal Medicine')
INSERT [dbo].[Department] ([Department_ID], [Department_Name]) VALUES (12, N'Social Work')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (3, 6, N'ED')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (5, 7, N'ICU')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (6, 8, N'Surgery')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (7, 9, N'Internal Medicine')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (12, 11, N'Pediatrics')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (13, 12, N'Cardiology')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (14, 13, N'Neurology')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (15, 14, N'Radiology')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (16, 15, N'Anesthesiology')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (17, 16, N'Obstetrics and Gynecology')
INSERT [dbo].[Doctor] ([Doctor_ID], [Employee_ID], [Specialization]) VALUES (20, 17, N'Oncology')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (6, 1, 1, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (7, 2, 2, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (8, 3, 3, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (9, 4, 11, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (11, 5, 4, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (12, 6, 6, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (13, 7, 7, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (14, 8, 8, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (15, 9, 9, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (16, 10, 5, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (17, 11, 10, N'Dr.')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (18, 14, 7, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (19, 15, 3, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (20, 16, 2, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (21, 17, 11, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (22, 18, 6, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (23, 19, 8, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (24, 20, 9, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (27, 28, 12, N'Social Worker')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (28, 29, 12, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (29, 30, 10, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (30, 32, 5, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (31, 34, 4, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (32, 35, 4, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (33, 36, 3, N'Secretary')
INSERT [dbo].[Employee] ([Employee_ID], [Person_ID], [Department_ID], [Position]) VALUES (34, 37, 8, N'Secretary')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Medication] ON 

INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (1, N'Morphine', CAST(36 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (2, N'Midazolam', CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (3, N'Cephalexin', CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (4, N'Amoxicillin', CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (5, N'Prenatal Vitamins', CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (6, N'Amplodopine', CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (7, N'Levetiracetam', CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (8, N'Barium Sulfate', CAST(36 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (9, N'Propofol', CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (10, N'Methotrexate', CAST(36 AS Decimal(18, 0)))
INSERT [dbo].[Medication] ([Medication_ID], [Medication_name], [ShelfLife]) VALUES (11, N'Metformin', CAST(36 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Medication] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (1, 12)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (2, 13)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (3, 22)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (4, 23)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (5, 24)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (6, 25)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (7, 26)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (8, 27)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (9, 31)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (10, 33)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (11, 38)
INSERT [dbo].[Patient] ([Patient_ID], [Person_ID]) VALUES (12, 39)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (1, N'Logan', N'Mitchell', N'Christopher', N'Dr.', NULL, CAST(N'1982-03-17' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (2, N'Mason', N'Blake', N'Alexander', N'Dr. ', NULL, CAST(N'1985-10-22' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (3, N'Ethan', N'Parker', N'Thomas', N'Dr.', NULL, CAST(N'1983-05-10' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (4, N'Frank', N'Stein', N'N.', N'Dr.', NULL, CAST(N'1978-07-15' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (5, N'Aaron', N'Stein', NULL, N'Dr.', NULL, CAST(N'1973-06-15' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (6, N'Jacob', N'Bernstein', NULL, N'Dr.', NULL, CAST(N'1962-05-20' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (7, N'Isaac', N'Cohen', NULL, N'Dr.', NULL, CAST(N'1955-11-04' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (8, N'Isabella', N'Cooper', N'Marie', N'Dr.', NULL, CAST(N'1992-12-25' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (9, N'Olivia', N'Walker', N'Rose', N'Dr.', NULL, CAST(N'1989-11-21' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (10, N'Talia', N'Weiss', NULL, N'Dr.', NULL, CAST(N'1991-03-05' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (11, N'Ruth', N'Horowitz', NULL, N'Dr.', NULL, CAST(N'1952-02-10' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (12, N'Lucas', N'Reed', NULL, N'Mr.', NULL, CAST(N'2002-07-24' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (13, N'Nathaniel', N'Steinberg', NULL, N'Mr.', NULL, CAST(N'1994-10-02' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (14, N'Jacob', N'Price', NULL, N'Mr.', NULL, CAST(N'1991-05-30' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (15, N'Joshua', N'Spector', NULL, N'Mr.', NULL, CAST(N'1991-05-16' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (16, N'Liam', N'Turner', N'James', N'Mr.', NULL, CAST(N'1995-01-18' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (17, N'Harper', N'James', N'Daniel', N'Mr.', NULL, CAST(N'1996-08-05' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (18, N'Benjamin', N'Scott', NULL, N'Mr.', NULL, CAST(N'1994-02-20' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (19, N'Daniel', N'Levi', NULL, N'Mr.', NULL, CAST(N'1984-07-25' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (20, N'Alexander', N'Brooks', NULL, N'Mr.', NULL, CAST(N'1993-04-17' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (21, N'David', N'Rosenberg', NULL, N'Mr.', NULL, CAST(N'1960-04-09' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (22, N'Samuel', N'Greenberg', NULL, N'Mr.', NULL, CAST(N'1965-11-12' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (23, N'Noah', N'Evans', N'Benjamin', N'Mr.', NULL, CAST(N'1952-06-15' AS Date), N'M')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (24, N'Mia', N'Sullivan', NULL, N'Ms.', NULL, CAST(N'2004-11-14' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (25, N'Leah', N'Friedman', NULL, N'Ms.', NULL, CAST(N'2002-01-10' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (26, N'Naomi', N'Rosen', NULL, N'Ms.', NULL, CAST(N'2002-10-14' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (27, N'Charlotte', N'Foster', NULL, N'Ms.', NULL, CAST(N'2004-03-04' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (28, N'Rebecca', N'Cohen', NULL, N'Ms.', NULL, CAST(N'1997-03-23' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (29, N'Sophia', N'Hayes', N'Claire', N'Ms.', NULL, CAST(N'2002-09-30' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (30, N'Amelia', N'Carter', N'Grace', N'Ms.', NULL, CAST(N'2001-03-12' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (31, N'Esther', N'Schwartz', NULL, N'Ms.', NULL, CAST(N'2000-07-30' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (32, N'Benjamin', N'Kaplan', NULL, N'Ms.', NULL, CAST(N'1999-11-01' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (33, N'Grace', N'Anderson', NULL, N'Miss', NULL, CAST(N'2005-10-10' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (34, N'Ella', N'Thompson', N'Marie', N'Mrs.', NULL, CAST(N'1988-06-07' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (35, N'Sarah', N'Goldstein', NULL, N'Mrs.', NULL, CAST(N'1961-03-19' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (36, N'Miriam', N'Katz', NULL, N'Mrs.', NULL, CAST(N'1956-12-03' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (37, N'Rachel', N'Shapiro', NULL, N'Mrs.', NULL, CAST(N'1961-02-02' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (38, N'Hannah', N'Goldberg', NULL, N'Mrs.', N'LCSW', CAST(N'1979-01-30' AS Date), N'F')
INSERT [dbo].[Person] ([Person_ID], [fName], [lName], [MiddleName], [Title], [Suffix], [DOB], [Gender]) VALUES (39, N'Ava', N'Morgan', N'Katherine', N'Ms.', NULL, CAST(N'1928-01-01' AS Date), N'F')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Prescription] ON 

INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (1, 6, 3, 3, CAST(N'2024-01-04' AS Date), 1)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (2, 7, 11, 7, CAST(N'2024-03-15' AS Date), 2)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (4, 12, 4, 1, CAST(N'2024-04-20' AS Date), 2)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (5, 13, 6, 2, CAST(N'2024-05-08' AS Date), 2)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (7, 14, 7, 4, CAST(N'2024-05-28' AS Date), NULL)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (9, 15, 8, 10, CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (11, 3, 1, 11, CAST(N'2024-06-30' AS Date), NULL)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (12, 17, 5, 9, CAST(N'2024-07-22' AS Date), 1)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (13, 5, 2, 5, CAST(N'2024-08-11' AS Date), NULL)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (14, 16, 9, 2, CAST(N'2024-09-09' AS Date), NULL)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (15, 20, 10, 6, CAST(N'2024-10-17' AS Date), NULL)
INSERT [dbo].[Prescription] ([Prescription_ID], [Doctor_ID], [Medication_ID], [Patient_ID], [Date_issued], [Refill_amount]) VALUES (16, 20, 10, 6, CAST(N'2024-11-15' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Prescription] OFF
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctor] ([Doctor_ID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([Appointment_ID])
REFERENCES [dbo].[Appointments] ([Appointment_ID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Person_ID])
REFERENCES [dbo].[Person] ([Person_ID])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([Person_ID])
REFERENCES [dbo].[Person] ([Person_ID])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctor] ([Doctor_ID])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([Medication_ID])
REFERENCES [dbo].[Medication] ([Medication_ID])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [chk_Gender] CHECK  (([Gender]='F' OR [Gender]='M'))
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [chk_Gender]
GO
USE [master]
GO
ALTER DATABASE [HospitalFinalProject] SET  READ_WRITE 
GO
