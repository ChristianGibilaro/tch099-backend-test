/*Copy-Paste Template

--__________________________________________________________________________

-- table structure for table `` 
CREATE TABLE `` (

  -- Unique & Key
  `ID` int() UNIQUE NOT NULL AUTO_INCREMENT,
  `` varchar() NOT NULL UNIQUE,
  
  -- NOT NULL
  `` varchar() NOT NULL,
  `` int() NOT NULL,

  --Nullable
  `` varchar(),
  `` text,
  `` int(),

--Connections
  PRIMARY KEY (`ID`),
  FOREIGN KEY (``) REFERENCES `` (`ID`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--__________________________________________________________________________

-- table structure for table `` 
CREATE TABLE `` (
  
  -- NOT NULL
  `` int() NOT NULL,
  `` int() NOT NULL,

--Connections
  FOREIGN KEY (``) REFERENCES `` (`ID`),
  FOREIGN KEY (``) REFERENCES `` (`ID`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




MODS a faire au diagrame logique:
TO DO:


*/

CREATE TABLE `Position` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(70) NOT NULL,
  `Country` VARCHAR(70),
  `State` VARCHAR(70),
  `City` VARCHAR(70),
  `Street` VARCHAR(70),
  `Number` INT(16),
  `GPS` TEXT,
  `Local_Time` INT(8),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `PositionFilter` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(70) NOT NULL UNIQUE,
  `Count` INT(16) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `PositionArray` (
  `PositionID` INT(16) NOT NULL,
  `PositionFilterID` INT(16) NOT NULL,
  FOREIGN KEY (`PositionID`) REFERENCES `Position` (`ID`),
  FOREIGN KEY (`PositionFilterID`) REFERENCES `PositionFilter` (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Type` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `TypeFilter` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(70) NOT NULL UNIQUE,
  `Count` INT(16) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `TypeArray` (
  `TypeID` INT(16) NOT NULL,
  `TypeFilterID` INT(16) NOT NULL,
  FOREIGN KEY (`TypeID`) REFERENCES `Type` (`ID`),
  FOREIGN KEY (`TypeFilterID`) REFERENCES `TypeFilter` (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Language` (
  `ID` INT(10) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `LanguageFilter` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL UNIQUE,
  `Count` INT(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `LanguageArray` (
  `LanguageID` INT(10) NOT NULL,
  `LanguageFilterID` INT(16) NOT NULL,
  FOREIGN KEY (`LanguageID`) REFERENCES `Language` (`ID`),
  FOREIGN KEY (`LanguageFilterID`) REFERENCES `LanguageFilter` (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Environment` (
  `ID` INT(10) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `EnvironmentFilter` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL UNIQUE,
  `Count` INT(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `EnvironmentArray` (
  `EnvironmentID` INT(10) NOT NULL,
  `EnvironmentFilterID` INT(16) NOT NULL,
  FOREIGN KEY (`EnvironmentID`) REFERENCES `Environment` (`ID`),
  FOREIGN KEY (`EnvironmentFilterID`) REFERENCES `EnvironmentFilter` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Activity` (
  `ID` INT(32) UNIQUE NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(70) NOT NULL UNIQUE,
  `IsSport` BIT NOT NULL,
  `Main_Img` VARCHAR(255) NOT NULL,
  `Description` TEXT NOT NULL,
  `Creation_Date` TIMESTAMP NULL DEFAULT current_timestamp(),
  `Logo_Img` VARCHAR(255),
  `Point_Value` VARCHAR(35),
  `Word_4_Player` VARCHAR(35),
  `Word_4_Teammate` VARCHAR(35),
  `Word_4_Playing` VARCHAR(35),
  `Live_url` TEXT,
  `Live_Desc` TEXT,
  `Main_Color` VARCHAR(32),
  `Second_Color` VARCHAR(32),
  `Friend_Main_Color` VARCHAR(32),
  `Friend_Second_Color` VARCHAR(32),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Team` (
  `ID` INT(64) UNIQUE NOT NULL AUTO_INCREMENT,
  `ActivityID` INT(32) NOT NULL,
  `Name` VARCHAR(35) NOT NULL,
  `Description` TEXT NOT NULL,
  `Creation_Date` TIMESTAMP NULL DEFAULT current_timestamp(),
  `Main_Img` VARCHAR(255),
  `Logo_Img` VARCHAR(255),
  `Main_Color` VARCHAR(32),
  `Second_Color` VARCHAR(32),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ActivityID`) REFERENCES `Activity` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Rank` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(35) NOT NULL,
  `Image` VARCHAR(255),
  `Index` INT(8),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Level` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(35) NOT NULL,
  `Img` VARCHAR(255),
  `Index` INT(10),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `ActivityLevel` (
  `Name` VARCHAR(35) NOT NULL,
  `ActivityID` INT(32) NOT NULL,
  `LevelID` INT(16) NOT NULL,
  FOREIGN KEY (`ActivityID`) REFERENCES `Activity` (`ID`),
  FOREIGN KEY (`LevelID`) REFERENCES `Level` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `User` (
  `ID` INT(32) UNIQUE NOT NULL AUTO_INCREMENT,
  `Image` VARCHAR(255) UNIQUE NOT NULL,
  `Pseudo` VARCHAR(35) NOT NULL,
  `Name` VARCHAR(70) NOT NULL,
  `Email` VARCHAR(320) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `Last_Login` DATE NOT NULL,
  `LanguageID` INT(10) NOT NULL, 
  `Creation_Date` TIMESTAMP NULL DEFAULT current_timestamp(),
  `PositionID` INT(16),
  `Description` TEXT,
  `Birth` DATE,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`PositionID`) REFERENCES `Position` (`ID`),
  FOREIGN KEY (`LanguageID`) REFERENCES `Language` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Match` (
  `ID` INT(64) UNIQUE NOT NULL AUTO_INCREMENT,
  `Is_Public` BIT NOT NULL,
  `UserID` INT(32) NOT NULL,
  `Creation_Date` TIMESTAMP NULL DEFAULT current_timestamp(),
  `End_Date` DATETIME,
  `Opening_End` DATETIME,
  `Description` TEXT,
  `TeamID` INT(64),
  `ActivityID` INT(32),
  `LevelID` INT(16),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`TeamID`) REFERENCES `Team` (`ID`),
  FOREIGN KEY (`ActivityID`) REFERENCES `Activity` (`ID`),
  FOREIGN KEY (`LevelID`) REFERENCES `Level` (`ID`)
  -- Pour ajouter la FK user → FOREIGN KEY (`UserID`) REFERENCES `User`(`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `UserFriend` (
  `UserID` INT(32) NOT NULL,
  `FriendID` INT(32) NOT NULL,
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`FriendID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `UserBlocked` (
  `UserID` INT(32) NOT NULL,
  `BlockedID` INT(32) NOT NULL,
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`BlockedID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Notification` (
  `ID` INT(24) UNIQUE NOT NULL AUTO_INCREMENT,
  `Content` VARCHAR(512) NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `Expiration_hours` INT(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `UserNotification` (
  `UserID` INT(32) NOT NULL,
  `TeamID` INT(64),
  `NotificationID` INT(24),
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`TeamID`) REFERENCES `Team` (`ID`),
  FOREIGN KEY (`NotificationID`) REFERENCES `Notification` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `UserActivity` (
  `UserID` INT(32) NOT NULL,
  `ActivityID` INT(32) NOT NULL,
  `Game_Count` INT(16) NOT NULL,
  `Joined_Date` DATE NOT NULL,
  `Encoded_Stats` VARCHAR(255),
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`ActivityID`) REFERENCES `Activity` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `AdminActivity` (
  `UserID` INT(32) NOT NULL,
  `ActivityID` INT(32) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`ActivityID`) REFERENCES `Activity` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `UserTeam` (
  `UserID` INT(32) NOT NULL,
  `TeamID` INT(64) NOT NULL,
  `RankID` INT(16) NOT NULL,
  `Game_Count` INT(16) NOT NULL,
  `Joined_Date` DATE NOT NULL,
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`TeamID`) REFERENCES `Team` (`ID`),
  FOREIGN KEY (`RankID`) REFERENCES `Rank` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `AdminTeam` (
  `UserID` INT(32) NOT NULL,
  `TeamID` INT(64) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`TeamID`) REFERENCES `Team` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `UserMatch` (
  `UserID` INT(32) NOT NULL,
  `MatchID` INT(64) NOT NULL,
  `Stats_Encoded` VARCHAR(255),
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`MatchID`) REFERENCES `Match` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `AdminMatch` (
  `UserID` INT(32) NOT NULL,
  `MatchID` INT(64) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`MatchID`) REFERENCES `Match` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `ImgLib` (
  `UserID` INT(32),
  `TeamID` INT(64),
  `MatchID` INT(64),
  `ActivityID` INT(32),
  `Url` VARCHAR(2048),
  `Index` INT(255),
  `Img` VARCHAR(255),
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`TeamID`) REFERENCES `Team` (`ID`),
  FOREIGN KEY (`MatchID`) REFERENCES `Match` (`ID`),
  FOREIGN KEY (`ActivityID`) REFERENCES `Activity` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Invitation` (
  `Name` VARCHAR(70) NOT NULL,
  `TeamID` INT(64) NOT NULL,
  `UserID` INT(32) NOT NULL,
  `RankID` INT(16) NOT NULL,
  `Expiration_date` DATE,
  FOREIGN KEY (`TeamID`) REFERENCES `Team` (`ID`),
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`RankID`) REFERENCES `Rank` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `TeamRank` (
  `ID` INT(16) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(70) NOT NULL,
  `RankID` INT(16) NOT NULL,
  `TeamID` INT(64) NOT NULL,
  `Index` INT(8),
  `Image` VARCHAR(255),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`RankID`) REFERENCES `Rank` (`ID`),
  FOREIGN KEY (`TeamID`) REFERENCES `Team` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Chat` (
  `ID` INT(32) UNIQUE NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(32) NOT NULL,
  `Creation_Date` TIMESTAMP NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `ChatCreator` (
  `UserID` INT(32) NOT NULL,
  `TeamID` INT(64),
  `ChatID` INT(32) NOT NULL,
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`),
  FOREIGN KEY (`TeamID`) REFERENCES `Team` (`ID`),
  FOREIGN KEY (`ChatID`) REFERENCES `Chat` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `Message` (
  `ID` INT(64) UNIQUE NOT NULL AUTO_INCREMENT,
  `UserID` INT(32) NOT NULL,
  `Content` VARCHAR(1024) NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `File` VARCHAR(1024),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;

CREATE TABLE `ChatMessage` (
  `ChatID` INT(32) NOT NULL,
  `MessageID` INT(64) NOT NULL,
  FOREIGN KEY (`ChatID`) REFERENCES `Chat` (`ID`),
  FOREIGN KEY (`MessageID`) REFERENCES `Message` (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;




/*

-- __________________________________________________________ CODE DU PROF TCH056 ___________________________________________________-

-- table structure for table `coaches`
CREATE TABLE `coaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- table structure for table `locations`
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- table structure for table `levels`
CREATE TABLE `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- table structure for table `activities` 
CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `level_id` varchar(50) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `schedule_day` varchar(20) NOT NULL,
  `schedule_time` varchar(20) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`),
  FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `username` varchar(50) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- indexes for table `activities`
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coach_id` (`coach`),
  ADD KEY `location_id` (`location`);
  ADD KEY `level_id` (`level`);

-- indexes for table `coaches`
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`id`);

-- indexes for table `locations`
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

-- indexes for table `locations`
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

-- Indexes for table `users`
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE_USERNAME` (`username`);

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `users`
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`coach`) REFERENCES `coaches` (`name`),
  ADD CONSTRAINT `activities_ibfk_2` FOREIGN KEY (`location`) REFERENCES `locations` (`name`);
  ADD CONSTRAINT `activities_ibfk_3` FOREIGN KEY (`level`) REFERENCES `levels` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET_CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
