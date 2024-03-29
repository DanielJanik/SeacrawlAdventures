USE [SeacrawlAdventures]
GO
/****** Object:  UserDefinedFunction [dbo].[IsPointOccupied]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IsPointOccupied](@MapId int, @Point int, @Direction char(1))
RETURNS int
AS
BEGIN
	DECLARE @IsOccupied int, @MapWidth int,	@TileLeft int, @TileRight int, @TileUp int, @TileDown int
	
	SELECT @MapWidth = MapWidth,
		@TileUp = (@Point-MapWidth),
		@TileDown = (@Point+MapWidth),
		@TileLeft = (@Point-1),
		@TileRight = (@Point+1)
	FROM Map 
	WHERE Id = @MapId
	
	SET @IsOccupied = 0;
			
	IF (EXISTS(SELECT Point FROM Character c INNER JOIN CharacterLocation cl ON (c.Id = cl.CharacterId) WHERE TypeId in (3,4) and Point = @TileRight and MapId = @MapId) and @Direction = 'r')
	BEGIN
		SET @IsOccupied = (SELECT Id FROM Character c INNER JOIN CharacterLocation cl ON (c.Id = cl.CharacterId) WHERE TypeId in (3,4) and Point = @TileRight and MapId = @MapId);
	END
	ELSE
	IF (EXISTS(SELECT Point FROM Character c INNER JOIN CharacterLocation cl ON (c.Id = cl.CharacterId) WHERE TypeId in (3,4) and Point = @TileLeft and MapId = @MapId) and @Direction = 'l')
	BEGIN
		SET @IsOccupied = (SELECT Id FROM Character c INNER JOIN CharacterLocation cl ON (c.Id = cl.CharacterId) WHERE TypeId in (3,4) and Point = @TileLeft and MapId = @MapId);
	END
	ELSE
	IF (EXISTS(SELECT Point FROM Character c INNER JOIN CharacterLocation cl ON (c.Id = cl.CharacterId) WHERE TypeId in (3,4) and Point = @TileUp and MapId = @MapId) and @Direction = 'u')
	BEGIN
		SET @IsOccupied = (SELECT Id FROM Character c INNER JOIN CharacterLocation cl ON (c.Id = cl.CharacterId) WHERE TypeId in (3,4) and Point = @TileUp and MapId = @MapId);
	END
	ELSE
	IF (EXISTS(SELECT Point FROM Character c INNER JOIN CharacterLocation cl ON (c.Id = cl.CharacterId) WHERE TypeId in (3,4) and Point = @TileDown and MapId = @MapId) and @Direction = 'd')
	BEGIN
		SET @IsOccupied = (SELECT Id FROM Character c INNER JOIN CharacterLocation cl ON (c.Id = cl.CharacterId) WHERE TypeId in (3,4) and Point = @TileDown and MapId = @MapId);
	END

	RETURN @IsOccupied
END
GO
