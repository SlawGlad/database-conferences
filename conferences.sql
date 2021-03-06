USE [master]
GO
/****** Object:  Database [gladys]    Script Date: 2016-02-01 16:53:44 ******/
CREATE DATABASE [gladys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gladys', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\gladys.mdf' , SIZE = 10240KB , MAXSIZE = 30720KB , FILEGROWTH = 2048KB )
 LOG ON 
( NAME = N'gladys_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\gladys.ldf' , SIZE = 10240KB , MAXSIZE = 30720KB , FILEGROWTH = 2048KB )
GO
ALTER DATABASE [gladys] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gladys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gladys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gladys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gladys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gladys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gladys] SET ARITHABORT OFF 
GO
ALTER DATABASE [gladys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gladys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gladys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gladys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gladys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gladys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gladys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gladys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gladys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gladys] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gladys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gladys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gladys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gladys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gladys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gladys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gladys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gladys] SET RECOVERY FULL 
GO
ALTER DATABASE [gladys] SET  MULTI_USER 
GO
ALTER DATABASE [gladys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gladys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gladys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gladys] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [gladys] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'gladys', N'ON'
GO
USE [gladys]
GO
/****** Object:  DatabaseRole [Secretary]    Script Date: 2016-02-01 16:53:45 ******/
CREATE ROLE [Secretary]
GO
/****** Object:  DatabaseRole [Organizer]    Script Date: 2016-02-01 16:53:45 ******/
CREATE ROLE [Organizer]
GO
/****** Object:  DatabaseRole [Customer]    Script Date: 2016-02-01 16:53:45 ******/
CREATE ROLE [Customer]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId_PK] [int] IDENTITY(1,1) NOT NULL,
	[AccountTypeId_FK] [int] NULL,
	[Login] [nvarchar](20) NOT NULL,
	[Pass] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Account_Login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[AccountTypeId_PK] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[AccountTypeId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CustomerId_PK_FK] [int] NOT NULL,
	[CompanyName] [nvarchar](20) NOT NULL,
	[NIP] [nvarchar](10) NOT NULL,
	[REGON] [nvarchar](9) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CustomerId_PK_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Company_NIP] UNIQUE NONCLUSTERED 
(
	[NIP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Company_REGON] UNIQUE NONCLUSTERED 
(
	[REGON] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conference]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conference](
	[ConferenceId_PK] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PriceForDay] [money] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TotalPlaces] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[StudentDiscount] [float] NOT NULL,
 CONSTRAINT [PK_Conference] PRIMARY KEY CLUSTERED 
(
	[ConferenceId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId_PK] [int] IDENTITY(1,1) NOT NULL,
	[AccountId_FK] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[E-mail] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Customer_E-mail] UNIQUE NONCLUSTERED 
(
	[E-mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayOfConference]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayOfConference](
	[EventsId_PK_FK] [int] NOT NULL,
	[ConferenceId_FK] [int] NOT NULL,
	[ConferenceDay] [date] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_DayOfConference] PRIMARY KEY CLUSTERED 
(
	[EventsId_PK_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId_PK] [int] IDENTITY(1,1) NOT NULL,
	[HeightDiscount] [float] NOT NULL,
	[NrDaysBeforeConference] [int] NOT NULL,
	[Description] [text] NULL,
	[ConferenceId_FK] [int] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId_PK] [int] IDENTITY(1,1) NOT NULL,
	[AccountId_FK] [int] NOT NULL,
	[PESEL] [nvarchar](11) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[E-mail] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Employee_E-mail] UNIQUE NONCLUSTERED 
(
	[E-mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Employee_PESEL] UNIQUE NONCLUSTERED 
(
	[PESEL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employment]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employment](
	[CustomerId_PK_FK] [int] NOT NULL,
	[CustomerCompanyId_FK] [int] NOT NULL,
 CONSTRAINT [PK_Employment] PRIMARY KEY CLUSTERED 
(
	[CustomerId_PK_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventsId_PK] [int] IDENTITY(1,1) NOT NULL,
	[ReservedPlaces] [int] NOT NULL CONSTRAINT [DF_Event_ReservedPlaces]  DEFAULT ((0)),
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventsId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParticipantsEvents]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipantsEvents](
	[ReservationId_PK_FK] [int] NOT NULL,
	[EventsId_PK_FK] [int] NOT NULL,
	[CustomerId_PK_FK] [int] NOT NULL,
 CONSTRAINT [PK_ParticipantsEvents] PRIMARY KEY CLUSTERED 
(
	[ReservationId_PK_FK] ASC,
	[EventsId_PK_FK] ASC,
	[CustomerId_PK_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[CustomerId_PK_FK] [int] NOT NULL,
	[PESEL] [nvarchar](11) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[CustomerId_PK_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Person_PESEL] UNIQUE NONCLUSTERED 
(
	[PESEL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId_PK] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId_FK] [int] NULL,
	[DateOfReservation] [date] NOT NULL,
	[TermOfContribution] [date] NOT NULL,
	[DateOfContribution] [date] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ReservationId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReservationDetails]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationDetails](
	[ReservationId_PK_FK] [int] NOT NULL,
	[EventsId_PK_FK] [int] NOT NULL,
	[NumberOfPlaces] [int] NOT NULL,
 CONSTRAINT [PK_ReservationDetails] PRIMARY KEY CLUSTERED 
(
	[ReservationId_PK_FK] ASC,
	[EventsId_PK_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[CustomerId_PK_FK] [int] NOT NULL,
	[CardNumber] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[CustomerId_PK_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[WorkshopId_PK] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Workshop] PRIMARY KEY CLUSTERED 
(
	[WorkshopId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkshopDetails]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkshopDetails](
	[EventsId_PK_FK] [int] NOT NULL,
	[WorkshopId_FK] [int] NULL,
	[DayOfConferenceEventsId_FK] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Price] [money] NOT NULL,
	[TotalPlaces] [int] NOT NULL,
 CONSTRAINT [PK_WorkshopDetails] PRIMARY KEY CLUSTERED 
(
	[EventsId_PK_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[BestCompanyClients]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BestCompanyClients]
AS
SELECT        TOP (10) WITH TIES dbo.Company.CustomerId_PK_FK AS CustomerId, dbo.Company.CompanyName, COUNT(dbo.Reservation.ReservationId_PK) 
                         AS NumberOfReservation
FROM            dbo.Company INNER JOIN
                         dbo.Customer ON dbo.Company.CustomerId_PK_FK = dbo.Customer.CustomerId_PK INNER JOIN
                         dbo.Reservation ON dbo.Customer.CustomerId_PK = dbo.Reservation.CustomerId_FK
GROUP BY dbo.Company.CustomerId_PK_FK, dbo.Company.CompanyName
ORDER BY NumberOfReservation DESC

GO
/****** Object:  View [dbo].[BestIndividualClients]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BestIndividualClients]
AS
SELECT        TOP (10) WITH TIES dbo.Person.CustomerId_PK_FK AS CustomerId, dbo.Person.PESEL, dbo.Person.FirstName, dbo.Person.LastName, 
                         COUNT(dbo.Reservation.ReservationId_PK) AS NumberOfReservation
FROM            dbo.Customer INNER JOIN
                         dbo.Person ON dbo.Customer.CustomerId_PK = dbo.Person.CustomerId_PK_FK INNER JOIN
                         dbo.Reservation ON dbo.Customer.CustomerId_PK = dbo.Reservation.CustomerId_FK
GROUP BY dbo.Person.CustomerId_PK_FK, dbo.Person.PESEL, dbo.Person.FirstName, dbo.Person.LastName
ORDER BY NumberOfReservation DESC

GO
/****** Object:  View [dbo].[ChargeCompany]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ChargeCompany]
AS
SELECT        CustomerId_PK_FK, CompanyName, NIP, ReservationId_PK_FK, SUM(total_price) AS total_price
FROM            (SELECT        co.CustomerId_PK_FK, co.CompanyName, co.NIP, rd.ReservationId_PK_FK, rd.EventsId_PK_FK, SUM(ISNULL(rd.NumberOfPlaces, 0) * ISNULL(wd.Price, 
                                                    0)) + SUM(ISNULL(rd.NumberOfPlaces, 0) * ISNULL(c.PriceForDay, 0)) * (1 - ISNULL
                                                        ((SELECT        TOP (1) d.HeightDiscount
                                                            FROM            dbo.Discount AS d INNER JOIN
                                                                                     dbo.Conference AS c ON d.ConferenceId_FK = c.ConferenceId_PK INNER JOIN
                                                                                     dbo.DayOfConference AS doc ON c.ConferenceId_PK = doc.ConferenceId_FK INNER JOIN
                                                                                     dbo.Event AS e ON doc.EventsId_PK_FK = e.EventsId_PK
                                                            WHERE        (d.NrDaysBeforeConference <= DATEDIFF(day, GETDATE(),
                                                                                         (SELECT        ConferenceDay
                                                                                           FROM            dbo.DayOfConference AS doc2
                                                                                           WHERE        (EventsId_PK_FK = rd.EventsId_PK_FK))))
                                                            ORDER BY d.HeightDiscount DESC), 0)) AS total_price
                          FROM            dbo.Company AS co INNER JOIN
                                                    dbo.Customer AS cust ON co.CustomerId_PK_FK = cust.CustomerId_PK INNER JOIN
                                                    dbo.Reservation AS r ON cust.CustomerId_PK = r.CustomerId_FK INNER JOIN
                                                    dbo.ReservationDetails AS rd ON r.ReservationId_PK = rd.ReservationId_PK_FK INNER JOIN
                                                    dbo.Event AS e ON e.EventsId_PK = rd.EventsId_PK_FK LEFT OUTER JOIN
                                                    dbo.DayOfConference AS doc ON doc.EventsId_PK_FK = e.EventsId_PK LEFT OUTER JOIN
                                                    dbo.WorkshopDetails AS wd ON wd.EventsId_PK_FK = rd.EventsId_PK_FK LEFT OUTER JOIN
                                                    dbo.Conference AS c ON c.ConferenceId_PK = doc.ConferenceId_FK
                          GROUP BY co.CustomerId_PK_FK, co.CompanyName, co.NIP, rd.ReservationId_PK_FK, rd.EventsId_PK_FK) AS DT
GROUP BY CustomerId_PK_FK, CompanyName, NIP, ReservationId_PK_FK

GO
/****** Object:  View [dbo].[ChargeCustomerIndividuala]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ChargeCustomerIndividuala]
AS
SELECT        CustomerId_PK_FK, LastName, FirstName, PESEL, ReservationId_PK_FK, SUM(total_price) AS total_price
FROM            (SELECT        p.CustomerId_PK_FK, p.LastName, p.FirstName, p.PESEL, rd.ReservationId_PK_FK, rd.EventsId_PK_FK, SUM(ISNULL(rd.NumberOfPlaces, 0) 
                                                    * ISNULL(wd.Price, 0)) + SUM(ISNULL(rd.NumberOfPlaces, 0) * ISNULL(c.PriceForDay, 0)) * (1 - ISNULL
                                                        ((SELECT        TOP (1) d.HeightDiscount
                                                            FROM            dbo.Discount AS d INNER JOIN
                                                                                     dbo.Conference AS c ON d.ConferenceId_FK = c.ConferenceId_PK INNER JOIN
                                                                                     dbo.DayOfConference AS doc ON c.ConferenceId_PK = doc.ConferenceId_FK INNER JOIN
                                                                                     dbo.Event AS e ON doc.EventsId_PK_FK = e.EventsId_PK
                                                            WHERE        (d.NrDaysBeforeConference <= DATEDIFF(day, GETDATE(),
                                                                                         (SELECT        ConferenceDay
                                                                                           FROM            dbo.DayOfConference AS doc2
                                                                                           WHERE        (EventsId_PK_FK = rd.EventsId_PK_FK))))
                                                            ORDER BY d.HeightDiscount DESC), 0)) * ISNULL
                                                        ((SELECT        ISNULL(1 - StudentDiscount, 1) AS Expr1
                                                            FROM            dbo.Conference AS c3
                                                            WHERE        (r.CustomerId_FK IN
                                                                                         (SELECT        CustomerId_PK_FK
                                                                                           FROM            dbo.Student AS s))), 1) AS total_price
                          FROM            dbo.Person AS p INNER JOIN
                                                    dbo.Customer AS cust ON p.CustomerId_PK_FK = cust.CustomerId_PK INNER JOIN
                                                    dbo.Reservation AS r ON cust.CustomerId_PK = r.CustomerId_FK INNER JOIN
                                                    dbo.ReservationDetails AS rd ON r.ReservationId_PK = rd.ReservationId_PK_FK INNER JOIN
                                                    dbo.Event AS e ON e.EventsId_PK = rd.EventsId_PK_FK LEFT OUTER JOIN
                                                    dbo.DayOfConference AS doc ON doc.EventsId_PK_FK = e.EventsId_PK LEFT OUTER JOIN
                                                    dbo.WorkshopDetails AS wd ON wd.EventsId_PK_FK = rd.EventsId_PK_FK LEFT OUTER JOIN
                                                    dbo.Conference AS c ON c.ConferenceId_PK = doc.ConferenceId_FK
                          GROUP BY p.CustomerId_PK_FK, p.LastName, p.FirstName, p.PESEL, rd.ReservationId_PK_FK, rd.EventsId_PK_FK, r.CustomerId_FK) AS DT
GROUP BY CustomerId_PK_FK, LastName, FirstName, PESEL, ReservationId_PK_FK

GO
/****** Object:  View [dbo].[ListOfConferenceWorkshops]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ListOfConferenceWorkshops]
AS
SELECT        dbo.Conference.ConferenceId_PK AS ConferenceId, dbo.Conference.Name AS ConferenceName, dbo.DayOfConference.ConferenceDay, 
                         dbo.WorkshopDetails.WorkshopId_FK AS WorkshopId, dbo.Workshop.Name AS WorkshopName, dbo.WorkshopDetails.StartTime, 
                         dbo.WorkshopDetails.EndTime
FROM            dbo.Conference INNER JOIN
                         dbo.DayOfConference ON dbo.Conference.ConferenceId_PK = dbo.DayOfConference.ConferenceId_FK INNER JOIN
                         dbo.WorkshopDetails ON dbo.DayOfConference.EventsId_PK_FK = dbo.WorkshopDetails.DayOfConferenceEventsId_FK INNER JOIN
                         dbo.Workshop ON dbo.WorkshopDetails.WorkshopId_FK = dbo.Workshop.WorkshopId_PK

GO
/****** Object:  View [dbo].[ListOfParticipantsConference]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ListOfParticipantsConference]
AS
SELECT        dbo.Conference.ConferenceId_PK AS ConferenceId, dbo.Conference.Name AS ConferenceName, dbo.DayOfConference.ConferenceDay, 
                         dbo.ParticipantsEvents.CustomerId_PK_FK AS CustomerId, dbo.Person.PESEL, dbo.Person.FirstName, dbo.Person.LastName
FROM            dbo.Conference INNER JOIN
                         dbo.DayOfConference ON dbo.Conference.ConferenceId_PK = dbo.DayOfConference.ConferenceId_FK INNER JOIN
                         dbo.ParticipantsEvents ON dbo.DayOfConference.EventsId_PK_FK = dbo.ParticipantsEvents.EventsId_PK_FK INNER JOIN
                         dbo.Person ON dbo.ParticipantsEvents.CustomerId_PK_FK = dbo.Person.CustomerId_PK_FK

GO
/****** Object:  View [dbo].[ListOfParticipantsWorkshop]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ListOfParticipantsWorkshop]
AS
SELECT        dbo.DayOfConference.ConferenceId_FK AS ConferenceId, dbo.DayOfConference.ConferenceDay, dbo.Workshop.WorkshopId_PK AS WorkshopId, 
                         dbo.Workshop.Name AS WorkshopName, dbo.ParticipantsEvents.CustomerId_PK_FK AS CustomerId, dbo.Person.PESEL, dbo.Person.FirstName, 
                         dbo.Person.LastName
FROM            dbo.Workshop INNER JOIN
                         dbo.WorkshopDetails ON dbo.Workshop.WorkshopId_PK = dbo.WorkshopDetails.WorkshopId_FK INNER JOIN
                         dbo.ParticipantsEvents ON dbo.WorkshopDetails.EventsId_PK_FK = dbo.ParticipantsEvents.EventsId_PK_FK INNER JOIN
                         dbo.Person ON dbo.ParticipantsEvents.CustomerId_PK_FK = dbo.Person.CustomerId_PK_FK INNER JOIN
                         dbo.DayOfConference ON dbo.WorkshopDetails.DayOfConferenceEventsId_FK = dbo.DayOfConference.EventsId_PK_FK

GO
/****** Object:  View [dbo].[PopularConference]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PopularConference]
AS
SELECT        dbo.Conference.ConferenceId_PK AS ConferenceId, dbo.Conference.Name AS ConferenceName, COUNT(dbo.ParticipantsEvents.CustomerId_PK_FK) 
                         AS NumberOfParticipants
FROM            dbo.Conference INNER JOIN
                         dbo.DayOfConference ON dbo.Conference.ConferenceId_PK = dbo.DayOfConference.ConferenceId_FK INNER JOIN
                         dbo.ParticipantsEvents ON dbo.DayOfConference.EventsId_PK_FK = dbo.ParticipantsEvents.EventsId_PK_FK
GROUP BY dbo.Conference.ConferenceId_PK, dbo.Conference.Name

GO
/****** Object:  View [dbo].[PopularWorkshops]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PopularWorkshops]
AS
SELECT        TOP (10) WITH TIES dbo.Workshop.WorkshopId_PK AS WorkshopId, dbo.Workshop.Name AS WorkshopName, COUNT(dbo.ParticipantsEvents.CustomerId_PK_FK) 
                         AS NumberOfParticipants
FROM            dbo.ParticipantsEvents INNER JOIN
                         dbo.WorkshopDetails ON dbo.WorkshopDetails.EventsId_PK_FK = dbo.ParticipantsEvents.EventsId_PK_FK INNER JOIN
                         dbo.Workshop ON dbo.WorkshopDetails.WorkshopId_FK = dbo.Workshop.WorkshopId_PK
GROUP BY dbo.Workshop.WorkshopId_PK, dbo.Workshop.Name
ORDER BY NumberofParticipants

GO
/****** Object:  Index [IX_Account_AccountTypeId_FK]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Account_AccountTypeId_FK] ON [dbo].[Account]
(
	[AccountTypeId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AccountType]    Script Date: 2016-02-01 16:53:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountType] ON [dbo].[AccountType]
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Conference_Name]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Conference_Name] ON [dbo].[Conference]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conference_PriceForDay]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Conference_PriceForDay] ON [dbo].[Conference]
(
	[PriceForDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conference_StartDate]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Conference_StartDate] ON [dbo].[Conference]
(
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customer_AccountId_FK]    Script Date: 2016-02-01 16:53:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customer_AccountId_FK] ON [dbo].[Customer]
(
	[AccountId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DayOfConference_ConferenceId_FK]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_DayOfConference_ConferenceId_FK] ON [dbo].[DayOfConference]
(
	[ConferenceId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Discount_ConferenceId_FK]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Discount_ConferenceId_FK] ON [dbo].[Discount]
(
	[ConferenceId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_AccountId_FK]    Script Date: 2016-02-01 16:53:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employee_AccountId_FK] ON [dbo].[Employee]
(
	[AccountId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Employee_LastName]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Employee_LastName] ON [dbo].[Employee]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employment_CustomerCompanyId_FK]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Employment_CustomerCompanyId_FK] ON [dbo].[Employment]
(
	[CustomerCompanyId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Person_LastName]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Person_LastName] ON [dbo].[Person]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservation_CustomerId_FK]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Reservation_CustomerId_FK] ON [dbo].[Reservation]
(
	[ReservationId_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student_CardNumber]    Script Date: 2016-02-01 16:53:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student_CardNumber] ON [dbo].[Student]
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Workshop_Name]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_Workshop_Name] ON [dbo].[Workshop]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkshopDetails_DayOfConfeEventsId_FK]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_WorkshopDetails_DayOfConfeEventsId_FK] ON [dbo].[WorkshopDetails]
(
	[DayOfConferenceEventsId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkshopDetails_Price]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_WorkshopDetails_Price] ON [dbo].[WorkshopDetails]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkshopDetails_Workshop]    Script Date: 2016-02-01 16:53:45 ******/
CREATE NONCLUSTERED INDEX [IX_WorkshopDetails_Workshop] ON [dbo].[WorkshopDetails]
(
	[WorkshopId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([AccountTypeId_FK])
REFERENCES [dbo].[AccountType] ([AccountTypeId_PK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountType]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Customer] FOREIGN KEY([CustomerId_PK_FK])
REFERENCES [dbo].[Customer] ([CustomerId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Customer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([AccountId_FK])
REFERENCES [dbo].[Account] ([AccountId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[DayOfConference]  WITH CHECK ADD  CONSTRAINT [FK_DayOfConference_Conference] FOREIGN KEY([ConferenceId_FK])
REFERENCES [dbo].[Conference] ([ConferenceId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DayOfConference] CHECK CONSTRAINT [FK_DayOfConference_Conference]
GO
ALTER TABLE [dbo].[DayOfConference]  WITH CHECK ADD  CONSTRAINT [FK_DayOfConference_Event] FOREIGN KEY([EventsId_PK_FK])
REFERENCES [dbo].[Event] ([EventsId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DayOfConference] CHECK CONSTRAINT [FK_DayOfConference_Event]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_Discount_Conference] FOREIGN KEY([ConferenceId_FK])
REFERENCES [dbo].[Conference] ([ConferenceId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_Discount_Conference]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Account] FOREIGN KEY([AccountId_FK])
REFERENCES [dbo].[Account] ([AccountId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Account]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Company] FOREIGN KEY([CustomerCompanyId_FK])
REFERENCES [dbo].[Company] ([CustomerId_PK_FK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Company]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Person] FOREIGN KEY([CustomerId_PK_FK])
REFERENCES [dbo].[Person] ([CustomerId_PK_FK])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Person]
GO
ALTER TABLE [dbo].[ParticipantsEvents]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantsEvents_Person] FOREIGN KEY([CustomerId_PK_FK])
REFERENCES [dbo].[Person] ([CustomerId_PK_FK])
GO
ALTER TABLE [dbo].[ParticipantsEvents] CHECK CONSTRAINT [FK_ParticipantsEvents_Person]
GO
ALTER TABLE [dbo].[ParticipantsEvents]  WITH CHECK ADD  CONSTRAINT [FK_ParticipantsEvents_ReservationDetails] FOREIGN KEY([ReservationId_PK_FK], [EventsId_PK_FK])
REFERENCES [dbo].[ReservationDetails] ([ReservationId_PK_FK], [EventsId_PK_FK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ParticipantsEvents] CHECK CONSTRAINT [FK_ParticipantsEvents_ReservationDetails]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Customer] FOREIGN KEY([CustomerId_PK_FK])
REFERENCES [dbo].[Customer] ([CustomerId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Customer]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Customer] FOREIGN KEY([CustomerId_FK])
REFERENCES [dbo].[Customer] ([CustomerId_PK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Customer]
GO
ALTER TABLE [dbo].[ReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReservationDetails_Event] FOREIGN KEY([EventsId_PK_FK])
REFERENCES [dbo].[Event] ([EventsId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationDetails] CHECK CONSTRAINT [FK_ReservationDetails_Event]
GO
ALTER TABLE [dbo].[ReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReservationDetails_Reservation] FOREIGN KEY([ReservationId_PK_FK])
REFERENCES [dbo].[Reservation] ([ReservationId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationDetails] CHECK CONSTRAINT [FK_ReservationDetails_Reservation]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Person] FOREIGN KEY([CustomerId_PK_FK])
REFERENCES [dbo].[Person] ([CustomerId_PK_FK])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Person]
GO
ALTER TABLE [dbo].[WorkshopDetails]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopDetails_DayOfConference] FOREIGN KEY([DayOfConferenceEventsId_FK])
REFERENCES [dbo].[DayOfConference] ([EventsId_PK_FK])
GO
ALTER TABLE [dbo].[WorkshopDetails] CHECK CONSTRAINT [FK_WorkshopDetails_DayOfConference]
GO
ALTER TABLE [dbo].[WorkshopDetails]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopDetails_Event] FOREIGN KEY([EventsId_PK_FK])
REFERENCES [dbo].[Event] ([EventsId_PK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkshopDetails] CHECK CONSTRAINT [FK_WorkshopDetails_Event]
GO
ALTER TABLE [dbo].[WorkshopDetails]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopDetails_Workshop] FOREIGN KEY([WorkshopId_FK])
REFERENCES [dbo].[Workshop] ([WorkshopId_PK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[WorkshopDetails] CHECK CONSTRAINT [FK_WorkshopDetails_Workshop]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [CK_Account_Login] CHECK  ((len([Login])>=(6) AND len([Login])<=(20)))
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [CK_Account_Login]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [CK_Account_Pass] CHECK  ((len([Pass])>=(6) AND len([Pass])<=(20)))
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [CK_Account_Pass]
GO
ALTER TABLE [dbo].[AccountType]  WITH CHECK ADD  CONSTRAINT [CK_AccountType_Type] CHECK  (([Type]='CustomerIndividual' OR [Type]='CustomerCompany' OR [Type]='Organizer' OR [Type]='Secretary'))
GO
ALTER TABLE [dbo].[AccountType] CHECK CONSTRAINT [CK_AccountType_Type]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [CK_Company_NIP] CHECK  (([NIP] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [CK_Company_NIP]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [CK_Company_REGON] CHECK  (([REGON] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [CK_Company_REGON]
GO
ALTER TABLE [dbo].[Conference]  WITH CHECK ADD  CONSTRAINT [CK_Conference_Date] CHECK  (([Startdate]<=[EndDate]))
GO
ALTER TABLE [dbo].[Conference] CHECK CONSTRAINT [CK_Conference_Date]
GO
ALTER TABLE [dbo].[Conference]  WITH CHECK ADD  CONSTRAINT [CK_Conference_PriceForDay] CHECK  (([PriceForDay]>(0)))
GO
ALTER TABLE [dbo].[Conference] CHECK CONSTRAINT [CK_Conference_PriceForDay]
GO
ALTER TABLE [dbo].[Conference]  WITH CHECK ADD  CONSTRAINT [CK_Conference_StudentDiscount] CHECK  (([StudentDiscount]>=(0) AND [StudentDiscount]<(1)))
GO
ALTER TABLE [dbo].[Conference] CHECK CONSTRAINT [CK_Conference_StudentDiscount]
GO
ALTER TABLE [dbo].[Conference]  WITH CHECK ADD  CONSTRAINT [CK_Conference_TotalPlaces] CHECK  (([TotalPlaces]>(0)))
GO
ALTER TABLE [dbo].[Conference] CHECK CONSTRAINT [CK_Conference_TotalPlaces]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CK_Customer_Phone] CHECK  (([Phone] like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR [Phone] like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CK_Customer_Phone]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [CK_Discount_HeightDiscount] CHECK  (([HeightDiscount]>=(0) AND [HeightDiscount]<(1)))
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [CK_Discount_HeightDiscount]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [CK_Discount_NrDays] CHECK  (([NrDaysBeforeConference]>=(0)))
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [CK_Discount_NrDays]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_PESEL] CHECK  (([PESEL] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_PESEL]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_Phone] CHECK  (([Phone] like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR [Phone] like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_Phone]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [CK_Event_Places] CHECK  (([ReservedPlaces]>=(0)))
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [CK_Event_Places]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [CK_Person_PESEL] CHECK  (([PESEL] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [CK_Person_PESEL]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [CK_Reservation_Date] CHECK  (([DateOfReservation]<[TermOfContribution] AND [DateOfReservation]<=[DateOfContribution]))
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [CK_Reservation_Date]
GO
ALTER TABLE [dbo].[ReservationDetails]  WITH CHECK ADD  CONSTRAINT [CK_ReservationDetails_NumberOfPlaces] CHECK  (([NumberOfPlaces]>(0)))
GO
ALTER TABLE [dbo].[ReservationDetails] CHECK CONSTRAINT [CK_ReservationDetails_NumberOfPlaces]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CK_Student_CardNumber] CHECK  (([CardNumber] like '[0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CK_Student_CardNumber]
GO
ALTER TABLE [dbo].[WorkshopDetails]  WITH CHECK ADD  CONSTRAINT [CK_WorkshopDetails_Price] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[WorkshopDetails] CHECK CONSTRAINT [CK_WorkshopDetails_Price]
GO
ALTER TABLE [dbo].[WorkshopDetails]  WITH CHECK ADD  CONSTRAINT [CK_WorkshopDetails_Time] CHECK  (([StartTime]<[EndTime] AND CONVERT([date],[StartTime])=CONVERT([date],[EndTime])))
GO
ALTER TABLE [dbo].[WorkshopDetails] CHECK CONSTRAINT [CK_WorkshopDetails_Time]
GO
ALTER TABLE [dbo].[WorkshopDetails]  WITH CHECK ADD  CONSTRAINT [CK_WorkshopDetails_TotalPlaces] CHECK  (([TotalPlaces]>(0)))
GO
ALTER TABLE [dbo].[WorkshopDetails] CHECK CONSTRAINT [CK_WorkshopDetails_TotalPlaces]
GO
/****** Object:  StoredProcedure [dbo].[AddConference]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddConference]
	@Name nvarchar(50),
	@Price float,
	@StartDate nvarchar(20),
	@EndDate nvarchar(20),
	@TotalPlaces int,
	@Address nvarchar(50),
	@StudentDiscount float

AS
BEGIN
    SET NOCOUNT ON;
 
	INSERT INTO [dbo].[Conference]
           ([Name]
           ,[PriceForDay]
           ,[StartDate]
           ,[EndDate]
           ,[TotalPlaces]
		   ,[Address]
		   ,[StudentDiscount])
     VALUES
           (@Name
           ,@Price
           ,CONVERT(date, @StartDate)
           ,CONVERT(date, @EndDate)
           ,@TotalPlaces
		   ,@Address
		   ,@StudentDiscount)      
END
GO
/****** Object:  StoredProcedure [dbo].[AddConferenceDay]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE PROCEDURE [dbo].[AddConferenceDay]
    @ConferenceId int,
	@ConferenceDate nvarchar(20),
	@Description text

AS
BEGIN
    SET NOCOUNT ON;

	exec AddEvent

	DECLARE @EventId int
	SET @EventId = (SELECT MAX(e.EventsId_PK) FROM [dbo].Event AS e)
 
	INSERT INTO [dbo].[DayOfConference]
           ([EventsId_PK_FK]
           ,[ConferenceId_FK]
           ,[ConferenceDay]
           ,[Description])
     VALUES
           (@EventId
           ,@ConferenceId
           ,CONVERT(date, @ConferenceDate)
           ,@Description)
		   
		   END

GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddCustomer]
	@Address nvarchar(50),
	@Phone nvarchar(20),
	@Mail nvarchar(40)

AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @AccountId int
	SET @AccountId = (SELECT MAX(a.AccountId_PK) FROM [dbo].Account AS a)
 
    INSERT INTO [dbo].[Customer]
           ([AccountId_FK]
		   ,[Address]
		   ,[Phone]
		   ,[E-mail])
     VALUES
           (@AccountId
		   ,@Address
		   ,@Phone
		   ,@Mail)       
END
GO
/****** Object:  StoredProcedure [dbo].[AddCustomerCompany]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddCustomerCompany]
    @CompanyName nvarchar(20),
	@NIP nvarchar(10),
	@REGON nvarchar(9),
	@Address nvarchar(50),
	@Phone nvarchar(20),
	@Mail nvarchar(40),
	@Login nvarchar(20),
	@Pass nvarchar(20),
	@AccountType nvarchar(20)

 
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRAN
	BEGIN TRY
		exec CreateNewAccount @Login, @Pass, @AccountType
		exec AddCustomer @Address, @Phone, @Mail

		DECLARE @CustomerId int
		SET @CustomerId = (SELECT MAX(c.CustomerId_PK) FROM [dbo].Customer AS c)
 
		INSERT INTO [dbo].[Company]
           ([CustomerId_PK_FK]
           ,[CompanyName]
           ,[NIP]
           ,[REGON])
		VALUES
           (@CustomerId
           ,@CompanyName
           ,@NIP
           ,@REGON)
	
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
		RAISERROR ('Something was wrong - cannot add this user.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
	END CATCH
	     
END
GO
/****** Object:  StoredProcedure [dbo].[AddCustomerIndividual]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddCustomerIndividual]
    @FirstName nvarchar(20),
	@LastName nvarchar(20),
	@PESEL nvarchar(11),
	@Address nvarchar(50),
	@Phone nvarchar(20),
	@Mail nvarchar(40),
	@Login nvarchar(20),
	@Pass nvarchar(20),
	@AccountType nvarchar(20)

 
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRAN
	BEGIN TRY

	exec CreateNewAccount @Login, @Pass, @AccountType
	exec AddCustomer @Address, @Phone, @Mail

	DECLARE @CustomerId int
	SET @CustomerId = (SELECT MAX(c.CustomerId_PK) FROM [dbo].Customer AS c)
 
    INSERT INTO [dbo].[Person]
           ([CustomerId_PK_FK]
		   ,[PESEL]
		   ,[FirstName]
		   ,[LastName])
	VALUES
           (@CustomerId
		   ,@PESEL
		   ,@FirstName
		   ,@LastName)    
		   
		   
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		exec GetErrorInfo
		IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
	END CATCH
	   
END
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddEmployee]
    @FirstName nvarchar(20),
	@LastName nvarchar(20),
	@PESEL nvarchar(11),
	@Address nvarchar(50),
	@Phone nvarchar(20),
	@Mail nvarchar(40),
	@Login nvarchar(20),
	@Pass nvarchar(20),
	@AccountType nvarchar(20)

AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRAN
	BEGIN TRY


	exec CreateNewAccount @Login, @Pass, @AccountType

	DECLARE @AccountId int
	SET @AccountId = (SELECT MAX(a.AccountId_PK) FROM [dbo].Account AS a)
 
INSERT INTO [dbo].[Employee]
           ([AccountId_FK]
           ,[PESEL]
           ,[FirstName]
           ,[LastName]
           ,[Address]
           ,[Phone]
           ,[E-mail])
     VALUES
           (@AccountId
           ,@PESEL
           ,@FirstName
           ,@LastName
           ,@Address
           ,@Phone
           ,@Mail)   
		   
		   
		   		COMMIT TRAN
	END TRY

	BEGIN CATCH
				IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
		RAISERROR ('Something was wrong - cannot add this employee.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
	END CATCH  
END
GO
/****** Object:  StoredProcedure [dbo].[AddEvent]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddEvent]
 
AS
BEGIN
    SET NOCOUNT ON;
 
    INSERT INTO [dbo].[Event]
           ([ReservedPlaces])
     VALUES
           (0)    
END
GO
/****** Object:  StoredProcedure [dbo].[AddParticipant]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddParticipant]
	@ReservationId int,
	@EventId int,
	@CustomerId int

AS
BEGIN
    SET NOCOUNT ON;

	INSERT INTO [dbo].[ParticipantsEvents]
           ([ReservationId_PK_FK]
           ,[EventsId_PK_FK]
           ,[CustomerId_PK_FK])
     VALUES
           (@ReservationId
           ,@EventId
           ,@CustomerId)    
END
GO
/****** Object:  StoredProcedure [dbo].[AddPayment]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddPayment]
	@ReservationId_PK int

 
AS
BEGIN
    SET NOCOUNT ON;
 
    UPDATE Reservation SET DateOfContribution = GETDATE() WHERE ReservationId_PK = @ReservationId_PK
	   
END
GO
/****** Object:  StoredProcedure [dbo].[AddPersonCompany]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddPersonCompany]
    @FirstName nvarchar(20),
	@LastName nvarchar(20),
	@PESEL nvarchar(11),
	@Address nvarchar(50),
	@Phone nvarchar(20),
	@Mail nvarchar(40),
	@Login nvarchar(20),
	@Pass nvarchar(20),
	@AccountType nvarchar(20),
	@CompanyId int

AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRAN
	BEGIN TRY

	exec CreateNewAccount @Login, @Pass, @AccountType
	exec AddCustomer @Address, @Phone, @Mail

	DECLARE @CustomerId int
	SET @CustomerId = (SELECT MAX(c.CustomerId_PK) FROM [dbo].Customer AS c)
 
    INSERT INTO [dbo].[Person]
           ([CustomerId_PK_FK]
		   ,[PESEL]
		   ,[FirstName]
		   ,[LastName])
	VALUES
           (@CustomerId
		   ,@PESEL
		   ,@FirstName
		   ,@LastName)
		   
	INSERT INTO [dbo].[Employment]
           ([CustomerId_PK_FK]
           ,[CustomerCompanyId_FK])
     VALUES
           (@CustomerId
           ,@CompanyId)


		   		COMMIT TRAN
	END TRY

	BEGIN CATCH
				IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
		RAISERROR ('Something was wrong - cannot add this person.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddStudent]
	@CustomerId int,
	@CardNumber nvarchar(6)

AS
BEGIN
    SET NOCOUNT ON;
 
	INSERT INTO [dbo].[Student]
           ([CustomerId_PK_FK]
           ,[CardNumber])
     VALUES
           (@CustomerId
           ,@CardNumber)    
END
GO
/****** Object:  StoredProcedure [dbo].[AddWorkshopDefinition]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[AddWorkshopDefinition]
	@Name nvarchar(30),
	@Description text

AS
BEGIN
    SET NOCOUNT ON;
 
	INSERT INTO [dbo].[Workshop]
           ([Name]
           ,[Description])
     VALUES
           (@Name
           ,@Description)   
END
GO
/****** Object:  StoredProcedure [dbo].[AddWorkshopToConference]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE PROCEDURE [dbo].[AddWorkshopToConference]
	@WorkshopId int,
    @ConferenceEventId int,
	@StartTime nvarchar(20),
	@EndTime nvarchar(20),
	@Price float,
	@TotalPlaces int

AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRAN
	BEGIN TRY

	exec AddEvent

	DECLARE @EventId int
	SET @EventId = (SELECT MAX(e.EventsId_PK) FROM [dbo].Event AS e)

	DECLARE @Date date
	SET @Date = (SELECT ConferenceDay FROM DayOfConference WHERE EventsId_PK_FK = @ConferenceEventId)
 
	INSERT INTO [dbo].[WorkshopDetails]
           ([EventsId_PK_FK]
           ,[WorkshopId_FK]
           ,[DayOfConferenceEventsId_FK]
           ,[StartTime]
           ,[EndTime]
           ,[Price]
		   ,[TotalPlaces])
     VALUES
           (@EventId
           ,@WorkshopId
           ,@ConferenceEventId
           ,CAST(@date AS DATETIME) + CAST(@StartTime AS DATETIME)
           ,CAST(@date AS DATETIME) + CAST(@EndTime AS DATETIME)
           ,@Price
		   ,@TotalPlaces)


	COMMIT TRAN
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
		RAISERROR ('Something was wrong - cannot add this workshop to conference day.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
	END CATCH
		   
		   END

GO
/****** Object:  StoredProcedure [dbo].[CreateAccountType]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[CreateAccountType]
    @Type nvarchar(20)
 
AS
BEGIN
    SET NOCOUNT ON;
 
    INSERT INTO [dbo].[AccountType]
           ([Type])
     VALUES
           (@Type)       
END
GO
/****** Object:  StoredProcedure [dbo].[CreateDiscountType]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[CreateDiscountType]
    @PercentValue float,
	@Days int,
	@Description text,
	@ConferenceId int
 
AS
BEGIN
    SET NOCOUNT ON;
 
	INSERT INTO [dbo].[Discount]
           ([HeightDiscount]
           ,[NrDaysBeforeConference]
           ,[Description]
           ,[ConferenceId_FK])
     VALUES
           (@PercentValue
           ,@Days
           ,@Description
           ,@ConferenceId)
		   
END
GO
/****** Object:  StoredProcedure [dbo].[CreateNewAccount]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[CreateNewAccount]
	@Login nvarchar(20),
	@Pass nvarchar(20),
	@AccountType nvarchar(20)

 
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRAN
	BEGIN TRY

	DECLARE @AccountTypeId varchar(20)
	SET @AccountTypeId = (SELECT at.AccountTypeId_PK FROM [dbo].AccountType AS at WHERE at.Type = @AccountType);
 
    INSERT INTO [dbo].[Account]
           ([AccountTypeId_FK]
		   ,[Login]
		   ,[Pass])
     VALUES
           (@AccountTypeId
		   ,@Login
		   ,@Pass)     
		   
		   
	COMMIT TRAN
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
	END CATCH  
END
GO
/****** Object:  StoredProcedure [dbo].[CreateNewReservationItem]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[CreateNewReservationItem]
    @CustomerId int

AS
BEGIN
    SET NOCOUNT ON;
 
	INSERT INTO [dbo].[Reservation]
           ([CustomerId_FK]
           ,[DateOfReservation]
           ,[TermOfContribution]
           ,[DateOfContribution])
     VALUES
           (@CustomerId
           ,CONVERT(date, GETDATE())
           ,DATEADD(day, 7, CONVERT(date, GETDATE()))
           ,NULL)   
END
GO
/****** Object:  StoredProcedure [dbo].[GetErrorInfo]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetErrorInfo]
AS
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() as ErrorState,
        ERROR_PROCEDURE() as ErrorProcedure,
        ERROR_LINE() as ErrorLine,
        ERROR_MESSAGE() as ErrorMessage;

GO
/****** Object:  StoredProcedure [dbo].[ModifyEventNumberOfPlaces]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[ModifyEventNumberOfPlaces]
	@EventId int,
	@NumberOfPlaces int

 
AS
BEGIN
    SET NOCOUNT ON;

	UPDATE Event SET TotalPlaces = @NumberOfPlaces WHERE EventsId_PK = @EventId
  
END
GO
/****** Object:  StoredProcedure [dbo].[ReserveEventCustomerCompany]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReserveEventCustomerCompany]
	@ReservationId int,
    @EventId int,
	@Places int

AS
BEGIN
    SET NOCOUNT ON;
 
	INSERT INTO [dbo].[ReservationDetails]
           ([ReservationId_PK_FK]
           ,[EventsId_PK_FK]
           ,[NumberOfPlaces])
     VALUES
           (@ReservationId
           ,@EventId
           ,@Places)

END
GO
/****** Object:  StoredProcedure [dbo].[ReserveEventCustomerIndividual]    Script Date: 2016-02-01 16:53:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReserveEventCustomerIndividual]
	@ReservationId int,
    @EventId int

AS
BEGIN
    SET NOCOUNT ON;

		BEGIN TRAN
	BEGIN TRY

	DECLARE @CustomerId int
	SET @CustomerId = (SELECT CustomerId_FK FROM Reservation WHERE ReservationId_PK = @ReservationId)
	
	DECLARE @Places int
	SET @Places = 1
 
	INSERT INTO [dbo].[ReservationDetails]
           ([ReservationId_PK_FK]
           ,[EventsId_PK_FK]
           ,[NumberOfPlaces])
     VALUES
           (@ReservationId
           ,@EventId
           ,@Places)

	exec AddParticipant @ReservationId, @EventId, @CustomerId

			COMMIT TRAN
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRAN; 
		RAISERROR ('Something was wrong - cannot make reservation to this person/event.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
	END CATCH

END



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
         Begin Table = "Company"
            Begin Extent = 
               Top = 5
               Left = 8
               Bottom = 134
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 3
               Left = 242
               Bottom = 132
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Reservation"
            Begin Extent = 
               Top = 9
               Left = 459
               Bottom = 104
               Right = 638
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
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BestCompanyClients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BestCompanyClients'
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
         Begin Table = "Customer"
            Begin Extent = 
               Top = 10
               Left = 243
               Bottom = 139
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 10
               Left = 16
               Bottom = 139
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Reservation"
            Begin Extent = 
               Top = 11
               Left = 472
               Bottom = 106
               Right = 651
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
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BestIndividualClients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BestIndividualClients'
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DT"
            Begin Extent = 
               Top = 198
               Left = 38
               Bottom = 327
               Right = 251
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
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ChargeCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ChargeCompany'
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
         Top = -288
         Left = -389
      End
      Begin Tables = 
         Begin Table = "DT"
            Begin Extent = 
               Top = 294
               Left = 427
               Bottom = 423
               Right = 640
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
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ChargeCustomerIndividuala'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ChargeCustomerIndividuala'
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
         Begin Table = "Conference"
            Begin Extent = 
               Top = 6
               Left = 13
               Bottom = 135
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DayOfConference"
            Begin Extent = 
               Top = 6
               Left = 216
               Bottom = 135
               Right = 394
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Workshop"
            Begin Extent = 
               Top = 21
               Left = 749
               Bottom = 133
               Right = 921
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WorkshopDetails"
            Begin Extent = 
               Top = 15
               Left = 457
               Bottom = 144
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfConferenceWorkshops'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfConferenceWorkshops'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfConferenceWorkshops'
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
         Left = -96
      End
      Begin Tables = 
         Begin Table = "Conference"
            Begin Extent = 
               Top = 6
               Left = 0
               Bottom = 135
               Right = 179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DayOfConference"
            Begin Extent = 
               Top = 6
               Left = 206
               Bottom = 135
               Right = 384
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ParticipantsEvents"
            Begin Extent = 
               Top = 30
               Left = 424
               Bottom = 142
               Right = 621
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 12
               Left = 645
               Bottom = 141
               Right = 833
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
      Begin ColumnWidths = 9
         Width = 284
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
         Or ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfParticipantsConference'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfParticipantsConference'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfParticipantsConference'
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
         Top = -192
         Left = -22
      End
      Begin Tables = 
         Begin Table = "ParticipantsEvents"
            Begin Extent = 
               Top = 137
               Left = 518
               Bottom = 249
               Right = 715
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 136
               Left = 768
               Bottom = 265
               Right = 956
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Workshop"
            Begin Extent = 
               Top = 148
               Left = 10
               Bottom = 260
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WorkshopDetails"
            Begin Extent = 
               Top = 139
               Left = 218
               Bottom = 268
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DayOfConference"
            Begin Extent = 
               Top = 272
               Left = 529
               Bottom = 401
               Right = 707
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
      Begin ColumnWidths = 9
         Width = 284
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
         Column =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfParticipantsWorkshop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1440
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfParticipantsWorkshop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ListOfParticipantsWorkshop'
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
         Begin Table = "Conference"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DayOfConference"
            Begin Extent = 
               Top = 6
               Left = 255
               Bottom = 135
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ParticipantsEvents"
            Begin Extent = 
               Top = 6
               Left = 471
               Bottom = 118
               Right = 668
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
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PopularConference'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PopularConference'
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
         Begin Table = "ParticipantsEvents"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 118
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WorkshopDetails"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 135
               Right = 518
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Workshop"
            Begin Extent = 
               Top = 6
               Left = 556
               Bottom = 118
               Right = 728
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
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PopularWorkshops'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PopularWorkshops'
GO
USE [master]
GO
ALTER DATABASE [gladys] SET  READ_WRITE 
GO
