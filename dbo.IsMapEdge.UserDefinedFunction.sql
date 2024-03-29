USE [SeacrawlAdventures]
GO
/****** Object:  UserDefinedFunction [dbo].[IsMapEdge]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[IsMapEdge](@MapId int, @Point int, @Direction char(1))
RETURNS bit
AS
BEGIN
	DECLARE @IsEdge bit, @MapWidth int, @MapLen int, @TileLeft nvarchar(4), @TileRight nvarchar(4), @TileUp nvarchar(4), @TileDown nvarchar(4)
	, @MapData nvarchar(4000)
	
	SELECT @MapWidth = MapWidth, @MapLen = LEN(MapData), 
		@TileLeft = dbo.TileAtPoint(Id, @Point-1),
		@TileRight = dbo.TileAtPoint(Id, @Point+1)
	FROM Map 
	WHERE Id = @MapId

	SET @IsEdge = 0;
		
	IF (ASCII(@TileRight) = 13 and @Direction = 'r')
	BEGIN
		SET @IsEdge = 1;
	END
	ELSE
	IF (ASCII(@TileLeft) = 13 and @Direction = 'l')
	BEGIN
		SET @IsEdge = 1;
	END
	ELSE
	IF (@Point - @MapWidth <= 0 and @Direction = 'u')
	BEGIN
		SET @IsEdge = 1;
	END
	ELSE
	IF (@Point + @MapWidth >= @MapLen and @Direction = 'd')
	BEGIN
		SET @IsEdge = 1;
	END

	RETURN @IsEdge
END
GO
