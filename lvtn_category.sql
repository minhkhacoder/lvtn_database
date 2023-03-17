-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lvtn
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cat_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cat_parent` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('CAT01','Cycling',NULL),('CAT02','Golf',NULL),('CAT03','Running',NULL),('CAT04','Tennis',NULL),('CAT05','Swimming',NULL),('CAT06','Soccer',NULL),('CAT07','Football',NULL),('CAT08','Volleyball',NULL),('CAT09','Bikes','CAT01'),('CAT10','Glasses & Goggles','CAT01'),('CAT11','Accessories','CAT01'),('CAT12','Helmets','CAT01'),('CAT13','Golf Clubs','CAT02'),('CAT14','Golf Club Parts','CAT02'),('CAT15','Golf Balls','CAT02'),('CAT16','Gloves','CAT02'),('CAT17','Golf Carts','CAT02'),('CAT18','Headlamps','CAT03'),('CAT19','Waist Packs','CAT03'),('CAT20','Stopwatches','CAT03'),('CAT21','Activity Trackers','CAT03'),('CAT22','Accessories','CAT04'),('CAT23','Balls','CAT04'),('CAT24','Court Equipment','CAT04'),('CAT25','Racquets','CAT04'),('CAT26','Aquatic Gloves','CAT05'),('CAT27','Earplugs','CAT05'),('CAT28','Swim Caps','CAT05'),('CAT29','Swimwear','CAT05'),('CAT30','Balls','CAT06'),('CAT31','Footwear','CAT06'),('CAT32','Clothing','CAT06'),('CAT33','Player Equipment','CAT06'),('CAT34','Footballs','CAT07'),('CAT35','Gloves','CAT07'),('CAT36','Footwear','CAT07'),('CAT37','Protective Gear','CAT07'),('CAT38','Volleyballs','CAT08'),('CAT39','Court Equipment','CAT08'),('CAT40','Footwear','CAT08'),('CAT41','Protective Gear','CAT08');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 23:33:29
