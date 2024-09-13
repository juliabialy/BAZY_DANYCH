-- MySQL dump 10.16  Distrib 10.1.8-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: panstwa
-- ------------------------------------------------------
-- Server version	10.1.8-MariaDB

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
-- Current Database: `panstwa`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `panstwa` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `panstwa`;

--
-- Table structure for table `jezyk`

DROP TABLE IF EXISTS `panstwa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panstwa` (
  `IdPanstwa` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` nvarchar(25) DEFAULT NULL,
  `Populacja` int(11) DEFAULT NULL,
  `Kontynent` nvarchar(40) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `Powierzchnia` int(11) DEFAULT NULL,
  `Stolica` varchar(25) DEFAULT NULL,
  `SredniaDlugoscZycia` float DEFAULT NULL,
  PRIMARY KEY (`IdPanstwa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
--


--
-- Dumping data for table `panstwa`
--

LOCK TABLES `panstwa` WRITE;
/*!40000 ALTER TABLE `panstwa` DISABLE KEYS */;
INSERT INTO `panstwa` VALUES (1,'Polska',38483957,'Europa','Środkowa Europa',312679,'Warszawa',76.8),(2,'Jamajka',2889187,'Ameryka Północna','Ameryka Środkowa',10991,'Kingston',73.28),(3,'Niemcy',81083600,'Europa','Europa Zachodnia',357340,'Berlin',80.89),(4,'Australia',23581000,'Australia i Oceania','Australia',7686850,'Canberra',82.1);
/*!40000 ALTER TABLE `panstwa` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `jezyk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jezyk` (
  `IdPanstwa` int(11) DEFAULT NULL,
  `Nazwa` varchar(25) DEFAULT NULL,
  `CzyOficjalny` bit(1) NOT NULL,
  `Procent` int(11) DEFAULT NULL,
  KEY `IdPanstwa` (`IdPanstwa`),
  CONSTRAINT `jezyk_ibfk_1` FOREIGN KEY (`IdPanstwa`) REFERENCES `panstwa` (`IdPanstwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jezyk`
--

INSERT INTO `jezyk` VALUES (1,'polski',1,97),(1,'angielski',0,1);

--
-- Table structure for table `miasta`
--

DROP TABLE IF EXISTS `miasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miasta` (
  `IdMiasta` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` nvarchar(25) DEFAULT NULL,
  `Populacja` int(11) DEFAULT NULL,
  `Wojewodztwo` nvarchar(25) DEFAULT NULL,
  `IdPanstwa` int(11) DEFAULT NULL,
  `PrawaMiejskie` date DEFAULT NULL,
  PRIMARY KEY (`IdMiasta`),
  KEY `IdPanstwa` (`IdPanstwa`),
  CONSTRAINT `miasta_ibfk_1` FOREIGN KEY (`IdPanstwa`) REFERENCES `panstwa` (`IdPanstwa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miasta`
--

LOCK TABLES `miasta` WRITE;
/*!40000 ALTER TABLE `miasta` DISABLE KEYS */;
INSERT INTO `miasta` VALUES (1,'Tarnów',111376,'Małopolskie',1,'1330-03-07'),(2,'Kraków',761873,'Małopolskie',1,'1228-01-01'),(3,'Zakopane',27556,'Małopolskie',1,'1933-01-01'),(4,'Bochnia',30176,'Małopolskie',1,'1253-02-27'),(5,'Chrzanów',38989,'Małopolskie',1,'1350-01-01'),(6,'Czchów',2376,'Małopolskie',1,'1333-01-01');
/*!40000 ALTER TABLE `miasta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panstwa`
--




/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-15  9:46:49
