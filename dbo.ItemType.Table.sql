USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[TypeDesc] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ItemType] ON 

INSERT [dbo].[ItemType] ([Id], [TypeDesc]) VALUES (1, N'Weapon')
INSERT [dbo].[ItemType] ([Id], [TypeDesc]) VALUES (2, N'Gold')
INSERT [dbo].[ItemType] ([Id], [TypeDesc]) VALUES (3, N'Armor')
INSERT [dbo].[ItemType] ([Id], [TypeDesc]) VALUES (4, N'Junk')
SET IDENTITY_INSERT [dbo].[ItemType] OFF
