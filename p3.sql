CREATE DATABASE  IF NOT EXISTS `goit-rdb-hw-02` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `goit-rdb-hw-02`;
-- MySQL dump 10.13  Distrib 8.0.44, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: goit-rdb-hw-02
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;


--
-- Table structure for table `Клієнти` (Normalized to 3NF - Clients)
--

DROP TABLE IF EXISTS `Клієнти`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Клієнти` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Клієнт` varchar(45) NOT NULL,
  `Адреса_клієнта` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_клієнт` (`Клієнт`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Клієнти`
--

LOCK TABLES `Клієнти` WRITE;
/*!40000 ALTER TABLE `Клієнти` DISABLE KEYS */;
INSERT INTO `Клієнти` (`id`, `Клієнт`, `Адреса_клієнта`) VALUES
(1, 'Мельник', 'Хрещатик 1'),
(2, 'Шевченко', 'Басейна 2'),
(3, 'Коваленко', 'Комп\'ютерна 3');
/*!40000 ALTER TABLE `Клієнти` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Замовлення` (Normalized to 3NF - Orders)
--

DROP TABLE IF EXISTS `Замовлення`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Замовлення` (
  `Номер_замовлення` int NOT NULL,
  `Клієнт_id` int DEFAULT NULL,
  `Дата_замовлення` DATE DEFAULT NULL,
  PRIMARY KEY (`Номер_замовлення`),
  KEY `fk_замовлення_клієнт` (`Клієнт_id`),
  CONSTRAINT `fk_замовлення_клієнт` FOREIGN KEY (`Клієнт_id`) REFERENCES `Клієнти` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Замовлення`
--

LOCK TABLES `Замовлення` WRITE;
/*!40000 ALTER TABLE `Замовлення` DISABLE KEYS */;
INSERT INTO `Замовлення` (`Номер_замовлення`, `Клієнт_id`, `Дата_замовлення`) VALUES
(101, 1, '2023-03-15'),
(102, 2, '2023-03-16'),
(103, 3, '2023-03-17');
/*!40000 ALTER TABLE `Замовлення` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Товари` (Normalized to 3NF - Products)
--

DROP TABLE IF EXISTS `Товари`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Товари` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Назва_товару` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_товар` (`Назва_товару`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Товари`
--

LOCK TABLES `Товари` WRITE;
/*!40000 ALTER TABLE `Товари` DISABLE KEYS */;
INSERT INTO `Товари` (`id`, `Назва_товару`) VALUES
(1, 'Лептоп'),
(2, 'Мишка'),
(3, 'Принтер');
/*!40000 ALTER TABLE `Товари` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Позиції_замовлення` (Normalized to 3NF - Order Items)
--

DROP TABLE IF EXISTS `Позиції_замовлення`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Позиції_замовлення` (
  `Номер_замовлення` int NOT NULL,
  `Товар_id` int NOT NULL,
  `Кількість` int DEFAULT NULL,
  PRIMARY KEY (`Номер_замовлення`, `Товар_id`),
  KEY `fk_позиції_товар` (`Товар_id`),
  CONSTRAINT `fk_позиції_замовлення` FOREIGN KEY (`Номер_замовлення`) REFERENCES `Замовлення` (`Номер_замовлення`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_позиції_товар` FOREIGN KEY (`Товар_id`) REFERENCES `Товари` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Позиції_замовлення`
--

LOCK TABLES `Позиції_замовлення` WRITE;
/*!40000 ALTER TABLE `Позиції_замовлення` DISABLE KEYS */;
INSERT INTO `Позиції_замовлення` (`Номер_замовлення`, `Товар_id`, `Кількість`) VALUES
(101, 1, 3),
(101, 2, 2),
(102, 3, 1),
(103, 2, 4);
/*!40000 ALTER TABLE `Позиції_замовлення` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-23  9:44:07
