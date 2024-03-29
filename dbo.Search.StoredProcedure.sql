USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[Search]
	@MapId int, @Point int, @PlayerId int, @SearchInfo nvarchar(500) OUTPUT
AS
BEGIN

	DECLARE @Icon nvarchar(4), @Info nvarchar(500) = '', @TypeId int = -1, @Id int, @Value int

	select @Id = i.Id, @Icon = Icon, @TypeId = TypeId, @Info = Info, @Value = i.Value 
	from Item i 
	inner join ItemLocation il on (i.Id = il.ItemId) 
	WHERE Point = @Point and Found = 0
	
	IF (@TypeId = 1)
	BEGIN
		SET @SearchInfo = CONCAT(@Icon, ' : ', @Info)

		UPDATE Character SET MaxStrength += @Value, Strength += @Value WHERE Id = @PlayerId

		UPDATE Item SET Found = 1 WHERE Id = @Id
	END
	ELSE IF (@TypeId = 2)
	BEGIN
		SET @SearchInfo = CONCAT(@Icon, ' : ', @Info)

		UPDATE Record SET Total += @Value WHERE Name = 'Gold'

		UPDATE Item SET Found = 1 WHERE Id = @Id
	END
	ELSE IF (@TypeId = 4)
	BEGIN
		SET @SearchInfo = CONCAT(@Icon, ' : ', @Info)

		UPDATE Item SET Found = 1 WHERE Id = @Id
	END	
END

GO
