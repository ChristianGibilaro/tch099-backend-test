
/*

Copy-Paste Template

-- table structure for table `` 
CREATE TABLE `` (

  -- Unique & Key
  `ID` int() UNIQUE NOT NULL AUTO_INCREMENT,
  `` varchar() NOT NULL UNIQUE,
  
  -- NOT NULL
  `` varchar() NOT NULL,
  `` int() NOT NULL

  --Nullable
  `` varchar(),
  `` text,
  `` int(),

--Connections
  PRIMARY KEY (`ID`),
  FOREIGN KEY (``) REFERENCES `` (``),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

*/


-- table structure for table `user` 
CREATE TABLE `User` (
  -- Unique & Key
  `ID` int(32) UNIQUE NOT NULL AUTO_INCREMENT,
  `Image` varchar(255) UNIQUE NOT NULL,

  -- NOT NULL
  `Pseudo` varchar(35) NOT NULL,
  `Name` varchar(35) NOT NULL,
  `Email` varchar(320) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Last_Login` DATE NOT NULL,
  `LanguageID` int(10) NOT NULL
  `Creation_Date` timestamp NULL DEFAULT current_timestamp(),

  --Nullable
  `PositionID` int(16),
  `Description` text,
  `Birth` DATE,

  --Connections
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`PositionID`) REFERENCES `Position` (`ID`),
  FOREIGN KEY (`LanguageID`) REFERENCES `Language` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- table structure for table `activity` 
CREATE TABLE `Activity` (

  -- Unique & Key
  `ID` int(32) UNIQUE NOT NULL AUTO_INCREMENT,
  `Title` varchar(70) NOT NULL UNIQUE,
  
  -- NOT NULL
  `IsSport` BIT NOT NULL,
  `Main_Img` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Creation_Date` timestamp NULL DEFAULT current_timestamp(),
  
  --Nullable
  `Logo_Img` varchar(255),
  `Point_Value` varchar(35),
  `Word_4_Player` varchar(35),
  `Word_4_Teammate` varchar(35),
  `Word_4_Playing` varchar(35),
  `Live_url` text,
  `Live_Desc` text,
  `Main_Color` varchar(32),
  `Second_Color` varchar(32),
  `Friend_Main_Color` varchar(32),
  `Firend_Second_Color` varchar(32),

--Connections
  PRIMARY KEY (`ID`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- table structure for table `` 
CREATE TABLE `` (

  -- Unique & Key
  `ID` int() UNIQUE NOT NULL AUTO_INCREMENT,
  `` varchar() NOT NULL UNIQUE,
  
  -- NOT NULL
  `` varchar() NOT NULL,
  `` int() NOT NULL

  --Nullable
  `` varchar(),
  `` text,
  `` int(),

--Connections
  PRIMARY KEY (`ID`),
  FOREIGN KEY (``) REFERENCES `` (``),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



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
