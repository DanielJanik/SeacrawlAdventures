USE [SeacrawlAdventures]
GO
/****** Object:  UserDefinedFunction [dbo].[PointInfo]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[PointInfo](@MapId int, @Point int)
RETURNS nvarchar(2000)
AS
BEGIN
	DECLARE @Info nvarchar(2000), @TileType nchar(1)
	
	SET @TileType = (SELECT SUBSTRING(dbo.ParseMapLines(MapData, 35), @Point, 1) FROM Map WHERE Id = @MapId)

	SET @Info = (SELECT Message 
				FROM TileMessage 
				WHERE Tile = @TileType and Id = (SELECT Val FROM Rnd))
	
	IF (EXISTS(SELECT Point FROM PlaceLocation WHERE MapId = @MapId and Point = @Point))
	BEGIN
		SET @Info = (SELECT Message 
					FROM PlaceLocation PL 
						INNER JOIN PlaceMessage PM on (PL.PlaceId = PM.PlaceId) 
					WHERE MapId = @MapId and Point = @Point and PM.Id = (SELECT Val FROM Rnd))
	END
	
	SET @Info = CONCAT(@Info, CHAR(13), CHAR(13))

	RETURN @Info
END
GO
