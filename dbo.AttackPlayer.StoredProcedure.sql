USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[AttackPlayer]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AttackPlayer]
	@PlayerId int, @PlayerPoint int, @MapId int, @AttackInfo nvarchar(1000) OUTPUT, @dmgdelt int OUTPUT
AS
BEGIN
	DECLARE @MapWidth int = (SELECT MapWidth FROM Map where Id = @MapId)
	DECLARE @Id int, @Name nvarchar(50), @dmg int = 0, @defdmg int = 0, @enemycnt int = 0, @dmgtotal int = 0, @defdmgtotal int = 0

	SET @dmgdelt = 0

	SELECT @enemycnt = COUNT(1)
		FROM CharacterLocation cl 
		INNER JOIN Character c on (c.Id = cl.CharacterId) 
		WHERE c.TypeId = 3 and cl.MapId = @MapId 
			and (cl.Point = @PlayerPoint + 1 or
				 cl.Point = @PlayerPoint - 1 or
				 cl.Point = @PlayerPoint + @MapWidth or
				 cl.Point = @PlayerPoint - @MapWidth )

	DECLARE curEnemies CURSOR 
	FOR		
		SELECT c.Id, Name 
		FROM CharacterLocation cl 
		INNER JOIN Character c on (c.Id = cl.CharacterId) 
		WHERE c.TypeId = 3 and cl.MapId = @MapId 
			and (cl.Point = @PlayerPoint + 1 or
				 cl.Point = @PlayerPoint - 1 or
				 cl.Point = @PlayerPoint + @MapWidth or
				 cl.Point = @PlayerPoint - @MapWidth )
	OPEN curEnemies
	FETCH NEXT FROM curEnemies INTO @Id, @Name
	WHILE @@FETCH_STATUS = 0  
    BEGIN  
		EXEC dbo.attack @Id, @dmg OUTPUT
		EXEC dbo.Defend @PlayerId, @dmg, @defdmg output

		SET @dmgtotal += @dmg;
		SET @defdmgtotal += @defdmg;

		FETCH NEXT FROM curEnemies INTO @Id, @Name
    END  
	CLOSE curEnemies;  
	DEALLOCATE curEnemies;
	
	IF (@enemycnt > 1)
	BEGIN
		SET @AttackInfo = CONCAT('You were attacked by multiple enemies for ', @dmgtotal, ' damage and you defended ', (select @dmgtotal - @defdmgtotal), ' damage.', CHAR(13), CHAR(13));
		SET @dmgdelt = @defdmgtotal
	END 
	ELSE IF (@enemycnt = 1)
	BEGIN
		SET @AttackInfo = CONCAT('The ', @Name, ' smashed you for ', @dmgtotal, ' damage and you defended ', (select @dmgtotal - @defdmgtotal), ' damage.', CHAR(13), CHAR(13));
		SET @dmgdelt = @defdmgtotal
	END 
	ELSE
	BEGIN
		SET @AttackInfo = '';
		SET @dmgdelt = 0
	END


END
GO
