USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[Record]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Total] [int] NULL,
	[Title] [nvarchar](500) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Record] ON 

INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (1, N'viper killed', 0, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (2, N'spider killed', 0, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (3, N'skeleton killed', 0, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (4, N'demon killed', 0, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (5, N'hydra killed', 0, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (6, N'bob killed', 0, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (7, N'Gold ', 0, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (8, N'XP', 0, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (9, N'XP Remaining', 10, N'')
INSERT [dbo].[Record] ([Id], [Name], [Total], [Title]) VALUES (10, N'Number of Turns', 32, N'')
SET IDENTITY_INSERT [dbo].[Record] OFF
