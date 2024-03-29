USE [SeacrawlAdventures]
GO
/****** Object:  StoredProcedure [dbo].[DO]    Script Date: 11/7/2019 2:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DO] (@Action varchar(50))
AS
BEGIN
SET NOCOUNT ON
	UPDATE Record SET Total += 1 WHERE Name = 'Number of Turns'
	
	DECLARE @PlayerId int, @PlayerName nvarchar(20), @PlayerHealth int, @PlayerIcon nvarchar(2), 
			@MapId int, @Point int, @UI nvarchar(500), @ActionInfo nvarchar(2000), @SearchInfo nvarchar(500), @LvlUp bit,
			@PlayerMaxHealth int, @PlayerStrength int, @PlayerMaxStrength int, @PlayerSkill int, @PlayerMaxSkill int 

	SELECT	@PlayerId = c.Id,
			@PlayerName = Name, 
			@PlayerHealth = Health, 
			@PlayerIcon = Icon,
			@MapId = cl.MapId,
			@Point = cl.Point 
	FROM Character c 
		INNER JOIN CharacterType ct on (c.TypeId = ct.Id) 
		INNER JOIN CharacterLocation cl on (c.Id = cl.CharacterId) 
	WHERE ct.IsPlayer = 1

	EXEC dbo.LevelUp @PlayerId, @LvlUp OUTPUT
	
	SELECT	@PlayerStrength = Strength,
			@PlayerSkill = Skill,
			@PlayerMaxHealth = MaxHealth,
			@PlayerMaxStrength = MaxStrength,
			@PlayerMaxSkill = MaxSkill 
	FROM Character c 
	WHERE Id = @PlayerId

	IF (@Action = 'New')
	BEGIN 
		UPDATE Character
		SET MaxHealth = 20,
			MaxStrength = 3,
			MaxSkill = 1,
			Health = 20,
			Strength = 3,
			Skill = 1, 
			Perception = 1,
			Magic = 0
		FROM Character c 
			INNER JOIN CharacterType ct on (c.TypeId = ct.Id) 
		WHERE ct.IsPlayer = 1

		SELECT @PlayerHealth = 20, @PlayerMaxHealth = 20, @PlayerStrength = 3, @PlayerMaxStrength = 3, @PlayerSkill = 1, @PlayerMaxSkill = 1

		UPDATE Record 
		SET Total = CASE WHEN Name = 'XP Remaining' THEN 10 ELSE 0 END,
			Title = ''

		UPDATE Item
		SET Found = 0

		UPDATE CharacterLocation
		SET MapId = 1,
			Point = 5
		FROM Character c 
			INNER JOIN CharacterType ct on (c.TypeId = ct.Id) 
			INNER JOIN CharacterLocation cl on (c.Id = cl.CharacterId) 
		WHERE ct.IsPlayer = 1

		SELECT @PlayerHealth = 20, @MapId = 1, @Point = 5
		SET @ActionInfo = CONCAT('You awake in the magical land of Seacrawl.', CHAR(13), 'Adventure awaits! You''re sure to find treasure, good food, ', CHAR(13), 'excitement, love, powerful weapons, and death... OK, mostly just death.', CHAR(13), CHAR(13))
	END
	ELSE
	IF (@Action = 'Retire')
	BEGIN
		SET @ActionInfo = ''
	END
	ELSE
	BEGIN
		IF (@PlayerHealth <= 0)
		BEGIN
			SET @ActionInfo = CONCAT(@PlayerName, ' is dead. To start a new adventure run "DO ''New''"', CHAR(13), CHAR(13))
		END
		ELSE
		IF (@Action = 'Enter')
		BEGIN
			DECLARE @ParentMapId int, @DoorPoint int, @TravelPoint int, @Name nvarchar(50), @IsDungeon bit
			
			IF(EXISTS(SELECT PlaceId FROM PlaceLocation WHERE point = @Point and MapId = @MapId))
			BEGIN
				
				SELECT @MapId = m.Id, @DoorPoint = DoorPoint, @Name = p.Name, @IsDungeon = IsDungeon FROM PlaceLocation pl INNER JOIN Place p on (p.Id = pl.PlaceId) INNER JOIN Map m on (m.Name = p.Name) WHERE pl.point = @Point
				
				UPDATE CharacterLocation 
				SET MapId = @MapId, 
					Point = @DoorPoint
				WHERE CharacterId = @PlayerId

				IF (@IsDungeon = 1)
				BEGIN
					EXEC dbo.SpawnEnemies @MapId
				END

				SET @ActionInfo = CONCAT('You have entered ', @Name, '.', CHAR(13), CHAR(13))
			END
			ELSE IF (@MapId > (SELECT Id FROM Map WHERE ParentMapId is NULL))
			BEGIN
				SELECT @ParentMapId = ParentMapId, @DoorPoint = DoorPoint, @TravelPoint = Point
				FROM PlaceLocation pl 
					INNER JOIN Place p on (p.Id = pl.PlaceId) 
					INNER JOIN Map m on (m.Name = p.Name) 
				WHERE m.Id = @MapId

				IF (@Point = @DoorPoint)
				BEGIN
					UPDATE CharacterLocation
					SET MapId = @ParentMapId,
						Point = @TravelPoint
					WHERE CharacterId = @PlayerId

					SELECT @MapId = @ParentMapId, @Point = @TravelPoint
				END
				ELSE
				BEGIN
					SET @ActionInfo = CONCAT('To travel you must be at a place or a door.', CHAR(13), CHAR(13))
				END
			END
			ELSE
			BEGIN
				SET @ActionInfo = CONCAT('Where are you trying to go?', CHAR(13), CHAR(13))
			END

		END
		ELSE
		IF (@Action = 'Heal')
		BEGIN
			IF (dbo.TileAtPoint(@MapId, @Point) = 'w')
			BEGIN
				UPDATE Character 
				SET Health = MaxHealth, Strength = MaxStrength, Skill = MaxSkill
				WHERE Id = @PlayerId

				SET @PlayerHealth = @PlayerMaxHealth

				SET @ActionInfo = CONCAT('You have been healed of all your wounds and are ready to adventure again.', CHAR(13), CHAR(13))
			END
			ELSE
			BEGIN
				SET @ActionInfo = CONCAT('What do you think this is World of Warcraft? 50 DKP MINUS!!', CHAR(13), CHAR(13))
			END
		END
		ELSE
		IF (@Action = 'Rest')
		BEGIN
			IF (@MapId  in (SELECT Id FROM Map WHERE Name NOT IN ('SeaCrawl','Shiloh')))
			BEGIN
				UPDATE Character 
				SET Strength = MaxStrength, Skill = MaxSkill
				WHERE Id = @PlayerId

				SELECT @PlayerStrength = @PlayerMaxStrength, @PlayerSkill = @PlayerMaxSkill

				SET @ActionInfo = CONCAT('You feel rested and are ready to adventure again.', CHAR(13), CHAR(13))
			END
			ELSE
			BEGIN
				IF (@MapId  in (SELECT Id FROM Map WHERE Name = 'SeaCrawl'))
				BEGIN
					SET @ActionInfo = CONCAT('You prepare your campsite and pull out your favorite book by Kalen Delaney.', CHAR(13), 'Just as you start to crack it open you notice shadows nearby.', CHAR(13), 'Perhaps it''s better to rest in a town safely.', CHAR(13), CHAR(13))
				END
				ELSE IF (@MapId  in (SELECT Id FROM Map WHERE Name = 'Shiloh'))
				BEGIN
					SET @ActionInfo = CONCAT('You take a quick moment to catch your breath.', CHAR(13), CHAR(13))
				END
			END
		END
		ELSE
		BEGIN
			IF (@Action = 'Help')
			BEGIN
				SET @ActionInfo = CONCAT(	'You can : ', CHAR(13), 
												CHAR(9), 'Move Left, Move Right, Move Up, Move Down', CHAR(13), 
												CHAR(9), 'Attack Left, Attack Right, Attack Up, Attack Down', CHAR(13), 
												CHAR(9), 'Search, Rest, Heal, Enter', CHAR(13), 
												CHAR(9), '', CHAR(13), CHAR(13))
			END
			ELSE
			IF (@Action not in ('MOVE LEFT','MOVE RIGHT', 'MOVE UP', 'MOVE DOWN', 'ENTER', 'HEAL', 'SEARCH', 'REST', 'ATTACK LEFT', 'ATTACK RIGHT', 'ATTACK UP', 'ATTACK DOWN'))
			BEGIN
				SET @ActionInfo = CONCAT(@PlayerName, ' is puzzled by your command. Try saying "DO ''help''"', CHAR(13), CHAR(13))
			END
			ELSE
			BEGIN
				DECLARE @dmg int, @AttackerId int, @AttackedId int, @AttackerName nvarchar(50), @defdmg int
				--MOVE LEFT, MOVE RIGHT, MOVE UP, MOVE DOWN
				IF (@Action in ('MOVE LEFT','MOVE RIGHT', 'MOVE UP', 'MOVE DOWN'))
				BEGIN
					EXEC dbo.MoveCharacter @PlayerId, @Action, @ActionInfo OUTPUT
					SELECT @Point = Point FROM CharacterLocation WHERE CharacterId = @PlayerId 
					If (@ActionInfo Like 'Attacked by:%')
					BEGIN				
						SET @AttackerId = REPLACE(@ActionInfo, 'Attacked by:', '')	
						EXEC dbo.attack @AttackerId, @dmg OUTPUT
						EXEC dbo.Defend @PlayerId, @dmg, @defdmg output
						
						UPDATE Character SET Health -= CASE WHEN @defdmg > Health THEN Health ELSE @defdmg END WHERE Id = @PlayerId
						
						SET @PlayerHealth -= @defdmg
						SELECT @AttackerName = name FROM Character WHERE id = @AttackerId
						SET @ActionInfo = CONCAT('The ', @AttackerName, ' has smashed you for ', @dmg, ' damage and you blocked ', @dmg - @defdmg, ' of it.', CHAR(13), CHAR(13));

						If (@PlayerHealth <= 0)
						BEGIN
							SET @PlayerHealth = 0;
							SET @ActionInfo = CONCAT('The ', @AttackerName, ' has crushed you with ', @dmg, ' damage and ', CHAR(13), 
													 'you have been slain.', CHAR(13), CHAR(13));
						END
					END

					EXEC dbo.MoveEnemies @MapId, @Point
				END
				ELSE
				IF (@Action in ('ATTACK LEFT','ATTACK RIGHT', 'ATTACK UP', 'ATTACK DOWN'))
				BEGIN
					SET @AttackedId = 0
					IF (@Action = 'ATTACK RIGHT')
					BEGIN
						SET @AttackedId = dbo.IsPointOccupied(@MapId, @Point, 'r')
					END
					IF (@Action = 'ATTACK LEFT')
					BEGIN
						SET @AttackedId = dbo.IsPointOccupied(@MapId, @Point, 'l')
					END
					IF (@Action = 'ATTACK UP')
					BEGIN
						SET @AttackedId = dbo.IsPointOccupied(@MapId, @Point, 'u')
					END
					IF (@Action = 'ATTACK DOWN')
					BEGIN
						SET @AttackedId = dbo.IsPointOccupied(@MapId, @Point, 'd')
					END
					
					IF (@AttackedId > 0)
					BEGIN
						SELECT @Name = Name FROM Character WHERE Id = @AttackedId 
						EXEC dbo.attack @PlayerId, @dmg OUTPUT
						EXEC dbo.Defend @AttackedId, @dmg, @defdmg output
						
						--UPDATE CHARACTER apply dmg
						UPDATE Character SET Health -= CASE WHEN @defdmg > Health THEN Health ELSE @defdmg END WHERE Id = @AttackedId
						IF (SELECT Health FROM Character WHERE Id = @AttackedId) <= 0
						BEGIN
							SET @ActionInfo = CONCAT('Your blow of ', @dmg, ' damage proved too much for the ', @Name, ' and it has been vanquished.', CHAR(13), CHAR(13));
							--GIVE XP/gold
							Declare @Val int = FLOOR(RAND()*(@defdmg)+1),
									@Record nvarchar(50) = CONCAT(@Name, ' killed'),
									@nVal int

							SET @nVal = 0-@Val;

							EXEC dbo.UpdateRecord @Record, 1
							EXEC dbo.UpdateRecord 'Gold',  @Val
							EXEC dbo.UpdateRecord 'XP', @Val
							EXEC dbo.UpdateRecord 'XP Remaining', @nVal
						END
						ELSE
						BEGIN
							SET @ActionInfo = CONCAT('You slashed ', @Name, ' for ', @dmg, ' damage and the ', @Name, ' blocked ', @dmg - @defdmg, ' damage.', CHAR(13), CHAR(13));
						END
					END					
				END
				ELSE
				IF (@Action = 'SEARCH')
				BEGIN 
					EXEC dbo.Search @MapId, @Point, @PlayerId, @SearchInfo OUTPUT
				END
			END
		END
	END
	
	--DELETE enemy with 0 health
	EXEC dbo.DespawnEnemies
	--IF NEXT TO Enemy then you should be attacked.
	DECLARE @AttackInfo nvarchar(1000)
	EXEC dbo.AttackPlayer @PlayerId, @Point, @MapId, @AttackInfo OUTPUT, @defdmg OUTPUT

	IF (@defdmg > 0)
	BEGIN
		UPDATE Character SET Health -= CASE WHEN @defdmg > Health THEN Health ELSE @defdmg END WHERE Id = @PlayerId
		
		SET @PlayerHealth -= CASE WHEN @PlayerHealth - @defdmg < 0 THEN @PlayerHealth ELSE @defdmg END
	END
	
	--Display UI and Text results
	SELECT @Point = cl.Point
	FROM Character c
		INNER JOIN CharacterType ct on (c.TypeId = ct.Id) 
		INNER JOIN CharacterLocation cl on (c.Id = cl.CharacterId) 
	WHERE ct.IsPlayer = 1

	Declare @PointInfo nvarchar(1000) = dbo.PointInfo(@MapId,@Point)
	IF (dbo.TileAtPoint(@MapId, @Point) = '~')
	BEGIN
		UPDATE Character 
		SET Health = 0
		--SET Health = MaxHealth
		FROM Character c 
			INNER JOIN CharacterType ct on (c.TypeId = ct.Id) 
		WHERE ct.IsPlayer = 1

		SET @PlayerHealth = 0;
		SET @ActionInfo = CONCAT('You have drown. Perhaps in your next life you''ll remember you can''t swim.', CHAR(13), CHAR(13));
		--SET @ActionInfo = CONCAT('It''s always nice to swim with turtles.', CHAR(13), CHAR(13));
	END
	ELSE 
	IF (dbo.TileAtPoint(@MapId, @Point) = '&')
	BEGIN
		UPDATE Character 
		SET Health = 0
		FROM Character c 
			INNER JOIN CharacterType ct on (c.TypeId = ct.Id) 
		WHERE ct.IsPlayer = 1

		SET @PlayerHealth = 0;
		SET @ActionInfo = CONCAT('You decided to end your adventure in a flaming ball of death.', CHAR(13), 'Next time remember you''re not a true dragon.', CHAR(13), CHAR(13));
	END
	ELSE 
	IF (dbo.TileAtPoint(@MapId, @Point) = '=')
	BEGIN
		UPDATE Character 
		SET Health = 0
		FROM Character c 
			INNER JOIN CharacterType ct on (c.TypeId = ct.Id) 
		WHERE ct.IsPlayer = 1

		SET @PlayerHealth = 0;
		SET @ActionInfo = CONCAT('A grumpy troll tackled you half way across the bridge ', CHAR(13), 'ripping your limbs off and eating them raw.', CHAR(13), CHAR(13));
	END
	ELSE 
	IF (dbo.TileAtPoint(@MapId, @Point) = 'D' and @PlayerHealth > 0)
	BEGIN
		UPDATE Character 
		SET Health -= 1
		FROM Character c 
			INNER JOIN CharacterType ct on (c.TypeId = ct.Id) 
		WHERE ct.IsPlayer = 1

		SET @PlayerHealth -= 1

		IF (@PlayerHealth = 0)
		BEGIN
			SET @ActionInfo = CONCAT('You have died of thirst.', CHAR(13), CHAR(13));
		END
	END	

	IF (@PlayerHealth <= 0)
	BEGIN
		SET @PointInfo = '';
	END

	DECLARE @LvlUpInfo nvarchar(500)
	IF (@LvlUp = 1)
	BEGIN
		SET @LvlUpInfo = CONCAT('You have leveled up! Try resting to increase you stats', CHAR(13), CHAR(13))
	END

	DECLARE @XPRemaining int, @Gold int
	SELECT @XPRemaining = Total FROM Record WHERE Name = 'XP Remaining'
	SELECT @Gold = Total FROM Record WHERE Name = 'Gold'
	--select @PlayerMaxHealth
	SET @UI = CONCAT(@PlayerName, '(', @PlayerIcon, ')', ' | Health : ', @PlayerHealth, '/', @PlayerMaxHealth,
	' | Strength : ', @PlayerStrength, '/', @PlayerMaxStrength,
	' | Skill : ', @PlayerSkill, '/', @PlayerMaxSkill,
	' | Gold : ', @Gold,
	' | XP to Next Level : ', @XPRemaining,
	 CHAR(13), CHAR(13))
	
	--Update MAX stats based on XP

	IF (@Action = 'Retire')
	BEGIN
		EXEC dbo.Retire
	END
	ELSE
	BEGIN
		exec dbo.ShowMap @MapId
		SELECT CONCAT(@UI, @ActionInfo, @AttackInfo, @PointInfo, @LvlUpInfo, @SearchInfo)
	END
	
SET NOCOUNT OFF
END
GO
