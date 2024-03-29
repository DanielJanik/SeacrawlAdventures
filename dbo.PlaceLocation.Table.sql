USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[PlaceLocation]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaceLocation](
	[MapId] [int] NULL,
	[PlaceId] [int] NOT NULL,
	[Point] [int] NULL,
 CONSTRAINT [PK_PlaceLocation] PRIMARY KEY CLUSTERED 
(
	[PlaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PlaceLocation] ([MapId], [PlaceId], [Point]) VALUES (1, 1, 193)
INSERT [dbo].[PlaceLocation] ([MapId], [PlaceId], [Point]) VALUES (1, 2, 368)
INSERT [dbo].[PlaceLocation] ([MapId], [PlaceId], [Point]) VALUES (1, 3, 67)
INSERT [dbo].[PlaceLocation] ([MapId], [PlaceId], [Point]) VALUES (1, 4, 389)
INSERT [dbo].[PlaceLocation] ([MapId], [PlaceId], [Point]) VALUES (3, 6, 66)
