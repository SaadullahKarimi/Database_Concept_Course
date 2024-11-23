-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: gym
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
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `Equipment_ID` int NOT NULL,
  `Equipment_name` varchar(20) NOT NULL,
  `Equipment_type` varchar(20) NOT NULL,
  `Member_ID` int DEFAULT NULL,
  PRIMARY KEY (`Equipment_ID`),
  KEY `Member_ID` (`Member_ID`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee`
--

DROP TABLE IF EXISTS `fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee` (
  `Fee_ID` int NOT NULL,
  `Fee_Ammount` float NOT NULL,
  `Fee_date` date NOT NULL,
  `training_schedule` int DEFAULT NULL,
  `Sess_ID` int DEFAULT NULL,
  PRIMARY KEY (`Fee_ID`),
  KEY `Sess_ID` (`Sess_ID`),
  CONSTRAINT `fee_ibfk_1` FOREIGN KEY (`Sess_ID`) REFERENCES `training_schedule` (`Sess_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee`
--

LOCK TABLES `fee` WRITE;
/*!40000 ALTER TABLE `fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_ID` int NOT NULL,
  `Member_name` varchar(20) NOT NULL,
  `Member_contact` char(13) NOT NULL,
  `Member_address` varchar(40) NOT NULL,
  `Member_email` varchar(50) NOT NULL,
  `Trainer_ID` int DEFAULT NULL,
  PRIMARY KEY (`Member_ID`),
  UNIQUE KEY `Member_email` (`Member_email`),
  KEY `Trainer_ID` (`Trainer_ID`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Trainer_ID`) REFERENCES `trainer` (`Trainer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff_ID` int NOT NULL,
  `Staff_name` varchar(20) NOT NULL,
  `Staff_contact` char(13) NOT NULL,
  `Staff_address` varchar(20) NOT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `Trainer_ID` int NOT NULL,
  `Trainer_name` varchar(20) NOT NULL,
  `Trainer_contact` char(13) NOT NULL,
  `Trainer_address` varchar(20) NOT NULL,
  PRIMARY KEY (`Trainer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (21,'Ahmad','07888888888','Kabul');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_schedule`
--

DROP TABLE IF EXISTS `training_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_schedule` (
  `Sess_ID` int NOT NULL,
  `Sess_Date` date DEFAULT NULL,
  `Sess_time` varchar(10) DEFAULT NULL,
  `Sess_duration` varchar(10) DEFAULT NULL,
  `Sess_Details` varchar(30) DEFAULT NULL,
  `Trainer_ID` int DEFAULT NULL,
  PRIMARY KEY (`Sess_ID`),
  UNIQUE KEY `Sess_Date` (`Sess_Date`),
  UNIQUE KEY `Sess_time` (`Sess_time`),
  UNIQUE KEY `Sess_duration` (`Sess_duration`),
  UNIQUE KEY `Sess_Details` (`Sess_Details`),
  KEY `Trainer_ID` (`Trainer_ID`),
  CONSTRAINT `training_schedule_ibfk_1` FOREIGN KEY (`Trainer_ID`) REFERENCES `trainer` (`Trainer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_schedule`
--

LOCK TABLES `training_schedule` WRITE;
/*!40000 ALTER TABLE `training_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 11:08:06
