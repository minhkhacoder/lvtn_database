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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 23:33:30
