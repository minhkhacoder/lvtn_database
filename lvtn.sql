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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `acc_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_phone` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_role` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`acc_id`),
  UNIQUE KEY `acc_phone` (`acc_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('ACC02','(086) 911-7530','7c222fb2927d828af22f592134e8932480637c0d','seller'),('ACC03','(032) 911-0540','239efe1121fa4e5483abfb2882a6b17eb2100c3a','user'),('ACC04','(034) 598-7377','7c222fb2927d828af22f592134e8932480637c0d','user'),('ACC05','(086) 985-6321','7c222fb2927d828af22f592134e8932480637c0d','user');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `bra_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bra_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bra_id`),
  UNIQUE KEY `bra_name` (`bra_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES ('BRA30','6KU'),('BRA09','adidas'),('BRA02','AliveCor'),('BRA17','ALLPAIPAI'),('BRA14','Amazfit'),('BRA21','Arena'),('BRA33','‎BV'),('BRA08','Callaway'),('BRA15','Carhartt'),('BRA28','Champion'),('BRA31','Cool Change'),('BRA01','Dickies'),('BRA12','Fitbit'),('BRA23','Franklin Sports'),('BRA10','Gold Toe'),('BRA03','Hanes'),('BRA19','KNIPEX'),('BRA32','Malsooa'),('BRA06','Master Lock'),('BRA35','‎Mirrycle'),('BRA05','Nike'),('BRA22','NuLink'),('BRA36','‎‎Panther Vision'),('BRA16','PENN'),('BRA04','PUMA'),('BRA34','‎Schwinn'),('BRA25','Sena'),('BRA24','Shock Doctor'),('BRA11','Speedo'),('BRA20','STEARNS'),('BRA07','Thermajohn'),('BRA18','TYR'),('BRA29','Unicycles'),('BRA27','Wilson'),('BRA26','YANYODO');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_brand_insert` BEFORE INSERT ON `brand` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('BRA', LPAD(COALESCE(MAX(SUBSTR(bra_id, 4)), 0) + 1, 2, '0')) FROM brand);
  
  WHILE (SELECT COUNT(*) FROM brand WHERE bra_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('BRA', LPAD(COALESCE(MAX(SUBSTR(bra_id, 4)), 0) + 1, 2, '0')) FROM brand);
  END WHILE;
  
  SET NEW.bra_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  PRIMARY KEY (`cat_id`),
  FULLTEXT KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('CAT01','Cycling',NULL),('CAT02','Golf',NULL),('CAT03','Running',NULL),('CAT04','Tennis',NULL),('CAT05','Swimming',NULL),('CAT06','Soccer',NULL),('CAT07','Football',NULL),('CAT08','Volleyball',NULL),('CAT09','Bikes','CAT01'),('CAT10','Glasses & Goggles','CAT01'),('CAT11','Bike Accessories','CAT01'),('CAT12','Helmets','CAT01'),('CAT13','Golf Clubs','CAT02'),('CAT14','Golf Club Parts','CAT02'),('CAT15','Golf Balls','CAT02'),('CAT16','Golf Gloves','CAT02'),('CAT17','Golf Carts','CAT02'),('CAT18','Headlamps','CAT03'),('CAT19','Waist Packs','CAT03'),('CAT20','Stopwatches','CAT03'),('CAT21','Activity Trackers','CAT03'),('CAT22','Tennis Accessories','CAT04'),('CAT23','Tennis Balls','CAT04'),('CAT24','Court Equipment','CAT04'),('CAT25','Racquets','CAT04'),('CAT26','Aquatic Gloves','CAT05'),('CAT27','Earplugs','CAT05'),('CAT28','Swim Caps','CAT05'),('CAT29','Swimwear','CAT05'),('CAT30','Soccer Balls','CAT06'),('CAT31','Footwear','CAT06'),('CAT32','Clothing','CAT06'),('CAT33','Player Equipment','CAT06'),('CAT34','Footballs','CAT07'),('CAT35','Football Gloves','CAT07'),('CAT36','Footwear','CAT07'),('CAT37','Protective Gear','CAT07'),('CAT38','Volleyballs','CAT08'),('CAT39','Court Equipment','CAT08'),('CAT40','Footwear','CAT08'),('CAT41','Protective Gear','CAT08');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classify`
--

DROP TABLE IF EXISTS `classify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classify` (
  `cla_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pro_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cla_group` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cla_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cla_id`),
  KEY `fk_cla_pro` (`pro_id`),
  CONSTRAINT `fk_cla_pro` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classify`
--

LOCK TABLES `classify` WRITE;
/*!40000 ALTER TABLE `classify` DISABLE KEYS */;
INSERT INTO `classify` VALUES ('CLA01','PRO01','Color','White'),('CLA02','PRO02','Color','Black'),('CLA03','PRO03','Color','Polar'),('CLA04','PRO04','Color','Flame Orange'),('CLA05','PRO05','Color','Green'),('CLA06','PRO05','Lens Coating','UV Protection Coating'),('CLA07','PRO06','Color','Navy Blue'),('CLA08','PRO06','Lens Coating','UV Protection Coating'),('CLA09','PRO07','Color','Black'),('CLA10','PRO08','Color','Yellow'),('CLA11','PRO09','Color','Black'),('CLA12','PRO09','Maximum','120 Pound per Square Inch'),('CLA16','PRO12','Color','Blue'),('CLA17','PRO12','Age Range','Infant'),('CLA18','PRO12','Size','X-Small/44-50cm'),('CLA19','PRO13','Color','Gray'),('CLA20','PRO14','Color','Black');
/*!40000 ALTER TABLE `classify` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_classify_insert` BEFORE INSERT ON `classify` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('CLA', LPAD(COALESCE(MAX(SUBSTR(cla_id, 4)), 0) + 1, 2, '0')) FROM classify);
  
  WHILE (SELECT COUNT(*) FROM classify WHERE cla_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('PRO', LPAD(COALESCE(MAX(SUBSTR(cla_id, 4)), 0) + 1, 2, '0')) FROM classify);
  END WHILE;
  
  SET NEW.cla_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cus_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cus_userName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cus_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cus_gender` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cus_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cus_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cus_id`),
  KEY `fk_cus_acc` (`acc_id`),
  CONSTRAINT `fk_cus_acc` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('CUS02','ACC02','kha27','kha@gmail.com','','123, Can Tho city','https://drive.google.com/uc?export=view&id=1jBn2U0Uv0YQOe9B-5EDHRt3-darbEFx_'),('CUS03','ACC03','minhkha12','kha@gmail.com','Nam','',NULL),('CUS04','ACC04','minhkha','minhkha@gmail.com','Male','Hung Loi Ward, Ninh Kieu Dist, Can Tho City','https://drive.google.com/uc?export=view&id=1Jio5jbHo_fb6Eykb2dydXnkJDWPXZroG'),('CUS05','ACC05','kha123','kha123@gmail.com','Male','500 Pennsylvania Avenue NW, Washington, DC 20500, USA','https://drive.google.com/uc?export=view&id=16iMsGN1mjIwy1LVq3sPToVFtWGP6LMS7');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `img_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pro_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `img_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`img_url`),
  KEY `fk_img_pro` (`pro_id`),
  CONSTRAINT `fk_img_pro` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('https://drive.google.com/uc?export=view&id=1-1-LSYKB9y5eVbvQkLGncB87-SLtr_6P','PRO07','Master Lock Bike Lock Cable 02.jpg'),('https://drive.google.com/uc?export=view&id=10lnXBSiX10x0qzicgg5Y07fVLHd3Cz5f','PRO01','WILSON AVP Soft Play Volleyball 3.jpg'),('https://drive.google.com/uc?export=view&id=10VVvUhBXPY_yhb1CWGoFxb-r-p2otYi4','PRO12','Schwinn Classic Toddler and Baby Bike Helmet 02.jpg'),('https://drive.google.com/uc?export=view&id=11Z5_rhD6jBt-3UBbMFsLDpiNw8aYw1K7','PRO09','Schwinn Air Base Plus Bike Foot Pump Black,one-Size 04.jpg'),('https://drive.google.com/uc?export=view&id=12oGK72yNGDQNIVE_pDVKuB56HkbmAfMH','PRO07','Master Lock Bike Lock Cable 01.jpg'),('https://drive.google.com/uc?export=view&id=13A4_y2nitU5X1M7ortIUqXlawtuEabNS','PRO08','BV Bicycle Pump Durable Steel Bike 03.jpg'),('https://drive.google.com/uc?export=view&id=15QquJiDuBPJ6h2aq2vl0YgZ4Muy3SPYG','PRO06','Zdatt Cycling Glasses Polarized Sunglasses 01.jpg'),('https://drive.google.com/uc?export=view&id=16C_IFRSstic4_j5pvLi0O3gfZCV91KvF','PRO08','BV Bicycle Pump Durable Steel Bike 02.jpg'),('https://drive.google.com/uc?export=view&id=19fY_KvycBqTVl4FGy5uhX-s2RcSlwlZ4','PRO02','Fun 20 Inch Wheel Unicycle with Alloy Rim 02.jpg'),('https://drive.google.com/uc?export=view&id=1amcFINGNXEIDAxNCw9Ieb3B1pJFRwx5g','PRO03','6KU Track Fixed Gear Bicycle.jpg'),('https://drive.google.com/uc?export=view&id=1cBUooQ8Z8xyV2Z97XAMQkFdRevq2gayW','PRO13','Panther Vision POWERCAP 3.0 USB Rechargeable Headlamp LED Beanie Ultra 02.jpg'),('https://drive.google.com/uc?export=view&id=1F197YIQAXp61tkhtArRQYNCHiCoGUpXr','PRO06','Zdatt Cycling Glasses Polarized Sunglasses 02.jpg'),('https://drive.google.com/uc?export=view&id=1go5UnL7KXYS9XJH_xqR3GbDTfOCHYpq3','PRO14','Mirrycle MTB Bar End Mountain Bicycle Mirror , Black 03.jpg'),('https://drive.google.com/uc?export=view&id=1j1FCtjOtnr3iD6neMxX1Sxor9f6X_8qi','PRO12','Schwinn Classic Toddler and Baby Bike Helmet 01.jpg'),('https://drive.google.com/uc?export=view&id=1Jz2TLDozHZHuP9rNahwQ46C4prsmKQwj','PRO08','BV Bicycle Pump Durable Steel Bike 04.jpg'),('https://drive.google.com/uc?export=view&id=1MJM_ow3DpfXQhBuwhqt744fgueajM7Ry','PRO13','Panther Vision POWERCAP 3.0 USB Rechargeable Headlamp LED Beanie Ultra 04.jpg'),('https://drive.google.com/uc?export=view&id=1mSW9zn-XfNpAILSSUTgZdYJIH7TjtN4l','PRO09','Schwinn Air Base Plus Bike Foot Pump Black,one-Size 01.jpg'),('https://drive.google.com/uc?export=view&id=1Nj0GNNXohwH_eM9PIRSIrvEoSvVNAURo','PRO08','BV Bicycle Pump Durable Steel Bike 01.jpg'),('https://drive.google.com/uc?export=view&id=1oPkizcVNUc1IHLwGmlFxeVSptDfEB-U8','PRO02','Fun 20 Inch Wheel Unicycle with Alloy Rim 01.jpg'),('https://drive.google.com/uc?export=view&id=1OZ_C_gjGXSdNzk7mmQN9MpP-Yhtd5Goj','PRO12','Schwinn Classic Toddler and Baby Bike Helmet 03.jpg'),('https://drive.google.com/uc?export=view&id=1q8E5yUdCY74TQQyb3UYku__8xPz6FfRQ','PRO12','Schwinn Classic Toddler and Baby Bike Helmet 04.jpg'),('https://drive.google.com/uc?export=view&id=1qN4GCJDlNuMRukKE2QxVuecZlEKu31Nv','PRO04','CoolChange Polarized Cycling Sunglasses Full Screen 03.jpg'),('https://drive.google.com/uc?export=view&id=1qrqYWthO1zHoAgguVmnXZx4sWx246_sv','PRO14','Mirrycle MTB Bar End Mountain Bicycle Mirror , Black 04.jpg'),('https://drive.google.com/uc?export=view&id=1SMTmEw6ZBH0Lx0i6YyBgbgHZrR5oILwT','PRO01','WILSON AVP Soft Play Volleyball 1.jpg'),('https://drive.google.com/uc?export=view&id=1TbgHxAe4zz6Uf3ncOdlM2akd7ms4bFIv','PRO01','WILSON AVP Soft Play Volleyball 2.jpg'),('https://drive.google.com/uc?export=view&id=1tldyLnYmrD3wHczOiapAmbT2J8a6Xo_i','PRO06','Zdatt Cycling Glasses Polarized Sunglasses 03.jpg'),('https://drive.google.com/uc?export=view&id=1TNndB6V0ONErtUFzyo-lQ_Y5v0_EswdB','PRO03','6KU Track Fixed Gear Bicycle 02.jpg'),('https://drive.google.com/uc?export=view&id=1U5nvA2Y1gwMlSXymUsF27dJUlbVGDRGY','PRO09','Schwinn Air Base Plus Bike Foot Pump Black,one-Size 02.jpg'),('https://drive.google.com/uc?export=view&id=1vYdFSBdTjygBLDy63FHgRaLXmr_l8RNH','PRO13','Panther Vision POWERCAP 3.0 USB Rechargeable Headlamp LED Beanie Ultra 01.jpg'),('https://drive.google.com/uc?export=view&id=1Wl5JUqLX8Txg86AzOkksHJM_4p4coFM3','PRO07','Master Lock Bike Lock Cable 03.jpg'),('https://drive.google.com/uc?export=view&id=1Wt2hWHz9odAPLTcbXrMdPJr-HNevQSsR','PRO05','Malsooa Cycling Sunglasses Men glasses Sports 01.jpg'),('https://drive.google.com/uc?export=view&id=1xDk-UunngIppXBvNznPt4d-xdo0-ga9c','PRO03','6KU Track Fixed Gear Bicycle 04.jpg'),('https://drive.google.com/uc?export=view&id=1xpVdF9W6QdP8JmMrqGDoVYWBOwm08KNx','PRO14','Mirrycle MTB Bar End Mountain Bicycle Mirror , Black 02.jpg'),('https://drive.google.com/uc?export=view&id=1XSbQeq5kYR4mqRQDa3UNQr2Xvte5G25e','PRO04','CoolChange Polarized Cycling Sunglasses Full Screen.jpg'),('https://drive.google.com/uc?export=view&id=1XVrRN6aOsxmXxNRTN8TMvAN-h4Q1zDc1','PRO01','WILSON AVP Soft Play Volleyball 4.jpg'),('https://drive.google.com/uc?export=view&id=1Z-BT2r61sb-KY1loWbcMf2HVFAMSyv2C','PRO13','Panther Vision POWERCAP 3.0 USB Rechargeable Headlamp LED Beanie Ultra 03.jpg'),('https://drive.google.com/uc?export=view&id=1zHlAV5aOodL0r_riNF6PAJ0qMr8-AfYl','PRO14','Mirrycle MTB Bar End Mountain Bicycle Mirror , Black 01.jpg'),('https://drive.google.com/uc?export=view&id=1ZOzP-JyGYSda5tzlKDIjh_85RhdQvV1J','PRO03','6KU Track Fixed Gear Bicycle 03.jpg'),('https://drive.google.com/uc?export=view&id=1zrUyso42pziTXemCK6UcDE-S3GZCDpV6','PRO04','CoolChange Polarized Cycling Sunglasses Full Screen 02.jpg'),('https://drive.google.com/uc?export=view&id=1zxaI8f-f8dz9ZePR2Zv436YhYdeUfC3H','PRO09','Schwinn Air Base Plus Bike Foot Pump Black,one-Size 03.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `ordt_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pro_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `or_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ordt_quantity` int DEFAULT '1',
  `ordt_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`ordt_id`),
  KEY `fk_ordt_or` (`or_id`),
  KEY `fk_ordt_pro` (`pro_id`),
  CONSTRAINT `fk_ordt_or` FOREIGN KEY (`or_id`) REFERENCES `orders` (`or_id`),
  CONSTRAINT `fk_ordt_pro` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES ('ORDT01','PRO01','OR01',1,16.95),('ORDT03','PRO08','OR03',1,34.19),('ORDT04','PRO04','OR04',1,99.99),('ORDT05','PRO01','OR04',1,16.95),('ORDT06','PRO14','OR04',1,18.85),('ORDT07','PRO13','OR05',1,28.65),('ORDT08','PRO12','OR06',1,17.89),('ORDT09','PRO03','OR07',1,179.98),('ORDT10','PRO01','OR08',1,16.95),('ORDT11','PRO01','OR08',1,16.95);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_order_detail_insert` BEFORE INSERT ON `orderdetail` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('ORDT', LPAD(COALESCE(MAX(SUBSTR(ordt_id, 5)), 0) + 1, 2, '0')) FROM orderdetail);
  
  WHILE (SELECT COUNT(*) FROM orderdetail WHERE ordt_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('ORDT', LPAD(COALESCE(MAX(SUBSTR(ordt_id, 5)), 0) + 1, 2, '0')) FROM orderdetail);
  END WHILE;
  
  SET NEW.ordt_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `or_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ship_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pay_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `or_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `or_status` int DEFAULT '0',
  `or_createdAt` datetime DEFAULT NULL,
  `or_updateAt` datetime DEFAULT NULL,
  PRIMARY KEY (`or_id`),
  KEY `fk_or_acc` (`acc_id`),
  KEY `fk_or_ship` (`ship_id`),
  KEY `fk_or_pay` (`pay_id`),
  CONSTRAINT `fk_or_acc` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`),
  CONSTRAINT `fk_or_pay` FOREIGN KEY (`pay_id`) REFERENCES `payment` (`pay_id`),
  CONSTRAINT `fk_or_ship` FOREIGN KEY (`ship_id`) REFERENCES `shipping` (`ship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('OR01','ACC05','SHIP01','PAY01','1600 Pennsylvania Avenue NW, Washington, DC 20500, USA',0,'2023-03-25 13:03:07',NULL),('OR03','ACC05','SHIP02','PAY01','1600 Pennsylvania Avenue NW, Washington, DC 20500, USA',0,'2023-03-27 20:55:49',NULL),('OR04','ACC05','SHIP01','PAY01','1600 Pennsylvania Avenue NW, Washington, DC 20500, USA',0,'2023-03-27 21:13:57',NULL),('OR05','ACC05','SHIP01','PAY01','1600 Pennsylvania Avenue NW, Washington, DC 20500, USA',0,'2023-03-27 21:22:30',NULL),('OR06','ACC04','SHIP02','PAY02','1600 Pennsylvania Avenue NW, Washington, DC 20500, USA',0,'2023-03-27 21:29:09',NULL),('OR07','ACC04','SHIP01','PAY02','1600 Pennsylvania Avenue NW, Washington, DC 20500, USA',0,'2023-03-28 19:58:27',NULL),('OR08','ACC05','SHIP01','PAY01','500 Pennsylvania Avenue NW, Washington, DC 20500, USA',0,'2023-04-08 03:06:01',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_orders_insert` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('OR', LPAD(COALESCE(MAX(SUBSTR(or_id, 3)), 0) + 1, 2, '0')) FROM orders);
  
  WHILE (SELECT COUNT(*) FROM orders WHERE or_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('OR', LPAD(COALESCE(MAX(SUBSTR(or_id, 3)), 0) + 1, 2, '0')) FROM orders);
  END WHILE;
  
  SET NEW.or_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pay_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pay_avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_name` (`pay_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('PAY01','‎‎COD','https://drive.google.com/uc?export=view&id=1aZ7moS8mAAl3LlEpOBFzBT81rMC7wOVX'),('PAY02','‎‎Stripe','https://drive.google.com/uc?export=view&id=1b8kSF5vT_U3NmmSCoYf00RerLmKiPgWl'),('PAY03','‎‎Credit Card','https://drive.google.com/uc?export=view&id=1TzL92w81MUfoZ_A6B6NlOOVGnKxou_0P');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_payment_insert` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('PAY', LPAD(COALESCE(MAX(SUBSTR(pay_id, 4)), 0) + 1, 2, '0')) FROM payment);
  
  WHILE (SELECT COUNT(*) FROM payment WHERE pay_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('RAT', LPAD(COALESCE(MAX(SUBSTR(pay_id, 4)), 0) + 1, 2, '0')) FROM payment);
  END WHILE;
  
  SET NEW.pay_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `prod_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prod_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES ('PROD01','YANYODO'),('PROD02','Wilson'),('PROD03','California, United States'),('PROD04','Fun'),('PROD05','6KU'),('PROD06','Cool Change'),('PROD07','Malsooa'),('PROD08','Master Lock'),('PROD09','BV'),('PROD10','‎Pacific Cycle'),('PROD11','‎Mirrycle'),('PROD12','‎‎Panther Vision');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_producer_insert` BEFORE INSERT ON `producer` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('PROD', LPAD(COALESCE(MAX(SUBSTR(prod_id, 5)), 0) + 1, 2, '0')) FROM producer);
  
  WHILE (SELECT COUNT(*) FROM producer WHERE prod_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('PROD', LPAD(COALESCE(MAX(SUBSTR(prod_id, 5)), 0) + 1, 2, '0')) FROM producer);
  END WHILE;
  
  SET NEW.prod_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pro_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cat_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bra_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `seller_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prod_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pro_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pro_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `pro_material` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_price` decimal(5,2) NOT NULL,
  `pro_quantity` int NOT NULL,
  `pro_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`pro_id`),
  KEY `fk_pro_cat` (`cat_id`),
  KEY `fk_pro_seller` (`seller_id`),
  KEY `fk_pro_bra` (`bra_id`),
  KEY `fk_pro_prod` (`prod_id`),
  FULLTEXT KEY `pro_name` (`pro_name`,`pro_desc`),
  CONSTRAINT `fk_pro_bra` FOREIGN KEY (`bra_id`) REFERENCES `brand` (`bra_id`),
  CONSTRAINT `fk_pro_cat` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`),
  CONSTRAINT `fk_pro_prod` FOREIGN KEY (`prod_id`) REFERENCES `producer` (`prod_id`),
  CONSTRAINT `fk_pro_seller` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('PRO01','CAT38','BRA27','SELLER01','PROD02','WILSON AVP Soft Play Volleyball - Official Size','Wilson AVP Soft Play Volleyball - Official Size, White\nAVP Official Size: The size & weight used by the AVP, ideal for ages 13 and up','Synthetic Leather Cover',16.95,1000,1),('PRO02','CAT09','BRA29','SELLER01','PROD04','Fun 20 Inch Wheel Unicycle with Alloy Rim','Yes. The seat post clamp skewer is on the back. The front also has a larger plastic \'handle\' that you can grab onto while riding. The pedals should be labeled L and R for left and right.When you\'re seated on the unicycle, with one foot on a pedal in its lowest position, your leg should be almost straight.The average time needed to learn unicycling is around 10-15 hours. That\'s about an hour a day for two weeks. This is just an estimate so be confident and have fun!\n\n','Steel',99.99,1000,1),('PRO03','CAT09','BRA30','SELLER01','PROD05','6KU Fixed Gear Single Speed Urban Fixie Road Bike','The dream bike, the Fixie is well-built, comfortable and stylish, making it the ideal companion for short commutes. Though at a competitive price, there are no corners cut and the never-ending pursuit to quality is evident. We\'re sure you\'ll have a smile on your face every time you hop on for your commutes, hangouts, workouts and beyond.\n','Alloy Steel',179.98,1000,1),('PRO04','CAT10','BRA31','SELLER01','PROD06','CoolChange Polarized Cycling Sunglasses Full Screen','CoolChange cycling sunglasses uses an ultra-light TR90 material that is widely used in brand sport sunglasses. Not only light but also not easy to break.','Rubber',99.99,1000,1),('PRO05','CAT10','BRA32','SELLER01','PROD07','Malsooa Cycling Sunglasses Men glasses Sports','Dazzling design makes you stylish in the crowd, polarized sunglasses restore true color, eliminate reflected light and scattered glare to protect your eyes perfectly. The anti-skid nose pad and silicone temple make these men sunglasses fit more comfortable on the bridge of your nose and above the ears.','Rubber',119.89,1000,1),('PRO06','CAT10','BRA32','SELLER01','PROD07','Zdatt Cycling Glasses Polarized Sunglasses','With outstanding performance,ZDATT Polarized Sports Sunglasses also have an exquisite package which makes it perfect for being a gift for friends or family members who love outdoor activities. UV400 polarized lens block 99% harmful UVA & UVB Rays. Only 24g ultralight design makes you feel at ease when taking exercise','Rubber',109.89,1000,1),('PRO07','CAT11','BRA06','SELLER01','PROD08','Master Lock Bike Lock Cable','Four digit combination security for keyless convenience. Suggested for use as a bike lock, gate lock, lawnmower lock, and ladder lock. High-performance braided steel cable provides strength, flexibility, and resistance to cutting and sawing. Protective vinyl coating for added weather and scratch resistance.','‎Braided steel, vinyl coating',8.99,1000,1),('PRO08','CAT11','BRA33','SELLER01','PROD09','BV Bicycle Pump Durable Steel Bike Floor Pump 17/24 inch Smart Valve Head','BV Pump is the perfect bicycle floor pump for anyone.\n\nDesigned Valve Head switches between Presta and Schrader valves easily and without any air leaks.\n\nThe long steel barrel allows more air to be pushed through with each pump making it easier and faster to pump. The large gauge is easy to read and will help you to set your desired pressure. Our extra long hose with 360 degree pivot will make your pumping easier.','Alloy Steel',34.19,100,1),('PRO09','CAT11','BRA34','SELLER01','PROD10','Schwinn Air Base Plus Bike Foot Pump Black,one-Size','Dual easy indicator pump head fits both Shrader and Presta valves; indicator is green when ready to pump and red when it\'s not. Unique design features foldable steel feet for added stability while pumping and long-lasting durability.','Metal',16.99,100,1),('PRO12','CAT12','BRA34','SELLER01','PROD10','Schwinn Classic Toddler and Baby Bike Helmet','Protect your little one with a helmet that’s as cute as they are. This infant helmet by Schwinn features an adorable design that little ones will love to wear. The Schwinn 360° comfort system with adjustable dial lets you find the perfect fit for your child, while the full-range padding provides superior protection. Plus, the dual-shell design provides improved durability and extra protection in the rear. This lightweight helmet also features an integrated visor and carefully placed vents to keep your child cool and comfortable. Start good safety habits early with the infant helmet by Schwinn.','Plastic',17.89,100,1),('PRO13','CAT18','BRA36','SELLER01','PROD12','Panther Vision POWERCAP 3.0 USB Rechargeable Headlamp LED Beanie Ultra','Since Panther Vision was founded over 10 years ago, we\'ve been finding uncommon solutions for all kinds of lighting problems. We are passionate about defying convention, and we never shy away from challenges. With the newest, brightest technology and the best materials, our products will make your life easier. Working or performing in low-light conditions is no longer a hassle with our convenient, hands-free lighting solutions','Polycarbonate',28.65,100,1),('PRO14','CAT11','BRA35','SELLER01','PROD11','Mirrycle MTB Bar End Mountain Bicycle Mirror , Black','View the world behind with this bar end mounted bicycle mirror Convex mirror with it\'s wide field of view is adjustable to any viewing angle. Mounts in minutes with included wrench. Fits handlebars with 15.8-23.4mm (0.62-0.92\") inside diameters','Plastic resin',18.85,100,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_product_insert` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('PRO', LPAD(COALESCE(MAX(SUBSTR(pro_id, 4)), 0) + 1, 2, '0')) FROM product);
  
  WHILE (SELECT COUNT(*) FROM product WHERE pro_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('PRO', LPAD(COALESCE(MAX(SUBSTR(pro_id, 4)), 0) + 1, 2, '0')) FROM product);
  END WHILE;
  
  SET NEW.pro_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `ques_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pro_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cus_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ques_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ques_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ques_id`),
  KEY `fk_ques_pro` (`pro_id`),
  KEY `fk_ques_cus` (`cus_id`),
  CONSTRAINT `fk_ques_cus` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
  CONSTRAINT `fk_ques_pro` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rat_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pro_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rat_point` int DEFAULT '0',
  `rat_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `rat_timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rat_id`),
  KEY `fk_rat_pro` (`pro_id`),
  KEY `fk_rat_acc` (`acc_id`),
  CONSTRAINT `fk_rat_acc` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`),
  CONSTRAINT `fk_rat_pro` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES ('RAT01','PRO01','ACC03',4,'This product is great!','2023-03-15 10:00:00'),('RAT02','PRO02','ACC04',5,'I love this product!','2023-03-15 11:00:00'),('RAT04','PRO03','ACC03',2,'Not satisfied with this product.','2023-03-15 13:00:00'),('RAT05','PRO04','ACC04',4,'Good product for the price.','2023-03-15 14:00:00'),('RAT07','PRO05','ACC03',1,'Worst product ever!','2023-03-15 16:00:00'),('RAT08','PRO06','ACC04',3,'Not great, but not terrible.','2023-03-15 17:00:00'),('RAT10','PRO07','ACC03',2,'Disappointing product.','2023-03-15 19:00:00'),('RAT11','PRO01','ACC03',5,'I love this product!','2023-04-04 21:00:00');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_rating_insert` BEFORE INSERT ON `rating` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('RAT', LPAD(COALESCE(MAX(SUBSTR(rat_id, 4)), 0) + 1, 2, '0')) FROM rating);
  
  WHILE (SELECT COUNT(*) FROM rating WHERE rat_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('RAT', LPAD(COALESCE(MAX(SUBSTR(rat_id, 4)), 0) + 1, 2, '0')) FROM rating);
  END WHILE;
  
  SET NEW.rat_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `rep_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ques_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `seller_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rep_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rep_status` tinyint(1) DEFAULT '1',
  `rep_timeCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rep_id`),
  KEY `fk_rep_ques` (`ques_id`),
  KEY `fk_rep_seller` (`seller_id`),
  CONSTRAINT `fk_rep_ques` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`),
  CONSTRAINT `fk_rep_seller` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `sale_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sale_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sale_dateStart` datetime DEFAULT CURRENT_TIMESTAMP,
  `sale_dateEnd` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_sale_insert` BEFORE INSERT ON `sale` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('SALE', LPAD(COALESCE(MAX(SUBSTR(sale_id, 5)), 0) + 1, 2, '0')) FROM sale);
  
  WHILE (SELECT COUNT(*) FROM sale WHERE sale_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('SALE', LPAD(COALESCE(MAX(SUBSTR(sale_id, 5)), 0) + 1, 2, '0')) FROM sale);
  END WHILE;
  
  SET NEW.sale_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `saleproduct`
--

DROP TABLE IF EXISTS `saleproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleproduct` (
  `sale_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pro_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ps_value` int NOT NULL,
  `ps_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`sale_id`,`pro_id`),
  KEY `fk_ps_pro` (`pro_id`),
  CONSTRAINT `fk_ps_pro` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`),
  CONSTRAINT `fk_ps_sale` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleproduct`
--

LOCK TABLES `saleproduct` WRITE;
/*!40000 ALTER TABLE `saleproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `saleproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `seller_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `seller_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `seller_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `seller_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `seller_avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  UNIQUE KEY `seller_name` (`seller_name`),
  KEY `fk_seller_acc` (`acc_id`),
  CONSTRAINT `fk_seller_acc` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES ('SELLER01','ACC02','storebikes','Store sports buy equipment sports','United States','https://drive.google.com/uc?export=view&id=1flAOuWwBphzqxK324dZhCkzpPz16mSFd');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_seller_insert` BEFORE INSERT ON `seller` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('SELLER', LPAD(COALESCE(MAX(SUBSTR(seller_id, 7)), 0) + 1, 2, '0')) FROM seller);
  
  WHILE (SELECT COUNT(*) FROM seller WHERE seller_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('SELLER', LPAD(COALESCE(MAX(SUBSTR(seller_id, 7)), 0) + 1, 2, '0')) FROM seller);
  END WHILE;
  
  SET NEW.seller_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `ship_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ship_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ship_fee` int NOT NULL,
  `ship_time` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ship_id`),
  UNIQUE KEY `ship_type` (`ship_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES ('SHIP01','‎‎FedEx',18,'1-2','https://drive.google.com/uc?export=view&id=1RdjozzAve3FN6FdjIwLv08lBWQpaV0F1'),('SHIP02','‎‎DHL',15,'1-2','https://drive.google.com/uc?export=view&id=1uZTpd_BgScoAv3jjEfCQjavDgTxH-7EC'),('SHIP03','‎‎USPS.COM',20,'1-2','https://drive.google.com/uc?export=view&id=13s0UG9ibxVgC2iZshoZUQ1gFFUUM7f0P');
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_shipping_insert` BEFORE INSERT ON `shipping` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(20);
  
  SET new_id = (SELECT CONCAT('SHIP', LPAD(COALESCE(MAX(SUBSTR(ship_id, 5)), 0) + 1, 2, '0')) FROM shipping);
  
  WHILE (SELECT COUNT(*) FROM shipping WHERE ship_id = new_id) > 0 DO
    SET new_id = (SELECT CONCAT('SHIP', LPAD(COALESCE(MAX(SUBSTR(ship_id, 5)), 0) + 1, 2, '0')) FROM shipping);
  END WHILE;
  
  SET NEW.ship_id = new_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'lvtn'
--

--
-- Dumping routines for database 'lvtn'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_update_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_update_customer`(p_cus_id VARCHAR(20), p_cus_userName VARCHAR(50), p_cus_email VARCHAR(100), p_cus_gender VARCHAR(6), p_cus_address VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  UPDATE customer
  SET cus_userName = COALESCE(p_cus_userName, cus_userName),
      cus_email = COALESCE(p_cus_email, cus_email),
      cus_gender = COALESCE(p_cus_gender, cus_gender),
      cus_address = COALESCE(p_cus_address, cus_address)
  WHERE cus_id = p_cus_id;
  
  IF ROW_COUNT() = 0 THEN
    RETURN 'Cannot update account information, please check information again';
  ELSE
    RETURN 'Customer updated successfully';
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_update_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_update_password`(p_acc_id VARCHAR(20), p_password_old VARCHAR(64), p_password_new VARCHAR(64)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_result VARCHAR(50);
    
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count
    FROM accounts
    WHERE acc_id = p_acc_id AND acc_password = p_password_old;

    IF v_count = 0 THEN
        SET v_result = 'Account or old password is incorrect';
    ELSE
        UPDATE accounts
        SET acc_password = p_password_new
        WHERE acc_id = p_acc_id;

        IF ROW_COUNT() = 0 THEN
            SET v_result = 'Account not found';
        ELSE
            SET v_result = 'Password updated successfully';
        END IF;
    END IF;

    RETURN v_result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_seller` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_seller`(IN p_acc_id VARCHAR(20), IN p_seller_name VARCHAR(100), IN p_seller_address VARCHAR(255))
BEGIN

	DECLARE count INT;
DECLARE new_seller_id VARCHAR(20);

SELECT count = COUNT(*)
FROM seller
WHERE seller_name = p_seller_name;

IF count > 0 THEN
   SELECT 'Store name already exists, please choose a different name';
ELSE
	
   SET new_seller_id = (SELECT CONCAT('SELLER', LPAD(COALESCE(MAX(SUBSTR(seller_id, 4)), 0) + 1, 2, '0')) FROM seller);
   INSERT INTO seller (seller_id, acc_id, seller_name, seller_address)
   VALUES (new_seller_id, p_acc_id, p_seller_name, p_seller_address);
   UPDATE accounts SET acc_role = 'seller' WHERE acc_id = p_acc_id;
   SELECT 'Store created successfully!';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_signup_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_signup_account`(IN cus_userName VARCHAR(50), IN acc_phone VARCHAR(20), IN acc_password VARCHAR(64))
BEGIN

DECLARE count INT;
DECLARE new_acc_id VARCHAR(20);
DECLARE new_cus_id VARCHAR(20);

SELECT count = COUNT(*)
FROM accounts
WHERE acc_phone = acc_phone;

IF count > 0 THEN
   SELECT 'Phone number already exists, please use a different phone number.';
ELSE
   SET new_acc_id = (SELECT CONCAT('ACC', LPAD(COALESCE(MAX(SUBSTR(acc_id, 4)), 0) + 1, 2, '0')) FROM accounts);
   INSERT INTO accounts (acc_id, acc_phone, acc_password)
   VALUES (new_acc_id, acc_phone, SHA(acc_password));

   SET new_cus_id = (SELECT CONCAT('CUS', LPAD(COALESCE(MAX(SUBSTR(cus_id, 4)), 0) + 1, 2, '0')) FROM customer);
   INSERT INTO customer (cus_id, acc_id, cus_userName, cus_email, cus_gender, cus_address)
   VALUES (new_cus_id, new_acc_id, cus_userName, NULL, NULL, NULL);

   SELECT 'Account created successfully.';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-08  3:12:22
