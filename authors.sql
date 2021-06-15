-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_24
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

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
-- Table structure for table `authors`
--

USE Network;

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Mollie','Sanford','bsmitham@example.com','1974-02-24','1996-10-21 23:04:23'),(2,'Reece','O\'Connell','terry.wilfred@example.net','1996-01-15','1999-01-15 12:32:27'),(3,'Hannah','Franecki','gilda17@example.org','2008-09-25','2006-06-05 03:05:11'),(4,'Jalen','Mann','qtowne@example.org','2015-07-20','1972-03-16 06:03:15'),(5,'Hilma','Hessel','newton.kulas@example.com','1976-12-07','2001-03-20 06:11:09'),(6,'Christopher','Watsica','vgoyette@example.com','2000-06-29','2002-12-15 08:36:17'),(7,'Sonia','Schmitt','lnader@example.org','1979-03-25','2007-08-10 13:59:14'),(8,'Lucas','Schamberger','ilowe@example.net','2013-08-28','1997-04-04 04:13:16'),(9,'Katelynn','Kling','qkling@example.net','1992-02-26','2014-07-20 03:26:03'),(10,'Paxton','Kuhic','ardella83@example.com','1993-03-12','2010-11-19 03:18:11'),(11,'Savion','Ruecker','greenholt.valerie@example.com','2019-01-17','2002-06-20 14:19:54'),(12,'Dale','Douglas','parmstrong@example.org','1985-10-20','2008-04-25 20:34:15'),(13,'Emery','Corkery','gulgowski.kyler@example.net','1985-12-01','1991-10-27 19:00:19'),(14,'Margarita','Cronin','ansel.mosciski@example.org','1995-02-07','1981-10-30 18:48:19'),(15,'Baby','Becker','cschaden@example.net','1999-06-10','1987-04-02 01:08:28'),(16,'Abe','Russel','yost.liana@example.org','2019-12-21','1972-05-31 02:30:39'),(17,'Nichole','Conroy','kvonrueden@example.net','1978-09-02','1997-06-04 14:02:01'),(18,'Cortney','Skiles','morar.marcelo@example.net','2008-02-13','1972-09-16 11:02:14'),(19,'Jon','Koch','uswift@example.com','2006-04-03','2015-05-27 09:49:48'),(20,'Leland','Torp','vbatz@example.com','2000-09-09','2015-04-04 05:18:23'),(21,'Armani','Quitzon','bode.tony@example.org','1994-08-06','1973-11-29 14:20:20'),(22,'Jaqueline','Bahringer','camylle.kuhn@example.com','2010-03-01','2008-06-16 23:25:18'),(23,'Verona','Hessel','graciela.gerhold@example.net','2006-05-23','1975-02-20 19:00:04'),(24,'Josefina','Powlowski','rcruickshank@example.com','1986-05-10','2013-01-18 02:27:19'),(25,'Harmon','Murray','ralph.schmidt@example.net','1986-12-09','1985-07-11 10:09:31'),(26,'Dorothy','Langworth','victor98@example.com','2006-08-15','2007-09-03 23:47:42'),(27,'Maria','Ortiz','dmills@example.com','2015-09-06','2010-03-07 03:52:34'),(28,'Susan','Hessel','brenden57@example.net','1975-11-29','2018-09-26 21:57:25'),(29,'Axel','Quitzon','ykris@example.org','1981-12-28','1996-04-02 21:34:37'),(30,'Jack','Beahan','yfritsch@example.org','1983-01-17','2003-10-06 11:16:50');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 13:05:18
