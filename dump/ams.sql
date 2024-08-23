/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ams
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-0ubuntu0.24.04.1

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
-- Table structure for table `car_brand`
--

DROP TABLE IF EXISTS `car_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Наименование марки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Марки автомобилей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_brand`
--

LOCK TABLES `car_brand` WRITE;
/*!40000 ALTER TABLE `car_brand` DISABLE KEYS */;
INSERT INTO `car_brand` VALUES
(1,'Audi'),
(2,'BMW'),
(3,'Cadillac'),
(4,'Citroen'),
(5,'Geely'),
(6,'Haval'),
(7,'Hyundai'),
(8,'Kia'),
(9,'Nissan'),
(10,'Peugeot');
/*!40000 ALTER TABLE `car_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_model`
--

DROP TABLE IF EXISTS `car_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL COMMENT 'id марки',
  `model` varchar(128) NOT NULL COMMENT 'Наименование модели',
  `body_type` enum('хэтчбек','легковой','джип') NOT NULL COMMENT 'Тип кузова',
  `image_url` varchar(256) DEFAULT NULL COMMENT 'Ссылка на изображение',
  `manufacture_begin_date` date DEFAULT NULL COMMENT 'Дата начала производства',
  `manufacture_end_date` date DEFAULT NULL COMMENT 'Дата окончания производства',
  PRIMARY KEY (`id`),
  KEY `car_model_car_brand_FK` (`brand_id`),
  KEY `idx_manufacture_begin_date` (`manufacture_begin_date`),
  KEY `idx_manufacture_end_date` (`manufacture_end_date`),
  CONSTRAINT `car_model_car_brand_FK` FOREIGN KEY (`brand_id`) REFERENCES `car_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Модели автомобилей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_model`
--

LOCK TABLES `car_model` WRITE;
/*!40000 ALTER TABLE `car_model` DISABLE KEYS */;
INSERT INTO `car_model` VALUES
(1,1,'A4','легковой','/images/cars/audi/a4.png','1998-01-12',NULL),
(2,1,'Q5','джип','/images/cars/audi/q5.png','2006-05-11',NULL),
(3,2,'5','джип','/images/cars/bmw/5.png','2003-01-01',NULL),
(4,3,'Escalade','джип','/images/c/cadillac/escalade.png','2001-01-01',NULL),
(5,4,'C5','легковой','/images/cars/citroen/c5.png','1998-01-01','2008-12-01'),
(6,5,'CoolRay','хэтчбек','/images/cars/geely/coolray.png','2022-06-01',NULL),
(7,6,'Jolion','хэтчбек','/images/cars/haval/jolion.png','2023-10-01',NULL),
(8,7,'Accent','легковой','/images/cars/huyndai/accent.png','1998-12-01','2008-12-01'),
(9,8,'Rio','хэтчбек','/images/cars/kia/rio.png','1997-12-01','2012-12-01'),
(10,9,'Maxima','легковой','/images/cars/nissan/maxima.png','1994-08-01','2009-09-01'),
(11,10,'LS500','джип','/images/cars/lexus/ls500.png','2001-12-01','2006-12-01');
/*!40000 ALTER TABLE `car_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_service`
--

DROP TABLE IF EXISTS `car_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(256) NOT NULL COMMENT 'Наименование работы/сервисной услуги',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Сервисные работы для автомобилей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_service`
--

LOCK TABLES `car_service` WRITE;
/*!40000 ALTER TABLE `car_service` DISABLE KEYS */;
INSERT INTO `car_service` VALUES
(1,'Замена масла'),
(2,'Замена охлаждающей жидкости'),
(3,'Замена передних тормозных колодок'),
(4,'Замена задних тормозных колодок'),
(5,'Диагностика подвески'),
(6,'Замена масла'),
(7,'Замена охлаждающей жидкости'),
(8,'Замена передних тормозных колодок'),
(9,'Замена задних тормозных колодок'),
(10,'Диагностика подвески');
/*!40000 ALTER TABLE `car_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_service_price`
--

DROP TABLE IF EXISTS `car_service_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_service_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT 'id модели автомобиля',
  `service_id` int(11) NOT NULL COMMENT 'id сервисной услуги',
  `price` float NOT NULL COMMENT 'Стоимость услуги',
  `duration_hour` float NOT NULL COMMENT 'Время выполнения работы в часах',
  PRIMARY KEY (`id`),
  KEY `car_service_price_car_model_FK` (`model_id`),
  KEY `car_service_price_car_service_FK` (`service_id`),
  KEY `idx_price` (`price`),
  CONSTRAINT `car_service_price_car_model_FK` FOREIGN KEY (`model_id`) REFERENCES `car_model` (`id`),
  CONSTRAINT `car_service_price_car_service_FK` FOREIGN KEY (`service_id`) REFERENCES `car_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Стоимость работ для автомобилей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_service_price`
--

LOCK TABLES `car_service_price` WRITE;
/*!40000 ALTER TABLE `car_service_price` DISABLE KEYS */;
INSERT INTO `car_service_price` VALUES
(1,1,1,500,2.5),
(2,1,3,800,2),
(3,2,1,5000,1),
(4,2,4,1500,1),
(5,3,1,2000,1.5),
(6,3,5,1600,2),
(7,4,2,1800,0.5),
(8,5,2,1900,2),
(9,6,1,900,1),
(10,7,1,850,2.5),
(11,8,2,750,1.2),
(12,9,2,1200,1),
(13,9,1,1000,1),
(14,10,1,1100,2),
(15,10,2,890,2.5);
/*!40000 ALTER TABLE `car_service_price` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-23 16:54:32
