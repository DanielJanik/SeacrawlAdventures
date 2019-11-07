USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[UpdateRecord]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateRecord]
	@Action nvarchar(50), @Value int
AS
BEGIN
	UPDATE Record 
	SET Total += @Value
	WHERE Name = @Action
END
GO
