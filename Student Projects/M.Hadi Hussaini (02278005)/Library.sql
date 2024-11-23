CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `Book_No` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Author_No` int DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Edition` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `YearOfPublication` year DEFAULT NULL,
  `Publisher_ID` int DEFAULT NULL,
  PRIMARY KEY (`Book_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (101,'The Great Gatsby',1,'9780743273565','First','Fiction',10.99,1925,1),(102,'To Kill a Mockingbird',2,'9780061120084','Second','Fiction',12.50,1960,NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuereturn`
--

DROP TABLE IF EXISTS `issuereturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issuereturn` (
  `Reg_No` int NOT NULL,
  `Book_No` int DEFAULT NULL,
  `User_ID` int DEFAULT NULL,
  `ReserveDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`Reg_No`),
  KEY `Book_No` (`Book_No`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `issuereturn_ibfk_1` FOREIGN KEY (`Book_No`) REFERENCES `books` (`Book_No`),
  CONSTRAINT `issuereturn_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `readers` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuereturn`
--

LOCK TABLES `issuereturn` WRITE;
/*!40000 ALTER TABLE `issuereturn` DISABLE KEYS */;
INSERT INTO `issuereturn` VALUES (1,101,1,'2024-11-01','2024-11-15'),(2,102,2,'2024-11-05','2024-11-20');
/*!40000 ALTER TABLE `issuereturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `Publisher_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `YearOfPublication` year DEFAULT NULL,
  PRIMARY KEY (`Publisher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Penguin Books',1935),(2,'HarperCollins',1989);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `User_ID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone_No` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (1,'Khalid','Amiri','KhalidAmiri133@gmail.com','0779287750','Kabul'),(2,'Erfan','Sadat','ErfanSadat50@gmail.com','0731128886','Kabul');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `Report_ID` int NOT NULL,
  `Staff_ID` int DEFAULT NULL,
  `IssueReturn_ID` int DEFAULT NULL,
  PRIMARY KEY (`Report_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `IssueReturn_ID` (`IssueReturn_ID`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`IssueReturn_ID`) REFERENCES `issuereturn` (`Reg_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff_ID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Alice Johnson'),(2,'Bob Williams');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffreaders`
--

DROP TABLE IF EXISTS `staffreaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffreaders` (
  `Staff_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Staff_ID`,`User_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `staffreaders_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  CONSTRAINT `staffreaders_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `readers` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffreaders`
--

LOCK TABLES `staffreaders` WRITE;
/*!40000 ALTER TABLE `staffreaders` DISABLE KEYS */;
INSERT INTO `staffreaders` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `staffreaders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-22 10:04:42
