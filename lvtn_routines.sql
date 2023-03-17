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

-- Dump completed on 2023-03-17 23:33:30
