USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[Defend]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Defend] (@DefenderId int, @Dmg int, @ModifiedDmg int OUTPUT)
AS

	DECLARE @Perception int,
			@Skill int,
			@Def0 int = 0,
			@Def1 int = 0,
			@Def2 int = 0,
			@DefMod0 int = 0,
			@DefMod1 int = 0

	SELECT @Perception = Perception, @Skill = Skill FROM Character WHERE Id = @DefenderId

	--Defend Physical Attack
	SET @Def0 = (SELECT FLOOR(RAND()*(@Perception)+1) as Val)
	SET @Def1 = (SELECT FLOOR(RAND()*(@Perception)+1) as Val)
	SET @Def2 = (SELECT FLOOR(RAND()*(@Perception)+1) as Val)
	SET @DefMod0 = (SELECT FLOOR(RAND()*(2)+1) as Val)
	SET @DefMod1 = (SELECT FLOOR(RAND()*(3)+1) as Val)

	/* Higher skill defenders should have a more consistant defense curve */
	IF (@Skill < 10)
	BEGIN
		SET @ModifiedDmg = @Dmg - @Def0
	END
	ELSE IF (@Skill >= 10 and @Skill < 50)
	BEGIN
		
		SELECT @ModifiedDmg = @Dmg - (MAX(val) * @DefMod0) from (VALUES(@Def0), (@Def1)) as def(val)
	END
	ELSE IF (@Skill >= 50)
	BEGIN
		SELECT @ModifiedDmg = @Dmg - (MAX(val) * @DefMod1) from (VALUES(@Def0), (@Def1), (@Def2)) as def(val)
	END

	IF (@ModifiedDmg < 0)
	BEGIN
		SET @ModifiedDmg = 0
	END

	return @ModifiedDmg
GO
