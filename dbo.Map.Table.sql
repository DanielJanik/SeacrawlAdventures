USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[Map]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Map](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[MapWidth] [int] NULL,
	[MapData] [nvarchar](4000) NULL,
	[DoorPoint] [int] NULL,
	[ParentMapId] [int] NULL,
 CONSTRAINT [PK_Map] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Map] ON 

INSERT [dbo].[Map] ([Id], [Name], [MapWidth], [MapData], [DoorPoint], [ParentMapId]) VALUES (1, N'Seacrawl', 36, N'†††††††††††††††††††~††††††††††††††††††††††††††††††††††B††††††††††††††††††††††††††††††††††~††††††††††††††††††††††††††††††††††~†††††††††††††††††††††††††††††††††~~~††††††††††††††††††††††††††††††~~~~~~††††††††††††††††††DD††††††††††~~~~~††††††††††††††††DDDDDDDD††††††††~~††††††††††††††††DDDDDDDDDDD††††††~~††††††††††^††††††DDDDDDDD†††††††††~†††††††††^^^†††††PPDDPP†††††††††††=†††††††^^^^^^†††PPPPPPPPP†††††††††~††††††††^^^^^^', NULL, NULL)
INSERT [dbo].[Map] ([Id], [Name], [MapWidth], [MapData], [DoorPoint], [ParentMapId]) VALUES (2, N'Shiloh', 36, N'ĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĨĨĨĨ¤ĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨ', 402, 1)
INSERT [dbo].[Map] ([Id], [Name], [MapWidth], [MapData], [DoorPoint], [ParentMapId]) VALUES (3, N'Denali', 36, N'ĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĪoĪĪoĪĪĪĪĪĪĪĪĪĪvĪvĪĪĪĪĪĪĪĪĪĪcĪĪĪĪĨĨĪooooĪĪĪooooĪĪĪvĪvĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪvĪvĪĪĪĪĪĪooooĪooooĨĨĪoqooĪĪĪĪĪĪĪĪvĪĪĪĪĪvĪĪĪĪooooĪooooĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪvĪĪfĪĪvĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪooooĪĪĪĪĪĪĪĪvĪĪĪĪĪvĪĪĪĪooooĪooooĨĨĪĪĪĪĪĪĪĪĪiĪĪĪĪĪvĪvĪĪĪĪĪĪooooĪooooĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪvĪvĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪoooĪĪĪĪĪĪĪĪĪĪĪvĪvĪĪĪĪĪĪĪĪĪĪĪwĪĪĪĨĨĪoqoĪĪĪĪĪĪĪĪĪĪĪvĪvĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨ¤ĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨ', 414, 1)
INSERT [dbo].[Map] ([Id], [Name], [MapWidth], [MapData], [DoorPoint], [ParentMapId]) VALUES (4, N'Helsinki', 36, N'ĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĪĪ","ĪĪĪĪĪĪĪPĪPĪPĪĪĪĪĪĪ?,?"ĪĪooĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪPPPĪĪĪĪĪĪĪĨĨoĪĪPPPĪĪĪĪĪĪĪĪĪwĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨ?ĪPĪĪĪPĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨ,ĪPĪfĪPĪĪĪĪĪuĪĪ[ĪĪ|ĪĪĪĪĪĪĪĪĪ:ĪĪĪĪ¤Ĩ?ĪPĪĪĪPĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨ,ĪĪPPPĪĪĪĪĪĪĪĪĪiĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨ~~~ĪĪĪĪĪĪĪĪPĪPĪĪĪĪPĪĪĪĪĪ]Ī]Ī]Ī]ĪĪĨĨ~~~~~~ĪĪĪĪĪoP"P,PoĪĪĪĪĪĪ]Ī]Ī]Ī]ĪĪĨĨ~~B~~~~ĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪzĪĪĪĪĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨ', 215, 1)
INSERT [dbo].[Map] ([Id], [Name], [MapWidth], [MapData], [DoorPoint], [ParentMapId]) VALUES (5, N'Juneau', 11, N'††††††¤††††ĪjĪĪĪĪĪJ††ĪjĪĪ&ĪĪJ††ĪĪĪjĪjĪĪ†††††††††††', 7, 1)
INSERT [dbo].[Map] ([Id], [Name], [MapWidth], [MapData], [DoorPoint], [ParentMapId]) VALUES (6, N'Mystic', 36, N'ĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĪĨĨĨĨĨĨ¤ĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨĨ', 402, 1)
INSERT [dbo].[Map] ([Id], [Name], [MapWidth], [MapData], [DoorPoint], [ParentMapId]) VALUES (7, N'Circus', 11, N'ĨĨĨĨĨ¤ĨĨĨĨĨĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĨĨĪĪĪĪĪĪĪĪĨĨĨĨĨĨĨĨĨĨĨ', 6, 3)
SET IDENTITY_INSERT [dbo].[Map] OFF
