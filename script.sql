-- MySQL dump 10.16  Distrib 10.1.10-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: MainDB
-- ------------------------------------------------------
-- Server version	10.1.10-MariaDB

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
-- Table structure for table `client_company`
--

DROP TABLE IF EXISTS `client_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_company` (
  `idClientCompany` int(10) NOT NULL AUTO_INCREMENT,
  `CC_Name` varchar(255) NOT NULL,
  `CC_Address` varchar(255) NOT NULL,
  `CC_Phone` int(15) NOT NULL,
  `CC_Skype` varchar(255) NOT NULL,
  `CC_Description` varchar(400) NOT NULL,
  `idAccount` int(10) NOT NULL,
  `CC_Logo` varchar(255) NOT NULL,
  PRIMARY KEY (`idClientCompany`),
  KEY `lnk_Client_Company_users` (`idAccount`),
  CONSTRAINT `lnk_Client_Company_users` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_company`
--

LOCK TABLES `client_company` WRITE;
/*!40000 ALTER TABLE `client_company` DISABLE KEYS */;
INSERT INTO `client_company` VALUES (2,'Company','Address of Company 1',123456789,'skypecompany','This is about a company of producing software for whole system of universites',56,'56Avatar.jpg'),(5,'Company2','Address of Company',985513217,'skypecompany2','This is about a company of producing product for software engineering department of Enclave',57,''),(6,'clientcompanytest','client company test address',1234567890,'','kjadslfksldjflgkjsldkfgjlskdfkgsdjfgskdfjgklsjdkflgjlksdfjsdfgkljsdlfgl',60,'60avatar.jpg');
/*!40000 ALTER TABLE `client_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `idClient` int(10) NOT NULL AUTO_INCREMENT,
  `ClientName` varchar(50) DEFAULT NULL,
  `C_Phone` int(15) DEFAULT NULL,
  `C_Address` varchar(100) DEFAULT NULL,
  `C_Skype` varchar(25) DEFAULT NULL,
  `idAccount` int(10) DEFAULT NULL,
  `idNote` int(10) DEFAULT NULL,
  `idClientCompany` int(10) DEFAULT NULL,
  `C_Avatar` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idClient`),
  KEY `idNote` (`idNote`),
  KEY `fk_Clients_1_idx` (`idAccount`),
  KEY `lnk_Clients_Client_Company` (`idClientCompany`),
  CONSTRAINT `fk_Clients_1` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lnk_Clients_Client_Company` FOREIGN KEY (`idClientCompany`) REFERENCES `client_company` (`idClientCompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Client1',1200000001,'Address123','Skype123',41,NULL,5,'41Avatar.jpg'),(2,'Client2',1200000002,'Address2','Skype2',42,NULL,2,'client2.png'),(3,'Client3',1200000003,'Address3','Skype3',43,NULL,5,'client3.png'),(4,'Client4',1200000004,'Address4','Skype4',44,NULL,5,'client4.png'),(5,'Client5',1200000005,'Address5','Skype5',45,NULL,5,'client5.png'),(7,'client for company test',1234567899,'skdlfjgksdfkgjklsfdg','sdfjkglsjdklfg',64,NULL,6,'64avatar.jpg');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_status`
--

DROP TABLE IF EXISTS `e_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_status` (
  `idStatus` int(10) NOT NULL,
  `Status` varchar(25) DEFAULT NULL,
  `S_Note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_status`
--

LOCK TABLES `e_status` WRITE;
/*!40000 ALTER TABLE `e_status` DISABLE KEYS */;
INSERT INTO `e_status` VALUES (1,'On Working',NULL),(2,'Available',NULL),(3,'Outside',NULL);
/*!40000 ALTER TABLE `e_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `idEmployee` int(10) NOT NULL,
  `E_Name` varchar(50) DEFAULT NULL,
  `E_Phone` int(15) DEFAULT NULL,
  `E_Address` varchar(75) DEFAULT NULL,
  `E_Skype` varchar(32) DEFAULT NULL,
  `E_Avatar` text,
  `E_EngName` varchar(50) DEFAULT NULL,
  `E_Cost_Hour` int(10) DEFAULT NULL,
  `E_DateofBirth` date DEFAULT NULL,
  `idAccount` int(10) DEFAULT NULL,
  `idStatus` int(10) DEFAULT NULL,
  `idEChart` int(10) DEFAULT NULL,
  `E_Sex` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  KEY `idStatus` (`idStatus`),
  KEY `idEChart` (`idEChart`),
  KEY `fk_Employee_1_idx` (`idAccount`),
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`idStatus`) REFERENCES `e_status` (`idStatus`),
  CONSTRAINT `fk_Employee_1` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1000000001,'ProjectManager1',906478808,'Address1','Skype1','2Avatar.jpg','ProjectManager1',10,'1994-03-02',2,2,NULL,1),(1000000002,'ProjectManager2',1000000002,'Address2','Skype2','2.png','ProjectManager2',10,'1994-03-02',3,2,NULL,1),(1000000003,'ProjectManager3',1000000003,'Address3','Skype3','3.png','ProjectManager3',10,'1994-03-02',4,2,NULL,1),(1000000004,'ProjectManager4',1000000004,'Address4','Skype4','4.png','ProjectManager4',10,'1994-03-02',5,2,NULL,1),(1000000005,'ProjectManager5',1000000005,'Address5','Skype5','5.png','ProjectManager5',10,'1994-03-02',6,2,NULL,1),(1100000001,'Member1',1100000001,'Address1','Skype1','6.png','Member1',10,'1994-03-03',7,2,NULL,2),(1100000002,'Member2',1100000002,'Address2','Skype2','7.png','Member2',10,'1994-03-03',8,2,NULL,2),(1100000003,'Member3',1100000003,'Address3','Skype3','8.png','Member3',10,'1994-03-03',9,2,NULL,2),(1100000004,'Member4',1100000004,'Address4','Skype4','9.png','Member4',10,'1994-03-03',10,1,NULL,2),(1100000005,'Member5',1100000005,'Address5','Skype5','10.png','Member5',10,'1994-03-03',11,1,NULL,2),(1100000006,'Member6',1100000006,'Address6','Skype6','11.png','Member6',10,'1994-03-03',12,1,NULL,2),(1100000007,'Member7',1100000007,'Address7','Skype7','12.png','Member7',10,'1994-03-03',13,2,NULL,2),(1100000008,'Member8',1100000008,'Address8','Skype8','13.png','Member8',10,'1994-03-03',14,1,NULL,2),(1100000009,'Member9',1100000009,'Address9','Skype9','14.png','Member9',10,'1994-03-03',15,1,NULL,2),(1100000010,'Member10',1100000010,'Address10','Skype10','15.png','Member10',10,'1994-03-03',16,1,NULL,2),(1100000011,'Member11',1100000011,'Address11','Skype11','16.png','Member11',10,'1994-03-03',17,2,NULL,2),(1100000012,'Member12',1100000012,'Address12','Skype12','17.png','Member12',10,'1994-03-03',18,2,NULL,2),(1100000013,'Member13',1100000013,'Address13','Skype13','18.png','Member13',10,'1994-03-03',19,2,NULL,2),(1100000014,'Member14',1100000014,'Address14','Skype14','19.png','Member14',10,'1994-03-03',20,2,NULL,2),(1100000015,'Member15',1100000015,'Address15','Skype15','20.png','Member15',10,'1994-03-03',21,2,NULL,2),(1100000016,'Member16',1100000016,'Address16','Skype16','21.png','Member16',10,'1994-03-03',22,2,NULL,2),(1100000017,'Member17',1100000017,'Address17','Skype17','22.png','Member17',10,'1994-03-03',23,2,NULL,2),(1100000018,'Member18',1100000018,'Address18','Skype18','23.png','Member18',10,'1994-03-03',24,2,NULL,2),(1100000019,'Member19',1100000019,'Address19','Skype19','24.png','Member19',10,'1994-03-03',25,2,NULL,2),(1100000020,'Member20',1100000020,'Address20','Skype20','25.png','Member20',10,'1994-03-03',26,2,NULL,2),(1100000021,'Member21',1100000021,'Address21','Skype21','26.png','Member21',10,'1994-03-03',27,2,NULL,2),(1100000022,'Member22',1100000022,'Address22','Skype22','27.png','Member22',10,'1994-03-03',28,2,NULL,2),(1100000023,'Member23',1100000023,'Address23','Skype23','28.png','Member23',10,'1994-03-03',29,2,NULL,2),(1100000024,'Member24',1100000024,'Address24','Skype24','29.png','Member24',10,'1994-03-03',30,2,NULL,2),(1100000025,'Member25',1100000025,'Address25','Skype25','30.png','Member25',10,'1994-03-03',31,2,NULL,2),(1100000026,'Member26',1100000026,'Address26','Skype26','31.png','Member26',10,'1994-03-03',32,2,NULL,2),(1100000027,'Member27',1100000027,'Address27','Skype27','32.png','Member27',10,'1994-03-03',33,2,NULL,2),(1100000028,'Member28',1100000028,'Address28','Skype28','33.png','Member28',10,'1994-03-03',34,2,NULL,2),(1100000029,'Member29',1100000029,'Address29','Skype29','34.png','Member29',10,'1994-03-03',35,2,NULL,2),(1100000030,'Member30',1100000030,'Address30','Skype30','35.png','Member30',10,'1994-03-03',36,1,NULL,2),(1100000031,'Member31',1100000031,'Address31','Skype31','36.png','Member31',10,'1994-03-03',37,2,NULL,2),(1100000032,'Member32',1100000032,'Address32','Skype32','37.png','Member32',10,'1994-03-03',38,1,NULL,2),(1100000033,'Member33',1100000033,'Address33','Skype33','38.png','Member33',10,'1994-03-03',39,2,NULL,2),(1100000034,'Member34',1100000034,'Address34','Skype34','39.png','Member34',10,'1994-03-03',40,2,NULL,2),(1102365489,'ksdkflhglksdfg',1235489366,'dfkhgdjklfgh','dgfhdfgh','68avatar.jpg','ksdsdfkgsf',20,'1994-02-03',68,2,NULL,1),(1111112226,'ndjfgjhdfgjh',112236656,'sdfgsdfgsdfg','dfghdfghdfgh','66avatar.jpg','sjdfhkskdjf',20,'1994-02-03',66,2,NULL,1),(1122335569,'ksdfglksdfg',2147483647,'kdgklhdfglkh','dflgkhdlfgh','67avatar.jpg','sksjdkflg',24,'1994-02-03',67,2,NULL,1),(1300000000,'Leader1',41,'Address1','Skype1','40.png','Leader1',10,'1994-03-04',46,2,NULL,1),(1300000001,'Leader2',42,'Address2','Skype2','41.png','Leader2',10,'1994-03-04',47,2,NULL,1),(1300000002,'Leader3',43,'Address3','Skype3','42.png','Leader3',10,'1994-03-04',48,2,NULL,1),(1300000003,'Leader4',44,'Address4','Skype4','43.png','Leader4',10,'1994-03-04',49,2,NULL,1),(1300000004,'Leader5',45,'Address5','Skype5','44.png','Leader5',10,'1994-03-04',50,2,NULL,1),(1300000005,'Leader6',46,'Address6','Skype6','45.png','Leader6',10,'1994-03-04',51,2,NULL,1),(1300000006,'Leader7',47,'Address7','Skype7','46.png','Leader7',10,'1994-03-04',52,2,NULL,1),(1300000007,'Leader8',48,'Address8','Skype8','47.png','Leader8',10,'1994-03-04',53,2,NULL,1),(1300000008,'Leader9',49,'Address9','Skype9','48.png','Leader9',10,'1994-03-04',54,2,NULL,1),(1300000009,'Leader10',50,'Address10','Skype10','49.png','Leader10',10,'1994-03-04',55,2,NULL,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_record`
--

DROP TABLE IF EXISTS `employee_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_record` (
  `idERecord` int(10) NOT NULL AUTO_INCREMENT,
  `Content` varchar(250) DEFAULT NULL,
  `DateStart` datetime DEFAULT NULL,
  `DateEnd` datetime DEFAULT NULL,
  `idEmployee` int(10) DEFAULT NULL,
  PRIMARY KEY (`idERecord`),
  KEY `idEmployee` (`idEmployee`),
  CONSTRAINT `Employee_Record_ibfk_1` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_record`
--

LOCK TABLES `employee_record` WRITE;
/*!40000 ALTER TABLE `employee_record` DISABLE KEYS */;
INSERT INTO `employee_record` VALUES (252,'Just become project manager of the project.81','2016-04-25 17:04:38',NULL,1000000005),(253,'Just become leader of the project.81','2016-04-25 17:04:38','2016-04-25 17:04:49',1100000030),(254,'Just become member of project.81','2016-04-25 17:04:38','2016-04-25 17:04:49',1100000031),(255,'Just become member of project.81','2016-04-25 17:04:38',NULL,1100000032),(256,'Just become leader of the project.81','2016-04-25 17:04:49',NULL,1100000031),(257,'Just be changed from leader to member of project.81','2016-04-25 17:04:49',NULL,1100000030),(258,'Just become leader of the project.70','2016-04-26 11:56:34',NULL,1100000001),(259,'Just become member of project.70','2016-04-26 11:56:43','2016-04-29 14:54:49',1100000002),(260,'Just become leader of the project.70','2016-04-26 11:56:51','2016-04-29 14:54:57',1100000003),(261,'Just become project manager of the project.82','2016-04-26 11:58:38',NULL,1000000001),(262,'Just become leader of the project.82','2016-04-26 11:58:38','2016-04-26 11:58:49',1100000004),(263,'Just become member of project.82','2016-04-26 11:58:38','2016-04-26 11:59:03',1100000001),(264,'Just become member of project.82','2016-04-26 11:58:38','2016-04-26 11:58:49',1100000005),(265,'Just become leader of the project.82','2016-04-26 11:58:49','2016-04-26 11:59:03',1100000005),(266,'Just be changed from leader to member of project.82','2016-04-26 11:58:49','2016-04-26 11:59:17',1100000004),(267,'Just become leader of the project.82','2016-04-26 11:59:03',NULL,1100000001),(268,'Just be changed from leader to member of project.82','2016-04-26 11:59:03','2016-04-26 11:59:25',1100000005),(269,'Just become leader of the project.82','2016-04-26 11:59:17','2016-04-26 11:59:25',1100000004),(270,'Just become leader of the project.82','2016-04-26 11:59:25','2016-04-30 16:22:12',1100000005),(271,'Just be changed from leader to member of project.82','2016-04-26 11:59:25','2016-04-30 16:22:12',1100000004),(272,'Just become project manager of the project.83','2016-04-26 13:07:05',NULL,1000000001),(273,'Just become leader of the project.83','2016-04-26 13:07:05','2016-04-26 13:07:18',1100000001),(274,'Just become member of project.83','2016-04-26 13:07:05','2016-04-26 13:07:18',1100000005),(275,'Just become member of project.83','2016-04-26 13:07:05','2016-04-26 13:07:26',1100000006),(276,'Just become leader of the project.83','2016-04-26 13:07:18','2016-04-26 13:07:26',1100000005),(277,'Just be changed from leader to member of project.83','2016-04-26 13:07:18',NULL,1100000001),(278,'Just become leader of the project.83','2016-04-26 13:07:26',NULL,1100000006),(279,'Just be changed from leader to member of project.83','2016-04-26 13:07:26',NULL,1100000005),(280,'Just become project manager of the project.84','2016-04-26 13:08:24',NULL,1000000002),(281,'Just become leader of the project.84','2016-04-26 13:08:24',NULL,1100000014),(282,'Just become member of project.84','2016-04-26 13:08:24',NULL,1100000010),(283,'Just become member of project.84','2016-04-26 13:08:24',NULL,1100000012),(284,'Just become project manager of the project.85','2016-04-26 13:10:28',NULL,1000000002),(285,'Just become leader of the project.85','2016-04-26 13:10:28','2016-04-26 13:10:37',1100000008),(286,'Just become member of project.85','2016-04-26 13:10:28','2016-04-26 13:10:37',1100000010),(287,'Just become member of project.85','2016-04-26 13:10:28',NULL,1100000012),(288,'Just become member of project.85','2016-04-26 13:10:28',NULL,1100000014),(289,'Just become leader of the project.85','2016-04-26 13:10:37',NULL,1100000010),(290,'Just be changed from leader to member of project.85','2016-04-26 13:10:37',NULL,1100000008),(291,'Just become project manager of the project.86','2016-04-26 13:19:06',NULL,1000000002),(292,'Just become leader of the project.86','2016-04-26 13:19:06','2016-04-26 13:19:14',1100000008),(293,'Just become member of project.86','2016-04-26 13:19:06','2016-04-26 13:19:14',1100000009),(294,'Just become member of project.86','2016-04-26 13:19:06',NULL,1100000010),(295,'Just become leader of the project.86','2016-04-26 13:19:14',NULL,1100000009),(296,'Just be changed from leader to member of project.86','2016-04-26 13:19:14',NULL,1100000008),(297,'Just become project manager of the project.87','2016-04-26 13:20:21',NULL,1000000001),(298,'Just become leader of the project.87','2016-04-26 13:20:21','2016-04-26 13:20:36',1300000002),(299,'Just become member of project.87','2016-04-26 13:20:21','2016-04-26 13:20:36',1100000006),(300,'Just become member of project.87','2016-04-26 13:20:21',NULL,1300000000),(301,'Just become leader of the project.87','2016-04-26 13:20:36',NULL,1100000006),(302,'Just be changed from leader to member of project.87','2016-04-26 13:20:36',NULL,1300000002),(303,'Just become project manager of the project.88','2016-04-26 13:21:34',NULL,1000000005),(304,'Just become leader of the project.88','2016-04-26 13:21:34','2016-04-26 13:21:40',1100000034),(305,'Just become member of project.88','2016-04-26 13:21:34',NULL,1100000031),(306,'Just become member of project.88','2016-04-26 13:21:34','2016-04-26 13:21:40',1100000033),(307,'Just become leader of the project.88','2016-04-26 13:21:40',NULL,1100000033),(308,'Just be changed from leader to member of project.88','2016-04-26 13:21:40',NULL,1100000034),(309,'Just become project manager of the project.89','2016-04-26 13:22:27',NULL,1000000002),(310,'Just become leader of the project.89','2016-04-26 13:22:27',NULL,1100000008),(311,'Just become member of project.89','2016-04-26 13:22:27',NULL,1100000009),(312,'Just become member of project.89','2016-04-26 13:22:27',NULL,1100000010),(313,'Just become project manager of the project.90','2016-04-26 13:23:15',NULL,1000000003),(314,'Just become leader of the project.90','2016-04-26 13:23:15','2016-04-26 13:23:32',1100000016),(315,'Just become member of project.90','2016-04-26 13:23:14','2016-04-26 13:23:32',1100000017),(316,'Just become member of project.90','2016-04-26 13:23:14',NULL,1100000018),(317,'Just become leader of the project.90','2016-04-26 13:23:32',NULL,1100000017),(318,'Just be changed from leader to member of project.90','2016-04-26 13:23:32',NULL,1100000016),(319,'Just become project manager of the project.91','2016-04-26 13:26:42','2016-04-26 13:27:23',1000000004),(320,'Just become leader of the project.91','2016-04-26 13:26:42','2016-04-26 13:27:03',1100000025),(321,'Just become member of project.91','2016-04-26 13:26:42','2016-04-26 13:27:23',1100000024),(322,'Just become member of project.91','2016-04-26 13:26:42','2016-04-26 13:27:03',1100000026),(323,'Just become leader of the project.91','2016-04-26 13:27:03','2016-04-26 13:27:23',1100000026),(324,'Just be changed from leader to member of project.91','2016-04-26 13:27:03','2016-04-26 13:27:23',1100000025),(325,'Just become leader of the project.54','2016-04-29 14:54:49','2016-04-29 14:54:56',1100000002),(326,'Just be changed from leader to member of project.54','2016-04-29 14:54:49','2016-04-29 14:55:04',1100000001),(327,'Just become leader of the project.54','2016-04-29 14:54:56','2016-04-29 14:55:03',1100000003),(328,'Just be changed from leader to member of project.54','2016-04-29 14:54:56','2016-04-30 16:21:47',1100000002),(329,'Just become leader of the project.54','2016-04-29 14:55:04','2016-04-29 14:55:22',1100000001),(330,'Just be changed from leader to member of project.54','2016-04-29 14:55:03',NULL,1100000003),(331,'Just become leader of the project.52','2016-04-29 14:55:22',NULL,1100000001),(332,'Just be changed from leader to member of project.52','2016-04-29 14:55:22',NULL,1100000003),(333,'Just become leader of the project.58','2016-04-30 16:21:47',NULL,1100000002),(334,'Just become member of project.58','2016-04-30 16:21:46','2016-05-02 15:00:10',1100000001),(335,'Just be changed from leader to member of project.58','2016-04-30 16:21:46',NULL,1100000003),(336,'Just become leader of the project.82','2016-04-30 16:22:12',NULL,1100000004),(337,'Just become member of project.82','2016-04-30 16:22:12',NULL,1100000002),(338,'Just be changed from leader to member of project.82','2016-04-30 16:22:12',NULL,1100000005),(339,'Just become project manager of the project.92','2016-05-02 12:48:35',NULL,1000000001),(340,'Just become leader of the project.92','2016-05-02 12:48:35',NULL,1100000004),(341,'Just become member of project.92','2016-05-02 12:48:35',NULL,1100000003),(342,'Just become member of project.92','2016-05-02 12:48:35',NULL,1100000006),(343,'Just become project manager of the project.93','2016-05-02 13:37:48',NULL,1000000002),(344,'Just become leader of the project.93','2016-05-02 13:37:48',NULL,1100000009),(345,'Just become member of project.93','2016-05-02 13:37:48',NULL,1100000008),(346,'Just become member of project.93','2016-05-02 13:37:48',NULL,1100000010),(347,'Just become project manager of the project.94','2016-05-02 13:48:37',NULL,1000000001),(348,'Just become leader of the project.94','2016-05-02 13:48:37','2016-05-02 14:07:08',1300000002),(349,'Just become member of project.94','2016-05-02 13:48:37','2016-05-02 14:07:08',1100000007),(350,'Just become member of project.94','2016-05-02 13:48:37','2016-05-02 14:07:58',1300000001),(351,'Just become leader of the project.94','2016-05-02 14:07:08','2016-05-02 14:07:58',1100000007),(352,'Just be changed from leader to member of project.94','2016-05-02 14:07:08',NULL,1300000002),(353,'Just become leader of the project.94','2016-05-02 14:07:58',NULL,1300000001),(354,'Just be changed from leader to member of project.94','2016-05-02 14:07:58',NULL,1100000007),(355,'Just become leader of the project.48','2016-05-02 15:00:10',NULL,1100000001),(356,'Just be changed from leader to member of project.48','2016-05-02 15:00:10',NULL,1100000002);
/*!40000 ALTER TABLE `employee_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `englishchart`
--

DROP TABLE IF EXISTS `englishchart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `englishchart` (
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
  CONSTRAINT `lnk_EnglishChart_Employee` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `englishchart`
--

LOCK TABLES `englishchart` WRITE;
/*!40000 ALTER TABLE `englishchart` DISABLE KEYS */;
INSERT INTO `englishchart` VALUES (4,150,120,110,130,150,180,200,150,160,170,200,120,NULL,1100000001,2016),(5,120,130,160,170,200,180,160,200,130,120,170,200,NULL,1000000002,2016),(6,110,150,170,153,120,200,190,170,130,149,120,200,NULL,1000000003,2016),(7,120,120,150,160,200,190,160,190,120,130,150,180,NULL,1000000004,2016),(8,100,100,150,0,0,0,0,0,0,0,0,0,NULL,1000000001,2016);
/*!40000 ALTER TABLE `englishchart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
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
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`),
  CONSTRAINT `Feedback_ibfk_2` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`),
  CONSTRAINT `lnk_Feedback_Project` FOREIGN KEY (`idProject`) REFERENCES `project` (`idProject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (3,'Cool1','You are very good1',4,'2016-04-21 11:27:56',1,1100000001,46),(4,'Cool','OK',5,'2016-04-22 11:28:17',1,1100000001,46),(5,'Good','Good',5,'2016-04-29 17:10:20',1,1100000001,51);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_history`
--

DROP TABLE IF EXISTS `feedback_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_history` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_history`
--

LOCK TABLES `feedback_history` WRITE;
/*!40000 ALTER TABLE `feedback_history` DISABLE KEYS */;
INSERT INTO `feedback_history` VALUES (1,'Did create new feedback ','2016-04-22 11:26:57',2,1,'You are very good','You are very good.',5,1100000001,1,46),(2,'Did delete new feedback ','2016-04-22 11:27:37',2,0,'You are very good',NULL,5,1100000001,1,46),(3,'Did create new feedback ','2016-04-22 11:27:56',3,1,'Cool','You are very good',5,1100000001,1,46),(4,'Did edit feedback ','2016-04-22 11:28:06',3,2,'Cool1','You are very good1',4,1100000001,1,46),(5,'Did create new feedback ','2016-04-22 11:28:17',4,1,'Cool','OK',5,1100000001,1,46),(6,'Did create new feedback ','2016-04-29 17:10:20',5,1,'Gog','Good',4,1100000001,1,51),(7,'Did edit feedback ','2016-04-29 17:17:39',5,2,'Good','Good',5,1100000001,1,51);
/*!40000 ALTER TABLE `feedback_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `idHistory` int(10) NOT NULL AUTO_INCREMENT,
  `H_Content` varchar(500) DEFAULT NULL,
  `H_DateCreate` datetime DEFAULT NULL,
  `idAccount` int(10) NOT NULL,
  PRIMARY KEY (`idHistory`),
  KEY `lnk_History_users` (`idAccount`),
  CONSTRAINT `lnk_History_users` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (62,'Did create new project .46','2016-04-22 08:48:55',2),(63,'Did edit project .46','2016-04-22 08:50:02',2),(64,'Did edit project .46','2016-04-22 08:51:15',2),(65,'Did edit project .46','2016-04-22 08:51:52',2),(66,'Did edit project .46','2016-04-22 08:52:22',2),(67,'Did create new project .47','2016-04-22 08:53:38',2),(68,'Did edit project .47','2016-04-22 08:54:10',2),(69,'Did create new project .48','2016-04-22 09:45:41',2),(70,'Did create new project .49','2016-04-25 10:28:06',2),(71,'Did edit project .49','2016-04-25 10:29:31',2),(72,'Did create new project .50','2016-04-25 10:32:59',2),(73,'Did edit project .50','2016-04-25 10:35:08',2),(74,'Did edit project .50','2016-04-25 10:35:57',2),(75,'Did edit project .50','2016-04-25 10:37:57',2),(76,'Did edit project .50','2016-04-25 10:44:28',2),(77,'Did edit project .50','2016-04-25 10:44:31',2),(78,'Did create new project .51','2016-04-25 10:48:27',2),(79,'Did edit project .51','2016-04-25 10:48:56',2),(80,'Did create new project .52','2016-04-25 10:51:55',2),(81,'Did edit project .52','2016-04-25 10:52:38',2),(82,'Did create new project .53','2016-04-25 10:56:04',2),(83,'Did edit project .53','2016-04-25 10:56:34',2),(84,'Did create new project .54','2016-04-25 11:04:56',2),(85,'Did edit project .54','2016-04-25 11:05:29',2),(86,'Did create new project .55','2016-04-25 11:09:26',2),(87,'Did edit project .55','2016-04-25 11:09:50',2),(88,'Did create new project .56','2016-04-25 11:14:21',2),(89,'Did edit project .56','2016-04-25 11:14:45',2),(90,'Did create new project .57','2016-04-25 11:19:07',2),(91,'Did edit project .57','2016-04-25 11:19:28',2),(92,'Did create new project .58','2016-04-25 11:20:25',2),(93,'Did edit project .58','2016-04-25 11:20:44',2),(94,'Did edit project .58','2016-04-25 11:22:40',2),(95,'Did create new project .59','2016-04-25 11:39:09',2),(96,'Did edit project .59','2016-04-25 11:39:43',2),(97,'Did edit project .59','2016-04-25 11:40:26',2),(98,'Did create new project .60','2016-04-25 11:43:34',2),(99,'Did create new project .61','2016-04-25 11:44:21',2),(100,'Did edit project .61','2016-04-25 11:45:13',2),(101,'Did edit project .61','2016-04-25 11:45:39',2),(102,'Did edit project .61','2016-04-25 11:49:09',2),(103,'Did create new project .62','2016-04-25 11:51:08',2),(104,'Did edit project .62','2016-04-25 11:51:27',2),(105,'Did edit project .62','2016-04-25 11:51:54',2),(106,'Did create new project .63','2016-04-25 15:45:35',2),(107,'Did create new project .64','2016-04-25 15:47:09',2),(108,'Did create new project .65','2016-04-25 15:48:28',2),(109,'Did create new project .66','2016-04-25 15:49:21',2),(110,'Did edit project .66','2016-04-25 15:49:44',2),(111,'Did edit project .66','2016-04-25 15:50:00',2),(112,'Did edit project .66','2016-04-25 15:50:12',2),(113,'Did create new project .67','2016-04-25 15:51:10',2),(114,'Did edit project .67','2016-04-25 15:51:22',2),(115,'Did edit project .67','2016-04-25 15:54:36',2),(116,'Did create new project .68','2016-04-25 15:56:34',2),(117,'Did edit project .68','2016-04-25 15:56:49',2),(118,'Did create new project .69','2016-04-25 16:03:08',2),(119,'Did edit project .69','2016-04-25 16:03:20',2),(120,'Did create new project .70','2016-04-25 16:10:41',2),(121,'Did edit project .70','2016-04-25 16:10:52',2),(122,'Did create new project .71','2016-04-25 16:13:18',2),(123,'Did edit project .71','2016-04-25 16:13:43',2),(124,'Did create new project .72','2016-04-25 16:15:33',2),(125,'Did create new project .73','2016-04-25 16:16:30',2),(126,'Did edit project .73','2016-04-25 16:17:06',2),(127,'Did create new project .74','2016-04-25 16:30:24',2),(128,'Did edit project .74','2016-04-25 16:30:40',2),(129,'Did create new project .75','2016-04-25 16:33:32',2),(130,'Did edit project .75','2016-04-25 16:33:41',2),(131,'Did edit project .75','2016-04-25 16:37:00',2),(132,'Did edit project .75','2016-04-25 16:38:37',2),(133,'Did edit project .75','2016-04-25 16:39:03',2),(134,'Did create new project .76','2016-04-25 16:39:22',2),(135,'Did edit project .76','2016-04-25 16:39:32',2),(136,'Did edit project .76','2016-04-25 16:39:50',2),(137,'Did edit project .76','2016-04-25 16:40:16',2),(138,'Did create new project .77','2016-04-25 16:44:11',2),(139,'Did edit project .77','2016-04-25 16:44:23',2),(140,'Did create new project .78','2016-04-25 16:45:14',2),(141,'Did edit project .78','2016-04-25 16:45:25',2),(142,'Did create new project .79','2016-04-25 17:01:06',1),(143,'Did edit project .79','2016-04-25 17:01:26',1),(144,'Did create new project .80','2016-04-25 17:03:16',1),(145,'Did edit project .80','2016-04-25 17:03:37',1),(146,'Did create new project .81','2016-04-25 17:04:38',1),(147,'Did edit project .81','2016-04-25 17:04:49',1),(148,'Did edit project .70','2016-04-26 11:56:34',1),(149,'Did edit project .70','2016-04-26 11:56:43',1),(150,'Did edit project .70','2016-04-26 11:56:51',1),(151,'Did create new project .82','2016-04-26 11:58:38',1),(152,'Did edit project .82','2016-04-26 11:58:49',1),(153,'Did edit project .82','2016-04-26 11:59:03',1),(154,'Did edit project .82','2016-04-26 11:59:16',1),(155,'Did edit project .82','2016-04-26 11:59:25',1),(156,'Did create new project .83','2016-04-26 13:07:05',1),(157,'Did edit project .83','2016-04-26 13:07:18',1),(158,'Did edit project .83','2016-04-26 13:07:26',1),(159,'Did edit project .83','2016-04-26 13:07:47',1),(160,'Did edit project .83','2016-04-26 13:07:57',1),(161,'Did create new project .84','2016-04-26 13:08:24',1),(162,'Did edit project .84','2016-04-26 13:08:41',1),(163,'Did create new project .85','2016-04-26 13:10:28',1),(164,'Did edit project .85','2016-04-26 13:10:37',1),(165,'Did edit project .85','2016-04-26 13:10:46',1),(166,'Did create new project .86','2016-04-26 13:19:06',1),(167,'Did edit project .86','2016-04-26 13:19:14',1),(168,'Did edit project .86','2016-04-26 13:19:24',1),(169,'Did create new project .87','2016-04-26 13:20:21',1),(170,'Did edit project .87','2016-04-26 13:20:36',1),(171,'Did create new project .88','2016-04-26 13:21:34',1),(172,'Did edit project .88','2016-04-26 13:21:40',1),(173,'Did edit project .88','2016-04-26 13:21:48',1),(174,'Did create new project .89','2016-04-26 13:22:27',1),(175,'Did edit project .89','2016-04-26 13:22:36',1),(176,'Did create new project .90','2016-04-26 13:23:14',1),(177,'Did edit project .90','2016-04-26 13:23:32',1),(178,'Did edit project .90','2016-04-26 13:25:03',1),(179,'Did create new project .91','2016-04-26 13:26:42',1),(180,'Did edit project .91','2016-04-26 13:27:03',1),(181,'Did edit project .91','2016-04-26 13:27:23',1),(182,'Did edit project .48','2016-04-28 17:18:20',2),(183,'Did edit project .54','2016-04-29 14:54:49',1),(184,'Did edit project .54','2016-04-29 14:54:56',1),(185,'Did edit project .54','2016-04-29 14:55:04',1),(186,'Did edit project .52','2016-04-29 14:55:22',1),(187,'Did edit project .58','2016-04-30 16:21:47',1),(188,'Did edit project .82','2016-04-30 16:22:12',1),(189,'Did edit project .82','2016-05-01 16:16:00',2),(190,'Did edit project .82','2016-05-01 16:18:32',2),(191,'Did edit project .82','2016-05-01 16:19:17',2),(192,'Did edit project .53','2016-05-01 16:35:47',1),(193,'Did edit project .53','2016-05-01 16:36:02',1),(194,'Did edit project .53','2016-05-01 16:41:02',1),(195,'Did edit project .82','2016-05-02 11:13:25',1),(196,'Did edit project .82','2016-05-02 11:13:38',1),(197,'Did create new project .92','2016-05-02 12:48:35',1),(198,'Did create new project .93','2016-05-02 13:37:48',1),(199,'Did create new project .94','2016-05-02 13:48:37',2),(200,'Did edit project .94','2016-05-02 14:06:59',1),(201,'Did edit project .94','2016-05-02 14:07:08',1),(202,'Did edit project .94','2016-05-02 14:07:50',2),(203,'Did edit project .94','2016-05-02 14:07:58',2),(204,'Did edit project .48','2016-05-02 15:00:10',2),(205,'Did edit project .94','2016-05-02 15:00:25',2);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `idMessage` int(10) NOT NULL AUTO_INCREMENT,
  `idAccount` int(10) NOT NULL,
  `content` varchar(300) NOT NULL,
  `dateSend` datetime NOT NULL,
  `sender` varchar(50) NOT NULL,
  `M_Status` int(2) NOT NULL,
  PRIMARY KEY (`idMessage`),
  KEY `lnk_Message_users` (`idAccount`),
  CONSTRAINT `lnk_Message_users` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,2,'hdugfbmd','2016-04-28 16:19:49','0',0),(2,2,'gfgfhsgrr','2016-04-28 16:23:32','0',1),(4,2,'shfhdhdseasfd','2016-04-28 16:29:21','ProjectManager1',1),(5,2,'Hey, man.  I need your help about my computer\'s problem. Can you get here to resolve it for me?','2016-04-29 15:04:38','ProjectManager1',1),(6,7,'Hey, man.  I need your help about this problem.','2016-04-29 15:38:23','Member1',1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
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
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `idNote` int(10) NOT NULL AUTO_INCREMENT,
  `N_Title` varchar(150) DEFAULT NULL,
  `N_Content` varchar(500) DEFAULT NULL,
  `N_DateCreate` date DEFAULT NULL,
  `N_DateUpdate` date DEFAULT NULL,
  `idEmployee` int(10) DEFAULT NULL,
  `idClient` int(10) DEFAULT NULL,
  `idAccount` int(10) NOT NULL,
  PRIMARY KEY (`idNote`),
  KEY `lnk_Note_Employee` (`idEmployee`),
  KEY `lnk_Note_Clients` (`idClient`),
  KEY `lnk_Note_users` (`idAccount`),
  CONSTRAINT `lnk_Note_users` FOREIGN KEY (`idAccount`) REFERENCES `users` (`idAccount`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,'My note','OKff','2016-04-28','2016-04-28',NULL,NULL,1),(2,'hgjg','ghjgh','2016-04-28','2016-04-28',NULL,NULL,1),(3,'dsfsdfsd','sdfsdfsdf','2016-04-28','2016-04-28',NULL,NULL,1),(4,'sdsdasd','sdfsdfasdas','2016-04-29','2016-04-29',NULL,NULL,2),(5,'fdfg','dfgdfg','2016-05-01','2016-05-01',NULL,NULL,1);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
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
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `idProject` int(10) NOT NULL AUTO_INCREMENT,
  `P_Name` varchar(50) DEFAULT NULL,
  `idPManager` int(10) DEFAULT NULL,
  `idTeamLeader` int(10) DEFAULT NULL,
  `idClient` int(10) DEFAULT NULL,
  `P_DateCreate` datetime DEFAULT NULL,
  `P_DateStart` date DEFAULT NULL,
  `P_Description` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `P_DateFinish` date DEFAULT NULL,
  `idPStatus` int(10) DEFAULT NULL,
  PRIMARY KEY (`idProject`),
  KEY `idPStatus` (`idPStatus`),
  KEY `idPManager` (`idPManager`),
  KEY `idTeamLeader` (`idTeamLeader`),
  KEY `idClient` (`idClient`),
  CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`idPStatus`) REFERENCES `projectstatus` (`idPStatus`),
  CONSTRAINT `Project_ibfk_2` FOREIGN KEY (`idPManager`) REFERENCES `employee` (`idEmployee`),
  CONSTRAINT `Project_ibfk_3` FOREIGN KEY (`idTeamLeader`) REFERENCES `employee` (`idEmployee`),
  CONSTRAINT `Project_ibfk_4` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (46,'Test1',1000000001,1100000004,4,'2016-04-22 08:48:55','2016-04-22',NULL,'2016-05-21',2),(47,'Test2',1000000001,1100000002,5,'2016-04-22 08:53:38','2016-04-22',NULL,'2016-05-20',1),(48,'Test',1000000001,1100000001,4,'2016-04-22 09:45:40','2016-04-30','This is about the project','2016-05-27',2),(49,'Test History OK',1000000001,1100000005,1,'2016-04-25 10:28:05','2016-04-27',NULL,'2016-05-27',1),(50,'Test History OK OK',1000000001,1100000005,1,'2016-04-25 10:32:59','2016-04-28',NULL,'2016-05-20',1),(51,'Test',1000000001,1100000003,1,'2016-04-25 10:48:27','2016-04-27',NULL,'2016-05-14',1),(52,'Test Test',1000000001,1100000001,4,'2016-04-25 10:51:55','2016-04-29',NULL,'2016-05-26',1),(53,'Test Real History',1000000001,1100000003,4,'2016-04-25 10:56:04','2016-04-28',NULL,'2016-05-27',1),(54,'Test OK',1000000001,1100000001,1,'2016-04-25 11:04:56','2016-04-30',NULL,'2016-05-27',1),(55,'History Project',1000000001,1100000002,1,'2016-04-25 11:09:26','2016-04-25',NULL,'2016-05-27',1),(56,'History Project Real',1000000001,1100000002,1,'2016-04-25 11:14:21','2016-04-29',NULL,'2016-05-27',1),(57,'Real Test History',1000000001,1100000001,1,'2016-04-25 11:19:07','2016-04-25',NULL,'2016-05-27',1),(58,'Real Test History History',1000000001,1100000002,1,'2016-04-25 11:20:25','2016-04-30',NULL,'2016-05-27',1),(59,'History Real Test',1000000001,1100000003,1,'2016-04-25 11:39:09','2016-04-25',NULL,'2016-05-27',1),(60,'Real Test History',1000000001,1100000001,1,'2016-04-25 11:43:34','2016-04-29',NULL,'2016-05-27',1),(61,'Real Test History History',1000000001,1100000003,1,'2016-04-25 11:44:21','2016-04-25',NULL,'2016-05-27',1),(62,'History',1000000001,1100000001,5,'2016-04-25 11:51:08','2016-04-27',NULL,'2016-05-27',1),(63,'Test',1000000001,1100000001,5,'2016-04-25 15:45:35','2016-04-27',NULL,'2016-05-27',1),(64,'Test History',1000000001,1100000001,1,'2016-04-25 15:47:09','2016-04-28',NULL,'2016-05-26',1),(65,'Test History',1000000001,1100000001,1,'2016-04-25 15:48:28','2016-04-25',NULL,'2016-05-26',1),(66,'Test History',1000000001,1100000002,1,'2016-04-25 15:49:21','2016-04-27',NULL,'2016-05-27',1),(67,'Test History',1000000001,1100000002,1,'2016-04-25 15:51:10','2016-04-28',NULL,'2016-05-27',1),(68,'Test History OK',1000000001,1100000002,5,'2016-04-25 15:56:34','2016-04-27',NULL,'2016-05-27',1),(69,'Test History',1000000001,1100000003,1,'2016-04-25 16:03:08','2016-04-27',NULL,'2016-05-27',1),(70,'Real Test History',1000000001,1100000003,1,'2016-04-25 16:10:41','2016-04-26',NULL,'2016-05-27',1),(71,'Real Test History',1000000001,1100000002,1,'2016-04-25 16:13:18','2016-04-27',NULL,'2016-05-27',1),(72,'Real Test History',1000000001,1100000001,2,'2016-04-25 16:15:33','2016-04-27',NULL,'2016-05-27',1),(73,'Real Test History',1000000001,1100000002,1,'2016-04-25 16:16:30','2016-04-27',NULL,'2016-05-19',1),(74,'Real Test History',1000000001,1100000004,1,'2016-04-25 16:30:24','2016-04-27',NULL,'2016-05-27',1),(75,'Real Test History',1000000001,1100000002,1,'2016-04-25 16:33:32','2016-04-27',NULL,'2016-05-19',1),(76,'fdsfsdf',1000000001,1300000002,3,'2016-04-25 16:39:21','2016-04-27',NULL,'2016-05-27',1),(77,'asdasd',1000000001,1100000002,4,'2016-04-25 16:44:11','2016-04-29',NULL,'2016-05-20',1),(78,'dfgdfgdfg',1000000001,1100000007,1,'2016-04-25 16:45:14','2016-04-26',NULL,'2016-05-27',1),(79,'OK',1000000002,1100000009,1,'2016-04-25 00:00:00','2016-04-28',NULL,'2016-05-20',1),(80,'Admin OK',1000000001,1100000002,1,'2016-04-25 00:00:00','2016-04-25',NULL,'2016-05-27',1),(81,'dfdfdf',1000000005,1100000031,1,'2016-04-25 00:00:00','2016-04-27',NULL,'2016-05-27',1),(82,'TestTestTestTestTestTestTestTestTestestTestTestTes',1000000001,1100000004,1,'2016-04-26 00:00:00','2016-04-28',NULL,'2016-05-20',1),(83,'OK',1000000001,1100000006,1,'2016-04-26 00:00:00','2016-04-27',NULL,'2016-05-28',2),(84,'OK',1000000002,1100000014,1,'2016-04-26 00:00:00','2016-04-27',NULL,'2016-05-20',2),(85,'Test',1000000002,1100000010,2,'2016-04-26 00:00:00','2016-04-26',NULL,'2016-05-26',2),(86,'fgfg',1000000002,1100000009,3,'2016-04-26 00:00:00','2016-04-26',NULL,'2016-05-26',2),(87,'ghjghj',1000000001,1100000006,1,'2016-04-26 00:00:00','2016-04-26',NULL,'2016-05-18',2),(88,'dsfsdfsdf',1000000005,1100000033,1,'2016-04-26 00:00:00','2016-04-26',NULL,'2016-05-25',2),(89,'fdgfg',1000000002,1100000008,1,'2016-04-26 00:00:00','2016-04-28',NULL,'2016-05-27',2),(90,'fdsgdfgdfg',1000000003,1100000017,1,'2016-04-26 00:00:00','2016-04-26',NULL,'2016-05-27',2),(91,'adfdf',1000000004,1100000026,1,'2016-04-26 00:00:00','2016-04-26',NULL,'2016-05-26',2),(92,'This is good project',1000000001,1100000004,1,'2016-05-02 00:00:00','2016-05-18',NULL,'2016-06-24',1),(93,'Project Test About',1000000002,1100000009,1,'2016-05-02 00:00:00','2016-05-02','Enter something about this project','2016-06-17',1),(94,'This is new good project',1000000001,1300000001,1,'2016-05-02 13:48:37','2016-05-09','This is really good project11','2016-06-16',2);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
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
-- Table structure for table `project_history`
--

DROP TABLE IF EXISTS `project_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_history` (
  `idProject_History` int(11) NOT NULL,
  `Content` varchar(45) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  PRIMARY KEY (`idProject_History`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_history`
--

LOCK TABLES `project_history` WRITE;
/*!40000 ALTER TABLE `project_history` DISABLE KEYS */;
INSERT INTO `project_history` VALUES (1,'OK','2016-04-14 13:07:30'),(2,'OK','2016-04-14 13:22:10'),(3,'OK','2016-04-14 13:40:45'),(4,'OK','2016-04-14 13:44:45'),(5,'OK','2016-04-14 13:49:29'),(6,'OK','2016-04-14 14:06:29'),(7,'OK','2016-04-14 14:08:02'),(8,'OK','2016-04-14 14:10:28'),(9,'OK','2016-04-14 14:15:59'),(10,'OK','2016-04-14 14:22:46'),(11,'OK','2016-04-14 14:26:04'),(12,'OK','2016-04-14 15:57:08'),(13,'OK','2016-04-14 15:57:30'),(14,'OK','2016-04-14 15:58:04'),(15,'OK','2016-04-19 14:57:40'),(16,'OK','2016-04-19 15:25:53'),(17,'OK','2016-04-19 15:26:40'),(18,'OK','2016-04-19 15:26:51'),(19,'OK','2016-04-19 15:29:18'),(20,'OK','2016-04-19 15:33:06'),(21,'OK','2016-04-21 15:38:43'),(22,'OK','2016-04-21 15:39:42'),(23,'OK','2016-04-21 15:41:28'),(24,'OK','2016-04-21 15:48:57'),(25,'OK','2016-04-21 15:58:02'),(26,'OK','2016-04-21 15:59:49'),(27,'OK','2016-04-21 16:04:38'),(28,'OK','2016-04-21 16:05:50'),(29,'OK','2016-04-21 16:05:59'),(30,'OK','2016-04-21 16:06:29'),(31,'OK','2016-04-21 16:06:57'),(32,'OK','2016-04-21 16:07:11'),(33,'OK','2016-04-21 16:07:30'),(34,'OK','2016-04-21 16:07:54'),(35,'OK','2016-04-21 16:08:20'),(36,'OK','2016-04-21 16:08:32'),(37,'OK','2016-04-21 16:08:39'),(38,'OK','2016-04-21 16:29:36'),(39,'OK','2016-04-21 16:44:54'),(40,'OK','2016-04-21 16:58:38'),(41,'OK','2016-04-21 16:58:56'),(42,'OK','2016-04-21 16:59:13'),(43,'OK','2016-04-21 17:13:45'),(44,'OK','2016-04-21 17:32:01'),(45,'OK','2016-04-22 08:17:57'),(46,'OK','2016-04-22 08:48:55'),(47,'OK','2016-04-22 08:53:38'),(48,'OK','2016-04-22 09:45:41'),(49,'OK','2016-04-25 10:28:05'),(50,'OK','2016-04-25 10:32:59'),(51,'OK','2016-04-25 10:48:27'),(52,'OK','2016-04-25 10:51:55'),(53,'OK','2016-04-25 10:56:04'),(54,'OK','2016-04-25 11:04:56'),(55,'OK','2016-04-25 11:09:26'),(56,'OK','2016-04-25 11:14:21'),(57,'OK','2016-04-25 11:19:07'),(58,'OK','2016-04-25 11:20:25'),(59,'OK','2016-04-25 11:39:09'),(60,'OK','2016-04-25 11:43:34'),(61,'OK','2016-04-25 11:44:21'),(62,'OK','2016-04-25 11:51:08'),(63,'OK','2016-04-25 15:45:35'),(64,'OK','2016-04-25 15:47:09'),(65,'OK','2016-04-25 15:48:28'),(66,'OK','2016-04-25 15:49:21'),(67,'OK','2016-04-25 15:51:10'),(68,'OK','2016-04-25 15:56:34'),(69,'OK','2016-04-25 16:03:08'),(70,'OK','2016-04-25 16:10:41'),(71,'OK','2016-04-25 16:13:18'),(72,'OK','2016-04-25 16:15:33'),(73,'OK','2016-04-25 16:16:30'),(74,'OK','2016-04-25 16:30:24'),(75,'OK','2016-04-25 16:33:32'),(76,'OK','2016-04-25 16:39:21'),(77,'OK','2016-04-25 16:44:11'),(78,'OK','2016-04-25 16:45:14'),(79,'OK','2016-04-25 17:01:06'),(80,'OK','2016-04-25 17:03:16'),(81,'OK','2016-04-25 17:04:38'),(82,'OK','2016-04-26 11:58:38'),(83,'OK','2016-04-26 13:07:05'),(84,'OK','2016-04-26 13:08:24'),(85,'OK','2016-04-26 13:10:28'),(86,'OK','2016-04-26 13:19:06'),(87,'OK','2016-04-26 13:20:21'),(88,'OK','2016-04-26 13:21:34'),(89,'OK','2016-04-26 13:22:27'),(90,'OK','2016-04-26 13:23:14'),(91,'OK','2016-04-26 13:26:42'),(92,'OK','2016-05-02 12:48:35'),(93,'OK','2016-05-02 13:37:48'),(94,'OK','2016-05-02 13:48:37');
/*!40000 ALTER TABLE `project_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectemployee`
--

DROP TABLE IF EXISTS `projectemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectemployee` (
  `idProject` int(10) NOT NULL,
  `idEmployee` int(10) NOT NULL,
  PRIMARY KEY (`idProject`,`idEmployee`),
  KEY `idEmployee` (`idEmployee`),
  CONSTRAINT `ProjectEmployee_ibfk_1` FOREIGN KEY (`idProject`) REFERENCES `project` (`idProject`),
  CONSTRAINT `ProjectEmployee_ibfk_2` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectemployee`
--

LOCK TABLES `projectemployee` WRITE;
/*!40000 ALTER TABLE `projectemployee` DISABLE KEYS */;
INSERT INTO `projectemployee` VALUES (46,1100000001),(46,1100000002),(46,1100000003),(47,1100000001),(47,1100000003),(48,1100000002),(48,1100000003),(49,1100000005),(49,1100000006),(49,1100000007),(50,1100000001),(50,1100000002),(50,1100000003),(50,1100000004),(51,1100000001),(51,1100000003),(52,1100000002),(52,1100000003),(53,1100000001),(53,1100000002),(54,1100000002),(54,1100000003),(55,1100000001),(55,1100000003),(56,1100000001),(56,1100000003),(57,1100000001),(57,1100000003),(58,1100000001),(58,1100000003),(59,1100000002),(60,1100000002),(60,1100000003),(61,1100000002),(62,1100000002),(63,1100000002),(63,1100000003),(64,1100000002),(64,1100000003),(65,1100000002),(65,1100000003),(66,1100000001),(66,1100000003),(67,1100000001),(67,1100000003),(68,1100000001),(68,1100000003),(69,1100000002),(69,1100000004),(70,1100000002),(70,1100000003),(71,1100000001),(71,1100000003),(72,1100000002),(72,1100000003),(73,1100000001),(73,1100000003),(74,1100000002),(74,1100000005),(75,1100000001),(75,1100000003),(76,1100000006),(76,1300000000),(77,1100000004),(77,1100000005),(78,1100000002),(78,1300000001),(79,1100000008),(79,1100000010),(80,1100000001),(80,1100000003),(81,1100000030),(81,1100000032),(82,1100000002),(82,1100000005),(83,1100000001),(83,1100000005),(84,1100000010),(84,1100000012),(85,1100000008),(85,1100000012),(85,1100000014),(86,1100000008),(86,1100000010),(87,1300000000),(87,1300000002),(88,1100000031),(88,1100000034),(89,1100000009),(89,1100000010),(90,1100000016),(90,1100000018),(91,1100000024),(91,1100000025),(92,1100000003),(92,1100000006),(93,1100000008),(93,1100000010),(94,1100000007),(94,1300000002);
/*!40000 ALTER TABLE `projectemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectstatus`
--

DROP TABLE IF EXISTS `projectstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectstatus` (
  `idPStatus` int(10) NOT NULL,
  `P_Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectstatus`
--

LOCK TABLES `projectstatus` WRITE;
/*!40000 ALTER TABLE `projectstatus` DISABLE KEYS */;
INSERT INTO `projectstatus` VALUES (1,'In progress'),(2,'Done');
/*!40000 ALTER TABLE `projectstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `idRequest` int(10) NOT NULL AUTO_INCREMENT,
  `idClient` int(10) DEFAULT NULL,
  `idEmployee2` int(10) DEFAULT NULL,
  `dateCreate` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `responseTime` datetime DEFAULT NULL,
  PRIMARY KEY (`idRequest`),
  KEY `lnk_Request_Clients` (`idClient`),
  KEY `lnk_Request_Employee` (`idEmployee2`),
  CONSTRAINT `lnk_Request_Clients` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lnk_Request_Employee` FOREIGN KEY (`idEmployee2`) REFERENCES `employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,1000000001,'2016-05-03 20:27:54',1,'2016-05-03 20:28:20');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requeste_e`
--

DROP TABLE IF EXISTS `requeste_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requeste_e` (
  `idRequestE_E` int(10) NOT NULL AUTO_INCREMENT,
  `idEmployee1` int(10) NOT NULL,
  `idEmployee2` int(10) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `responseTime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRequestE_E`),
  KEY `lnk_RequestE_E_Employee` (`idEmployee1`),
  KEY `lnk_RequestE_E_Employee_2` (`idEmployee2`),
  CONSTRAINT `lnk_RequestE_E_Employee` FOREIGN KEY (`idEmployee1`) REFERENCES `employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lnk_RequestE_E_Employee_2` FOREIGN KEY (`idEmployee2`) REFERENCES `employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requeste_e`
--

LOCK TABLES `requeste_e` WRITE;
/*!40000 ALTER TABLE `requeste_e` DISABLE KEYS */;
INSERT INTO `requeste_e` VALUES (1,1100000001,1000000001,'2016-04-26 09:25:46','2016-05-01 16:56:05',1),(2,1100000001,1000000001,'2016-04-26 09:28:15','2016-04-29 15:02:39',1),(3,1100000001,1000000003,'2016-04-26 09:28:33','2016-04-26 09:49:15',1),(4,1100000001,1000000002,'2016-04-26 09:30:54','2016-04-26 09:49:04',2),(5,1100000001,1000000004,'2016-04-26 09:33:44','2016-04-26 09:35:00',1),(6,1000000001,1100000030,'2016-05-01 13:07:46','2016-05-01 13:08:19',1),(7,1000000001,1000000003,'2016-05-01 15:58:23','2016-05-01 16:56:18',1);
/*!40000 ALTER TABLE `requeste_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `idRole` int(10) NOT NULL,
  `Role` varchar(25) DEFAULT NULL,
  `Note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator','This is Administrator'),(2,'Manager','This is Manager'),(3,'Leader','This is Leader'),(4,'Client','This is Client'),(5,'Member','This is Member'),(6,'Client Company','This is Company of Representative');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `idSkill` int(10) NOT NULL AUTO_INCREMENT,
  `Skill` varchar(50) DEFAULT NULL,
  `S_Note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSkill`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'JAVA','This is the technical for JAVA'),(2,'.NET','This is the technical for .NET'),(3,'Python','This is the technical for Python'),(4,'C#','This is the technical for C#');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skilldetail`
--

DROP TABLE IF EXISTS `skilldetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skilldetail` (
  `idEmployee` int(10) NOT NULL,
  `idSkill` int(10) NOT NULL,
  `S_Rate` int(5) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`,`idSkill`),
  KEY `idSkill` (`idSkill`),
  CONSTRAINT `SkillDetail_ibfk_1` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`),
  CONSTRAINT `SkillDetail_ibfk_2` FOREIGN KEY (`idSkill`) REFERENCES `skill` (`idSkill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skilldetail`
--

LOCK TABLES `skilldetail` WRITE;
/*!40000 ALTER TABLE `skilldetail` DISABLE KEYS */;
INSERT INTO `skilldetail` VALUES (1000000001,1,3),(1000000001,2,2),(1000000002,1,3),(1000000002,2,2),(1000000003,1,3),(1000000003,2,2),(1000000004,1,3),(1000000004,2,2),(1000000005,1,3),(1000000005,2,2),(1100000001,1,3),(1100000001,2,2),(1100000002,1,3),(1100000002,2,2),(1100000003,1,3),(1100000003,2,2),(1100000004,1,3),(1100000004,2,2),(1100000005,1,3),(1100000005,2,2),(1100000006,1,3),(1100000006,2,2),(1100000007,1,3),(1100000007,2,2),(1100000008,1,3),(1100000008,2,2),(1100000009,1,3),(1100000009,2,2),(1100000010,1,3),(1100000010,2,2),(1100000011,1,3),(1100000011,2,2),(1100000012,1,3),(1100000012,2,2),(1100000013,1,3),(1100000013,2,2),(1100000014,1,3),(1100000014,2,2),(1100000015,1,3),(1100000015,2,2),(1100000016,1,3),(1100000016,2,2),(1100000017,1,3),(1100000017,2,2),(1100000018,1,3),(1100000018,2,2),(1100000019,1,3),(1100000019,2,2),(1100000020,1,3),(1100000020,2,2),(1100000021,1,3),(1100000021,2,2),(1100000022,1,3),(1100000022,2,2),(1100000023,1,3),(1100000023,2,2),(1100000024,1,3),(1100000024,2,2),(1100000025,1,3),(1100000025,2,2),(1100000026,1,3),(1100000026,2,2),(1100000027,1,3),(1100000027,2,2),(1100000028,1,3),(1100000028,2,2),(1100000029,1,3),(1100000029,2,2),(1100000030,1,3),(1100000030,2,2),(1100000031,1,3),(1100000031,2,2),(1100000032,1,3),(1100000032,2,2),(1100000033,1,3),(1100000033,2,2),(1100000034,1,3),(1100000034,2,2),(1102365489,1,4),(1102365489,3,3),(1111112226,1,4),(1111112226,2,3),(1122335569,1,2),(1122335569,3,3);
/*!40000 ALTER TABLE `skilldetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `idTeam` int(10) NOT NULL,
  `TeamName` varchar(25) DEFAULT NULL,
  `idPManager` int(10) unsigned DEFAULT NULL,
  `T_Note` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idTeam`),
  KEY `idPManager` (`idPManager`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Team1',1000000001,NULL),(2,'Team2',1000000002,NULL),(3,'Team3',1000000003,NULL),(4,'Team4',1000000004,NULL),(5,'Team5',1000000005,NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teammember`
--

DROP TABLE IF EXISTS `teammember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teammember` (
  `idTeam` int(10) NOT NULL,
  `idMember` int(10) NOT NULL,
  PRIMARY KEY (`idTeam`,`idMember`),
  KEY `idMember` (`idMember`),
  CONSTRAINT `TeamMember_ibfk_1` FOREIGN KEY (`idTeam`) REFERENCES `team` (`idTeam`),
  CONSTRAINT `TeamMember_ibfk_2` FOREIGN KEY (`idMember`) REFERENCES `employee` (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teammember`
--

LOCK TABLES `teammember` WRITE;
/*!40000 ALTER TABLE `teammember` DISABLE KEYS */;
INSERT INTO `teammember` VALUES (1,1100000001),(1,1100000002),(1,1100000003),(1,1100000004),(1,1100000005),(1,1100000006),(1,1100000007),(1,1300000000),(1,1300000001),(1,1300000002),(2,1100000008),(2,1100000009),(2,1100000010),(2,1100000011),(2,1100000012),(2,1100000013),(2,1100000014),(2,1100000015),(2,1102365489),(2,1300000004),(2,1300000005),(2,1300000006),(3,1100000016),(3,1100000017),(3,1100000018),(3,1100000019),(3,1100000020),(3,1100000021),(3,1100000022),(3,1100000023),(3,1300000007),(3,1300000008),(4,1100000024),(4,1100000025),(4,1100000026),(4,1100000027),(4,1100000028),(4,1100000029),(4,1300000009),(5,1100000030),(5,1100000031),(5,1100000032),(5,1100000033),(5,1100000034);
/*!40000 ALTER TABLE `teammember` ENABLE KEYS */;
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
  CONSTRAINT `fk_users_1` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@enclave.vn','$2y$10$glV9.12rSlJhg6SRn2QFieI77bv8sxcDQY93sDmRt2lEyE0tUs2XS',1,'UB5D9EUUUI96YpAxsC13W9q0x53KfNn8fh8Oh4IL8ZBajfyhmnSt6kgiB1pc',NULL,NULL),(2,'projectmanager1@enclave.vn','$2y$10$rWly/v51PLv3sifFVqOnr.IDa2a2t2a5KKakUOy6sLLGYSb5JHXjO',2,'TDnu8SJkSm3b4zq87UnyM6K7k9e1HqM1pOOQ3SdZBrcI5wSSKpQ3Qr5kkuHS',NULL,NULL),(3,'projectmanager2@enclave.vn','$2y$10$UyNfOn/4DGNvNClnJkJyFeYR.D7727lo3qUgPW3bqA0geK.wFsNF6',2,'KHu7J34fZGLtTlnGafbDvOzfHeQbueAkzJmiReWXRF4FVz4rvJFarlHOk0Ee',NULL,NULL),(4,'projectmanager3@enclave.vn','$2y$10$0T17tiD6yhzU2QAvs5XQAOStrPJ8J/8broe7E6cwJFlSbnWCr4liq',2,'DWmxBDZtnSCmQaXptvNdZ7cDlrhPmmIPbeF0AM6tRJfRQ1OaRW1jhasC35Ki',NULL,NULL),(5,'projectmanager4@enclave.vn','$2y$10$XNL6m1MJtjEUDO7vPCSHBusIZ3untW/3/cwawc.dt6GytaVlJW.H6',2,'pWmrlUCA6psscIGz5CRmqhfnqRx8ZdwbpIvZ5ermY2OKd9fJP1gelp0T1oMQ',NULL,NULL),(6,'projectmanager5@enclave.vn','$2y$10$41W5CjRecVavkGLagF7VPuwJy91DK/FMZ6pYOAC4mGRLg9GVz.yha',2,'yQlzje4GAyjv54s8AjC2OVVdblo3iktFIIlQvUjUTayQWWa4PFvGiYUxxTZo',NULL,NULL),(7,'membem1@enclave.vn','$2y$10$0wuqptODjklbP7.8.GIhweigJOxwMaDtj2dvuRiPGShGXG0AgnNcW',5,'qfk7w5MDQYOfamU43qIjMCpKDlaBdlxgptpEUEynDzftK8vQzmsK0Q6kYOcj',NULL,NULL),(8,'membem2@enclave.vn','$2y$10$qNm3aX.JYGwFUs/jRJxljuxn9Xp6EkO/TfV6PZxVmFTHyF8SkOi0i',5,'CT3xg7kLviaA6MvdaniuoQqbP3N3ju7XkjrwOmzPAJaNi5CN6vilr7E2V2an',NULL,NULL),(9,'membem3@enclave.vn','$2y$10$R33q.lfDIURMMbshMWy.T.CrnKethzTnoQNKF.XqU7NiGeRnj0Hyu',5,'HDueFKqMpyx02w69WLIJLvrRM2tJF5whmHaYXrNo24fEGxFPyDqL1a0KrgHg',NULL,NULL),(10,'membem4@enclave.vn','$2y$10$Bkh8uelH/xrxBSxFz4ySl.sTKZ9loluEQIJAhtBU0aoKoUw2wkmB2',3,NULL,NULL,NULL),(11,'membem5@enclave.vn','$2y$10$WnjSfgIoKyxD/1D4XQLQK.tRGwEd3cWu8KwpFSVpBKv5pz/fOYnqC',5,NULL,NULL,NULL),(12,'membem6@enclave.vn','$2y$10$WpDau/K3Pjj0wyQdSAJ/7OjzyZGNozJXAb/Js1ocVMbu.urzLZruW',5,NULL,NULL,NULL),(13,'membem7@enclave.vn','$2y$10$00s6KhedvdHj.95dBDE5vuE2YUQez207Amhd2WaGRyGOIwhoWTu4S',5,'oPy9Q96BiGKhKDT6GemmrxA7p2nvXL5V69Bg11wBb8M82msnZwnWsy89prdu',NULL,NULL),(14,'membem8@enclave.vn','$2y$10$yJHJQgy/GJAQB9Mmn5e1Ne94A0WAwcItm3XQLWUzieGiI2f8CbT3C',5,NULL,NULL,NULL),(15,'membem9@enclave.vn','$2y$10$doB87NckrF27XjBeKfO1jeBlBg7dSlHm3YDUGROePCUc7iqpo4LWO',3,NULL,NULL,NULL),(16,'member10@enclave.vn','$2y$10$FMDObqy2CKw3R42bX.1NaOYpiLmT4OUDuPEIYdRpsSntkDhH0ER7m',5,NULL,NULL,NULL),(17,'member11@enclave.vn','$2y$10$WDT2Xe2BeavDwWej0eNMLOueZ6UR8cF8UPAzMuL8U9j9/aUFqQ3h6',5,NULL,NULL,NULL),(18,'member12@enclave.vn','$2y$10$Tahl1TKxfIG2JD0DrGW1Y.f0A3qMTTtwKrbgWvERDW9yTuaZicVHq',5,NULL,NULL,NULL),(19,'member13@enclave.vn','$2y$10$fAkQ2vBBf9oDeTZ.kRhm3OQgvcU65mnOAucTmT9xyg3JI7lc4XjYO',5,NULL,NULL,NULL),(20,'member14@enclave.vn','$2y$10$velsujLOg.S2mfI4KpLERux68wS.T9JygfIqVPvetjeEHPOTXzXaa',5,NULL,NULL,NULL),(21,'member15@enclave.vn','$2y$10$WpP8sEjaJq26KHm1Tn3vd.660iSffp5V6Kt9B3YTPyBsweKUjZ4ZK',5,NULL,NULL,NULL),(22,'member16@enclave.vn','$2y$10$NhJeCdy3/utOmt6ExlKYgOAsMUTJm2fty.1IrXN9quwoTvSb0tNU6',3,NULL,NULL,NULL),(23,'member17@enclave.vn','$2y$10$YJnlwzjfRXhPJ7a5kQbuBOTsFuJgaOMYkFKy30U9it/JZRia8zWym',5,NULL,NULL,NULL),(24,'member18@enclave.vn','$2y$10$7QbzPparQyg95MVmyKPG..T972ULeN9qe20BXOpCEl98i3q7hCnNy',5,NULL,NULL,NULL),(25,'member19@enclave.vn','$2y$10$me5P.8uzbrOidEKfZ2tMFeyh6D0aBrNWEQhKTSafAXd/Yn0YgxDuG',5,NULL,NULL,NULL),(26,'member20@enclave.vn','$2y$10$056gqNm5.5gxxQYTyE6uxuQddSEgJE5zuTbI3E04uzEHSdlfW/x8i',5,NULL,NULL,NULL),(27,'member21@enclave.vn','$2y$10$b0EDbaaa2IkhStAFtvchi.gmy9BcoKOQwoyE1A/bi9ChvkBYzAVdu',5,NULL,NULL,NULL),(28,'member22@enclave.vn','$2y$10$.SAl6FBRrWp4lhwpwR3o2uR4xWzeip7BUXJcMQLqB2hO6GLbp2/LK',5,NULL,NULL,NULL),(29,'member23@enclave.vn','$2y$10$avrbgayT91C51dwLLwFHsutFT/aI0AjbzW7SNuqcHmmM6DNkqCMeC',5,NULL,NULL,NULL),(30,'member24@enclave.vn','$2y$10$CeuWFVvclddDL.uwfLijiOsO69opniGjTE0P8Dy96oWI6tEu6RTpC',5,NULL,NULL,NULL),(31,'member25@enclave.vn','$2y$10$vuvnaOAdx0lHoJ.1hV.Bbu/QqxXSVf1xovul9olQ0UalVhHbVaKFK',3,NULL,NULL,NULL),(32,'member26@enclave.vn','$2y$10$B5cIXiNtlb2F5W.Fmm3qxeK7W13O8KNRqPPWnZs8Mv3.EgJhoKxvy',5,NULL,NULL,NULL),(33,'member27@enclave.vn','$2y$10$WYlLKcAleUfYKY70T3dUQ.0E9xonJpg4D2k5NLHh6BGwjDGhH7wW.',5,NULL,NULL,NULL),(34,'member28@enclave.vn','$2y$10$NwkR.J0z1ryBpBmksrmT.ehYl8wFXZeKthybgfUxKSq6qpN7G3WsC',5,NULL,NULL,NULL),(35,'member29@enclave.vn','$2y$10$ykyn3k2.IvQXg4JHRj7i3uVjssdPIGslYMNjDzppXOy5Ts6gq0vIW',5,NULL,NULL,NULL),(36,'member30@enclave.vn','$2y$10$VhWOFlLDXQL7oMOx0zrJ2OXzKOJwo47nuZvsef6POrJiIVbfw.u7i',3,NULL,NULL,NULL),(37,'member31@enclave.vn','$2y$10$GPRO0JSxEVWMfwf/NjgyTuBL4LIGt.etA9BJRNm8tqHQvFe5Gzm4G',5,NULL,NULL,NULL),(38,'member32@enclave.vn','$2y$10$GjkgJvR1L4LiDGk5jtZEN.LJ67q.hENM.eELMx7IQEjBcny3o3fui',5,NULL,NULL,NULL),(39,'member33@enclave.vn','$2y$10$dOMOJAWoVlLEPnyMr7gP9Oki7dJGCSpq5tpb63VbC5kEDX81gYnke',5,NULL,NULL,NULL),(40,'member34@enclave.vn','$2y$10$ch3dSQLLp2czrl59lvQrouHRbUwve8ogiZpC.wjlw2mrb8aPyURPG',3,NULL,NULL,NULL),(41,'client1@enclave.vn','$2y$10$TiOSwmCt6QHyidtQQbAQ0.pcrsZBbSUPH/BPov8CcvayaNv5qt4Y6',4,'rgeO0K9keOkIUUOWrrH0eNYFNYcMgU2bkVC8lu76QHaIKHxTPdhrZU3mdYgK',NULL,NULL),(42,'client2@enclave.vn','$2y$10$0GB9maO9hWfFPLfczNEwiumfhsyIUgSnqx4h1Yri3akjlenVU8yCa',4,NULL,NULL,NULL),(43,'client3@enclave.vn','$2y$10$pknsTIQhHn/bHW.HL1HMOuoOotLQX9FqkhECj.MWoCPGnW8h.K3dq',4,NULL,NULL,NULL),(44,'client4@enclave.vn','$2y$10$lQuDGPu6u5DtbvIl68IH6u2Vvvy/dxq7/TZ3zxgiSAvACldITkQvW',4,NULL,NULL,NULL),(45,'client5@enclave.vn','$2y$10$oRvZhFuXNmorQWupnX.dlO0ynUsOkscqLd2Mjxre/wjXsW.UD8QhG',4,NULL,NULL,NULL),(46,'member35@enclave.vn','$2y$10$9ns1USWkf/F1eosxOpEs3Omp9xSqmeK6BZBScWxrwgW/BtV4Q3gdO',5,'VgviYGYYqm7AKdToJOztlTc1OPLKkboA9Q1lOw7nm7j3ebYkTpUgz1VwrkMo',NULL,NULL),(47,'member36@enclave.vn','$2y$10$.olXRw2j6m0.iA9jpeepjOG0ffK1aN/ssSSMFLxcIudDeeh/.zMB2',5,NULL,NULL,NULL),(48,'member37@enclave.vn','$2y$10$p//W7OyskasWPswpZ7chx.qEkvTVllgcHuHMaC4jZKFrBC.aiV.hG',5,NULL,NULL,NULL),(49,'member38@enclave.vn','$2y$10$ciZdntFuxJzJ64QoJMQw4.HEGM8R.Uo06.2xEPFGKCl49AUuQpW4K',5,NULL,NULL,NULL),(50,'member39@enclave.vn','$2y$10$WwjIvYmOvrKtM5yMdeRBeOeNbxkJPkvC0p8bYIUj9Q0sMoaEW7b/i',5,'gbLnwcRJf09Bv4y7ihuTCWL2T7tniF23zwjl2GNuRnjetts8OpFJbAlmBxZm',NULL,NULL),(51,'member40@enclave.vn','$2y$10$8VTjKoBShySU3m/upC1lBebCYMGu/sJJcuaNLK0hcs3CYX9IvxirK',5,NULL,NULL,NULL),(52,'member41@enclave.vn','$2y$10$Ee8LgNAIJewJe6QRIDlRBu..1GtRt6Hlt15ynLGJTG7OhkpQb99YC',5,NULL,NULL,NULL),(53,'member42@enclave.vn','$2y$10$0S7O.37oBqg/Nzj/H5jjQujR9mAhmg2eAf7d1Cb5o15jgSADtVq9e',5,NULL,NULL,NULL),(54,'member43@enclave.vn','$2y$10$XNwTq8j2VVDBRfc0c562xu53vnvl7avA2b5jAptA.Qw/49R8g6Dya',5,NULL,NULL,NULL),(55,'member44@enclave.vn','$2y$10$/uy0v/4YgOu2xIIz0UqoJex39LehF0rBy9Izcan2Yxt.vNc/qZAHy',5,NULL,NULL,NULL),(56,'client_company@enclave.vn','$2y$10$6BB3tsVIc7tFKeIH791Ukuz2Cg/BsOymo2k8BEdP8JxH8tp2k33Ka',6,'7ZN2IWTii4CTjLL80HP8ovAaiUQchBOicpzJgNoClCGgZsmCXpRIBMpSsCmK',NULL,NULL),(57,'client_company2@enclave.vn','$2y$10$lFgzWcv7oKE5EXRL8ofpoOs/8j5ZC13vKjs8RdHUGupTK9HPghcfO',6,'CEHTJOgPl2xmJxDEBH035qeCAtY5TpJzMNROeYYGiR5tGhh9LlfpZ1maaFDm',NULL,NULL),(60,'clientcompanytest@us.vn','$2y$10$KH.Ntp2/G6IBHBD2dl.F8OtUNKWU0YajwO.v/OwbDsVh/2jWwyJgG',6,NULL,NULL,NULL),(64,'clientforcompanytest@enclave.us','$2y$10$CLPG2jjk8VMcgWL9LqpzxuUZraVywdxI/9/k.rwjD68TCelkFozbq',4,'haMV4YZWqC8kpXLUlGGzPDP7a6yX2glCN95ZIISpMWz0LPiUCXhG9T9A9RKi',NULL,NULL),(66,'memberfortest@enclave.vn','$2y$10$XOQ16Bz8LvPKolDZiST/IuaVYPK/thbCh5yIT13iY37DEDRieRKvy',5,NULL,NULL,NULL),(67,'memberfortestteam@enclave.vn','$2y$10$oP5sDRDmKfEt4/utFAYGF.G.kzq9NI9VCA2WjwI/Ue0kVkm9sg/Pe',5,NULL,NULL,NULL),(68,'dfgsdfg@gmail.com','$2y$10$2.rU5wT7RUtcBQio8k/n4egPJ8hRawYIN3f2PZAxvc1OIL8vpMqwi',5,NULL,NULL,NULL);
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

-- Dump completed on 2016-05-03 23:03:21
