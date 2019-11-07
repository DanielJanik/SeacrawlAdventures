USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[DespawnEnemies]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DespawnEnemies]
AS
BEGIN
	DELETE FROM CharacterLocation WHERE CharacterId in (SELECT Id FROM Character WHERE TypeId = 3 and Health <= 0)
	DELETE FROM Character WHERE TypeId = 3 and Health <= 0
END
GO
