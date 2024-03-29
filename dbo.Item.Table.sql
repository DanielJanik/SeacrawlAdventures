USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [tinyint] NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [int] NULL,
	[Icon] [nvarchar](4) NULL,
	[Info] [nvarchar](500) NULL,
	[Found] [bit] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (1, 1, N'Salad Fork', 1, N'🍴', N'You found a salad fork! All the veggies in the land cower before you.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (2, 1, N'Key', 1, N'🗝', N'You found a pointy key! Slay your enemies by unlocking their insides.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (3, 1, N'Long Sword of Seacrawl', 35, N'🗡', N'You found the legendary long sword of Seacrawl! You detect a slight glow on it''s blade and feel much more powerful!!', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (4, 1, N'Dual Short Swords', 15, N'⚔', N'You found a set of short swords. They are sharp enough to split a page.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (5, 1, N'Dinner Knife', 10, N'🔪', N'You found a Dinner Knife! This is sure to do some real damage, just wash it before dinner.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (6, 1, N'Long Bow', 5, N'🏹', N'You found a long bow! This will surely help decimate your foes.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (7, 1, N'Revolver', 17, N'🔫', N'You found a revolver! This is one of the most powerful weapons in all of Seacrawl.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (8, 1, N'Grenade', 20, N'💣', N'You found grenades! Blow up your enemies with amazing fury.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (9, 1, N'Tennis Racket', 1, N'🎾', N'You found a tennis racket! It''s not much but it can do some damage.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (10, 1, N'Paddle of Isolation', 36, N'🏓', N'You found the legendary paddle of Isolation! This is the most powerful weapon ever crafted.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (11, 1, N'Hockey Stick', 5, N'🏒', N'You found a hockey stick. These have been known to break bones of all types.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (12, 2, N'Diamond', 1000, N'💎', N'You found a diamond!', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (13, 2, N'Bag of coins', 50, N'💰', N'You found a bag of coins!', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (14, 2, N'Ring', 75, N'💍', N'You found a ring!', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (15, 2, N'Gentlemans purse', 2500, N'👛', N'You found an gentlemans coin purse! ALL the townsfolk will surely be jealous now!', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (16, 4, N'Balloon', 0, N'🎈', N'You found a balloon. Oh the memories this brings back. Popping, squeeky voices, balloon animals.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (17, 4, N'Jack-o-Lantern', 0, N'🎃', N'You found a jack-o-lantern. It''s completely useless but someone spent a lot of time carving it.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (18, 4, N'Present', 0, N'🎁', N'You found a present! Too bad it''s not your birthday. You return it where it was found.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (19, 4, N'Sunglasses', 0, N'👓', N'You found sun glasses. You put them on and realize they are perscription. Doh!', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (20, 4, N'Event Shirt', 0, N'👕', N'You found a SQL Server shirt. It''s three sizes too big but you decide to keep it because hey, free swag!', 1)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (21, 4, N'Moldy Pizza', 0, N'🍕', N'You found moldy pizza. Yuk!', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (22, 4, N'Beef Hotdog', 0, N'🌭', N'You found an all beef hotdog! Then see it has corn syrup in it. Yuk!', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (23, 4, N'Burger', 0, N'🍔', N'You found a burger. Are those sesame seeds on the bun?', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (24, 4, N'Doughnuts', 0, N'🍩', N'You found a box of old doughnuts. You eat them knowing they''re a few days old. Have you no shame?', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (25, 4, N'Shrimp', 0, N'🍤', N'You found a shrimp.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (26, 4, N'Taco', 0, N'🌮', N'You found a taco. You toss it back because it has a hard shell.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (27, 4, N'Lettuce Wrap', 0, N'🌯', N'You found a lettuce wrap.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (28, 4, N'Chicken Leg', 0, N'🍗', N'You found a chicken leg.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (29, 4, N'Mushroom', 0, N'🍄', N'You found a mushroom. It''s white with green dots. Could this give you an extra live?', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (30, 4, N'Corn', 0, N'🌽', N'You found some corn on the cob but then realize you have no butter.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (31, 4, N'Beer', 0, N'🍺', N'You found a beer! Drink responsibly.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (32, 4, N'Eggplant', 0, N'🍆', N'You found an eggplant. You cook it and wonder why it turned to mush. Perhaps next time you''ll wring it out first.', 0)
INSERT [dbo].[Item] ([Id], [TypeId], [Name], [Value], [Icon], [Info], [Found]) VALUES (33, 4, N'Pepper', 0, N'🌶', N'You found a deadly pepper. Don''t eat it.', 0)
SET IDENTITY_INSERT [dbo].[Item] OFF
