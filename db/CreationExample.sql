-- table structure for table `ClassName` 
CREATE TABLE `ClassName` (

  -- Unique & Key
  `ID` int() UNIQUE NOT NULL AUTO_INCREMENT,
  `` varchar() UNIQUE NOT NULL,
  
  -- NOT NULL
  `` varchar() NOT NULL,
  `` int() NOT NULL,

  --Nullable
  `` varchar(),
  `` text,
  `` int(),

--Connections
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`xxxxID`) REFERENCES `yyyyClass` (`ID`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;