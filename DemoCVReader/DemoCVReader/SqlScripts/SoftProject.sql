GO
USE [master]
GO
/****** Object:  Database [SoftProject]    Script Date: 12/06/2018 7:29:19 PM ******/
CREATE DATABASE [SoftProject]


ALTER DATABASE [SoftProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoftProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoftProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoftProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoftProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoftProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoftProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoftProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoftProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoftProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoftProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoftProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoftProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoftProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoftProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoftProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoftProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SoftProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoftProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoftProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoftProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoftProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoftProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoftProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoftProject] SET RECOVERY FULL 
GO
ALTER DATABASE [SoftProject] SET  MULTI_USER 
GO
ALTER DATABASE [SoftProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoftProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoftProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoftProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoftProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SoftProject', N'ON'
GO
ALTER DATABASE [SoftProject] SET QUERY_STORE = OFF
GO
USE [SoftProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SoftProject]
GO
/****** Object:  FullTextCatalog [_SkillSetIndexing]    Script Date: 12/06/2018 7:29:20 PM ******/
CREATE FULLTEXT CATALOG [_SkillSetIndexing]WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/06/2018 7:29:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/06/2018 7:29:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NULL,
	[EmailId] [nvarchar](255) NULL,
	[PasswordHash] [nvarchar](300) NULL,
	[SaltKey] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVInfo]    Script Date: 12/06/2018 7:29:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[TextualData] [nvarchar](max) NULL,
	[Rating] [smallint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[FileBytes] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_CVInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillSet]    Script Date: 12/06/2018 7:29:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Rating] [smallint] NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_InformationData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 1) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (2, N'Programming Language', N'Programming Language')
GO
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (3, N'IDE', N'IDE')
GO
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (4, N'Platform', N'Platform')
GO
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (5, N'Architechture', N'Architechture')
GO
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (7, N'Networking', N'Hardware Software Networking')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[SkillSet] ON 
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (1, N'C', N'C', 5, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (2, N'C++', N'C++', 5, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (3, N'C#', N'C#', 5, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (4, N'JAVA', N'JAVA', 5, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (7, N'Python', N'Python', 8, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (8, N'VB', N'VB', 8, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (9, N'Pearl', N'Pearl', 8, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (11, N'Dart', N'Dart', 7, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (12, N'Html', N'Html', 2, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (13, N'CSS', N'CSS', 2, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (14, N'Javascript', N'JavaScript', 2, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (15, N'Visual Studio', N'Visual Studio', 4, 3)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (16, N'NetBeans', N'NetBeans', 4, 3)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (17, N'Eclipse', N'Eclipse', 4, 3)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (18, N'.Net', N'.Net', 6, 4)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (19, N'Android', N'Android', 6, 4)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (20, N'IOS', N'IOS', 6, 4)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (21, N'AJAX', N'AJAX', 6, 4)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (22, N'MVC', N'MVC', 6, 5)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (23, N'Singleton', N'Singleton', 1, 5)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (24, N'Factory Pattern', N'Factory Pattern', 1, 5)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (25, N'3 Tier', N'3 Tier', 1, 5)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (26, N'Hibernate', N'Hibernate', 1, 5)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (27, N'dojo', N'dojo', 1, 5)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (28, N'R Programming', N'R language', 5, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (29, N'ASP,net', N'ASP Web Languages', 4, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (30, N'ASP.net', N'ASP Web Languages', 4, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (31, N'PHP', N'PHP', 4, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (32, N'SSIS', N'SSIS', 4, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (33, N'SSRS', N'SSRS', 4, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (34, N'WCF', N'WCF', 4, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (35, N'WPF', N'WPF', 4, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (36, N'Eclipse', N'Eclipse', 4, 4)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (37, N'Ruby', N'Ruby Langauge', 5, 2)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (38, N'Blueberry', N'Blueberry Enterprise', 6, 5)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (39, N'Android Studio', N'Mobile Applications', 6, 3)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (40, N'CCNA', N'Cisco Certified Network Administrator', 5, 7)
GO
INSERT [dbo].[SkillSet] ([Id], [Name], [Description], [Rating], [CategoryId]) VALUES (41, N'ccnp', N'ccno ', 5, 7)
GO
SET IDENTITY_INSERT [dbo].[SkillSet] OFF
GO
ALTER TABLE [dbo].[CVInfo]  WITH CHECK ADD  CONSTRAINT [FK_CVInfo_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CVInfo] CHECK CONSTRAINT [FK_CVInfo_Customer]
GO
ALTER TABLE [dbo].[SkillSet]  WITH CHECK ADD  CONSTRAINT [FK_InformationData_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[SkillSet] CHECK CONSTRAINT [FK_InformationData_Category]
GO
/****** Object:  StoredProcedure [dbo].[sp_AnalyseSkillSetForTextualInfo]    Script Date: 12/06/2018 7:29:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ashwin Semwal>
-- Create date: <8/06/2018>
-- Description:	<Analyse Skill set for Technical>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AnalyseSkillSetForTextualInfo]
@textinput nvarchar(MAX)
AS
BEGIN


declare @tempCV table
(
id int identity(1,1),
textdata nvarchar(MAx)
)

declare @tempSkill table
(
tempid int identity(1,1),
skillID int
)

insert into @tempSkill(skillID)
select id from SkillSet

declare @count int =  (select count(1) from @tempSkill) 
declare @i int= 0
declare @skill_Name nvarchar(300)

declare @detailedresult table
(
Categoryid int,
skillID int,
dataFound nvarchar(200),
CategoryName nvarchar(200),
datavalue int,

datavaluewithcommaInfront int,
datavaluewithcommabothSide int,
datavaluewithcommaBack int ,
datavaluewithfullstop int 
)

declare @result table
(
dataFound nvarchar(200),
CategoryName nvarchar(200)
)


insert into @detailedresult
select 
C.CategoryId,
SS.Id,
C.Name,
SS.Name, 
PATINDEX('% '+Lower(SS.Name)+' %',lower(@textinput)),
PATINDEX('%,'+Lower(SS.Name)+'%',lower(@textinput)),
PATINDEX('%,'+Lower(SS.Name)+',%',lower(@textinput)),
PATINDEX('%'+Lower(SS.Name)+',%',lower(@textinput)),
PATINDEX('%'+Lower(SS.Name)+'.%',lower(@textinput))

from SkillSet SS
join Category C on C.CategoryId = SS.CategoryId





insert into @result
select datafound,CategoryName from @detailedresult where datavalue <> 0 or datavaluewithcommaBack <> 0 or datavaluewithcommabothSide <> 0 or datavaluewithcommaInfront <> 0 or datavaluewithfullstop <>0

select distinct t.dataFound as 'Category',
  STUFF((SELECT distinct ', ' + t1.CategoryName
         from @result t1
         where t.dataFound = t1.dataFound
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,2,'') Skills
from @result t;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateNewCategory]    Script Date: 12/06/2018 7:29:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ashwin Semwal>
-- Create date: <8/06/2018>
-- Description:	<Category /Skill set for Technical>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateNewCategory]
@categoryName nvarchar(500),
@cateogryDescription nvarchar(500)
AS
BEGIN
    
	declare @_categoryName_lowercase nvarchar(500) = Lower(@categoryName)

	if not exists(select * from Category where  Lower(Name) = @_categoryName_lowercase)
	begin
	    insert into Category(Name,Description) values (@categoryName,@cateogryDescription)
	end
	else
	begin
	   update Category set Description = @cateogryDescription where Lower(Name) = @_categoryName_lowercase 
	end


END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateNewSkillSet]    Script Date: 12/06/2018 7:29:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ashwin Semwal>
-- Create date: <8/06/2018>
-- Description:	<Skill set for Technical>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateNewSkillSet]
@categoryID int,
@categoryName nvarchar(500),
@cateogryDescription nvarchar(500),
@skillName nvarchar(500),
@skillDescription nvarchar(500),
@skillRating nvarchar(500)
AS
BEGIN
    
	declare @_categoryId int

	if(@categoryID is null or @categoryID < 1)
	begin
	declare @_categoryName_lowercase nvarchar(500) = Lower(@categoryName)

	if not exists(select * from Category where  Lower(Name) = @_categoryName_lowercase)
	begin
	    insert into Category(Name,Description) values (@categoryName,@cateogryDescription)	    
	end
	else
	begin
	   update Category set Description = @cateogryDescription where Lower(Name) = @_categoryName_lowercase 
	end

	set @_categoryId  = (select CategoryId from Category where  Lower(Name) = @_categoryName_lowercase)
	end
	else
	begin
	     set @_categoryId  = @categoryID	
	end


	if(@_categoryId is not null)
	begin

	 if(LEN(@skillName) > 0)
	 begin
	    
		if not exists(select * from SkillSet where lower(Name) = lower(@skillName) and CategoryId = @_categoryId)
		begin
	     insert into SkillSet(Name,Description,Rating,CategoryId) values (@skillName,@skillDescription,@skillRating,@_categoryId)
		end
		else
		begin
		    declare @_skillsetid int= (select Id from SkillSet where lower(Name) = lower(@skillName) and CategoryId = @_categoryID)
			 if(@cateogryDescription is null )
			 begin
			  set @cateogryDescription = ''
			  update SkillSet set @cateogryDescription = @cateogryDescription where id = @_skillsetid
			 end
			 else
			 begin 
			  update SkillSet set @cateogryDescription = @cateogryDescription where id = @_skillsetid
			 end

			 set @skillRating = @skillRating % 11

			 if(@skillRating > 0)
			 begin
			  update SkillSet set Rating = @skillRating where id = @_skillsetid
			 end

			 
			 


		end
      end

	end

END
GO
USE [master]
GO
ALTER DATABASE [SoftProject] SET  READ_WRITE 
GO

GO