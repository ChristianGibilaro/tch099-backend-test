-- Positions
INSERT INTO `Position` (`Name`, `Country`, `City`) 
VALUES
  ('Tour Eiffel', 'France', 'Paris'),
  ('Big Ben',     'England', 'London');

-- Types
INSERT INTO `Type` (`Name`)
VALUES
  ('Sport'),
  ('E-Sport');

-- Langues
INSERT INTO `Language` (`Name`)
VALUES
  ('French'),
  ('English');

-- Environments
INSERT INTO `Environment` (`Name`)
VALUES
  ('Indoor'),
  ('Outdoor');

-- Levels
INSERT INTO `Level` (`Name`)
VALUES
  ('Débutant');

-- Activity
INSERT INTO `Activity`
  (`Title`, `IsSport`, `Main_Img`, `Description`)
VALUES
  (
    'Football',
    b'1',
    'https://exemple.com/football.png',
    'Activity for playing football matches.'
  );

-- Team
INSERT INTO `Team`
  (`ActivityID`, `Name`, `Description`)
VALUES
  (
    1,
    'ParisUnited',
    'Friendly local team'
  );

-- Users
INSERT INTO `User`
  (`Img`, `Pseudo`, `Name`, `Email`, `Password`, `Last_Login`, `LanguageID`, `PositionID`)
VALUES
  (
    'https://exemple.com/ava1.jpg',
    'Alice88',
    'Alice Martin',
    'alice@example.com',
    'hashedPwd1',
    '2025-01-10',
    1,
    1
  ),
  (
    'https://exemple.com/ava2.jpg',
    'Boby',
    'Bob Marley',
    'bob@example.com',
    'hashedPwd2',
    '2025-01-15',
    2,
    2
  ),
  (
    'https://exemple.com/ava3.jpg',
    'CharlieC',
    'Charlie Cole',
    'charlie@example.com',
    'hashedPwd3',
    '2025-02-01',
    1,
    1
  ),
  (
    'https://exemple.com/ava4.jpg',
    'DanaD',
    'Dana Davis',
    'dana@example.com',
    'hashedPwd4',
    '2025-03-01',
    2,
    2
  ),
  (
    'https://exemple.com/ava5.jpg',
    'EveE',
    'Eve Evans',
    'eve@example.com',
    'hashedPwd5',
    '2025-03-15',
    1,
    1
  );

-- UserFriend
INSERT INTO `UserFriend` (`UserID`, `FriendID`)
VALUES
  (1, 2);

-- Match
INSERT INTO `Match`
  (`Is_Public`, `UserID`, `TeamID`, `ActivityID`, `LevelID`, `Description`, `End_Date`, `Opening_End`)
VALUES
  (
    b'1',
    1,
    1,
    1,
    1,
    'Friendly match in Paris',
    '2025-04-01 18:00:00',
    '2025-04-01 17:30:00'
  );


-- 2.1 PositionFilter (1 exemple)
INSERT INTO `PositionFilter` (`Name`, `Count`)
VALUES
  ('FilterParis',  100);

-- 2.2 TypeFilter (1 exemple)
INSERT INTO `TypeFilter` (`Name`, `Count`)
VALUES
  ('FilterSport',  200);

-- 2.3 LanguageFilter (1 exemple)
INSERT INTO `LanguageFilter` (`Name`, `Count`)
VALUES
  ('FilterFrench', 50);

-- 2.4 EnvironmentFilter (1 exemple)
INSERT INTO `EnvironmentFilter` (`Name`, `Count`)
VALUES
  ('FilterIndoor', 30);

INSERT INTO `ActivityLevel` (`Name`, `ActivityID`, `LevelID`)
VALUES
  (
    'BeginnerLevel', 
    1,   -- l'Activity qu'on vient d'insérer
    1    -- Level = "Débutant"
  );

  INSERT INTO `UserBlocked` (`UserID`, `BlockedID`)
VALUES
  (1, 3);

  -- Ranks
INSERT INTO `Rank` (`Name`, `Img`, `Index`)
VALUES
  ('Captain',   'https://exemple.com/captain.png',   1),
  ('Lieutenant','https://exemple.com/lieutenant.png',2),
  ('Member',    'https://exemple.com/member.png',   3);

INSERT INTO `UserTeam`
  (`UserID`, `TeamID`, `RankID`, `Game_Count`)
VALUES
  (
    2,  -- Bob
    1,  -- ParisUnited
    1,  -- Captain
    10
  );

INSERT INTO `UserMatch`
  (`UserID`, `MatchID`, `Stats_Encoded`)
VALUES
  (
    2,  -- Bob
    1,  -- Match #1
    'No stats yet'
  );

INSERT INTO `Invitation`
  (`Name`, `TeamID`, `UserID`, `RankID`, `Expiration_date`)
VALUES
  (
    'Join our team!',
    1,  -- ParisUnited
    2,  -- Bob
    1,  -- Captain
    '2025-05-01'
  );


INSERT INTO `TeamRank`
  (`ID`, `Name`, `RankID`, `TeamID`)
VALUES
  (
    1,
    'CaptainOfTeam',
    1,  -- Rank #1
    1   -- Team #1
  );

INSERT INTO `Message`
  (`UserID`, `Content`)
VALUES
  (
    1,  -- Alice
    'Hello everyone, welcome!'
  );

INSERT INTO `Chat`
  (`Name`)
VALUES
  ('TeamChat');

INSERT INTO `ChatCreator`
  (`UserID`, `TeamID`, `ChatID`)
VALUES
  (
    1,  -- Alice
    1,  -- ParisUnited
    1   -- TeamChat
  );

INSERT INTO `ChatMessage` (`ChatID`, `MessageID`)
VALUES
  (1, 1);

-- 18) AdminActivity (User=1, Activity=1)
INSERT INTO `AdminActivity`
  (`UserID`, `ActivityID`, `Password`)
VALUES
  (1, 1, 'secretForActivity');

-- 19) AdminMatch (User=1, Match=1)
INSERT INTO `AdminMatch`
  (`UserID`, `MatchID`, `Password`)
VALUES
  (1, 1, 'secretForMatch');

-- 20) AdminTeam (User=1, Team=1)
INSERT INTO `AdminTeam`
  (`UserID`, `TeamID`, `Password`)
VALUES
  (1, 1, 'secretForTeam');

-- 21) Notification
INSERT INTO `Notification`
  (`Content`, `Date`, `Time`, `Expiration_hours`)
VALUES
  (
    'Welcome to the new league!',
    '2025-03-30',
    '12:00:00',
    48
  );

-- 22) UserNotification (User=1, Team=1, Notification=1)
INSERT INTO `UserNotification`
  (`UserID`, `TeamID`, `NotificationID`)
VALUES
  (1, 1, 1);

-- 23) UserActivity (User=1, Activity=1)
INSERT INTO `UserActivity`
  (`UserID`, `ActivityID`, `Game_Count`, `Joined_Date`, `Encoded_Stats`)
VALUES
  (
    1,   -- Alice
    1,   -- Football
    5,
    CURRENT_TIMESTAMP(),  -- ou toute autre date
    'SomeStatsEncodedHere'
  );

-- 24) ImgLib (référence user=1, team=1, match=1, activity=1)
INSERT INTO `ImgLib`
  (`UserID`, `TeamID`, `MatchID`, `ActivityID`, `Url`, `Index`, `Img`)
VALUES
  (
    1,
    1,
    1,
    1,
    'https://exemple.com/img_souvenir.jpg',
    1,
    'souvenir.jpg'
  );

-- 25) ActivityFilter (PositionFilterID=1, TypeFilterID=1, etc.)
INSERT INTO `ActivityFilter`
  (`PositionFilterID`, `TypeFilterID`, `LanguageFilterID`, `EnvironmentFilterID`)
VALUES
  (1, 1, 1, 1);

-- 26) ActivityData
INSERT INTO `ActivityData`
  (`ActivityFilterID`, `ActivityID`, `PositionID`, `TypeID`, `LanguageID`, `EnvironmentID`,
   `Team_Count`, `QuickTeam_Count`, `Player_Count`, `Active_Player_Count`, `Rating`)
VALUES
  (
    1,  -- activityFilter #1
    1,  -- activity #1
    1,  -- position #1
    1,  -- type #1 (Sport)
    1,  -- language #1 (French)
    1,  -- environment #1 (Indoor)
    2,
    1,
    10,
    5,
    9
  );

-- 27) TeamFilter
INSERT INTO `TeamFilter`
  (`PositionFilterID`, `TypeFilterID`, `LanguageFilterID`, `EnvironmentFilterID`)
VALUES
  (1, 1, 1, 1);

-- 28) TeamData
INSERT INTO `TeamData`
  (`TeamFilterID`, `TeamID`, `PositionID`, `TypeID`, `LanguageID`, `EnvironmentID`,
   `Match_Count`, `Max_Player`, `Player_Count`, `Active_Player_Count`, `Rating`)
VALUES
  (
    1,  -- teamFilter #1
    1,  -- team #1
    1,  -- position #1
    1,  -- type #1
    1,  -- language #1
    1,  -- environment #1
    5,
    11,
    9,
    8,
    10
  );

-- 29) MatchFilter
INSERT INTO `MatchFilter`
  (`PositionFilterID`, `TypeFilterID`, `LanguageFilterID`, `EnvironmentFilterID`)
VALUES
  (1, 1, 1, 1);

-- 30) MatchData
INSERT INTO `MatchData`
  (`MatchFilterID`, `MatchID`, `PositionID`, `TypeID`, `LanguageID`, `EnvironmentID`,
   `Team_Count`, `QuickTeam_Count`, `Player_Count`, `Active_Player_Count`, `Rating`)
VALUES
  (
    1,  -- matchFilter #1
    1,  -- match #1
    1,  -- position #1
    1,  -- type #1
    1,  -- language #1
    1,  -- environment #1
    2,
    1,
    10,
    5,
    7
  );
