USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[ItemLocation]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemLocation](
	[MapId] [int] NULL,
	[ItemId] [int] NOT NULL,
	[Point] [int] NULL,
 CONSTRAINT [PK_ItemLocation] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 1, 222)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 2, 394)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (2, 3, 50)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 4, 393)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 5, 295)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 6, 148)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (4, 7, 41)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (2, 8, 69)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 9, 220)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (2, 10, 26)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 11, 57)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (2, 12, 77)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (7, 13, 42)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (4, 14, 186)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (2, 15, 317)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (4, 16, 197)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 17, 67)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 18, 380)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 19, 329)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (4, 20, 200)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (2, 21, 345)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 22, 364)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 23, 328)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 24, 5)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 25, 292)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 26, 204)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 27, 305)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 28, 209)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (4, 29, 356)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (2, 30, 332)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (3, 31, 198)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (4, 32, 210)
INSERT [dbo].[ItemLocation] ([MapId], [ItemId], [Point]) VALUES (1, 33, 368)
