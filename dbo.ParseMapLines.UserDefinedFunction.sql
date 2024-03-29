USE [SeacrawlAdventures]
GO
/****** Object:  UserDefinedFunction [dbo].[ParseMapLines]    Script Date: 11/7/2019 2:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[ParseMapLines] (	@MapData nvarchar(4000), @MapWidth int	)
RETURNS nvarchar(4000)
AS
BEGIN
	DECLARE @ParsedMapData nvarchar(4000), @i int = @MapWidth
	
	WHILE @i <= LEN(@MapData)
	BEGIN
		--Add CR/LF after every @MapWidth
		IF(@i < LEN(@MapData))
		BEGIN
			SET @ParsedMapData = CONCAT(@ParsedMapData, RIGHT(LEFT(@MapData, @i), @MapWidth), NCHAR(13))
		END
		ELSE
		BEGIN
			SET @ParsedMapData = CONCAT(@ParsedMapData, RIGHT(LEFT(@MapData, @i), @MapWidth))
		END
		
		SET @i += @MapWidth
	END
	
	RETURN @ParsedMapData
END
GO
