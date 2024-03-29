USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[LevelUp]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LevelUp]
	@Id int, @LvlUp bit OUTPUT
AS
BEGIN
	SET @LvlUp = 0
	IF (SELECT Total FROM Record WHERE Name = 'XP Remaining') <= 0
	BEGIN		
		UPDATE Record 
		SET Total =  (SELECT Total*2 FROM Record where Name = 'XP')
		WHERE Name = 'XP Remaining'

		UPDATE Character
		SET MaxHealth += 10, MaxStrength += 5, MaxSkill += 5, Perception += 5
		WHERE Id = @Id

		SET @LvlUp = 1
	END
END
GO
