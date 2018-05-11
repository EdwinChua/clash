DELIMITER $$  
CREATE PROCEDURE GetUserActivity(IN playerId varchar(15))
   BEGIN
      DECLARE x INT Default 36 ;
      declare activityCount VARCHAR(255) default '';
      SET @maxCount = (SELECT id FROM clashdash.clan_non_static ORDER BY id DESC LIMIT 0, 1 );
      DROP TABLE IF EXISTS activityLog;
      CREATE TEMPORARY TABLE IF NOT EXISTS activityLog(
		`timestamp` timestamp NULL,
		`activityCount` int(11) NULL
		);
	  WHILE x <= @maxCount DO
			SET activityCount = 
            (select (u1.trophies > u2.trophies) + ((u1.trophies < u2.trophies) * (u1.attackWins < u2.attackWins) * 5) + ((u1.versusTrophies <> u2.versusTrophies) * 5) + ((u1.attackWins <> u2.attackWins)* 5) + 
			((u1.donations <> u2.donations)* 5) + ((u1.versusBattleWins<> u2.versusBattleWins)* 5) + ((u1.warStars <> u2.warStars)* 2)
			FROM
			  clashdash.players u1,
			  clashdash.players u2
			where u1.tag = playerId
			AND u2.tag = playerId
			AND u1.clan_nonStaticId = (x-1)
			AND u2.clan_nonStaticId = x);
		INSERT INTO activityLog (`timestamp`,`activityCount`) values ((SELECT timestamp FROM clashdash.clan_non_static where id = x),activityCount);
		SET x = x + 1;
	  END WHILE;
      select * from activityLog;
END $$