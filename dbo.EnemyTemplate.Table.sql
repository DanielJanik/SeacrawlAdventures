USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[EnemyTemplate]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnemyTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [tinyint] NULL,
	[Name] [nvarchar](50) NULL,
	[Health] [int] NULL,
	[Strength] [int] NULL,
	[Skill] [int] NULL,
	[Magic] [int] NULL,
	[Icon] [nvarchar](4) NULL,
	[DeathIcon] [nvarchar](4) NULL,
	[Symbol] [nvarchar](4) NULL,
	[XP] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EnemyTemplate] ON 

INSERT [dbo].[EnemyTemplate] ([Id], [TypeId], [Name], [Health], [Strength], [Skill], [Magic], [Icon], [DeathIcon], [Symbol], [XP]) VALUES (1, 3, N'viper', 5, 1, 3, 0, N'🐍', N'💀', N'n', 10)
INSERT [dbo].[EnemyTemplate] ([Id], [TypeId], [Name], [Health], [Strength], [Skill], [Magic], [Icon], [DeathIcon], [Symbol], [XP]) VALUES (2, 3, N'demon', 30, 8, 2, 0, N'😈', N'💀', N'@', 50)
INSERT [dbo].[EnemyTemplate] ([Id], [TypeId], [Name], [Health], [Strength], [Skill], [Magic], [Icon], [DeathIcon], [Symbol], [XP]) VALUES (3, 3, N'skeleton', 8, 1, 1, 5, N'💀', N'💀', N'k', 30)
INSERT [dbo].[EnemyTemplate] ([Id], [TypeId], [Name], [Health], [Strength], [Skill], [Magic], [Icon], [DeathIcon], [Symbol], [XP]) VALUES (4, 3, N'spider', 10, 3, 5, 0, N'🕷', N'💀', N'{', 20)
SET IDENTITY_INSERT [dbo].[EnemyTemplate] OFF
