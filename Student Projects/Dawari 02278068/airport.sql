-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: international_airport
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
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `Airplane_id` int NOT NULL,
  `Total_no_of_seats` int NOT NULL,
  PRIMARY KEY (`Airplane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES (1,150),(2,150),(3,250);
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane_type`
--

DROP TABLE IF EXISTS `airplane_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane_type` (
  `Type_name` varchar(20) NOT NULL,
  `Company` varchar(20) NOT NULL,
  `Max_seats` int DEFAULT NULL,
  `Airplane` int DEFAULT NULL,
  PRIMARY KEY (`Type_name`),
  KEY `Airplane` (`Airplane`),
  CONSTRAINT `airplane_type_ibfk_1` FOREIGN KEY (`Airplane`) REFERENCES `airplane` (`Airplane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane_type`
--

LOCK TABLES `airplane_type` WRITE;
/*!40000 ALTER TABLE `airplane_type` DISABLE KEYS */;
INSERT INTO `airplane_type` VALUES ('Boing Jet 2000','Boing',150,1),('Boing Jet 2001','Boing',150,2),('Flying jet','Boing',250,3);
/*!40000 ALTER TABLE `airplane_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `Airport_code` char(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Airplane` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Airport_code`),
  KEY `Airplane` (`Airplane`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`Airplane`) REFERENCES `airplane_type` (`Type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('A100','KABUL AIRPROT','Kabul','Kabul','Boing Jet 2000'),('B1200','UNITED ARAB AIRPORT','Abudabi','Abudabi','Boing Jet 2000'),('C2300','Ata Turk International Airport','Istanbul','','Flying Jet');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrival_airport`
--

DROP TABLE IF EXISTS `arrival_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrival_airport` (
  `scheduled_arr_time` time NOT NULL,
  `Flight_leg` int DEFAULT NULL,
  `Airport` char(10) DEFAULT NULL,
  KEY `Flight_leg` (`Flight_leg`),
  KEY `Airport` (`Airport`),
  CONSTRAINT `arrival_airport_ibfk_1` FOREIGN KEY (`Flight_leg`) REFERENCES `flight_leg` (`Leg_no`),
  CONSTRAINT `arrival_airport_ibfk_2` FOREIGN KEY (`Airport`) REFERENCES `airport` (`Airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrival_airport`
--

LOCK TABLES `arrival_airport` WRITE;
/*!40000 ALTER TABLE `arrival_airport` DISABLE KEYS */;
INSERT INTO `arrival_airport` VALUES ('02:30:00',100,'B1200');
/*!40000 ALTER TABLE `arrival_airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrives`
--

DROP TABLE IF EXISTS `arrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrives` (
  `Arr_time` time DEFAULT NULL,
  `Leg_instance` date DEFAULT NULL,
  `Airport` char(10) DEFAULT NULL,
  KEY `Leg_instance` (`Leg_instance`),
  KEY `Airport` (`Airport`),
  CONSTRAINT `arrives_ibfk_1` FOREIGN KEY (`Leg_instance`) REFERENCES `leg_instance` (`Date`),
  CONSTRAINT `arrives_ibfk_2` FOREIGN KEY (`Airport`) REFERENCES `airport` (`Airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrives`
--

LOCK TABLES `arrives` WRITE;
/*!40000 ALTER TABLE `arrives` DISABLE KEYS */;
INSERT INTO `arrives` VALUES ('12:00:00','2024-10-12','C2300');
/*!40000 ALTER TABLE `arrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departs`
--

DROP TABLE IF EXISTS `departs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departs` (
  `Dep_time` time DEFAULT NULL,
  `Leg_instance` date DEFAULT NULL,
  `Airport` char(10) DEFAULT NULL,
  KEY `Leg_instance` (`Leg_instance`),
  KEY `Airport` (`Airport`),
  CONSTRAINT `departs_ibfk_1` FOREIGN KEY (`Leg_instance`) REFERENCES `leg_instance` (`Date`),
  CONSTRAINT `departs_ibfk_2` FOREIGN KEY (`Airport`) REFERENCES `airport` (`Airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departs`
--

LOCK TABLES `departs` WRITE;
/*!40000 ALTER TABLE `departs` DISABLE KEYS */;
INSERT INTO `departs` VALUES ('10:25:00','2024-10-12','B1200');
/*!40000 ALTER TABLE `departs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departure_airport`
--

DROP TABLE IF EXISTS `departure_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departure_airport` (
  `scheduled_dep_time` time NOT NULL,
  `Flight_leg` int DEFAULT NULL,
  `Airport` char(10) DEFAULT NULL,
  KEY `Flight_leg` (`Flight_leg`),
  KEY `Airport` (`Airport`),
  CONSTRAINT `departure_airport_ibfk_1` FOREIGN KEY (`Flight_leg`) REFERENCES `flight_leg` (`Leg_no`),
  CONSTRAINT `departure_airport_ibfk_2` FOREIGN KEY (`Airport`) REFERENCES `airport` (`Airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departure_airport`
--

LOCK TABLES `departure_airport` WRITE;
/*!40000 ALTER TABLE `departure_airport` DISABLE KEYS */;
INSERT INTO `departure_airport` VALUES ('23:30:00',100,'A100');
/*!40000 ALTER TABLE `departure_airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare`
--

DROP TABLE IF EXISTS `fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare` (
  `Code` int NOT NULL,
  `Amount` char(15) NOT NULL,
  `Restriction` varchar(30) DEFAULT NULL,
  `Flight_number` char(10) DEFAULT NULL,
  UNIQUE KEY `Code` (`Code`),
  KEY `Flight_number` (`Flight_number`),
  CONSTRAINT `fare_ibfk_1` FOREIGN KEY (`Flight_number`) REFERENCES `flight` (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare`
--

LOCK TABLES `fare` WRITE;
/*!40000 ALTER TABLE `fare` DISABLE KEYS */;
INSERT INTO `fare` VALUES (1,'340$','Maximum Baggage wieght is 50kg','12BA'),(101,'980$','No electronic device allowed','0912HZ');
/*!40000 ALTER TABLE `fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `Number` char(10) NOT NULL,
  `Airline` varchar(20) NOT NULL,
  `Weekdays` varchar(20) NOT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('0912HZ','Turkish','Sunday'),('12BA','Fly Dubai','Saturday');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_leg`
--

DROP TABLE IF EXISTS `flight_leg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_leg` (
  `Leg_no` int NOT NULL,
  `Flight_number` char(10) DEFAULT NULL,
  UNIQUE KEY `Leg_no` (`Leg_no`),
  KEY `Flight_number` (`Flight_number`),
  CONSTRAINT `flight_leg_ibfk_1` FOREIGN KEY (`Flight_number`) REFERENCES `flight` (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_leg`
--

LOCK TABLES `flight_leg` WRITE;
/*!40000 ALTER TABLE `flight_leg` DISABLE KEYS */;
INSERT INTO `flight_leg` VALUES (101,'0912HZ'),(100,'12BA');
/*!40000 ALTER TABLE `flight_leg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leg_instance`
--

DROP TABLE IF EXISTS `leg_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leg_instance` (
  `No_of_avail_seats` int NOT NULL,
  `Date` date NOT NULL,
  `Instance_of` int DEFAULT NULL,
  `Airplane` int DEFAULT NULL,
  UNIQUE KEY `Date` (`Date`),
  KEY `Instance_of` (`Instance_of`),
  KEY `Airplane` (`Airplane`),
  CONSTRAINT `leg_instance_ibfk_1` FOREIGN KEY (`Instance_of`) REFERENCES `flight_leg` (`Leg_no`),
  CONSTRAINT `leg_instance_ibfk_2` FOREIGN KEY (`Airplane`) REFERENCES `airplane` (`Airplane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leg_instance`
--

LOCK TABLES `leg_instance` WRITE;
/*!40000 ALTER TABLE `leg_instance` DISABLE KEYS */;
INSERT INTO `leg_instance` VALUES (20,'2024-10-12',101,3);
/*!40000 ALTER TABLE `leg_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `Customer_name` varchar(20) NOT NULL,
  `Cphone` char(13) DEFAULT NULL,
  `Reserved_seat` int DEFAULT NULL,
  `Flight_date` date DEFAULT NULL,
  KEY `Reserved_seat` (`Reserved_seat`),
  KEY `Flight_date` (`Flight_date`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Reserved_seat`) REFERENCES `seat` (`Seat_no`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Flight_date`) REFERENCES `leg_instance` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('Mohammad','+9034544321',45,'2024-10-12'),('Mohammad','+9034544321',46,'2024-10-12'),('Sara','+9034544321',47,'2024-10-12');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `Seat_no` int NOT NULL,
  UNIQUE KEY `Seat_no` (`Seat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (45),(46),(47),(107),(108),(109);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-13  9:40:45
