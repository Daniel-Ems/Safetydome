-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: dflanagan
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `attack`
--

DROP TABLE IF EXISTS `attack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attack` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `speed` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attack`
--

LOCK TABLES `attack` WRITE;
/*!40000 ALTER TABLE `attack` DISABLE KEYS */;
INSERT INTO `attack` VALUES (1,'punch','Physical',15,15,'00:00:01'),(2,'kick','Physical',20,40,'00:00:01'),(3,'suplex','Physical',30,90,'00:00:04'),(4,'venom bite','Biological',5,55,'00:00:02'),(5,'loogie','Biological',10,230,'00:00:08'),(6,'disease','Biological',15,285,'00:00:10'),(7,'alpha particle','Radioactive',0,30,'00:00:01'),(8,'beta particle','Radioactive',0,90,'00:00:03'),(9,'gamma particle','Radioactive',0,150,'00:00:05'),(10,'acid spit','Chemical',60,90,'00:00:05'),(11,'lye vomit','Chemical',90,120,'00:00:07'),(12,'hydroxic acid','Chemical',120,150,'00:00:09'),(13,'buzz saw','Technological',60,60,'00:00:04'),(14,'laser','Technological',120,120,'00:00:08'),(15,'thermonuclear warhead','Technological',240,240,'00:00:16'),(16,'magic missle','Mystical',10,20,'00:00:01'),(17,'fireball','Mystical',40,80,'00:00:04'),(18,'lightning bolt','Mystical',80,160,'00:00:08'),(19,'pocket sand','Mineral',30,60,'00:00:03'),(20,'very small rocks','Mineral',5,85,'00:00:03'),(21,'rock smash','Mineral',0,90,'00:00:03'),(22,'crushing boredom','Mineral',30000,30000,'00:33:20'),(23,'explode','Physical',30,30,'00:00:02');
/*!40000 ALTER TABLE `attack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combatant`
--

DROP TABLE IF EXISTS `combatant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `combatant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `species_id` int(11) NOT NULL,
  `plus_atk` int(11) NOT NULL,
  `plus_dfn` int(11) NOT NULL,
  `plus_hp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combatant`
--

LOCK TABLES `combatant` WRITE;
/*!40000 ALTER TABLE `combatant` DISABLE KEYS */;
INSERT INTO `combatant` VALUES (1,'Person',1,0,0,0),(2,'Sneezy',2,0,0,0),(3,'Winner',3,0,0,0),(4,'Grumpy',4,0,0,0),(5,'Dopey',5,0,0,0),(6,'Happy',6,0,0,0),(7,'The Almighty Paradis',7,0,0,0),(8,'Doc',8,0,0,0),(9,'Sleepy',9,0,0,0),(10,'Death Incarnate',10,0,0,0),(11,'Toilet',11,0,0,0),(12,'Bashful',12,0,0,0),(13,'Your Mailman',13,0,0,0),(14,'No one',14,0,0,0);
/*!40000 ALTER TABLE `combatant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fight`
--

DROP TABLE IF EXISTS `fight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fight` (
  `combatant_one` int(11) NOT NULL,
  `combatant_two` int(11) NOT NULL,
  `winner_id` int(11) DEFAULT NULL,
  `start` datetime NOT NULL,
  `finish` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fight`
--

LOCK TABLES `fight` WRITE;
/*!40000 ALTER TABLE `fight` DISABLE KEYS */;
INSERT INTO `fight` VALUES (1,2,1,'2016-06-10 00:00:00','2016-06-10 00:00:09'),(1,3,3,'2016-06-10 00:00:00','2016-06-10 00:00:02'),(1,4,4,'2016-06-10 00:00:00','2016-06-10 00:00:11'),(1,5,1,'2016-06-10 00:00:00','2016-06-10 00:00:05'),(1,6,6,'2016-06-10 00:00:00','2016-06-10 00:00:14'),(1,7,1,'2016-06-10 00:00:00','2016-06-10 00:00:08'),(1,8,8,'2016-06-10 00:00:00','2016-06-10 00:00:02'),(1,9,1,'2016-06-10 00:00:00','2016-06-10 00:00:11');
/*!40000 ALTER TABLE `fight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `base_atk` int(11) NOT NULL,
  `base_dfn` int(11) NOT NULL,
  `base_hp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES (1,'human','Physical',100,100,100),(2,'zombie','Biological',50,110,140),(3,'mutant','Radioactive',110,140,50),(4,'ooze','Chemical',140,50,110),(5,'robot','Technological',50,140,110),(6,'wendigo','Mystical',140,110,50),(7,'xorn','Mineral',110,50,140),(8,'monkey','Physical',50,200,50),(9,'sentient offal','Biological',150,0,150),(10,'imaginary dragon','Radioactive',50,50,200),(11,'toxic revenger','Chemical',200,50,50),(12,'land mine','Technological',300,0,0),(13,'ghost','Mystical',150,150,0),(14,'large rock','Mineral',0,150,150);
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species_attack`
--

DROP TABLE IF EXISTS `species_attack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species_attack` (
  `species_id` int(11) NOT NULL,
  `attack_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species_attack`
--

LOCK TABLES `species_attack` WRITE;
/*!40000 ALTER TABLE `species_attack` DISABLE KEYS */;
INSERT INTO `species_attack` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(3,7),(3,8),(3,9),(4,10),(4,11),(4,12),(5,13),(5,14),(5,15),(6,16),(6,17),(6,18),(7,19),(7,20),(7,21),(8,1),(8,5),(8,19),(9,6),(9,11),(9,15),(11,4),(11,12),(11,13),(12,15),(12,23),(13,18),(13,7),(13,2),(14,22);
/*!40000 ALTER TABLE `species_attack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES ('Biological'),('Chemical'),('Mineral'),('Mystical'),('Physical'),('Radioactive'),('Technological');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-09  8:55:48
