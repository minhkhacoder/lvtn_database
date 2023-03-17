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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 23:33:29
