USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [tinyint] NULL,
	[Name] [nvarchar](50) NULL,
	[MaxHealth] [int] NULL,
	[Health] [int] NULL,
	[MaxStrength] [int] NULL,
	[Strength] [int] NULL,
	[MaxSkill] [int] NULL,
	[Skill] [int] NULL,
	[Perception] [int] NULL,
	[Magic] [int] NULL,
	[Icon] [nvarchar](4) NULL,
	[DeathIcon] [nvarchar](4) NULL,
	[Symbol] [nvarchar](4) NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Character] ON 

INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (1, 1, N'Jack', 20, 15, 3, 3, 1, 1, 1, 0, N'👦', N'⚰', N'*')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (5, 4, N'Hydra', 500, 500, 150, 150, 75, 75, 25, 35, N'🐉', N'💀', N'y')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (6, 2, N'Elephant', 50, 50, 50, 50, 1, 1, 10, 0, N'🐘', N'💀', N'a')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (7, 2, N'Tiger', 20, 20, 10, 10, 25, 25, 8, 0, N'🐅', N'💀', N't')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (8, 2, N'Bob', 5000, 5000, 1, 1, 1, 1, 1, 0, N'🐌', N'💀', N'l')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (9, 2, N'Turtle', 1, 1, 1, 1, 1, 1, 1, 0, N'🐢', N'💀', N'r')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (529, 3, N'viper', 5, 5, 1, 1, 3, 3, 1, 0, N'🐍', N'💀', N'n')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (530, 3, N'skeleton', 8, 8, 1, 1, 1, 1, 1, 5, N'💀', N'💀', N'k')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (531, 3, N'viper', 5, 5, 1, 1, 3, 3, 1, 0, N'🐍', N'💀', N'n')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (532, 3, N'skeleton', 8, 8, 1, 1, 1, 1, 1, 5, N'💀', N'💀', N'k')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (533, 3, N'viper', 5, 5, 1, 1, 3, 3, 1, 0, N'🐍', N'💀', N'n')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (534, 3, N'viper', 5, 5, 1, 1, 3, 3, 1, 0, N'🐍', N'💀', N'n')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (535, 3, N'viper', 5, 5, 1, 1, 3, 3, 1, 0, N'🐍', N'💀', N'n')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (536, 3, N'skeleton', 8, 8, 1, 1, 1, 1, 1, 5, N'💀', N'💀', N'k')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (538, 3, N'spider', 10, 10, 3, 3, 5, 5, 1, 0, N'🕷', N'💀', N'{')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (539, 3, N'skeleton', 8, 8, 1, 1, 1, 1, 1, 5, N'💀', N'💀', N'k')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (540, 3, N'demon', 30, 30, 8, 8, 2, 2, 1, 0, N'😈', N'💀', N'@')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (541, 3, N'viper', 5, 5, 1, 1, 3, 3, 1, 0, N'🐍', N'💀', N'n')
INSERT [dbo].[Character] ([Id], [TypeId], [Name], [MaxHealth], [Health], [MaxStrength], [Strength], [MaxSkill], [Skill], [Perception], [Magic], [Icon], [DeathIcon], [Symbol]) VALUES (542, 3, N'viper', 5, 5, 1, 1, 3, 3, 1, 0, N'🐍', N'💀', N'n')
SET IDENTITY_INSERT [dbo].[Character] OFF
