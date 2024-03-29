USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[MoveEnemies]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MoveEnemies] (@MapId int, @PlayerPoint int)
AS 
BEGIN 
	/* Get tile count & map width */
	DECLARE @MapLen int, @MapWidth int, @EnemyId int, @EnemyPoint int
	SELECT @MapLen = Len(MapData), @MapWidth = MapWidth FROM Map WHERE Id = @MapId
	
	/* Loop over each enemy on the map - not great for performance but no real need for that in this game */
	DECLARE curEnemies CURSOR
		FOR SELECT CharacterId, Point 
			FROM CharacterLocation cl 
				INNER JOIN Character c on (c.id = cl.CharacterId) and (c.TypeId = 3)
			WHERE MapId = @MapId and CharacterId not in (SELECT Id FROM CharacterType WHERE IsPlayer = 1) and @MapId != 1
	OPEN curEnemies
	FETCH NEXT FROM curEnemies INTO @EnemyId, @EnemyPoint
	WHILE @@FETCH_STATUS = 0
	BEGIN  
		IF ((@PlayerPoint % @MapWidth) < (@EnemyPoint % @MapWidth)) --Player is left
		BEGIN
			UPDATE CharacterLocation SET Point = @EnemyPoint -1 WHERE CharacterId = @EnemyId and @EnemyPoint - 1 not in (SELECT Point FROM CharacterLocation WHERE CharacterId != @EnemyId and MapId = @MapId)
		END
		--ELSE
		IF ((@PlayerPoint % @MapWidth) > (@EnemyPoint % @MapWidth)) --Player is right
		BEGIN
			UPDATE CharacterLocation SET Point = @EnemyPoint + 1 WHERE CharacterId = @EnemyId and @EnemyPoint + 1 not in (SELECT Point FROM CharacterLocation WHERE CharacterId != @EnemyId and MapId = @MapId)
		END
		--ELSE
		IF ((@PlayerPoint - @EnemyPoint) > 72) --Player is down
		BEGIN
			UPDATE CharacterLocation SET Point = @EnemyPoint + 36 WHERE CharacterId = @EnemyId and @EnemyPoint + 36 not in (SELECT Point FROM CharacterLocation WHERE CharacterId != @EnemyId and MapId = @MapId)
		END
		--ELSE
		IF ((@PlayerPoint - @EnemyPoint) < -72) --Player is up
		BEGIN
			UPDATE CharacterLocation SET Point = @EnemyPoint - 36 WHERE CharacterId = @EnemyId and @EnemyPoint - 36 not in (SELECT Point FROM CharacterLocation WHERE CharacterId != @EnemyId and MapId = @MapId)
		END
		FETCH NEXT FROM curEnemies INTO @EnemyId, @EnemyPoint
	END  
    CLOSE curEnemies  
    DEALLOCATE curEnemies
END
GO
