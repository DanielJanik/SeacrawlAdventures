USE [SeacrawlAdventures]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL
) ON [PRIMARY]
GO
