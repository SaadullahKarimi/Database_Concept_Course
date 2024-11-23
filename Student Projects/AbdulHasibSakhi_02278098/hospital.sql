-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitall
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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `ID` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Gender` char(3) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Specialist` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Wahid Aqmal','M',50,'cardiovascular'),(2,'Bezhan Niazi','M',52,'Stomatolog');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_record`
--

DROP TABLE IF EXISTS `medical_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record` (
  `Mr_No` int NOT NULL,
  `Date` date DEFAULT NULL,
  `Diagnose` varchar(50) DEFAULT NULL,
  `Drugs` varchar(50) DEFAULT NULL,
  `referencev` varchar(30) DEFAULT NULL,
  `registered_by` int DEFAULT NULL,
  `Doctor` int DEFAULT NULL,
  PRIMARY KEY (`Mr_No`),
  KEY `registered_by` (`registered_by`),
  KEY `Doctor` (`Doctor`),
  CONSTRAINT `medical_record_ibfk_1` FOREIGN KEY (`registered_by`) REFERENCES `registeration` (`Mr_No`),
  CONSTRAINT `medical_record_ibfk_2` FOREIGN KEY (`Doctor`) REFERENCES `doctor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record`
--

LOCK TABLES `medical_record` WRITE;
/*!40000 ALTER TABLE `medical_record` DISABLE KEYS */;
INSERT INTO `medical_record` VALUES (815,'2024-07-22','Lack of concentration','TAP Zeekap, SIP Tramadol','Mental Departement',209,2);
/*!40000 ALTER TABLE `medical_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `Mr_No` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Gender` char(3) NOT NULL,
  `Age` int DEFAULT NULL,
  `Notes` varchar(50) NOT NULL,
  `Coresponding_Doctor` int DEFAULT NULL,
  PRIMARY KEY (`Mr_No`),
  KEY `Coresponding_Doctor` (`Coresponding_Doctor`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`Coresponding_Doctor`) REFERENCES `doctor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (102,'Qari Mujeer','M',32,'Lake of concentration',2);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registeration`
--

DROP TABLE IF EXISTS `registeration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registeration` (
  `Mr_No` int NOT NULL,
  `Date` date NOT NULL,
  `Poly` varchar(40) DEFAULT NULL,
  `Assurance` varchar(30) DEFAULT NULL,
  `Age` char(10) DEFAULT NULL,
  `patient` int DEFAULT NULL,
  PRIMARY KEY (`Mr_No`),
  KEY `patient` (`patient`),
  CONSTRAINT `registeration_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`Mr_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeration`
--

LOCK TABLES `registeration` WRITE;
/*!40000 ALTER TABLE `registeration` DISABLE KEYS */;
INSERT INTO `registeration` VALUES (209,'2024-07-22','pressure: 120/80, weight:90 KG','','32 yo',102);
/*!40000 ALTER TABLE `registeration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 10:11:40
