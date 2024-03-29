USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[CharacterLocation]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterLocation](
	[MapId] [int] NULL,
	[CharacterId] [int] NOT NULL,
	[Point] [int] NULL,
 CONSTRAINT [PK_CharacterLocation] PRIMARY KEY CLUSTERED 
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (4, 1, 200)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (1, 5, 392)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (7, 6, 14)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (7, 7, 19)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (7, 8, 36)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (7, 9, 41)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 529, 278)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 530, 266)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 531, 99)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 532, 82)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 533, 142)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 534, 350)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 535, 342)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 536, 44)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 538, 363)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 539, 273)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 540, 352)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 541, 362)
INSERT [dbo].[CharacterLocation] ([MapId], [CharacterId], [Point]) VALUES (2, 542, 328)
