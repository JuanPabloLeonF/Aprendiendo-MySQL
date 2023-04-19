-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: torneo
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `equipo` int NOT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estadio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Madrid','2022-01-01','Santiago Bernabéu'),(2,'Barcelona','2022-01-02','Camp Nou'),(3,'Manchester','2022-01-03','Old Trafford'),(4,'Milán','2022-01-04','San Siro'),(5,'Múnich','2022-01-05','Allianz Arena');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goles`
--

DROP TABLE IF EXISTS `goles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goles` (
  `fk_partido` int NOT NULL,
  `fk_nif` int DEFAULT NULL,
  `goles` int DEFAULT NULL,
  PRIMARY KEY (`fk_partido`),
  KEY `FK_nif_goles` (`fk_nif`),
  CONSTRAINT `FK_nif_goles` FOREIGN KEY (`fk_nif`) REFERENCES `jugadores` (`id_nif`),
  CONSTRAINT `FK_partido_goles` FOREIGN KEY (`fk_partido`) REFERENCES `partidos` (`id_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goles`
--

LOCK TABLES `goles` WRITE;
/*!40000 ALTER TABLE `goles` DISABLE KEYS */;
INSERT INTO `goles` VALUES (1,1,3),(2,3,2),(3,5,1);
/*!40000 ALTER TABLE `goles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id_nif` int NOT NULL,
  `fk_equipo` int DEFAULT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `foto` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_nif`),
  KEY `FK_equipo_jugadores` (`fk_equipo`),
  CONSTRAINT `FK_equipo_jugadores` FOREIGN KEY (`fk_equipo`) REFERENCES `equipos` (`equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,1,'Lionel Messi','1987-06-24','lionel_messi.jpg'),(2,2,'Cristiano Ronaldo','1985-02-05','cristiano_ronaldo.jpg'),(3,3,'Neymar Jr.','1992-02-05','neymar_jr.jpg'),(4,4,'Luis Suárez','1987-01-24','luis_suarez.jpg'),(5,5,'Sergio Ramos','1986-03-30','sergio_ramos.jpg');
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido_equipos`
--

DROP TABLE IF EXISTS `partido_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido_equipos` (
  `fk_partido` int DEFAULT NULL,
  `equipo` varchar(20) DEFAULT NULL,
  KEY `FK_partido_partido_equipo` (`fk_partido`),
  CONSTRAINT `FK_partido_partido_equipo` FOREIGN KEY (`fk_partido`) REFERENCES `partidos` (`id_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido_equipos`
--

LOCK TABLES `partido_equipos` WRITE;
/*!40000 ALTER TABLE `partido_equipos` DISABLE KEYS */;
INSERT INTO `partido_equipos` VALUES (1,'Real Madrid'),(1,'FC Barcelona'),(2,'Manchester United'),(2,'Liverpool FC'),(3,'AC Milan');
/*!40000 ALTER TABLE `partido_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `id_partido` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `arbitro` varchar(20) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,'2023-04-15','Juan Pérez','Madrid'),(2,'2023-04-16','Ana Gómez','Barcelona'),(3,'2023-04-17','Carlos Martínez','Londres'),(4,'2023-04-18','María Rodríguez','Milán'),(5,'2023-04-19','Pedro Fernández','Múnich');
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonos` (
  `fk_nif` int DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  KEY `FK_nif_telefonos` (`fk_nif`),
  CONSTRAINT `FK_nif_telefonos` FOREIGN KEY (`fk_nif`) REFERENCES `jugadores` (`id_nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES (1,'123456789'),(2,'987654321'),(3,'456789123'),(4,'789123456'),(5,'321987654');
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-13 20:25:35
