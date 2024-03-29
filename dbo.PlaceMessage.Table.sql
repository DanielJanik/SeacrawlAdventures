USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[PlaceMessage]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaceMessage](
	[Id] [int] NOT NULL,
	[PlaceId] [int] NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_PlaceMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[PlaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PlaceMessage] ([Id], [PlaceId], [Message]) VALUES (1, 1, N'You have arrived at Juneau, a place where you can find tools
for your adventure and rest safely.')
INSERT [dbo].[PlaceMessage] ([Id], [PlaceId], [Message]) VALUES (1, 2, N'The walls of Helsinki seem familiar yet foreign.')
INSERT [dbo].[PlaceMessage] ([Id], [PlaceId], [Message]) VALUES (1, 3, N'The gates of Denali are strong.')
INSERT [dbo].[PlaceMessage] ([Id], [PlaceId], [Message]) VALUES (1, 4, N'The once great city of Shiloh is the oldest city in Seacrawl.
It has been abandoned for ages and who knows what may lurk inside.')
INSERT [dbo].[PlaceMessage] ([Id], [PlaceId], [Message]) VALUES (2, 1, N'You are at camp Juneau.')
INSERT [dbo].[PlaceMessage] ([Id], [PlaceId], [Message]) VALUES (2, 2, N'Helsinki is the most advanced city in Seacrawl. Many treasures await you within.')
INSERT [dbo].[PlaceMessage] ([Id], [PlaceId], [Message]) VALUES (2, 3, N'Denali rushed in a new age of advancements and is the most populous.')
INSERT [dbo].[PlaceMessage] ([Id], [PlaceId], [Message]) VALUES (2, 4, N'The Gates of Shiloh stand before you. They are very old but still strong. 
Your heart trembles over the horrors that lay within.')
