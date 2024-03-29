USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[MoveCharacter]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MoveCharacter]
	@CharacterId int,
	@Action varchar(50), -- Move Left, Move Right, Move Up, Move Down
	@Result nvarchar(2000) OUT
AS
BEGIN
	DECLARE @MapId int, @Point int, @OccupiedBy int, @MapWidth int
	SELECT @MapId = MapId, @Point = Point FROM CharacterLocation WHERE CharacterId = @CharacterId
	SELECT @MapWidth = MapWidth FROM Map WHERE Id = @MapId 

	IF @Action = 'Move Left'
	BEGIN
		IF (dbo.IsMapEdge(@MapId, @Point, 'l') = 1)
		BEGIN
			SET @result = CONCAT('You peer over the edge of this flat world knowing any further movement would be certain death.', CHAR(13), CHAR(13))
		END
		ELSE
		BEGIN
			SET @OccupiedBy = dbo.IsPointOccupied(@MapId, @Point, 'l')
			IF (@OccupiedBy = 0)
			BEGIN
				UPDATE CharacterLocation SET Point = Point - 1 WHERE CharacterId = @CharacterId
				SET @result = ''
			END
			ELSE
			BEGIN
				SET @result = CONCAT('Attacked by:', @OccupiedBy)
			END
		END
	END
	ELSE
	IF @Action = 'Move Right'
	BEGIN
	IF (dbo.IsMapEdge(@MapId, @Point, 'r') = 1)
		BEGIN
			SET @result = CONCAT('You peer over the edge of this flat world knowing any further movement would be certain death.', CHAR(13), CHAR(13))
		END
		ELSE
		BEGIN
			SET @OccupiedBy = dbo.IsPointOccupied(@MapId, @Point, 'r')
			IF (@OccupiedBy = 0)
			BEGIN
				UPDATE CharacterLocation SET Point = Point + 1 WHERE CharacterId = @CharacterId
				SET @result = ''
			END
			ELSE
			BEGIN
				SET @result = CONCAT('Attacked by:', @OccupiedBy)
			END
		END
	END
	ELSE
	IF @Action = 'Move Up'
	BEGIN
	IF (dbo.IsMapEdge(@MapId, @Point, 'u') = 1)
		BEGIN
			SET @result = CONCAT('You peer over the edge of this flat world knowing any further movement would be certain death.', CHAR(13), CHAR(13))
		END
		ELSE
		BEGIN
			SET @OccupiedBy = dbo.IsPointOccupied(@MapId, @Point, 'u')
			IF (@OccupiedBy = 0)
			BEGIN
				UPDATE CharacterLocation SET Point = Point - @MapWidth WHERE CharacterId = @CharacterId
				SET @result = ''
			END
			ELSE
			BEGIN
				SET @result = CONCAT('Attacked by:', @OccupiedBy)
			END
		END
	END
	ELSE
	IF @Action = 'Move Down'
	BEGIN
	IF (dbo.IsMapEdge(@MapId, @Point, 'd') = 1)
		BEGIN
			SET @result = CONCAT('You peer over the edge of this flat world knowing any further movement would be certain death.', CHAR(13), CHAR(13))
		END
		ELSE
		BEGIN
			SET @OccupiedBy = dbo.IsPointOccupied(@MapId, @Point, 'd')
			IF (@OccupiedBy = 0)
			BEGIN
				UPDATE CharacterLocation SET Point = Point + @MapWidth WHERE CharacterId = @CharacterId
				SET @result = ''
			END
			ELSE
			BEGIN
				SET @result = CONCAT('Attacked by:', @OccupiedBy)
			END
		END
	END
END
GO
