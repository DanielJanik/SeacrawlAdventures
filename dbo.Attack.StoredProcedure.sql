USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[Attack]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Attack] (@AttackerId int, @TotalDmg int OUTPUT)
AS
	DECLARE @BasePhy int,
			@BaseMag int,
			@Skill int,
			@Dmg0 int = 0,
			@Dmg1 int = 0,
			@Dmg2 int = 0,
			@DmgM int = 0

	SELECT @BasePhy = Strength, @BaseMag = Magic, @Skill = Skill FROM Character WHERE Id = @AttackerId

	--Do Physical Attack
	SET @Dmg0 = (SELECT FLOOR(RAND()*(@BasePhy)+1) as Val)
	SET @Dmg1 = (SELECT FLOOR(RAND()*(@BasePhy)+1) as Val)
	SET @Dmg2 = (SELECT FLOOR(RAND()*(@BasePhy)+1) as Val)
	SET @DmgM = (SELECT FLOOR(RAND()*(@BaseMag)+1) as Val)
	
	/* Higher skill attackers should have a more consistant damage curve */
	IF (@Skill < 10)
	BEGIN
		SELECT @TotalDmg = @Dmg0 + @DmgM
	END
	ELSE IF (@Skill >= 10 and @Skill < 50)
	BEGIN
		
		select @TotalDmg = MAX(val) + @DmgM from (VALUES(@Dmg0), (@Dmg1)) as dmg(val)
	END
	ELSE IF (@Skill >= 50)
	BEGIN
		SELECT @TotalDmg = MAX(val) + @DmgM from (VALUES(@Dmg0), (@Dmg1), (@Dmg2)) as dmg(val)
	END

	--select @dmg0, @dmg1, @dmg2, @DmgM

	return @TotalDmg
GO
