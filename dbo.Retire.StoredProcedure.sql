USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[Retire]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[Retire]
AS
BEGIN
SET NOCOUNT ON
	UPDATE Record  
	SET Title = CASE WHEN Total between 50 and 99 THEN CONCAT('Killer of ', REPLACE(Name, ' killed', 's'))
					WHEN Total between 100 and 249 THEN CONCAT('Slayer of ', REPLACE(Name, ' killed', 's'))
					WHEN Total between 250 and 499 THEN CONCAT('Destroyer of ', REPLACE(Name, ' killed', 's'))
					WHEN Total between 250 and 499 THEN CONCAT('Hugger of ', REPLACE(Name, ' killed', 's'))
					WHEN Total >= 5000 THEN CONCAT('Vanquisher of ', REPLACE(Name, ' killed', 's')) END
	WHERE Name like '%killed' and Total >= 50

	UPDATE Record  
	SET Title = 'Slayer of the Hydra'
	WHERE Name = 'Hydra Killed' and Total > 0
	
	UPDATE Record  
	SET Title = CASE WHEN Total < 50 THEN 'beggar'
					WHEN Total between 50 and 249 THEN 'tailor'
					WHEN Total between 250 and 999 THEN 'blacksmith'
					WHEN Total between 1000 and 2499 THEN 'shop owner'
					WHEN Total between 2500 and 4999 THEN 'affluent socialite'
					WHEN Total between 5000 and 7999 THEN 'Mayor'
					WHEN Total > 8000 THEN 'Governor' END
	WHERE Name = 'Gold'
	
	UPDATE Record  
	SET Title = CASE WHEN Total < 500 THEN 'youthful'
					WHEN Total between 500 and 4999 THEN 'strong'
					WHEN Total between 5000 and 24999 THEN 'frail'
					WHEN Total > 25000 THEN 'sickly' END
	WHERE Name = 'Number of turns'

	UPDATE Record  
	SET Title = CASE WHEN Total < 100 THEN 'greenhorn adventurer'
					WHEN Total between 100 and 249 THEN 'battle-ready adventurer'
					WHEN Total between 250 and 5000 THEN 'veteran adventurer'
					WHEN Total > 5000 THEN 'hero' END
	WHERE Name = 'XP'
	
	DECLARE @Title nvarchar(max), @Status nvarchar(500), @Health nvarchar(500), @Exp nvarchar(500), @HeroTitle nvarchar(500)

	;WITH playerTitle (Id, Title) AS
	(
		SELECT 1, CAST('' AS NVARCHAR(MAX)) 
		UNION ALL
		SELECT B.Id + 1, B.Title +  A.Title + ', ' 
		FROM (SELECT Row_Number() OVER (ORDER BY Id) AS RN, Title FROM Record WHERE Title <> '' and Id <= 4) A 
		INNER JOIN playerTitle B ON A.RN = B.Id 	
	)
	SELECT @Title = Title FROM (SELECT TOP 1 Title FROM playerTitle ORDER BY Id DESC) t

	select @Status = Title from record WHERE Name = 'Gold'
	select @Health = Title from record WHERE Name = 'Number of Turns'
	select @Exp = Title from record WHERE Name = 'XP'
	select @HeroTitle = Title from record WHERE Name = 'hyrda killed'
	
	
	SET @Title = CASE WHEN LEN(@Title) = 0 THEN 'Your exploits leave you completely unknown.' ELSE CONCAT('You are well known by townsfolk as the ', LEFT(@Title, LEN(@Title) - 1), ' and a ', @Exp, '.') END
	
	SELECT CONCAT('You have retired as a ', @Health, ' adventurer.', CHAR(13),
				'Your accumulated wealth affords you your position of ', @Status, '.', CHAR(13),
				@Title)
SET NOCOUNT OFF
END

GO
