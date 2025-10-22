-- MySQL dump 10.13  Distrib 9.4.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: copa_mundo
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `posicao` enum('goleiro','zagueiro','meio-campo','atacante') DEFAULT NULL,
  `numero_camisa` int DEFAULT NULL,
  `selecao_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selecao_id` (`selecao_id`),
  CONSTRAINT `jogadores_ibfk_1` FOREIGN KEY (`selecao_id`) REFERENCES `selecoes` (`id`),
  CONSTRAINT `jogadores_chk_1` CHECK ((`numero_camisa` between 1 and 99))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
/*!40000 ALTER TABLE `jogadores` DISABLE KEYS */;
INSERT INTO `jogadores` VALUES (1,'Alisson','goleiro',1,1),(2,'Neymar','atacante',10,1),(3,'Sommer','goleiro',1,2),(4,'Xhaka','meio-campo',10,2),(5,'Onana','goleiro',16,3),(6,'Aboubakar','atacante',10,3),(7,'Milinkovic-Savic','goleiro',1,4),(8,'Mitrovic','atacante',9,4),(9,'Dibu Martinez','goleiro',23,5),(10,'Messi','atacante',10,5),(11,'Szczesny','goleiro',1,6),(12,'Lewandowski','atacante',9,6),(13,'Ochoa','goleiro',13,7),(14,'Lozano','atacante',11,7),(15,'Al-Owais','goleiro',21,8),(16,'Al-Shehri','atacante',10,8);
/*!40000 ALTER TABLE `jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selecoes`
--

DROP TABLE IF EXISTS `selecoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selecoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `grupo` char(1) DEFAULT NULL,
  `titulos` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selecoes`
--

LOCK TABLES `selecoes` WRITE;
/*!40000 ALTER TABLE `selecoes` DISABLE KEYS */;
INSERT INTO `selecoes` VALUES (1,'Brasil','G',5),(2,'Suíça','G',0),(3,'Camarões','G',0),(4,'Sérvia','G',0),(5,'Argentina','C',3),(6,'Plônia','C',0),(7,'México','C',0),(8,'Arábia Saudita','C',0);
/*!40000 ALTER TABLE `selecoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'copa_mundo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-22 10:48:44
