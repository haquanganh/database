-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: MainDB
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `idClient` int(10) NOT NULL AUTO_INCREMENT,
  `ClientName` varchar(50) DEFAULT NULL,
  `C_Phone` int(15) DEFAULT NULL,
  `C_Address` varchar(100) DEFAULT NULL,
  `C_Company` varchar(100) DEFAULT NULL,
  `C_Skype` varchar(25) DEFAULT NULL,
  `idAccount` int(10) DEFAULT NULL,
  `idNote` int(10) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  KEY `idNote` (`idNote`),
  KEY `fk_Clients_1_idx` (`idAccount`),
  CONSTRAINT `Clients_ibfk_2` FOREIGN KEY (`idNote`) REFERENCES `Note` (`idNote`),
  CONSTRAINT `fk_Clients_1` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,'Client1',1200000001,'Address1','Company1','Skype1',41,NULL),(2,'Client2',1200000002,'Address2','Company2','Skype2',42,NULL),(3,'Client3',1200000003,'Address3','Company3','Skype3',43,NULL),(4,'Client4',1200000004,'Address4','Company4','Skype4',44,NULL),(5,'Client5',1200000005,'Address5','Company5','Skype5',45,NULL);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `E_Status`
--

DROP TABLE IF EXISTS `E_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `E_Status` (
  `idStatus` int(10) NOT NULL,
  `Status` varchar(25) DEFAULT NULL,
  `S_Note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `E_Status`
--

LOCK TABLES `E_Status` WRITE;
/*!40000 ALTER TABLE `E_Status` DISABLE KEYS */;
INSERT INTO `E_Status` VALUES (1,'On Working',NULL),(2,'Available',NULL),(3,'Outside',NULL);
/*!40000 ALTER TABLE `E_Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `idEmployee` int(10) NOT NULL,
  `E_Name` varchar(50) DEFAULT NULL,
  `E_Phone` int(15) DEFAULT NULL,
  `E_Address` varchar(75) DEFAULT NULL,
  `E_Skype` varchar(32) DEFAULT NULL,
  `E_Level` varchar(5) DEFAULT NULL,
  `E_Avatar` text,
  `E_EngName` varchar(50) DEFAULT NULL,
  `E_Cost_Hour` int(10) DEFAULT NULL,
  `E_DateofBirth` date DEFAULT NULL,
  `idAccount` int(10) DEFAULT NULL,
  `idStatus` int(10) DEFAULT NULL,
  `idEChart` int(10) DEFAULT NULL,
  `idNote` int(10) DEFAULT NULL,
  `E_Sex` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  KEY `idStatus` (`idStatus`),
  KEY `idEChart` (`idEChart`),
  KEY `idNote` (`idNote`),
  KEY `fk_Employee_1_idx` (`idAccount`),
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`idStatus`) REFERENCES `E_Status` (`idStatus`),
  CONSTRAINT `Employee_ibfk_5` FOREIGN KEY (`idNote`) REFERENCES `Note` (`idNote`),
  CONSTRAINT `fk_Employee_1` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1000000001,'ProjectManager1',906478808,'Address1','Skype1',NULL,'1.png','ProjectManager1',10,'1994-03-02',2,2,NULL,NULL,1),(1000000002,'ProjectManager2',1000000002,'Address2','Skype2',NULL,'2.png','ProjectManager2',10,'1994-03-02',3,2,NULL,NULL,1),(1000000003,'ProjectManager3',1000000003,'Address3','Skype3',NULL,'3.png','ProjectManager3',10,'1994-03-02',4,2,NULL,NULL,1),(1000000004,'ProjectManager4',1000000004,'Address4','Skype4',NULL,'4.png','ProjectManager4',10,'1994-03-02',5,2,NULL,NULL,1),(1000000005,'ProjectManager5',1000000005,'Address5','Skype5',NULL,'5.png','ProjectManager5',10,'1994-03-02',6,2,NULL,NULL,1),(1100000001,'Member1',1100000001,'Address1','Skype1',NULL,'6.png','Member1',10,'1994-03-03',7,1,NULL,NULL,2),(1100000002,'Member2',1100000002,'Address2','Skype2',NULL,'7.png','Member2',10,'1994-03-03',8,1,NULL,NULL,2),(1100000003,'Member3',1100000003,'Address3','Skype3','','8.png','Member3',10,'1994-03-03',9,1,NULL,NULL,2),(1100000004,'Member4',1100000004,'Address4','Skype4',NULL,'9.png','Member4',10,'1994-03-03',10,2,NULL,NULL,2),(1100000005,'Member5',1100000005,'Address5','Skype5',NULL,'10.png','Member5',10,'1994-03-03',11,2,NULL,NULL,2),(1100000006,'Member6',1100000006,'Address6','Skype6',NULL,'11.png','Member6',10,'1994-03-03',12,2,NULL,NULL,2),(1100000007,'Member7',1100000007,'Address7','Skype7',NULL,'12.png','Member7',10,'1994-03-03',13,2,NULL,NULL,2),(1100000008,'Member8',1100000008,'Address8','Skype8',NULL,'13.png','Member8',10,'1994-03-03',14,2,NULL,NULL,2),(1100000009,'Member9',1100000009,'Address9','Skype9',NULL,'14.png','Member9',10,'1994-03-03',15,2,NULL,NULL,2),(1100000010,'Member10',1100000010,'Address10','Skype10',NULL,'15.png','Member10',10,'1994-03-03',16,2,NULL,NULL,2),(1100000011,'Member11',1100000011,'Address11','Skype11',NULL,'16.png','Member11',10,'1994-03-03',17,2,NULL,NULL,2),(1100000012,'Member12',1100000012,'Address12','Skype12',NULL,'17.png','Member12',10,'1994-03-03',18,2,NULL,NULL,2),(1100000013,'Member13',1100000013,'Address13','Skype13',NULL,'18.png','Member13',10,'1994-03-03',19,2,NULL,NULL,2),(1100000014,'Member14',1100000014,'Address14','Skype14',NULL,'19.png','Member14',10,'1994-03-03',20,2,NULL,NULL,2),(1100000015,'Member15',1100000015,'Address15','Skype15',NULL,'20.png','Member15',10,'1994-03-03',21,2,NULL,NULL,2),(1100000016,'Member16',1100000016,'Address16','Skype16',NULL,'21.png','Member16',10,'1994-03-03',22,2,NULL,NULL,2),(1100000017,'Member17',1100000017,'Address17','Skype17',NULL,'22.png','Member17',10,'1994-03-03',23,2,NULL,NULL,2),(1100000018,'Member18',1100000018,'Address18','Skype18',NULL,'23.png','Member18',10,'1994-03-03',24,2,NULL,NULL,2),(1100000019,'Member19',1100000019,'Address19','Skype19',NULL,'24.png','Member19',10,'1994-03-03',25,2,NULL,NULL,2),(1100000020,'Member20',1100000020,'Address20','Skype20',NULL,'25.png','Member20',10,'1994-03-03',26,2,NULL,NULL,2),(1100000021,'Member21',1100000021,'Address21','Skype21',NULL,'26.png','Member21',10,'1994-03-03',27,2,NULL,NULL,2),(1100000022,'Member22',1100000022,'Address22','Skype22',NULL,'27.png','Member22',10,'1994-03-03',28,2,NULL,NULL,2),(1100000023,'Member23',1100000023,'Address23','Skype23',NULL,'28.png','Member23',10,'1994-03-03',29,2,NULL,NULL,2),(1100000024,'Member24',1100000024,'Address24','Skype24',NULL,'29.png','Member24',10,'1994-03-03',30,2,NULL,NULL,2),(1100000025,'Member25',1100000025,'Address25','Skype25',NULL,'30.png','Member25',10,'1994-03-03',31,2,NULL,NULL,2),(1100000026,'Member26',1100000026,'Address26','Skype26',NULL,'31.png','Member26',10,'1994-03-03',32,2,NULL,NULL,2),(1100000027,'Member27',1100000027,'Address27','Skype27',NULL,'32.png','Member27',10,'1994-03-03',33,2,NULL,NULL,2),(1100000028,'Member28',1100000028,'Address28','Skype28',NULL,'33.png','Member28',10,'1994-03-03',34,2,NULL,NULL,2),(1100000029,'Member29',1100000029,'Address29','Skype29',NULL,'34.png','Member29',10,'1994-03-03',35,2,NULL,NULL,2),(1100000030,'Member30',1100000030,'Address30','Skype30',NULL,'35.png','Member30',10,'1994-03-03',36,2,NULL,NULL,2),(1100000031,'Member31',1100000031,'Address31','Skype31',NULL,'36.png','Member31',10,'1994-03-03',37,2,NULL,NULL,2),(1100000032,'Member32',1100000032,'Address32','Skype32',NULL,'37.png','Member32',10,'1994-03-03',38,2,NULL,NULL,2),(1100000033,'Member33',1100000033,'Address33','Skype33',NULL,'38.png','Member33',10,'1994-03-03',39,2,NULL,NULL,2),(1100000034,'Member34',1100000034,'Address34','Skype34',NULL,'39.png','Member34',10,'1994-03-03',40,2,NULL,NULL,2),(1300000000,'Leader1',41,'Address1','Skype1',NULL,'40.png','Leader1',10,'1994-03-04',46,2,NULL,NULL,1),(1300000001,'Leader2',42,'Address2','Skype2',NULL,'41.png','Leader2',10,'1994-03-04',47,2,NULL,NULL,1),(1300000002,'Leader3',43,'Address3','Skype3',NULL,'42.png','Leader3',10,'1994-03-04',48,2,NULL,NULL,1),(1300000003,'Leader4',44,'Address4','Skype4',NULL,'43.png','Leader4',10,'1994-03-04',49,2,NULL,NULL,1),(1300000004,'Leader5',45,'Address5','Skype5',NULL,'44.png','Leader5',10,'1994-03-04',50,2,NULL,NULL,1),(1300000005,'Leader6',46,'Address6','Skype6',NULL,'45.png','Leader6',10,'1994-03-04',51,2,NULL,NULL,1),(1300000006,'Leader7',47,'Address7','Skype7',NULL,'46.png','Leader7',10,'1994-03-04',52,2,NULL,NULL,1),(1300000007,'Leader8',48,'Address8','Skype8',NULL,'47.png','Leader8',10,'1994-03-04',53,2,NULL,NULL,1),(1300000008,'Leader9',49,'Address9','Skype9',NULL,'48.png','Leader9',10,'1994-03-04',54,2,NULL,NULL,1),(1300000009,'Leader10',50,'Address10','Skype10',NULL,'49.png','Leader10',10,'1994-03-04',55,2,NULL,NULL,1);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Record`
--

DROP TABLE IF EXISTS `Employee_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Record` (
  `idERecord` int(10) NOT NULL AUTO_INCREMENT,
  `Content` varchar(250) DEFAULT NULL,
  `DateStart` date DEFAULT NULL,
  `DateEnd` date DEFAULT NULL,
  `idEmployee` int(10) DEFAULT NULL,
  PRIMARY KEY (`idERecord`),
  KEY `idEmployee` (`idEmployee`),
  CONSTRAINT `Employee_Record_ibfk_1` FOREIGN KEY (`idEmployee`) REFERENCES `Employee` (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Record`
--

LOCK TABLES `Employee_Record` WRITE;
/*!40000 ALTER TABLE `Employee_Record` DISABLE KEYS */;
INSERT INTO `Employee_Record` VALUES (41,'Just become project manager of the project Test1','2016-04-22','2016-05-20',1000000001),(42,'Just become leader of the project Test1','2016-04-22','2016-05-20',1100000002),(43,'Just become member of project Test1','2016-04-22','2016-05-20',1100000001),(44,'Just become member of project Test1','2016-04-22','2016-05-20',1100000003),(45,'Just become member of the project Test1','2016-04-22','2016-05-20',1100000004),(46,'Just become leader of the project Test1','2016-04-22','2016-05-20',1100000004),(47,'Just be changed from leader to member of project Test1','2016-04-22','2016-05-20',1100000002),(48,'Just become project manager of the project Test2','2016-04-22','2016-05-27',1000000001),(49,'Just become leader of the project Test2','2016-04-22','2016-05-27',1100000002),(50,'Just become member of project Test2','2016-04-22','2016-05-27',1100000001),(51,'Just become member of project Test2','2016-04-22','2016-05-27',1100000003),(52,'Just become project manager of the project Test','2016-04-22','2016-05-19',1000000001),(53,'Just become leader of the project Test','2016-04-22','2016-05-19',1100000002),(54,'Just become member of project Test','2016-04-22','2016-05-19',1100000001),(55,'Just become member of project Test','2016-04-22','2016-05-19',1100000003);
/*!40000 ALTER TABLE `Employee_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnglishChart`
--

DROP TABLE IF EXISTS `EnglishChart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EnglishChart` (
  `idEChart` int(10) NOT NULL AUTO_INCREMENT,
  `Month01` int(3) DEFAULT '0',
  `Month02` int(3) DEFAULT '0',
  `Month03` int(3) DEFAULT '0',
  `Month04` int(3) DEFAULT '0',
  `Month05` int(3) DEFAULT '0',
  `Month06` int(3) DEFAULT '0',
  `Month07` int(3) DEFAULT '0',
  `Month08` int(3) DEFAULT '0',
  `Month09` int(3) DEFAULT '0',
  `Month10` int(3) DEFAULT '0',
  `Month11` int(3) DEFAULT '0',
  `Month12` int(3) DEFAULT '0',
  `EC_Note` varchar(100) DEFAULT NULL,
  `idEmployee` int(10) DEFAULT NULL,
  `Year` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idEChart`),
  KEY `lnk_EnglishChart_Employee` (`idEmployee`),
  CONSTRAINT `lnk_EnglishChart_Employee` FOREIGN KEY (`idEmployee`) REFERENCES `Employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnglishChart`
--

LOCK TABLES `EnglishChart` WRITE;
/*!40000 ALTER TABLE `EnglishChart` DISABLE KEYS */;
INSERT INTO `EnglishChart` VALUES (4,150,120,110,130,150,180,200,150,160,170,200,120,NULL,1100000001,2016),(5,120,130,160,170,200,180,160,200,130,120,170,200,NULL,1000000002,2016),(6,110,150,170,153,120,200,190,170,130,149,120,200,NULL,1000000003,2016),(7,120,120,150,160,200,190,160,190,120,130,150,180,NULL,1000000004,2016);
/*!40000 ALTER TABLE `EnglishChart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedback` (
  `idFeedback` int(10) NOT NULL AUTO_INCREMENT,
  `F_Title` varchar(150) DEFAULT NULL,
  `F_Content` varchar(500) DEFAULT NULL,
  `F_Rate` int(5) DEFAULT NULL,
  `F_DateCreate` datetime DEFAULT NULL,
  `idClient` int(10) DEFAULT NULL,
  `idEmployee` int(10) DEFAULT NULL,
  `idProject` int(10) DEFAULT NULL,
  PRIMARY KEY (`idFeedback`),
  KEY `idClient` (`idClient`),
  KEY `idEmployee` (`idEmployee`),
  KEY `lnk_Feedback_Project` (`idProject`),
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `Clients` (`idClient`),
  CONSTRAINT `Feedback_ibfk_2` FOREIGN KEY (`idEmployee`) REFERENCES `Employee` (`idEmployee`),
  CONSTRAINT `lnk_Feedback_Project` FOREIGN KEY (`idProject`) REFERENCES `Project` (`idProject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES (3,'Cool1','You are very good1',4,'2016-04-22 11:27:56',1,1100000001,46),(4,'Cool','OK',5,'2016-04-22 11:28:17',1,1100000001,46);
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback_History`
--

DROP TABLE IF EXISTS `Feedback_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedback_History` (
  `idFeedbackHistory` int(10) NOT NULL AUTO_INCREMENT,
  `H_Content` varchar(250) NOT NULL,
  `H_DateCreate` datetime NOT NULL,
  `idFeedback` int(10) NOT NULL,
  `H_Mark` int(1) NOT NULL DEFAULT '1',
  `H_newTitle` varchar(150) DEFAULT NULL,
  `H_newContent` varchar(500) DEFAULT NULL,
  `H_newRate` int(5) NOT NULL,
  `H_idEmployee` int(10) NOT NULL,
  `H_idClient` int(10) NOT NULL,
  `H_idProject` int(10) DEFAULT NULL,
  PRIMARY KEY (`idFeedbackHistory`),
  KEY `lnk_Feedback_History_Feedback` (`idFeedback`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback_History`
--

LOCK TABLES `Feedback_History` WRITE;
/*!40000 ALTER TABLE `Feedback_History` DISABLE KEYS */;
INSERT INTO `Feedback_History` VALUES (1,'Did create new feedback ','2016-04-22 11:26:57',2,1,'You are very good','You are very good.',5,1100000001,1,46),(2,'Did delete new feedback ','2016-04-22 11:27:37',2,0,'You are very good',NULL,5,1100000001,1,46),(3,'Did create new feedback ','2016-04-22 11:27:56',3,1,'Cool','You are very good',5,1100000001,1,46),(4,'Did edit feedback ','2016-04-22 11:28:06',3,2,'Cool1','You are very good1',4,1100000001,1,46),(5,'Did create new feedback ','2016-04-22 11:28:17',4,1,'Cool','OK',5,1100000001,1,46);
/*!40000 ALTER TABLE `Feedback_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `History` (
  `idHistory` int(10) NOT NULL AUTO_INCREMENT,
  `H_Content` varchar(500) DEFAULT NULL,
  `H_DateCreate` datetime DEFAULT NULL,
  `idAccount` int(10) NOT NULL,
  PRIMARY KEY (`idHistory`),
  KEY `lnk_History_users` (`idAccount`),
  CONSTRAINT `lnk_History_users` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
INSERT INTO `History` VALUES (62,'Did create new project .46','2016-04-22 08:48:55',2),(63,'Did edit project .46','2016-04-22 08:50:02',2),(64,'Did edit project .46','2016-04-22 08:51:15',2),(65,'Did edit project .46','2016-04-22 08:51:52',2),(66,'Did edit project .46','2016-04-22 08:52:22',2),(67,'Did create new project .47','2016-04-22 08:53:38',2),(68,'Did edit project .47','2016-04-22 08:54:10',2),(69,'Did create new project .48','2016-04-22 09:45:41',2);
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History_Type`
--

DROP TABLE IF EXISTS `History_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `History_Type` (
  `idHistoryType` int(10) NOT NULL,
  `HT_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idHistoryType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History_Type`
--

LOCK TABLES `History_Type` WRITE;
/*!40000 ALTER TABLE `History_Type` DISABLE KEYS */;
/*!40000 ALTER TABLE `History_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Note`
--

DROP TABLE IF EXISTS `Note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Note` (
  `idNote` int(10) NOT NULL,
  `N_Title` varchar(150) DEFAULT NULL,
  `N_Content` varchar(500) DEFAULT NULL,
  `N_DateCreate` date DEFAULT NULL,
  `N_DateUpdate` date DEFAULT NULL,
  PRIMARY KEY (`idNote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Note`
--

LOCK TABLES `Note` WRITE;
/*!40000 ALTER TABLE `Note` DISABLE KEYS */;
/*!40000 ALTER TABLE `Note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `idProject` int(10) NOT NULL AUTO_INCREMENT,
  `P_Name` varchar(50) DEFAULT NULL,
  `idPManager` int(10) DEFAULT NULL,
  `idTeamLeader` int(10) DEFAULT NULL,
  `idClient` int(10) DEFAULT NULL,
  `P_DateCreate` datetime DEFAULT NULL,
  `P_DateStart` date DEFAULT NULL,
  `P_DateFinish` date DEFAULT NULL,
  `P_Note` varchar(50) DEFAULT NULL,
  `idPStatus` int(10) DEFAULT NULL,
  PRIMARY KEY (`idProject`),
  KEY `idPStatus` (`idPStatus`),
  KEY `idPManager` (`idPManager`),
  KEY `idTeamLeader` (`idTeamLeader`),
  KEY `idClient` (`idClient`),
  CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`idPStatus`) REFERENCES `ProjectStatus` (`idPStatus`),
  CONSTRAINT `Project_ibfk_2` FOREIGN KEY (`idPManager`) REFERENCES `Employee` (`idEmployee`),
  CONSTRAINT `Project_ibfk_3` FOREIGN KEY (`idTeamLeader`) REFERENCES `Employee` (`idEmployee`),
  CONSTRAINT `Project_ibfk_4` FOREIGN KEY (`idClient`) REFERENCES `Clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (46,'Test1',1000000001,1100000004,1,'2016-04-22 08:48:55','2016-04-22','2016-05-21',NULL,2),(47,'Test2',1000000001,1100000002,2,'2016-04-22 08:53:38','2016-04-22','2016-05-20',NULL,2),(48,'Test',1000000001,1100000002,4,'2016-04-22 09:45:40','2016-04-22','2016-05-19',NULL,1);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MainDB`.`trigger`
AFTER INSERT ON `MainDB`.`Project`
FOR EACH ROW
BEGIN
INSERT INTO Project_History VALUES(NEW.idProject,'OK',NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ProjectEmployee`
--

DROP TABLE IF EXISTS `ProjectEmployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectEmployee` (
  `idProject` int(10) NOT NULL,
  `idEmployee` int(10) NOT NULL,
  PRIMARY KEY (`idProject`,`idEmployee`),
  KEY `idEmployee` (`idEmployee`),
  CONSTRAINT `ProjectEmployee_ibfk_1` FOREIGN KEY (`idProject`) REFERENCES `Project` (`idProject`),
  CONSTRAINT `ProjectEmployee_ibfk_2` FOREIGN KEY (`idEmployee`) REFERENCES `Employee` (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectEmployee`
--

LOCK TABLES `ProjectEmployee` WRITE;
/*!40000 ALTER TABLE `ProjectEmployee` DISABLE KEYS */;
INSERT INTO `ProjectEmployee` VALUES (46,1100000001),(47,1100000001),(48,1100000001),(46,1100000002),(46,1100000003),(47,1100000003),(48,1100000003);
/*!40000 ALTER TABLE `ProjectEmployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectStatus`
--

DROP TABLE IF EXISTS `ProjectStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectStatus` (
  `idPStatus` int(10) NOT NULL,
  `P_Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectStatus`
--

LOCK TABLES `ProjectStatus` WRITE;
/*!40000 ALTER TABLE `ProjectStatus` DISABLE KEYS */;
INSERT INTO `ProjectStatus` VALUES (1,'In progress'),(2,'Done');
/*!40000 ALTER TABLE `ProjectStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_History`
--

DROP TABLE IF EXISTS `Project_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_History` (
  `idProject_History` int(11) NOT NULL,
  `Content` varchar(45) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  PRIMARY KEY (`idProject_History`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_History`
--

LOCK TABLES `Project_History` WRITE;
/*!40000 ALTER TABLE `Project_History` DISABLE KEYS */;
INSERT INTO `Project_History` VALUES (1,'OK','2016-04-14 13:07:30'),(2,'OK','2016-04-14 13:22:10'),(3,'OK','2016-04-14 13:40:45'),(4,'OK','2016-04-14 13:44:45'),(5,'OK','2016-04-14 13:49:29'),(6,'OK','2016-04-14 14:06:29'),(7,'OK','2016-04-14 14:08:02'),(8,'OK','2016-04-14 14:10:28'),(9,'OK','2016-04-14 14:15:59'),(10,'OK','2016-04-14 14:22:46'),(11,'OK','2016-04-14 14:26:04'),(12,'OK','2016-04-14 15:57:08'),(13,'OK','2016-04-14 15:57:30'),(14,'OK','2016-04-14 15:58:04'),(15,'OK','2016-04-19 14:57:40'),(16,'OK','2016-04-19 15:25:53'),(17,'OK','2016-04-19 15:26:40'),(18,'OK','2016-04-19 15:26:51'),(19,'OK','2016-04-19 15:29:18'),(20,'OK','2016-04-19 15:33:06'),(21,'OK','2016-04-21 15:38:43'),(22,'OK','2016-04-21 15:39:42'),(23,'OK','2016-04-21 15:41:28'),(24,'OK','2016-04-21 15:48:57'),(25,'OK','2016-04-21 15:58:02'),(26,'OK','2016-04-21 15:59:49'),(27,'OK','2016-04-21 16:04:38'),(28,'OK','2016-04-21 16:05:50'),(29,'OK','2016-04-21 16:05:59'),(30,'OK','2016-04-21 16:06:29'),(31,'OK','2016-04-21 16:06:57'),(32,'OK','2016-04-21 16:07:11'),(33,'OK','2016-04-21 16:07:30'),(34,'OK','2016-04-21 16:07:54'),(35,'OK','2016-04-21 16:08:20'),(36,'OK','2016-04-21 16:08:32'),(37,'OK','2016-04-21 16:08:39'),(38,'OK','2016-04-21 16:29:36'),(39,'OK','2016-04-21 16:44:54'),(40,'OK','2016-04-21 16:58:38'),(41,'OK','2016-04-21 16:58:56'),(42,'OK','2016-04-21 16:59:13'),(43,'OK','2016-04-21 17:13:45'),(44,'OK','2016-04-21 17:32:01'),(45,'OK','2016-04-22 08:17:57'),(46,'OK','2016-04-22 08:48:55'),(47,'OK','2016-04-22 08:53:38'),(48,'OK','2016-04-22 09:45:41');
/*!40000 ALTER TABLE `Project_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Request`
--

DROP TABLE IF EXISTS `Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Request` (
  `idRequest` int(10) NOT NULL AUTO_INCREMENT,
  `idClient` int(10) DEFAULT NULL,
  `idEmployee1` int(10) DEFAULT NULL,
  `idEmployee2` int(10) DEFAULT NULL,
  `dateCreate` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `responseTime` datetime DEFAULT NULL,
  PRIMARY KEY (`idRequest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Request`
--

LOCK TABLES `Request` WRITE;
/*!40000 ALTER TABLE `Request` DISABLE KEYS */;
/*!40000 ALTER TABLE `Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `idRole` int(10) NOT NULL,
  `Role` varchar(25) DEFAULT NULL,
  `Note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Administrator','This is Administrator'),(2,'Manager','This is Manager'),(3,'Leader','This is Leader'),(4,'Client','This is Client'),(5,'Member','This is Member');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skill`
--

DROP TABLE IF EXISTS `Skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill` (
  `idSkill` int(10) NOT NULL,
  `Skill` varchar(50) DEFAULT NULL,
  `S_Note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSkill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skill`
--

LOCK TABLES `Skill` WRITE;
/*!40000 ALTER TABLE `Skill` DISABLE KEYS */;
INSERT INTO `Skill` VALUES (1,'JAVA','This is the technical for JAVA'),(2,'.NET','This is the technical for JAVA'),(3,'Python','This is the technical for JAVA');
/*!40000 ALTER TABLE `Skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SkillDetail`
--

DROP TABLE IF EXISTS `SkillDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SkillDetail` (
  `idEmployee` int(10) NOT NULL,
  `idSkill` int(10) NOT NULL,
  `S_Rate` int(5) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`,`idSkill`),
  KEY `idSkill` (`idSkill`),
  CONSTRAINT `SkillDetail_ibfk_1` FOREIGN KEY (`idEmployee`) REFERENCES `Employee` (`idEmployee`),
  CONSTRAINT `SkillDetail_ibfk_2` FOREIGN KEY (`idSkill`) REFERENCES `Skill` (`idSkill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SkillDetail`
--

LOCK TABLES `SkillDetail` WRITE;
/*!40000 ALTER TABLE `SkillDetail` DISABLE KEYS */;
INSERT INTO `SkillDetail` VALUES (1000000001,1,3),(1000000001,2,2),(1000000002,1,3),(1000000002,2,2),(1000000003,1,3),(1000000003,2,2),(1000000004,1,3),(1000000004,2,2),(1000000005,1,3),(1000000005,2,2),(1100000001,1,3),(1100000001,2,2),(1100000002,1,3),(1100000002,2,2),(1100000003,1,3),(1100000003,2,2),(1100000004,1,3),(1100000004,2,2),(1100000005,1,3),(1100000005,2,2),(1100000006,1,3),(1100000006,2,2),(1100000007,1,3),(1100000007,2,2),(1100000008,1,3),(1100000008,2,2),(1100000009,1,3),(1100000009,2,2),(1100000010,1,3),(1100000010,2,2),(1100000011,1,3),(1100000011,2,2),(1100000012,1,3),(1100000012,2,2),(1100000013,1,3),(1100000013,2,2),(1100000014,1,3),(1100000014,2,2),(1100000015,1,3),(1100000015,2,2),(1100000016,1,3),(1100000016,2,2),(1100000017,1,3),(1100000017,2,2),(1100000018,1,3),(1100000018,2,2),(1100000019,1,3),(1100000019,2,2),(1100000020,1,3),(1100000020,2,2),(1100000021,1,3),(1100000021,2,2),(1100000022,1,3),(1100000022,2,2),(1100000023,1,3),(1100000023,2,2),(1100000024,1,3),(1100000024,2,2),(1100000025,1,3),(1100000025,2,2),(1100000026,1,3),(1100000026,2,2),(1100000027,1,3),(1100000027,2,2),(1100000028,1,3),(1100000028,2,2),(1100000029,1,3),(1100000029,2,2),(1100000030,1,3),(1100000030,2,2),(1100000031,1,3),(1100000031,2,2),(1100000032,1,3),(1100000032,2,2),(1100000033,1,3),(1100000033,2,2),(1100000034,1,3),(1100000034,2,2);
/*!40000 ALTER TABLE `SkillDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Team` (
  `idTeam` int(10) NOT NULL,
  `TeamName` varchar(25) DEFAULT NULL,
  `idPManager` int(10) unsigned DEFAULT NULL,
  `T_Note` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idTeam`),
  KEY `idPManager` (`idPManager`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES (1,'Team1',1000000001,NULL),(2,'Team2',1000000002,NULL),(3,'Team3',1000000003,NULL),(4,'Team4',1000000004,NULL),(5,'Team5',1000000005,NULL);
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeamMember`
--

DROP TABLE IF EXISTS `TeamMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeamMember` (
  `idTeam` int(10) NOT NULL,
  `idMember` int(10) NOT NULL,
  PRIMARY KEY (`idTeam`,`idMember`),
  KEY `idMember` (`idMember`),
  CONSTRAINT `TeamMember_ibfk_1` FOREIGN KEY (`idTeam`) REFERENCES `Team` (`idTeam`),
  CONSTRAINT `TeamMember_ibfk_2` FOREIGN KEY (`idMember`) REFERENCES `Employee` (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeamMember`
--

LOCK TABLES `TeamMember` WRITE;
/*!40000 ALTER TABLE `TeamMember` DISABLE KEYS */;
INSERT INTO `TeamMember` VALUES (1,1100000001),(1,1100000002),(1,1100000003),(1,1100000004),(1,1100000005),(1,1100000006),(1,1100000007),(2,1100000008),(2,1100000009),(2,1100000010),(2,1100000011),(2,1100000012),(2,1100000013),(2,1100000014),(2,1100000015),(3,1100000016),(3,1100000017),(3,1100000018),(3,1100000019),(3,1100000020),(3,1100000021),(3,1100000022),(3,1100000023),(4,1100000024),(4,1100000025),(4,1100000026),(4,1100000027),(4,1100000028),(4,1100000029),(5,1100000030),(5,1100000031),(5,1100000032),(5,1100000033),(5,1100000034),(1,1300000000),(1,1300000001),(1,1300000002),(2,1300000004),(2,1300000005),(2,1300000006),(3,1300000007),(3,1300000008),(4,1300000009);
/*!40000 ALTER TABLE `TeamMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) CHARACTER SET utf8 NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idAccount` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `idRole` int(10) DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idAccount`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `fk_users_1_idx` (`idRole`),
  CONSTRAINT `fk_users_1` FOREIGN KEY (`idRole`) REFERENCES `Role` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@enclave.vn','$2y$10$glV9.12rSlJhg6SRn2QFieI77bv8sxcDQY93sDmRt2lEyE0tUs2XS',1,'W3QBbpacKezRzMkEQSPyx6ayslX91EK8tBeBas7hOmt27sG0b1tePMl0RAas',NULL,NULL),(2,'projectmanager1@enclave.vn','$2y$10$rWly/v51PLv3sifFVqOnr.IDa2a2t2a5KKakUOy6sLLGYSb5JHXjO',2,'0KAW1GU4Z9syak9rXahVMreXmdhIKy4V3kLgooFGPEKXO7MRqMCN2qthL6Yk',NULL,NULL),(3,'projectmanager2@enclave.vn','$2y$10$UyNfOn/4DGNvNClnJkJyFeYR.D7727lo3qUgPW3bqA0geK.wFsNF6',2,'UAOLeYb1PuvGGpyPqymNiVVL3AlksnM3lLwYCR84i9RoEhW6fgFheAqsWmWI',NULL,NULL),(4,'projectmanager3@enclave.vn','$2y$10$0T17tiD6yhzU2QAvs5XQAOStrPJ8J/8broe7E6cwJFlSbnWCr4liq',2,'DWmxBDZtnSCmQaXptvNdZ7cDlrhPmmIPbeF0AM6tRJfRQ1OaRW1jhasC35Ki',NULL,NULL),(5,'projectmanager4@enclave.vn','$2y$10$XNL6m1MJtjEUDO7vPCSHBusIZ3untW/3/cwawc.dt6GytaVlJW.H6',2,'pWmrlUCA6psscIGz5CRmqhfnqRx8ZdwbpIvZ5ermY2OKd9fJP1gelp0T1oMQ',NULL,NULL),(6,'projectmanager5@enclave.vn','$2y$10$41W5CjRecVavkGLagF7VPuwJy91DK/FMZ6pYOAC4mGRLg9GVz.yha',2,'yQlzje4GAyjv54s8AjC2OVVdblo3iktFIIlQvUjUTayQWWa4PFvGiYUxxTZo',NULL,NULL),(7,'membem1@enclave.vn','$2y$10$0wuqptODjklbP7.8.GIhweigJOxwMaDtj2dvuRiPGShGXG0AgnNcW',5,'6aYamLmx3f0rfvkTi7aUD5R8L6bTECyEDy4vHM9soaGPZgS94KkDQKDAebCb',NULL,NULL),(8,'membem2@enclave.vn','$2y$10$qNm3aX.JYGwFUs/jRJxljuxn9Xp6EkO/TfV6PZxVmFTHyF8SkOi0i',3,NULL,NULL,NULL),(9,'membem3@enclave.vn','$2y$10$R33q.lfDIURMMbshMWy.T.CrnKethzTnoQNKF.XqU7NiGeRnj0Hyu',5,NULL,NULL,NULL),(10,'membem4@enclave.vn','$2y$10$Bkh8uelH/xrxBSxFz4ySl.sTKZ9loluEQIJAhtBU0aoKoUw2wkmB2',5,NULL,NULL,NULL),(11,'membem5@enclave.vn','$2y$10$WnjSfgIoKyxD/1D4XQLQK.tRGwEd3cWu8KwpFSVpBKv5pz/fOYnqC',5,NULL,NULL,NULL),(12,'membem6@enclave.vn','$2y$10$WpDau/K3Pjj0wyQdSAJ/7OjzyZGNozJXAb/Js1ocVMbu.urzLZruW',5,NULL,NULL,NULL),(13,'membem7@enclave.vn','$2y$10$00s6KhedvdHj.95dBDE5vuE2YUQez207Amhd2WaGRyGOIwhoWTu4S',5,NULL,NULL,NULL),(14,'membem8@enclave.vn','$2y$10$yJHJQgy/GJAQB9Mmn5e1Ne94A0WAwcItm3XQLWUzieGiI2f8CbT3C',5,NULL,NULL,NULL),(15,'membem9@enclave.vn','$2y$10$doB87NckrF27XjBeKfO1jeBlBg7dSlHm3YDUGROePCUc7iqpo4LWO',5,NULL,NULL,NULL),(16,'member10@enclave.vn','$2y$10$FMDObqy2CKw3R42bX.1NaOYpiLmT4OUDuPEIYdRpsSntkDhH0ER7m',5,NULL,NULL,NULL),(17,'member11@enclave.vn','$2y$10$WDT2Xe2BeavDwWej0eNMLOueZ6UR8cF8UPAzMuL8U9j9/aUFqQ3h6',5,NULL,NULL,NULL),(18,'member12@enclave.vn','$2y$10$Tahl1TKxfIG2JD0DrGW1Y.f0A3qMTTtwKrbgWvERDW9yTuaZicVHq',5,NULL,NULL,NULL),(19,'member13@enclave.vn','$2y$10$fAkQ2vBBf9oDeTZ.kRhm3OQgvcU65mnOAucTmT9xyg3JI7lc4XjYO',5,NULL,NULL,NULL),(20,'member14@enclave.vn','$2y$10$velsujLOg.S2mfI4KpLERux68wS.T9JygfIqVPvetjeEHPOTXzXaa',5,NULL,NULL,NULL),(21,'member15@enclave.vn','$2y$10$WpP8sEjaJq26KHm1Tn3vd.660iSffp5V6Kt9B3YTPyBsweKUjZ4ZK',5,NULL,NULL,NULL),(22,'member16@enclave.vn','$2y$10$NhJeCdy3/utOmt6ExlKYgOAsMUTJm2fty.1IrXN9quwoTvSb0tNU6',5,NULL,NULL,NULL),(23,'member17@enclave.vn','$2y$10$YJnlwzjfRXhPJ7a5kQbuBOTsFuJgaOMYkFKy30U9it/JZRia8zWym',5,NULL,NULL,NULL),(24,'member18@enclave.vn','$2y$10$7QbzPparQyg95MVmyKPG..T972ULeN9qe20BXOpCEl98i3q7hCnNy',5,NULL,NULL,NULL),(25,'member19@enclave.vn','$2y$10$me5P.8uzbrOidEKfZ2tMFeyh6D0aBrNWEQhKTSafAXd/Yn0YgxDuG',5,NULL,NULL,NULL),(26,'member20@enclave.vn','$2y$10$056gqNm5.5gxxQYTyE6uxuQddSEgJE5zuTbI3E04uzEHSdlfW/x8i',5,NULL,NULL,NULL),(27,'member21@enclave.vn','$2y$10$b0EDbaaa2IkhStAFtvchi.gmy9BcoKOQwoyE1A/bi9ChvkBYzAVdu',5,NULL,NULL,NULL),(28,'member22@enclave.vn','$2y$10$.SAl6FBRrWp4lhwpwR3o2uR4xWzeip7BUXJcMQLqB2hO6GLbp2/LK',5,NULL,NULL,NULL),(29,'member23@enclave.vn','$2y$10$avrbgayT91C51dwLLwFHsutFT/aI0AjbzW7SNuqcHmmM6DNkqCMeC',5,NULL,NULL,NULL),(30,'member24@enclave.vn','$2y$10$CeuWFVvclddDL.uwfLijiOsO69opniGjTE0P8Dy96oWI6tEu6RTpC',5,NULL,NULL,NULL),(31,'member25@enclave.vn','$2y$10$vuvnaOAdx0lHoJ.1hV.Bbu/QqxXSVf1xovul9olQ0UalVhHbVaKFK',5,NULL,NULL,NULL),(32,'member26@enclave.vn','$2y$10$B5cIXiNtlb2F5W.Fmm3qxeK7W13O8KNRqPPWnZs8Mv3.EgJhoKxvy',5,NULL,NULL,NULL),(33,'member27@enclave.vn','$2y$10$WYlLKcAleUfYKY70T3dUQ.0E9xonJpg4D2k5NLHh6BGwjDGhH7wW.',5,NULL,NULL,NULL),(34,'member28@enclave.vn','$2y$10$NwkR.J0z1ryBpBmksrmT.ehYl8wFXZeKthybgfUxKSq6qpN7G3WsC',5,NULL,NULL,NULL),(35,'member29@enclave.vn','$2y$10$ykyn3k2.IvQXg4JHRj7i3uVjssdPIGslYMNjDzppXOy5Ts6gq0vIW',5,NULL,NULL,NULL),(36,'member30@enclave.vn','$2y$10$VhWOFlLDXQL7oMOx0zrJ2OXzKOJwo47nuZvsef6POrJiIVbfw.u7i',5,NULL,NULL,NULL),(37,'member31@enclave.vn','$2y$10$GPRO0JSxEVWMfwf/NjgyTuBL4LIGt.etA9BJRNm8tqHQvFe5Gzm4G',5,NULL,NULL,NULL),(38,'member32@enclave.vn','$2y$10$GjkgJvR1L4LiDGk5jtZEN.LJ67q.hENM.eELMx7IQEjBcny3o3fui',5,NULL,NULL,NULL),(39,'member33@enclave.vn','$2y$10$dOMOJAWoVlLEPnyMr7gP9Oki7dJGCSpq5tpb63VbC5kEDX81gYnke',5,NULL,NULL,NULL),(40,'member34@enclave.vn','$2y$10$ch3dSQLLp2czrl59lvQrouHRbUwve8ogiZpC.wjlw2mrb8aPyURPG',5,NULL,NULL,NULL),(41,'client1@enclave.vn','$2y$10$TiOSwmCt6QHyidtQQbAQ0.pcrsZBbSUPH/BPov8CcvayaNv5qt4Y6',4,'yh9MESohf3zcwCAgMLk4CtX2TOzR6tR72L8VQFr64BLMv74Z9oOrf6Ec88H0',NULL,NULL),(42,'client2@enclave.vn','$2y$10$0GB9maO9hWfFPLfczNEwiumfhsyIUgSnqx4h1Yri3akjlenVU8yCa',4,NULL,NULL,NULL),(43,'client3@enclave.vn','$2y$10$pknsTIQhHn/bHW.HL1HMOuoOotLQX9FqkhECj.MWoCPGnW8h.K3dq',4,NULL,NULL,NULL),(44,'client4@enclave.vn','$2y$10$lQuDGPu6u5DtbvIl68IH6u2Vvvy/dxq7/TZ3zxgiSAvACldITkQvW',4,NULL,NULL,NULL),(45,'client5@enclave.vn','$2y$10$oRvZhFuXNmorQWupnX.dlO0ynUsOkscqLd2Mjxre/wjXsW.UD8QhG',4,NULL,NULL,NULL),(46,'member35@enclave.vn','$2y$10$9ns1USWkf/F1eosxOpEs3Omp9xSqmeK6BZBScWxrwgW/BtV4Q3gdO',5,'VgviYGYYqm7AKdToJOztlTc1OPLKkboA9Q1lOw7nm7j3ebYkTpUgz1VwrkMo',NULL,NULL),(47,'member36@enclave.vn','$2y$10$.olXRw2j6m0.iA9jpeepjOG0ffK1aN/ssSSMFLxcIudDeeh/.zMB2',5,NULL,NULL,NULL),(48,'member37@enclave.vn','$2y$10$p//W7OyskasWPswpZ7chx.qEkvTVllgcHuHMaC4jZKFrBC.aiV.hG',5,NULL,NULL,NULL),(49,'member38@enclave.vn','$2y$10$ciZdntFuxJzJ64QoJMQw4.HEGM8R.Uo06.2xEPFGKCl49AUuQpW4K',5,NULL,NULL,NULL),(50,'member39@enclave.vn','$2y$10$WwjIvYmOvrKtM5yMdeRBeOeNbxkJPkvC0p8bYIUj9Q0sMoaEW7b/i',5,'gbLnwcRJf09Bv4y7ihuTCWL2T7tniF23zwjl2GNuRnjetts8OpFJbAlmBxZm',NULL,NULL),(51,'member40@enclave.vn','$2y$10$8VTjKoBShySU3m/upC1lBebCYMGu/sJJcuaNLK0hcs3CYX9IvxirK',5,NULL,NULL,NULL),(52,'member41@enclave.vn','$2y$10$Ee8LgNAIJewJe6QRIDlRBu..1GtRt6Hlt15ynLGJTG7OhkpQb99YC',5,NULL,NULL,NULL),(53,'member42@enclave.vn','$2y$10$0S7O.37oBqg/Nzj/H5jjQujR9mAhmg2eAf7d1Cb5o15jgSADtVq9e',5,NULL,NULL,NULL),(54,'member43@enclave.vn','$2y$10$XNwTq8j2VVDBRfc0c562xu53vnvl7avA2b5jAptA.Qw/49R8g6Dya',5,NULL,NULL,NULL),(55,'member44@enclave.vn','$2y$10$/uy0v/4YgOu2xIIz0UqoJex39LehF0rBy9Izcan2Yxt.vNc/qZAHy',5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-22 17:43:04
