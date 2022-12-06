-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: wsoapp2
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `ensemble`
--

DROP TABLE IF EXISTS `ensemble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ensemble` (
  `Ensemble_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Ensemble_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensemble`
--

LOCK TABLES `ensemble` WRITE;
/*!40000 ALTER TABLE `ensemble` DISABLE KEYS */;
INSERT INTO `ensemble` VALUES (1,'Lewis Family'),(2,'Adult Choir'),(3,'7-9th Choir');
/*!40000 ALTER TABLE `ensemble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_type` (
  `Event_Type_ID` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`Event_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES (1,'Opener'),(2,'Prelude'),(3,'Welcome'),(4,'Scripture Reading'),(5,'Cong. Song'),(6,'Prayer'),(7,'Offertory'),(8,'Choir'),(9,'Special Music'),(10,'Message'),(11,'Closing Song'),(12,'Postlude'),(13,'Lord\'s Supper'),(14,'Prayer/Announcements');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fills_role`
--

DROP TABLE IF EXISTS `fills_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fills_role` (
  `Person_ID` int NOT NULL,
  `Service_ID` int NOT NULL,
  `Role_Type` char(1) NOT NULL,
  `Confirmed` char(1) NOT NULL,
  PRIMARY KEY (`Person_ID`,`Service_ID`),
  KEY `Service_ID` (`Service_ID`),
  CONSTRAINT `fills_role_ibfk_1` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`),
  CONSTRAINT `fills_role_ibfk_2` FOREIGN KEY (`Service_ID`) REFERENCES `service` (`Service_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fills_role`
--

LOCK TABLES `fills_role` WRITE;
/*!40000 ALTER TABLE `fills_role` DISABLE KEYS */;
INSERT INTO `fills_role` VALUES (1,7,'P','Y'),(2,1,'O','Y'),(2,7,'O','Y'),(6,2,'P','Y'),(10,1,'P','Y'),(14,2,'O','Y'),(15,2,'S','Y'),(15,7,'S','Y'),(15,8,'S','Y'),(15,11,'S','Y'),(15,13,'S','Y'),(15,15,'S','Y'),(15,16,'S','Y'),(15,18,'S','Y'),(15,20,'S','Y'),(15,22,'S','Y'),(15,23,'S','Y'),(16,1,'S','Y'),(16,9,'S','Y'),(16,14,'S','Y'),(16,17,'S','Y'),(16,19,'S','Y'),(16,21,'S','Y');
/*!40000 ALTER TABLE `fills_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_of`
--

DROP TABLE IF EXISTS `member_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_of` (
  `Ensemble_ID` int NOT NULL,
  `Person_ID` int NOT NULL,
  PRIMARY KEY (`Ensemble_ID`,`Person_ID`),
  KEY `FK_member_of_Person` (`Person_ID`),
  CONSTRAINT `FK_member_of_Ensemble` FOREIGN KEY (`Ensemble_ID`) REFERENCES `ensemble` (`Ensemble_ID`),
  CONSTRAINT `FK_member_of_Person` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_of`
--

LOCK TABLES `member_of` WRITE;
/*!40000 ALTER TABLE `member_of` DISABLE KEYS */;
INSERT INTO `member_of` VALUES (2,7),(1,9),(2,10),(2,13),(3,16),(3,18);
/*!40000 ALTER TABLE `member_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `organist_view`
--

DROP TABLE IF EXISTS `organist_view`;
/*!50001 DROP VIEW IF EXISTS `organist_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `organist_view` AS SELECT 
 1 AS `service_id`,
 1 AS `organist_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `Person_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Person_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Rebekah','Hawkey','rhawkey@gmail.com'),(2,'Amanda','Bixby','abixby@gmail.com'),(3,'Steve','Lee','slee@gmail.com'),(4,'Robert','Everett','reveret@gmail.com'),(5,'Sam','Martin','smartin@gmail.com'),(6,'Judy','Jackson','jjackson@gmail.com'),(7,'Jon','Avery','javery@gmail.com'),(8,'Sarah','Dobney','sdobney@gmail.com'),(9,'Tomothy','Lewis','tlewis@gmail.com'),(10,'Nathan','Martin','nmartin@gmail.com'),(11,'Stan','Bush','sbush@gmail.com'),(12,'Holly','Fordham','hfordham@gmail.com'),(13,'Cyndi','Wright','cwright@gmail.com'),(14,'Ed','Jackson','ejackson@gmail.com'),(15,'Jason','Boyle','jboyle@gmail.com'),(16,'Alan','Kennedy','akennedy@gmail.com'),(18,'Stephan','Griggs','sgriggs@gmail.com');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pianist_view`
--

DROP TABLE IF EXISTS `pianist_view`;
/*!50001 DROP VIEW IF EXISTS `pianist_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pianist_view` AS SELECT 
 1 AS `service_id`,
 1 AS `pianist_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `Service_ID` int NOT NULL AUTO_INCREMENT,
  `Svc_DateTime` datetime(6) NOT NULL,
  `Theme_Event` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Service_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'2019-10-03 10:30:00.000000','let the peace of christ rule'),(2,'2019-10-03 17:30:00.000000','Lord\'s Supper'),(6,'2019-10-10 10:30:00.000000','Drawing Nearer'),(7,'2021-12-04 00:00:00.000000','let the peale'),(8,'2021-02-02 00:00:00.000000','NewTheme'),(9,'2021-12-02 00:00:00.000000','let the of christ rule'),(10,'2021-12-03 00:00:00.000000','let the hrist rule'),(11,'2021-03-02 00:00:00.000000','NewTheme'),(12,'2021-12-01 00:00:00.000000','let christ rule'),(13,'2022-12-02 10:00:00.000000','Bruh'),(14,'2022-12-01 10:00:00.000000','bruh'),(15,'2022-12-14 10:00:00.000000','bradaf'),(16,'2022-12-21 10:00:00.000000','dsfajlfdasf'),(17,'2022-11-24 10:00:00.000000','test'),(18,'2022-02-24 10:00:00.000000','dsafs'),(19,'2022-02-23 10:00:00.000000','saD'),(20,'2022-02-25 10:00:00.000000','dfas'),(21,'2022-03-25 10:00:00.000000','dsfasdf'),(22,'2022-04-25 10:00:00.000000','let the peace of christ rule'),(23,'2022-05-25 10:00:00.000000','let the peace of christ rule');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_item`
--

DROP TABLE IF EXISTS `service_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_item` (
  `Service_Item_ID` int NOT NULL AUTO_INCREMENT,
  `Service_ID` int NOT NULL,
  `Seq_Num` int NOT NULL,
  `Event_Type_ID` int NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Notes` varchar(40) DEFAULT NULL,
  `Confirmed` char(1) NOT NULL,
  `Person_ID` int DEFAULT NULL,
  `Ensemble_ID` int DEFAULT NULL,
  `Song_ID` int DEFAULT NULL,
  PRIMARY KEY (`Service_Item_ID`),
  KEY `FK_service_event_Ensemble` (`Ensemble_ID`),
  KEY `FK_service_event_EventType` (`Event_Type_ID`),
  KEY `FK_service_event_Person` (`Person_ID`),
  KEY `FK_service_event_Service` (`Service_ID`),
  KEY `FK_service_event_Song` (`Song_ID`),
  CONSTRAINT `FK_service_event_Ensemble` FOREIGN KEY (`Ensemble_ID`) REFERENCES `ensemble` (`Ensemble_ID`),
  CONSTRAINT `FK_service_event_Person` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`),
  CONSTRAINT `FK_service_event_Service` FOREIGN KEY (`Service_ID`) REFERENCES `service` (`Service_ID`),
  CONSTRAINT `FK_service_event_Song` FOREIGN KEY (`Song_ID`) REFERENCES `song` (`Song_ID`),
  CONSTRAINT `FK_service_item_event_type` FOREIGN KEY (`Event_Type_ID`) REFERENCES `event_type` (`Event_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_item`
--

LOCK TABLES `service_item` WRITE;
/*!40000 ALTER TABLE `service_item` DISABLE KEYS */;
INSERT INTO `service_item` VALUES (1,1,1,1,'It is Well','flute','Y',1,NULL,NULL),(2,1,2,2,NULL,NULL,'Y',2,NULL,NULL),(3,1,3,3,NULL,NULL,'Y',3,NULL,NULL),(4,1,4,2,NULL,NULL,'Y',2,NULL,NULL),(5,1,5,4,NULL,NULL,'Y',3,NULL,NULL),(6,1,6,5,NULL,NULL,'Y',NULL,NULL,2),(7,1,7,6,NULL,NULL,'Y',4,NULL,NULL),(8,1,8,5,NULL,NULL,'Y',NULL,NULL,3),(9,1,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,1,NULL),(10,1,10,8,NULL,NULL,'Y',NULL,2,5),(11,1,11,5,NULL,NULL,'Y',NULL,NULL,6),(12,1,12,9,'Jesus, I am Resting',NULL,'Y',5,NULL,NULL),(13,1,13,10,NULL,NULL,'Y',4,NULL,NULL),(14,1,14,11,NULL,NULL,'Y',NULL,NULL,8),(15,1,15,12,NULL,NULL,'Y',2,NULL,NULL),(16,2,1,2,NULL,NULL,'Y',10,NULL,NULL),(17,2,2,6,NULL,NULL,'N',3,NULL,NULL),(18,2,3,5,NULL,NULL,'Y',NULL,NULL,9),(19,2,4,5,NULL,NULL,'Y',NULL,NULL,10),(21,2,5,5,NULL,NULL,'Y',NULL,NULL,13),(22,2,6,5,NULL,NULL,'Y',NULL,NULL,14),(23,2,7,14,NULL,NULL,'Y',11,NULL,NULL),(33,6,1,1,NULL,NULL,'N',2,NULL,NULL),(34,6,2,5,NULL,NULL,'Y',NULL,NULL,6),(146,7,1,1,'It is Well','flute','Y',1,NULL,NULL),(147,7,2,2,NULL,NULL,'Y',2,NULL,NULL),(148,7,3,3,NULL,NULL,'Y',3,NULL,NULL),(149,7,4,2,NULL,NULL,'Y',2,NULL,NULL),(150,7,5,4,NULL,NULL,'Y',3,NULL,NULL),(151,7,6,5,NULL,NULL,'Y',NULL,NULL,2),(152,7,7,6,NULL,NULL,'Y',4,NULL,NULL),(153,7,8,5,NULL,NULL,'Y',NULL,NULL,3),(154,7,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,1,NULL),(155,7,10,8,NULL,NULL,'Y',NULL,2,5),(156,7,11,5,NULL,NULL,'Y',NULL,NULL,6),(157,7,12,9,'Jesus, I am Resting',NULL,'Y',5,NULL,NULL),(158,7,13,10,NULL,NULL,'Y',4,NULL,NULL),(159,7,14,11,NULL,NULL,'Y',NULL,NULL,8),(160,7,15,12,NULL,NULL,'Y',2,NULL,NULL),(161,8,1,1,'It is Well','flute','Y',1,NULL,NULL),(162,8,2,2,NULL,NULL,'Y',2,NULL,NULL),(163,8,3,3,NULL,NULL,'Y',3,NULL,NULL),(164,8,4,2,NULL,NULL,'Y',2,NULL,NULL),(165,8,5,4,NULL,NULL,'Y',3,NULL,NULL),(166,8,6,5,NULL,NULL,'Y',NULL,NULL,2),(167,8,7,6,NULL,NULL,'Y',4,NULL,NULL),(168,8,8,5,NULL,NULL,'Y',NULL,NULL,3),(169,8,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,1,NULL),(170,8,10,8,NULL,NULL,'Y',NULL,2,5),(171,8,11,5,NULL,NULL,'Y',NULL,NULL,6),(172,8,12,9,'Jesus, I am Resting',NULL,'Y',5,NULL,NULL),(173,8,13,10,NULL,NULL,'Y',4,NULL,NULL),(174,8,14,11,NULL,NULL,'Y',NULL,NULL,8),(175,8,15,12,NULL,NULL,'Y',2,NULL,NULL),(176,9,1,1,'It is Well','flute','Y',1,NULL,NULL),(177,9,2,2,NULL,NULL,'Y',2,NULL,NULL),(178,9,3,3,NULL,NULL,'Y',3,NULL,NULL),(179,9,4,2,NULL,NULL,'Y',2,NULL,NULL),(180,9,5,4,NULL,NULL,'Y',3,NULL,NULL),(181,9,6,5,NULL,NULL,'Y',NULL,NULL,2),(182,9,7,6,NULL,NULL,'Y',4,NULL,NULL),(183,9,8,5,NULL,NULL,'Y',NULL,NULL,3),(184,9,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,1,NULL),(185,9,10,8,NULL,NULL,'Y',NULL,2,5),(186,9,11,5,NULL,NULL,'Y',NULL,NULL,6),(187,9,12,9,'Jesus, I am Resting',NULL,'Y',5,NULL,NULL),(188,9,13,10,NULL,NULL,'Y',4,NULL,NULL),(189,9,14,11,NULL,NULL,'Y',NULL,NULL,8),(190,9,15,12,NULL,NULL,'Y',2,NULL,NULL),(191,10,1,1,'It is Well','flute','Y',1,NULL,NULL),(192,10,2,2,NULL,NULL,'Y',2,NULL,NULL),(193,10,3,3,NULL,NULL,'Y',3,NULL,NULL),(194,10,4,2,NULL,NULL,'Y',2,NULL,NULL),(195,10,5,4,NULL,NULL,'Y',3,NULL,NULL),(196,10,6,5,NULL,NULL,'Y',NULL,NULL,2),(197,10,7,6,NULL,NULL,'Y',4,NULL,NULL),(198,10,8,5,NULL,NULL,'Y',NULL,NULL,3),(199,10,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,1,NULL),(200,10,10,8,NULL,NULL,'Y',NULL,2,5),(201,10,11,5,NULL,NULL,'Y',NULL,NULL,6),(202,10,12,9,'Jesus, I am Resting',NULL,'Y',5,NULL,NULL),(203,10,13,10,NULL,NULL,'Y',4,NULL,NULL),(204,10,14,11,NULL,NULL,'Y',NULL,NULL,8),(205,10,15,12,NULL,NULL,'Y',2,NULL,NULL),(206,11,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(207,11,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(208,11,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(209,11,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(210,11,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(211,11,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(212,11,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(213,11,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(214,11,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(215,11,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(216,11,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(217,11,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(218,11,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(219,11,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(220,11,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(221,12,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(222,12,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(223,12,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(224,12,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(225,12,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(226,12,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(227,12,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(228,12,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(229,12,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(230,12,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(231,12,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(232,12,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(233,12,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(234,12,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(235,12,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(236,13,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(237,13,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(238,13,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(239,13,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(240,13,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(241,13,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(242,13,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(243,13,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(244,13,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(245,13,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(246,13,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(247,13,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(248,13,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(249,13,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(250,13,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(251,14,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(252,14,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(253,14,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(254,14,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(255,14,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(256,14,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(257,14,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(258,14,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(259,14,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(260,14,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(261,14,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(262,14,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(263,14,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(264,14,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(265,14,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(266,15,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(267,15,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(268,15,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(269,15,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(270,15,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(271,15,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(272,15,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(273,15,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(274,15,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(275,15,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(276,15,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(277,15,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(278,15,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(279,15,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(280,15,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(281,16,1,2,NULL,NULL,'Y',NULL,NULL,NULL),(282,16,2,6,NULL,NULL,'Y',NULL,NULL,NULL),(283,16,3,5,NULL,NULL,'Y',NULL,NULL,NULL),(284,16,4,5,NULL,NULL,'Y',NULL,NULL,NULL),(285,16,5,5,NULL,NULL,'Y',NULL,NULL,NULL),(286,16,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(287,16,7,14,NULL,NULL,'Y',NULL,NULL,NULL),(288,17,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(289,17,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(290,17,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(291,17,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(292,17,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(293,17,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(294,17,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(295,17,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(296,17,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(297,17,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(298,17,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(299,17,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(300,17,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(301,17,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(302,17,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(303,18,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(304,18,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(305,18,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(306,18,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(307,18,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(308,18,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(309,18,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(310,18,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(311,18,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(312,18,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(313,18,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(314,18,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(315,18,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(316,18,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(317,18,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(318,19,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(319,19,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(320,19,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(321,19,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(322,19,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(323,19,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(324,19,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(325,19,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(326,19,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(327,19,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(328,19,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(329,19,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(330,19,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(331,19,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(332,19,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(333,20,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(334,20,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(335,20,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(336,20,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(337,20,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(338,20,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(339,20,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(340,20,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(341,20,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(342,20,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(343,20,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(344,20,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(345,20,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(346,20,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(347,20,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(348,21,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(349,21,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(350,21,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(351,21,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(352,21,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(353,21,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(354,21,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(355,21,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(356,21,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(357,21,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(358,21,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(359,21,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(360,21,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(361,21,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(362,21,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(363,22,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(364,22,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(365,22,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(366,22,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(367,22,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(368,22,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(369,22,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(370,22,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(371,22,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(372,22,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(373,22,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(374,22,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(375,22,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(376,22,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(377,22,15,12,NULL,NULL,'Y',NULL,NULL,NULL),(378,23,1,1,'It is Well','flute','Y',NULL,NULL,NULL),(379,23,2,2,NULL,NULL,'Y',NULL,NULL,NULL),(380,23,3,3,NULL,NULL,'Y',NULL,NULL,NULL),(381,23,4,2,NULL,NULL,'Y',NULL,NULL,NULL),(382,23,5,4,NULL,NULL,'Y',NULL,NULL,NULL),(383,23,6,5,NULL,NULL,'Y',NULL,NULL,NULL),(384,23,7,6,NULL,NULL,'Y',NULL,NULL,NULL),(385,23,8,5,NULL,NULL,'Y',NULL,NULL,NULL),(386,23,9,7,'May the Mind of Christ my Savior','From organ well, need MIC','Y',NULL,NULL,NULL),(387,23,10,8,NULL,NULL,'Y',NULL,NULL,NULL),(388,23,11,5,NULL,NULL,'Y',NULL,NULL,NULL),(389,23,12,9,'Jesus, I am Resting',NULL,'Y',NULL,NULL,NULL),(390,23,13,10,NULL,NULL,'Y',NULL,NULL,NULL),(391,23,14,11,NULL,NULL,'Y',NULL,NULL,NULL),(392,23,15,12,NULL,NULL,'Y',NULL,NULL,NULL);
/*!40000 ALTER TABLE `service_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `service_view`
--

DROP TABLE IF EXISTS `service_view`;
/*!50001 DROP VIEW IF EXISTS `service_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `service_view` AS SELECT 
 1 AS `service_ID`,
 1 AS `Svc_DateTime`,
 1 AS `Theme_Event`,
 1 AS `songleader`,
 1 AS `organist`,
 1 AS `pianist`,
 1 AS `Seq_Num`,
 1 AS `event`,
 1 AS `name`,
 1 AS `Title`,
 1 AS `notes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `Song_ID` int NOT NULL AUTO_INCREMENT,
  `Song_Type` char(1) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Hymnbook_Num` varchar(5) DEFAULT NULL,
  `Arranger` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Song_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'C','It is Well',NULL,NULL),(2,'H','My Faith has Found','60',NULL),(3,'H','Hiding in Thee','608',NULL),(4,'C','May the Mind of Christ my Savior',NULL,NULL),(5,'C','If You Search with All Your Hearts',NULL,NULL),(6,'H','Like a River','352',NULL),(7,'C','Jesus, I am Resting',NULL,NULL),(8,'H','For All the Saints','643',NULL),(9,'H','At the Cross','140',NULL),(10,'H','He Died For ME','154',NULL),(13,'H','When I Survey','137',NULL),(14,'H','It is Finished','138',NULL),(15,'H','Jesus Paid It All','390',NULL);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `songleader_view`
--

DROP TABLE IF EXISTS `songleader_view`;
/*!50001 DROP VIEW IF EXISTS `songleader_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `songleader_view` AS SELECT 
 1 AS `service_id`,
 1 AS `songleader_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `songusageview`
--

DROP TABLE IF EXISTS `songusageview`;
/*!50001 DROP VIEW IF EXISTS `songusageview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `songusageview` AS SELECT 
 1 AS `Song_Id`,
 1 AS `Song_Type`,
 1 AS `Title`,
 1 AS `Hymnbook_Num`,
 1 AS `Arranger`,
 1 AS `LastUsedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `unavailable_for`
--

DROP TABLE IF EXISTS `unavailable_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unavailable_for` (
  `Person_ID` int NOT NULL,
  `Service_ID` int NOT NULL,
  PRIMARY KEY (`Person_ID`,`Service_ID`),
  KEY `FK_unavailable_for_Service` (`Service_ID`),
  CONSTRAINT `FK_unavailable_for_Person` FOREIGN KEY (`Person_ID`) REFERENCES `person` (`Person_ID`),
  CONSTRAINT `FK_unavailable_for_Service` FOREIGN KEY (`Service_ID`) REFERENCES `service` (`Service_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unavailable_for`
--

LOCK TABLES `unavailable_for` WRITE;
/*!40000 ALTER TABLE `unavailable_for` DISABLE KEYS */;
INSERT INTO `unavailable_for` VALUES (6,1),(10,1),(14,1),(10,2),(2,6),(16,6);
/*!40000 ALTER TABLE `unavailable_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wsoapp2'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_service`(IN currentServiceID INT, IN newDateTime DATETIME, IN newTheme VARCHAR(50), IN newSongleader VARCHAR(50), OUT success INT, OUT newID INT)
BEGIN
	DECLARE next_id INTEGER;
    DECLARE personid INTEGER;
    
    # Default values
    SELECT person.Person_ID INTO personid FROM person WHERE CONCAT(person.First_Name, ' ' , person.Last_Name) = newSongleader;
	SELECT MAX(Service_ID) + 1 INTO next_id FROM service;
    
    # Check service time
    IF newDateTime IN (SELECT Svc_DateTime FROM service) THEN 
		SET success = 0; # Error
    ELSE 
		INSERT INTO service (Service_ID, Svc_DateTime, Theme_Event)
		VALUES (next_id, newDateTime, newTheme);
        
        IF personid IS NOT NULL THEN 
			INSERT INTO fills_role (Service_ID, Person_ID, Role_Type, Confirmed)
			VALUES (next_id, personid, 'S', 'Y');
		END IF;
        
        INSERT INTO service_item (Service_ID, Seq_Num, Event_Type_ID, Title, Notes, Confirmed, Person_ID, Ensemble_ID, Song_ID)
        SELECT next_id, service_item.Seq_num, service_item.Event_Type_ID, service_item.Title, service_item.Notes, 'Y', null, null, null FROM service_item
        WHERE Service_id = currentServiceID;
        
        
        SET success = 1; # Success
        SET newID = next_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `organist_view`
--

/*!50001 DROP VIEW IF EXISTS `organist_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `organist_view` AS select `fills_role`.`Service_ID` AS `service_id`,concat(`person`.`First_Name`,' ',`person`.`Last_Name`) AS `organist_name` from (`person` join `fills_role` on((`person`.`Person_ID` = `fills_role`.`Person_ID`))) where (`fills_role`.`Role_Type` = 'O') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pianist_view`
--

/*!50001 DROP VIEW IF EXISTS `pianist_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pianist_view` AS select `fills_role`.`Service_ID` AS `service_id`,concat(`person`.`First_Name`,' ',`person`.`Last_Name`) AS `pianist_name` from (`person` join `fills_role` on((`person`.`Person_ID` = `fills_role`.`Person_ID`))) where (`fills_role`.`Role_Type` = 'P') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `service_view`
--

/*!50001 DROP VIEW IF EXISTS `service_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `service_view` AS select `service`.`Service_ID` AS `service_ID`,`service`.`Svc_DateTime` AS `Svc_DateTime`,`service`.`Theme_Event` AS `Theme_Event`,`songleader_view`.`songleader_name` AS `songleader`,`organist_view`.`organist_name` AS `organist`,`pianist_view`.`pianist_name` AS `pianist`,`service_item`.`Seq_Num` AS `Seq_Num`,`event_type`.`Description` AS `event`,(case when (`service_item`.`Person_ID` is not null) then concat(`person`.`First_Name`,' ',`person`.`Last_Name`) when (`service_item`.`Ensemble_ID` is not null) then `ensemble`.`Name` else NULL end) AS `name`,(case when (`song`.`Song_Type` = 'H') then concat(`song`.`Hymnbook_Num`,' - ',`song`.`Title`) when (`song`.`Song_Type` = 'C') then `song`.`Title` else `service_item`.`Title` end) AS `Title`,`service_item`.`Notes` AS `notes` from ((((((((`service_item` join `service` on((`service_item`.`Service_ID` = `service`.`Service_ID`))) join `event_type` on((`service_item`.`Event_Type_ID` = `event_type`.`Event_Type_ID`))) left join `songleader_view` on((`service_item`.`Service_ID` = `songleader_view`.`service_id`))) left join `organist_view` on((`service_item`.`Service_ID` = `organist_view`.`service_id`))) left join `pianist_view` on((`service_item`.`Service_ID` = `pianist_view`.`service_id`))) left join `person` on((`service_item`.`Person_ID` = `person`.`Person_ID`))) left join `ensemble` on((`service_item`.`Ensemble_ID` = `ensemble`.`Ensemble_ID`))) left join `song` on((`service_item`.`Song_ID` = `song`.`Song_ID`))) order by `service_item`.`Seq_Num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songleader_view`
--

/*!50001 DROP VIEW IF EXISTS `songleader_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `songleader_view` AS select `fills_role`.`Service_ID` AS `service_id`,concat(`person`.`First_Name`,' ',`person`.`Last_Name`) AS `songleader_name` from (`person` join `fills_role` on((`person`.`Person_ID` = `fills_role`.`Person_ID`))) where (`fills_role`.`Role_Type` = 'S') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songusageview`
--

/*!50001 DROP VIEW IF EXISTS `songusageview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `songusageview` AS select `song`.`Song_ID` AS `Song_Id`,`song`.`Song_Type` AS `Song_Type`,`song`.`Title` AS `Title`,`song`.`Hymnbook_Num` AS `Hymnbook_Num`,`song`.`Arranger` AS `Arranger`,max(`service`.`Svc_DateTime`) AS `LastUsedDate` from ((`song` left join `service_item` on((`song`.`Song_ID` = `service_item`.`Song_ID`))) left join `service` on((`service_item`.`Service_ID` = `service`.`Service_ID`))) where (`song`.`Song_Type` <> 'C') group by `song`.`Song_ID`,`song`.`Song_Type`,`song`.`Title`,`song`.`Hymnbook_Num`,`song`.`Arranger` order by (`service`.`Svc_DateTime` is not null),`service`.`Svc_DateTime` desc,`song`.`Title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 12:12:11
