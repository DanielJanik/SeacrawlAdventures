USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[Place]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NULL,
	[Name] [nvarchar](50) NULL,
	[Icon] [nvarchar](10) NULL,
	[Symbol] [nvarchar](4) NULL,
	[IsDungeon] [bit] NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Place] ON 

INSERT [dbo].[Place] ([Id], [Type], [Name], [Icon], [Symbol], [IsDungeon]) VALUES (1, 1, N'Juneau', N'🏕', N'j', 0)
INSERT [dbo].[Place] ([Id], [Type], [Name], [Icon], [Symbol], [IsDungeon]) VALUES (2, 1, N'Helsinki', N'🕌', N'h', 0)
INSERT [dbo].[Place] ([Id], [Type], [Name], [Icon], [Symbol], [IsDungeon]) VALUES (3, 1, N'Denali', N'🏰', N'e', 0)
INSERT [dbo].[Place] ([Id], [Type], [Name], [Icon], [Symbol], [IsDungeon]) VALUES (4, 1, N'Shiloh', N'🏛', N's', 1)
INSERT [dbo].[Place] ([Id], [Type], [Name], [Icon], [Symbol], [IsDungeon]) VALUES (5, 1, N'Mystic', N'🔮', N'm', 0)
INSERT [dbo].[Place] ([Id], [Type], [Name], [Icon], [Symbol], [IsDungeon]) VALUES (6, 1, N'Circus', N'🎪', N'c', 0)
SET IDENTITY_INSERT [dbo].[Place] OFF
