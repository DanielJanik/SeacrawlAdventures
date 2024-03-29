USE [SeacrawlAdventures]
GO
/****** Object:  UserDefinedFunction [dbo].[TileAtPoint]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TileAtPoint] (@MapId int, @Point int)
Returns nvarchar(2)
AS
BEGIN 
	DECLARE @tile nvarchar(2)
	SELECT @tile = SUBSTRING(dbo.ParseMapLines(MapData, MapWidth-1), @Point, 1) FROM Map WHERE Id = @MapId
	RETURN @tile
END
GO
