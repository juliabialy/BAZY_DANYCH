-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hurtownia
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `hurtownia`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hurtownia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `hurtownia`;

--
-- Table structure for table `archiwum`
--

DROP TABLE IF EXISTS `archiwum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archiwum` (
  `id_towaru` int(11) DEFAULT NULL,
  `nazwa_towaru` varchar(30) DEFAULT NULL,
  `cena` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archiwum`
--

LOCK TABLES `archiwum` WRITE;
/*!40000 ALTER TABLE `archiwum` DISABLE KEYS */;
/*!40000 ALTER TABLE `archiwum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klient` (
  `id_klienta` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(25) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
INSERT INTO `klient` VALUES (1,'Jan','Nowak'),(2,'Marta','Wojcik'),(3,'Anna','Krawczyk'),(4,'Janusz','Jasiak');
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towar`
--

DROP TABLE IF EXISTS `towar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towar` (
  `id_towaru` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(30) NOT NULL,
  `producent` varchar(15) DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `cena` float DEFAULT NULL,
  `poprzednia_cena` float DEFAULT NULL,
  PRIMARY KEY (`id_towaru`),
  UNIQUE KEY `nazwa` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towar`
--

LOCK TABLES `towar` WRITE;
/*!40000 ALTER TABLE `towar` DISABLE KEYS */;
INSERT INTO `towar` VALUES (1,'czujnik ruchu','Tech',15,45.6,NULL),(2,'czujnik ruchu 2','Tech',2,50,NULL),(3,'gniazdko podwojne','Polmark',10,29.8,NULL),(4,'gniazdko potrojne','Polmark',11,21.5,NULL);
/*!40000 ALTER TABLE `towar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zamowienia`
--

DROP TABLE IF EXISTS `zamowienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT,
  `id_klienta` int(11) DEFAULT NULL,
  `id_towaru` int(11) DEFAULT NULL,
  `liczbasztuk` int(11) DEFAULT NULL,
  `datazlozenia` date DEFAULT NULL,
  `datarealizacji` date DEFAULT NULL,
  PRIMARY KEY (`id_zamowienia`),
  KEY `id_klienta` (`id_klienta`),
  KEY `id_towaru` (`id_towaru`),
  CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klient` (`id_klienta`),
  CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`id_towaru`) REFERENCES `towar` (`id_towaru`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zamowienia`
--

LOCK TABLES `zamowienia` WRITE;
/*!40000 ALTER TABLE `zamowienia` DISABLE KEYS */;
INSERT INTO `zamowienia` VALUES (1,1,1,2,'2023-10-14','2023-10-16'),(2,1,3,4,'2023-10-15','2023-10-18'),(3,2,1,6,'2023-11-23','2023-11-26'),(4,3,3,3,'2024-01-23','2024-01-26'),(5,2,1,6,'2024-02-23','2024-02-26');
/*!40000 ALTER TABLE `zamowienia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-08 22:36:22
