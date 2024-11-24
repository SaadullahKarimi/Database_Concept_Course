-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: futsalteam
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `Match_ID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Location` varchar(25) NOT NULL,
  `Home_Team_ID` int NOT NULL,
  `Away_Team_ID` int NOT NULL,
  `Home_Team_Score` int NOT NULL,
  `Away_Team_Score` int NOT NULL,
  PRIMARY KEY (`Match_ID`),
  KEY `Home_Team_ID` (`Home_Team_ID`),
  KEY `Away_Team_ID` (`Away_Team_ID`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`Home_Team_ID`) REFERENCES `teams` (`Team_ID`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`Away_Team_ID`) REFERENCES `teams` (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'2024-03-12','Yallan Ground',2,1,12,0);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_team`
--

DROP TABLE IF EXISTS `player_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_team` (
  `Player_ID` int DEFAULT NULL,
  `Team_ID` int DEFAULT NULL,
  KEY `Player_ID` (`Player_ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `player_team_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `players` (`Player_ID`),
  CONSTRAINT `player_team_ibfk_2` FOREIGN KEY (`Team_ID`) REFERENCES `teams` (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_team`
--

LOCK TABLES `player_team` WRITE;
/*!40000 ALTER TABLE `player_team` DISABLE KEYS */;
INSERT INTO `player_team` VALUES (1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2);
/*!40000 ALTER TABLE `player_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `Player_ID` int NOT NULL AUTO_INCREMENT,
  `Player_Name` varchar(25) NOT NULL,
  `Last_Name` varchar(25) NOT NULL,
  `Age` int NOT NULL,
  `Position` varchar(25) NOT NULL,
  `Join_Date` date NOT NULL,
  PRIMARY KEY (`Player_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Mohammad Zahid','Dawari',22,'Mid fielder','2020-01-01'),(2,'Hasibullah','Noorzai',19,'Right winger','2022-12-12'),(3,'Ali Agha','Ali zade',19,'Mid fielder','2022-12-23'),(4,'Mahmood ','Farhan',21,'Attack Mid fielder','2023-12-23'),(5,'Pasoon','Barakzai',21,'Defense Mid fielder','2023-12-23'),(6,'AB Hasib','Sakhi',21,'Center Back','2023-09-01'),(7,'AB Mujeer','Hamdard',30,'Goal Keeper','2019-09-01'),(8,'Sajad','Ahamdi',22,'Center Forward','2020-09-01'),(9,'Didar','Ramaki',22,'Left Winger','2020-10-01'),(10,'Mujtaba','Hashimi',20,'Right Back','2020-10-01'),(11,'Elham','Rahimi',20,'Left Back','2020-10-01');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `Team_ID` int NOT NULL AUTO_INCREMENT,
  `Team_Name` varchar(25) NOT NULL,
  `Coach_Name` varchar(25) NOT NULL,
  `Founded_Year` int DEFAULT NULL,
  PRIMARY KEY (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Pashtoon','Ahmad',2015),(2,'FC MUSLIM UNITED','Hasibullah Noori',2012);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_sessions`
--

DROP TABLE IF EXISTS `training_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_sessions` (
  `Session_ID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Location` varchar(25) NOT NULL,
  `Team_ID` int NOT NULL,
  PRIMARY KEY (`Session_ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `training_sessions_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `teams` (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_sessions`
--

LOCK TABLES `training_sessions` WRITE;
/*!40000 ALTER TABLE `training_sessions` DISABLE KEYS */;
INSERT INTO `training_sessions` VALUES (1,'2024-03-23','20:00:00','Training ground',2);
/*!40000 ALTER TABLE `training_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 11:03:53
