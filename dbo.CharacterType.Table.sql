USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[CharacterType]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsNPC] [bit] NULL,
	[IsPlayer] [bit] NULL,
	[IsEnemy] [bit] NULL,
	[IsBoss] [bit] NULL,
 CONSTRAINT [PK_CharacterType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CharacterType] ON 

INSERT [dbo].[CharacterType] ([Id], [IsNPC], [IsPlayer], [IsEnemy], [IsBoss]) VALUES (1, 0, 1, 0, 0)
INSERT [dbo].[CharacterType] ([Id], [IsNPC], [IsPlayer], [IsEnemy], [IsBoss]) VALUES (2, 1, 0, 0, 0)
INSERT [dbo].[CharacterType] ([Id], [IsNPC], [IsPlayer], [IsEnemy], [IsBoss]) VALUES (3, 0, 0, 1, 0)
INSERT [dbo].[CharacterType] ([Id], [IsNPC], [IsPlayer], [IsEnemy], [IsBoss]) VALUES (4, 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[CharacterType] OFF
