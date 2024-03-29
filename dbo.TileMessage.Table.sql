USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[TileMessage]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TileMessage](
	[Id] [int] NOT NULL,
	[Tile] [nvarchar](4) NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_TileMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Tile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (1, N'^', N'From the mountain top you can see all of Seacrawl.
From Shiloh to Helsinki and beyond.')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (1, N'~', N'You have drown. Perhaps in your next life you''ll remember you can''t swim.')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (1, N'†', N'The forest is dark from the dense tree canopies.
Noises of wild woodland creatures echo from all directions.')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (1, N'B', N'The boat provides safe passage across the raging waters')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (1, N'D', N'The desert sands are hot. You step carefully to avoid scorpions and cactus.')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (1, N'P', N'The oasis air is cool and pleasant')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (2, N'^', N'Reaching the top of a mountain is no easy feat.
It is cold and snowy and you''re proud to have reached the peak.')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (2, N'~', N'The deep cold water has taken your life and the adventure has ended.')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (2, N'†', N'The forest is brimming with life.
Goosebumps grow with each wolf howl.')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (2, N'B', N'I''m on a Boat!')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (2, N'D', N'Not a drop of water in sight. The desert claims the life of the unprepared.')
INSERT [dbo].[TileMessage] ([Id], [Tile], [Message]) VALUES (2, N'P', N'You wonder why you''re not living in such beautiful place.')
