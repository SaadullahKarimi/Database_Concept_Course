-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dormetory
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
-- Table structure for table `dormetory`
--

DROP TABLE IF EXISTS `dormetory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormetory` (
  `number_D` int NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `adderss` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`number_D`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormetory`
--

LOCK TABLES `dormetory` WRITE;
/*!40000 ALTER TABLE `dormetory` DISABLE KEYS */;
INSERT INTO `dormetory` VALUES (21,'Kateb','darullaman');
/*!40000 ALTER TABLE `dormetory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `principle`
--

DROP TABLE IF EXISTS `principle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `principle` (
  `p_id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone_num` int NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `number_D` int DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `number_D` (`number_D`),
  CONSTRAINT `principle_ibfk_1` FOREIGN KEY (`number_D`) REFERENCES `dormetory` (`number_D`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principle`
--

LOCK TABLES `principle` WRITE;
/*!40000 ALTER TABLE `principle` DISABLE KEYS */;
INSERT INTO `principle` VALUES (1,'ahmad','ahmadi',78223211,'kabul',NULL);
/*!40000 ALTER TABLE `principle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL,
  `capacity` int NOT NULL,
  `is_empty` varchar(9) DEFAULT NULL,
  `is_full` varchar(9) DEFAULT NULL,
  `number_D` int DEFAULT NULL,
  `std_id` int DEFAULT NULL,
  `p_id` int DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `number_D` (`number_D`),
  KEY `std_id` (`std_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`number_D`) REFERENCES `dormetory` (`number_D`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`std_id`) REFERENCES `student` (`std_id`),
  CONSTRAINT `room_ibfk_3` FOREIGN KEY (`p_id`) REFERENCES `principle` (`p_id`),
  CONSTRAINT `room_ibfk_4` FOREIGN KEY (`p_id`) REFERENCES `principle` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `std_id` int NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `address` varchar(29) DEFAULT NULL,
  `phone_num` int NOT NULL,
  `number_D` int DEFAULT NULL,
  `p_id` int DEFAULT NULL,
  PRIMARY KEY (`std_id`),
  KEY `number_D` (`number_D`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`number_D`) REFERENCES `dormetory` (`number_D`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `principle` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (222,'mohammad','ali','laghman',783332211,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-19 20:53:30
