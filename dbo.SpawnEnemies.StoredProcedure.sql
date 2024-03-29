USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[SpawnEnemies]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpawnEnemies] (@MapId int)
AS /* This will eventually over-run the INT datatype; but, it's not suspected anyone who plays this will lack the skills to reseed the table. #worklifebalance haha :) */
BEGIN 
	/* Clear Existing Mobs */
	DECLARE @deleteThese Table (Id int)
	INSERT INTO @deleteThese (Id) SELECT CharacterId FROM CharacterLocation WHERE MapId = @MapId and CharacterId not in (SELECT Id FROM CharacterType WHERE IsPlayer = 1)
	
	DELETE FROM CharacterLocation WHERE CharacterId in (SELECT Id from @deleteThese)
	DELETE FROM Character WHERE Id in (SELECT Id from @deleteThese)

	/* Get tile count & door location */
	DECLARE @MapLen int, @MapWidth int, @DoorPoint int 
	SELECT @MapLen = Len(MapData), @MapWidth = MapWidth, @DoorPoint = DoorPoint FROM Map WHERE Id = @MapId

	/* Get a random count to spawn */
	DECLARE @Num2Spawn int, @Where2Spawn int, @What2Spawn int, @MaxEnemyId int
	SET @Num2Spawn = FLOOR(RAND() * 20 + 3)
	SELECT @MaxEnemyId = MAX(Id) FROM EnemyTemplate
	
	WHILE (@Num2Spawn > 0)
	BEGIN
		SET @Where2Spawn = FLOOR(RAND() * @MapLen + 1)
		SET @What2Spawn = FLOOR(RAND() * @MaxEnemyId + 1)

		/* Don't spawn on a door or another mob */
		WHILE ((@Where2Spawn in (SELECT Point FROM CharacterLocation WHERE MapId = @MapId)) 
				or (@Where2Spawn = @DoorPoint) 
				or (@Where2Spawn % @MapWidth) = 0)
		BEGIN
			SET @Where2Spawn = FLOOR(RAND() * @MapLen + 1)
			PRINT 'Picked new location due to conflict'
		END
		
		/* Add Enemy */
		INSERT INTO Character (TypeId, Name, MaxHealth, Health, MaxStrength, Strength, MaxSkill, Skill, Perception, Magic, Icon, DeathIcon, Symbol)
		SELECT TypeId, Name, Health, Health, Strength, Strength, Skill, Skill, 1, Magic, Icon, DeathIcon, Symbol
		FROM EnemyTemplate
		WHERE Id = @What2Spawn

		/* Add Enemy Location */
		INSERT INTO CharacterLocation (MapId, CharacterId, Point)
		VALUES (@MapId, SCOPE_IDENTITY(), @Where2Spawn)

		SET @Num2Spawn -= 1;
	END
END
GO
