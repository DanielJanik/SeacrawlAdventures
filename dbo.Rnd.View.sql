USE [SeacrawlAdventures]
GO
/****** Object:  View [dbo].[Rnd]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Rnd]
AS
	SELECT FLOOR(RAND()*(2)+1) as Val
GO
