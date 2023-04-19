-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ejercicio1
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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `dni_empleado` varchar(8) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `domicilio` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`dni_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('12345678','Juan Pérez','Av. Libertad 1234'),('23456789','María Rodríguez','Calle del Sol 5678'),('34567890','Pedro Gómez','Paseo de la Montaña 789'),('45678901','Luisa Fernández','Plaza de la Victoria 4321'),('56789012','Carlos Martínez','Ronda del Norte 9876');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `existencias`
--

DROP TABLE IF EXISTS `existencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `existencias` (
  `cod_articulo` varchar(10) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` float NOT NULL,
  `cod_pub` varchar(5) NOT NULL,
  PRIMARY KEY (`cod_articulo`),
  KEY `fk_existencias_pub` (`cod_pub`),
  CONSTRAINT `fk_existencias_pub` FOREIGN KEY (`cod_pub`) REFERENCES `pub` (`cod_pub`),
  CONSTRAINT `ck_precio` CHECK ((`precio` <> 0)),
  CONSTRAINT `existencias_chk_1` CHECK ((`precio` <> 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `existencias`
--

LOCK TABLES `existencias` WRITE;
/*!40000 ALTER TABLE `existencias` DISABLE KEYS */;
INSERT INTO `existencias` VALUES ('ART01','Artículo 1',10,19.99,'PUB01'),('ART02','Artículo 2',5,9.99,'PUB02'),('ART03','Artículo 3',20,29.99,'PUB03'),('ART04','Artículo 4',15,14.99,'PUB04'),('ART05','Artículo 5',8,24.99,'PUB05');
/*!40000 ALTER TABLE `existencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `cod_localidad` int NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`cod_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Ciudad Capital'),(2,'Pueblo del Este'),(3,'Villa del Mar'),(4,'Caserío San Antonio'),(5,'Barrio San Juan');
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pub`
--

DROP TABLE IF EXISTS `pub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pub` (
  `cod_pub` varchar(5) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `licencia_fiscal` varchar(60) NOT NULL,
  `domicilio` varchar(60) DEFAULT NULL,
  `fecha_apertura` date NOT NULL,
  `horario` varchar(60) NOT NULL,
  `cod_localidad` int NOT NULL,
  PRIMARY KEY (`cod_pub`),
  KEY `fk_pub_localidad` (`cod_localidad`),
  CONSTRAINT `fk_pub_localidad` FOREIGN KEY (`cod_localidad`) REFERENCES `localidad` (`cod_localidad`),
  CONSTRAINT `fk_horario` CHECK ((`horario` in (_utf8mb4'hor1',_utf8mb4'hor2',_utf8mb4'hor3')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pub`
--

LOCK TABLES `pub` WRITE;
/*!40000 ALTER TABLE `pub` DISABLE KEYS */;
INSERT INTO `pub` VALUES ('PUB01','El Farol','LIC001','Av. de la Playa 1234','2022-01-01','hor1',1),('PUB02','La Taberna','LIC002','Calle del Sol 5678','2021-12-31','hor2',2),('PUB03','El Rincón de los Amigos','LIC003','Plaza Mayor 789','2022-02-15','hor3',3),('PUB04','La Esquina del Sabor','LIC004','Ronda del Norte 4321','2022-03-10','hor1',4),('PUB05','El Oasis de la Noche','LIC005','Avenida Libertad 9876','2022-04-05','hor2',5);
/*!40000 ALTER TABLE `pub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pub_empleado`
--

DROP TABLE IF EXISTS `pub_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pub_empleado` (
  `cod_pub` varchar(5) NOT NULL,
  `dni_empleado` varchar(8) NOT NULL,
  `funcion` varchar(9) NOT NULL,
  PRIMARY KEY (`cod_pub`,`dni_empleado`,`funcion`),
  KEY `fk_pubemple_empleado` (`dni_empleado`),
  CONSTRAINT `fk_pubemple_empleado` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`),
  CONSTRAINT `fk_pubemple_pub` FOREIGN KEY (`cod_pub`) REFERENCES `pub` (`cod_pub`),
  CONSTRAINT `ck_funcion` CHECK ((`funcion` in (_utf8mb4'camarero',_utf8mb4'seguridad',_utf8mb4'limpieza')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pub_empleado`
--

LOCK TABLES `pub_empleado` WRITE;
/*!40000 ALTER TABLE `pub_empleado` DISABLE KEYS */;
INSERT INTO `pub_empleado` VALUES ('PUB01','12345678','camarero'),('PUB02','23456789','seguridad'),('PUB03','34567890','limpieza'),('PUB04','45678901','camarero'),('PUB05','56789012','seguridad');
/*!40000 ALTER TABLE `pub_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titular`
--

DROP TABLE IF EXISTS `titular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titular` (
  `dni_titular` varchar(8) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `domicilio` varchar(60) DEFAULT NULL,
  `cod_pub` varchar(5) NOT NULL,
  PRIMARY KEY (`dni_titular`),
  KEY `fk_titular_pub` (`cod_pub`),
  CONSTRAINT `fk_titular_pub` FOREIGN KEY (`cod_pub`) REFERENCES `pub` (`cod_pub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titular`
--

LOCK TABLES `titular` WRITE;
/*!40000 ALTER TABLE `titular` DISABLE KEYS */;
INSERT INTO `titular` VALUES ('TIT001','Titular 1','Domicilio 1','PUB01'),('TIT002','Titular 2','Domicilio 2','PUB02'),('TIT003','Titular 3','Domicilio 3','PUB03'),('TIT004','Titular 4','Domicilio 4','PUB04'),('TIT005','Titular 5','Domicilio 5','PUB05');
/*!40000 ALTER TABLE `titular` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15 22:29:12
