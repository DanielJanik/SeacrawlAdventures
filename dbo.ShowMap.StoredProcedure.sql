USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[ShowMap]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ShowMap]
	@MapId int
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @MapData nvarchar(4000), @MapWidth int
	SELECT @MapData = MapData, @MapWidth = MapWidth -1 FROM Map WHERE Id = @MapId
	
	DECLARE @PlayerIcon nvarchar(2), @PlayerPoint int, @DeathIcon nvarchar(4), @PlayerHealth int
	SELECT @PlayerIcon = Icon, @DeathIcon = DeathIcon, @PlayerHealth = Health FROM Character c INNER JOIN CharacterType ct on (c.TypeId = ct.Id) WHERE ct.IsPlayer = 1
	SELECT @PlayerPoint = cl.Point FROM CharacterLocation cl INNER JOIN CharacterType ct on (cl.CharacterId = ct.Id) WHERE ct.IsPlayer = 1 and cl.MapId = @MapId

	SET @MapData = dbo.ParseMapLines(@MapData, @MapWidth)

	DECLARE @iplace int = 1
	DECLARE @Places TABLE (i int identity(1,1), PlaceId int, Point int, symbol nvarchar(4))
	INSERT INTO @Places (PlaceId, Point, Symbol) 
	SELECT Id, Point, Symbol 
	FROM Place P 
		INNER JOIN PlaceLocation PL on (PL.PlaceId = P.Id) 
	WHERE PL.Point != @PlayerPoint and PL.MapId = @MapId

	WHILE (@iplace <= (SELECT COUNT(1) FROM @Places)) /*No need for performance here. There's only 4 places & 1 user */
	BEGIN
		SELECT @MapData = CONCAT(left(@MapData, Point-1), symbol, RIGHT(@MapData, LEN(@MapData) - Point ))  /*Replace map tile with place*/
		FROM @Places
		WHERE i = @iplace

		SET @iplace += 1
	END

	DECLARE @PlayerIsDead bit = 0
	IF (dbo.TileAtPoint(@MapId, @PlayerPoint) = '~' or @PlayerHealth <= 0)
	BEGIN
		SET @PlayerIsDead = 1
	END

	DECLARE @iEnemy int = 1
	DECLARE @Enemies TABLE (i int identity(1,1), EnemyId int, Point int, symbol nvarchar(4))
	INSERT INTO @Enemies (EnemyId, Point, Symbol) 
	SELECT C.Id, Point, Symbol 
	FROM Character C
		INNER JOIN CharacterLocation CL on (CL.CharacterId = C.Id) 
		INNER JOIN CharacterType CT on (CT.Id = C.TypeId) 
	WHERE CT.IsEnemy = 1 and CL.MapId = @MapId

	WHILE (@iEnemy <= (SELECT COUNT(1) FROM @Enemies)) 
	BEGIN
		SELECT @MapData = CONCAT(left(@MapData, Point-1), symbol, RIGHT(@MapData, LEN(@MapData) - Point ))  /*Replace map tile with place*/
		FROM @Enemies
		WHERE i = @iEnemy

		SET @iEnemy += 1
	END

	DECLARE @iNPC int = 1
	DECLARE @NPCs TABLE (i int identity(1,1), NPCId int, Point int, symbol nvarchar(4))
	INSERT INTO @NPCs (NPCId, Point, Symbol) 
	SELECT C.Id, Point, Symbol 
	FROM Character C
		INNER JOIN CharacterLocation CL on (CL.CharacterId = C.Id) 
		INNER JOIN CharacterType CT on (CT.Id = C.TypeId) 
	WHERE CT.IsNPC = 1 and CL.MapId = @MapId

	WHILE (@iNPC <= (SELECT COUNT(1) FROM @NPCs)) 
	BEGIN
		SELECT @MapData = CONCAT(left(@MapData, Point-1), symbol, RIGHT(@MapData, LEN(@MapData) - Point ))  /*Replace map tile with place*/
		FROM @NPCs
		WHERE i = @iNPC

		SET @iNPC += 1
	END

	SET @MapData = CONCAT(left(@MapData, @PlayerPoint -1), '*', RIGHT(@MapData, LEN(@MapData) - @PlayerPoint)) /*Replace map tile with player icon*/	
	
	SET @MapData = REPLACE(@MapData, N'D', N'🌵')
	SET @MapData = REPLACE(@MapData, N'†', N'🌳')
	SET @MapData = REPLACE(@MapData, N'~', N'🌫')
	SET @MapData = REPLACE(@MapData, N'P', N'🌴')
	SET @MapData = REPLACE(@MapData, N'^', N'🏔')
	SET @MapData = REPLACE(@MapData, N'B', N'⛵')
		
	SET @MapData = REPLACE(@MapData, N'&', N'🔥')
	SET @MapData = REPLACE(@MapData, N'Ī', N'➖')--⬜
	SET @MapData = REPLACE(@MapData, N'Ĩ', N'🔳')--⬛
	SET @MapData = REPLACE(@MapData, N'¤', N'🚪')

	--💎🗝🗡⚔🔪🏹🔫⚰🗿💰
	--🍕🌭🍔🍜🍝🍱🍿🍗🍟🌮🍦🍨🎂🍩🍪🍰🍭🍮☕🍷🍬🍯🍼🍆🍒🍓🍅🍐🍏🍌🍍🍎🍋🍊🍉🍇🍈🍞
	--🛋🚪🚽🛁🛏🌈

	SET @MapData = REPLACE(@MapData, N'j', N'🏕')
	SET @MapData = REPLACE(@MapData, N'h', N'🕌')
	SET @MapData = REPLACE(@MapData, N'e', N'🏰')
	SET @MapData = REPLACE(@MapData, N's', N'🏛')
	SET @MapData = REPLACE(@MapData, N'c', N'🎪')
	SET @MapData = REPLACE(@MapData, N'v', N'🌲')
	SET @MapData = REPLACE(@MapData, N'f', N'⛲')
	SET @MapData = REPLACE(@MapData, N'z', N'💈')
	SET @MapData = REPLACE(@MapData, N'w', N'🏩')
	SET @MapData = REPLACE(@MapData, N'q', N'🏚')
	SET @MapData = REPLACE(@MapData, N'u', N'⛪')
	SET @MapData = REPLACE(@MapData, N'i', N'🏡')
	SET @MapData = REPLACE(@MapData, N'o', N'🏘')
	SET @MapData = REPLACE(@MapData, N':', N'🕍')
	SET @MapData = REPLACE(@MapData, N'"', N'🏤')
	SET @MapData = REPLACE(@MapData, N'.', N'🏥')
	SET @MapData = REPLACE(@MapData, N',', N'🏦')
	SET @MapData = REPLACE(@MapData, N'?', N'🏣')
	SET @MapData = REPLACE(@MapData, N'|', N'🏢')
	SET @MapData = REPLACE(@MapData, N']', N'🏭')
	SET @MapData = REPLACE(@MapData, N'[', N'🗼')
	SET @MapData = REPLACE(@MapData, N'=', N'🌉')

	SET @MapData = REPLACE(@MapData, N'n', N'🐍')
	SET @MapData = REPLACE(@MapData, N'@', N'😈')
	SET @MapData = REPLACE(@MapData, N'k', N'💀')
	SET @MapData = REPLACE(@MapData, N'y', N'🐉')
	SET @MapData = REPLACE(@MapData, N'l', N'🐌')
	SET @MapData = REPLACE(@MapData, N'r', N'🐢')
	SET @MapData = REPLACE(@MapData, N'{', N'🕷')
	SET @MapData = REPLACE(@MapData, N'a', N'🐘')
	SET @MapData = REPLACE(@MapData, N't', N'🐅')

	IF (@PlayerIsDead = 1)
	BEGIN
		SET @MapData = REPLACE(@MapData, N'*', @DeathIcon)
	END
	ELSE
	BEGIN
		SET @MapData = REPLACE(@MapData, N'*', @PlayerIcon)
	END

	SELECT @MapData

	SET NOCOUNT OFF
END
GO
