-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sena
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
-- Table structure for table `acta_inicio`
--

DROP TABLE IF EXISTS `acta_inicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta_inicio` (
  `codigo_acta_inicio` int NOT NULL,
  `fecha_acta_inicio` date DEFAULT NULL,
  `descripcion` text,
  `fk_codigo_contrato` int DEFAULT NULL,
  PRIMARY KEY (`codigo_acta_inicio`),
  KEY `FK_codigo_contrato_acta_inicio` (`fk_codigo_contrato`),
  CONSTRAINT `FK_codigo_contrato_acta_inicio` FOREIGN KEY (`fk_codigo_contrato`) REFERENCES `contrato` (`codigo_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_inicio`
--

LOCK TABLES `acta_inicio` WRITE;
/*!40000 ALTER TABLE `acta_inicio` DISABLE KEYS */;
INSERT INTO `acta_inicio` VALUES (1,'2023-01-01','Descripción del acta 1',1),(2,'2023-03-15','Descripción del acta 2',2),(3,'2023-05-10','Descripción del acta 3',3),(4,'2023-07-20','Descripción del acta 4',4),(5,'2023-09-05','Descripción del acta 5',5);
/*!40000 ALTER TABLE `acta_inicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ambiente`
--

DROP TABLE IF EXISTS `ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambiente` (
  `codigo_ambiente` int NOT NULL,
  `horario_ambiente` time DEFAULT NULL,
  `numero_ambiente` int DEFAULT NULL,
  `fk_codigo_h_ambiente` int DEFAULT NULL,
  PRIMARY KEY (`codigo_ambiente`),
  KEY `FK_codigo_h_ambiente` (`fk_codigo_h_ambiente`),
  CONSTRAINT `FK_codigo_h_ambiente` FOREIGN KEY (`fk_codigo_h_ambiente`) REFERENCES `hora_ambiente` (`codigo_h_ambiente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambiente`
--

LOCK TABLES `ambiente` WRITE;
/*!40000 ALTER TABLE `ambiente` DISABLE KEYS */;
INSERT INTO `ambiente` VALUES (1,'08:00:00',101,1),(2,'09:30:00',102,2),(3,'10:45:00',103,3),(4,'11:30:00',104,4),(5,'12:45:00',105,5);
/*!40000 ALTER TABLE `ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendiz`
--

DROP TABLE IF EXISTS `aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprendiz` (
  `codigo_aprendiz` int NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fk_codigo_programa_f` int DEFAULT NULL,
  PRIMARY KEY (`codigo_aprendiz`),
  KEY `FK_codigo_p_f_aprendiz` (`fk_codigo_programa_f`),
  CONSTRAINT `FK_codigo_p_f_aprendiz` FOREIGN KEY (`fk_codigo_programa_f`) REFERENCES `programas_formacion` (`codigo_programa_formacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendiz`
--

LOCK TABLES `aprendiz` WRITE;
/*!40000 ALTER TABLE `aprendiz` DISABLE KEYS */;
INSERT INTO `aprendiz` VALUES (1,'1234567890','aprendiz1@example.com',1),(2,'2345678901','aprendiz2@example.com',2),(3,'3456789012','aprendiz3@example.com',3),(4,'4567890123','aprendiz4@example.com',4),(5,'5678901234','aprendiz5@example.com',5);
/*!40000 ALTER TABLE `aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendiz_curso_complementario`
--

DROP TABLE IF EXISTS `aprendiz_curso_complementario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprendiz_curso_complementario` (
  `fk_codigo_aprendiz` int NOT NULL,
  `fk_codigo_curso_c` int DEFAULT NULL,
  PRIMARY KEY (`fk_codigo_aprendiz`),
  KEY `FK_codigo_curso_c_c` (`fk_codigo_curso_c`),
  CONSTRAINT `FK_codigo_aprendiz_c_c` FOREIGN KEY (`fk_codigo_aprendiz`) REFERENCES `aprendiz` (`codigo_aprendiz`),
  CONSTRAINT `FK_codigo_curso_c_c` FOREIGN KEY (`fk_codigo_curso_c`) REFERENCES `curso_complementario` (`codigo_curso_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendiz_curso_complementario`
--

LOCK TABLES `aprendiz_curso_complementario` WRITE;
/*!40000 ALTER TABLE `aprendiz_curso_complementario` DISABLE KEYS */;
INSERT INTO `aprendiz_curso_complementario` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `aprendiz_curso_complementario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro`
--

DROP TABLE IF EXISTS `centro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro` (
  `codigo_centro` int NOT NULL,
  `direccion_centro` varchar(30) DEFAULT NULL,
  `nombre_centro` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_centro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro`
--

LOCK TABLES `centro` WRITE;
/*!40000 ALTER TABLE `centro` DISABLE KEYS */;
INSERT INTO `centro` VALUES (1,'Calle 123, Ciudad 1','Centro 1'),(2,'Avenida 456, Ciudad 2','Centro 2'),(3,'Calle 789, Ciudad 3','Centro 3'),(4,'Avenida 012, Ciudad 4','Centro 4'),(5,'Calle 345, Ciudad 5','Centro 5');
/*!40000 ALTER TABLE `centro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencia`
--

DROP TABLE IF EXISTS `competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencia` (
  `codigo_competencia` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo_competencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencia`
--

LOCK TABLES `competencia` WRITE;
/*!40000 ALTER TABLE `competencia` DISABLE KEYS */;
INSERT INTO `competencia` VALUES (1,'Competencia 1'),(2,'Competencia 2'),(3,'Competencia 3'),(4,'Competencia 4'),(5,'Competencia 5');
/*!40000 ALTER TABLE `competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `codigo_contrato` int NOT NULL,
  `numero` int DEFAULT NULL,
  `VALOR` float DEFAULT NULL,
  `tipo_contrato` varchar(25) DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL,
  PRIMARY KEY (`codigo_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,12345,1500.5,'Venta','2023-04-20'),(2,54321,2000.25,'Alquiler','2023-04-21'),(3,98765,3000.75,'Venta','2023-04-22'),(4,56789,1200.8,'Alquiler','2023-04-23'),(5,43210,2500.6,'Venta','2023-04-24');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinador`
--

DROP TABLE IF EXISTS `coordinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinador` (
  `cedula_coordinador` int NOT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cedula_coordinador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinador`
--

LOCK TABLES `coordinador` WRITE;
/*!40000 ALTER TABLE `coordinador` DISABLE KEYS */;
INSERT INTO `coordinador` VALUES (11111111,'Perez','Juan','juan.perez@example.com'),(22222222,'Gomez','María','maria.gomez@example.com'),(33333333,'Rodriguez','Carlos','carlos.rodriguez@example.com'),(44444444,'Hernandez','Ana','ana.hernandez@example.com'),(55555555,'Lopez','Pedro','pedro.lopez@example.com');
/*!40000 ALTER TABLE `coordinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_complementario`
--

DROP TABLE IF EXISTS `curso_complementario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_complementario` (
  `codigo_curso_c` int NOT NULL,
  `nombres` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_curso_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_complementario`
--

LOCK TABLES `curso_complementario` WRITE;
/*!40000 ALTER TABLE `curso_complementario` DISABLE KEYS */;
INSERT INTO `curso_complementario` VALUES (1,'Curso 1'),(2,'Curso 2'),(3,'Curso 3'),(4,'Curso 4'),(5,'Curso 5');
/*!40000 ALTER TABLE `curso_complementario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hora_ambiente`
--

DROP TABLE IF EXISTS `hora_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hora_ambiente` (
  `codigo_h_ambiente` int NOT NULL,
  `hora_final` time DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_h_ambiente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hora_ambiente`
--

LOCK TABLES `hora_ambiente` WRITE;
/*!40000 ALTER TABLE `hora_ambiente` DISABLE KEYS */;
INSERT INTO `hora_ambiente` VALUES (1,'08:00:00','07:30:00','Registro 1'),(2,'09:30:00','09:00:00','Registro 2'),(3,'10:45:00','10:15:00','Registro 3'),(4,'11:30:00','11:00:00','Registro 4'),(5,'12:45:00','12:15:00','Registro 5');
/*!40000 ALTER TABLE `hora_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `codigo_hora` int NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `fk_cedula` int DEFAULT NULL,
  `fk_cedula_coordinado` int DEFAULT NULL,
  PRIMARY KEY (`codigo_hora`),
  KEY `FK_cedula_horario` (`fk_cedula`),
  KEY `FK_cedula_coordinador` (`fk_cedula_coordinado`),
  CONSTRAINT `FK_cedula_coordinador` FOREIGN KEY (`fk_cedula_coordinado`) REFERENCES `coordinador` (`cedula_coordinador`),
  CONSTRAINT `FK_cedula_horario` FOREIGN KEY (`fk_cedula`) REFERENCES `instructor` (`id_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'2023-04-21','2023-04-22',1,11111111),(2,'2023-04-22','2023-04-23',2,22222222),(3,'2023-04-23','2023-04-24',3,33333333),(4,'2023-04-24','2023-04-25',4,44444444),(5,'2023-04-25','2023-04-26',5,55555555);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id_cedula` int NOT NULL,
  `nombre_instructor` varchar(20) DEFAULT NULL,
  `apellido_instructor` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fk_codigo_centro` int DEFAULT NULL,
  `fk_codigo_contrato` int DEFAULT NULL,
  PRIMARY KEY (`id_cedula`),
  KEY `FK_codigo_centro_instructor` (`fk_codigo_centro`),
  KEY `FK_codigo_contrato_instructor` (`fk_codigo_contrato`),
  CONSTRAINT `FK_codigo_centro_instructor` FOREIGN KEY (`fk_codigo_centro`) REFERENCES `centro` (`codigo_centro`),
  CONSTRAINT `FK_codigo_contrato_instructor` FOREIGN KEY (`fk_codigo_contrato`) REFERENCES `contrato` (`codigo_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Juan','Perez','juan.perez@example.com','Calle 123','555-1234',1,1),(2,'María','Gomez','maria.gomez@example.com','Avenida 456','555-5678',2,2),(3,'Carlos','Rodriguez','carlos.rodriguez@example.com','Plaza 789','555-9876',3,3),(4,'Ana','Hernandez','ana.hernandez@example.com','Carretera 012','555-4567',4,4),(5,'Pedro','Lopez','pedro.lopez@example.com','Paseo 345','555-7890',5,5);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_programas_formacion`
--

DROP TABLE IF EXISTS `instructor_programas_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor_programas_formacion` (
  `cedula_i_p_f` int NOT NULL,
  `fk_codigo_p_f` int DEFAULT NULL,
  PRIMARY KEY (`cedula_i_p_f`),
  KEY `FK_codigo_p_f_i_p_f` (`fk_codigo_p_f`),
  CONSTRAINT `FK_cedula_i_p_f_i_p_f` FOREIGN KEY (`cedula_i_p_f`) REFERENCES `instructor` (`id_cedula`),
  CONSTRAINT `FK_codigo_p_f_i_p_f` FOREIGN KEY (`fk_codigo_p_f`) REFERENCES `programas_formacion` (`codigo_programa_formacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_programas_formacion`
--

LOCK TABLES `instructor_programas_formacion` WRITE;
/*!40000 ALTER TABLE `instructor_programas_formacion` DISABLE KEYS */;
INSERT INTO `instructor_programas_formacion` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `instructor_programas_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa_formacion_ambiente`
--

DROP TABLE IF EXISTS `programa_formacion_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa_formacion_ambiente` (
  `fk_codigo_p_f` int NOT NULL,
  `fk_codigo_ambiente` int DEFAULT NULL,
  PRIMARY KEY (`fk_codigo_p_f`),
  KEY `FK_codigo_ambiente_p_f_a` (`fk_codigo_ambiente`),
  CONSTRAINT `FK_codigo_ambiente_p_f_a` FOREIGN KEY (`fk_codigo_ambiente`) REFERENCES `ambiente` (`codigo_ambiente`),
  CONSTRAINT `FK_codigo_p_f_p_f_a` FOREIGN KEY (`fk_codigo_p_f`) REFERENCES `programas_formacion` (`codigo_programa_formacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa_formacion_ambiente`
--

LOCK TABLES `programa_formacion_ambiente` WRITE;
/*!40000 ALTER TABLE `programa_formacion_ambiente` DISABLE KEYS */;
INSERT INTO `programa_formacion_ambiente` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `programa_formacion_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa_formacion_competencia`
--

DROP TABLE IF EXISTS `programa_formacion_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa_formacion_competencia` (
  `fk_codigo_p_f` int NOT NULL,
  `fk_codigo_competencia` int DEFAULT NULL,
  PRIMARY KEY (`fk_codigo_p_f`),
  KEY `FK_codigo_competencia_p_f_c` (`fk_codigo_competencia`),
  CONSTRAINT `FK_codigo_competencia_p_f_c` FOREIGN KEY (`fk_codigo_competencia`) REFERENCES `competencia` (`codigo_competencia`),
  CONSTRAINT `FK_codigo_p_f` FOREIGN KEY (`fk_codigo_p_f`) REFERENCES `programas_formacion` (`codigo_programa_formacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa_formacion_competencia`
--

LOCK TABLES `programa_formacion_competencia` WRITE;
/*!40000 ALTER TABLE `programa_formacion_competencia` DISABLE KEYS */;
INSERT INTO `programa_formacion_competencia` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `programa_formacion_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas_formacion`
--

DROP TABLE IF EXISTS `programas_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programas_formacion` (
  `codigo_programa_formacion` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo_programa_formacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas_formacion`
--

LOCK TABLES `programas_formacion` WRITE;
/*!40000 ALTER TABLE `programas_formacion` DISABLE KEYS */;
INSERT INTO `programas_formacion` VALUES (1,'Programa 1'),(2,'Programa 2'),(3,'Programa 3'),(4,'Programa 4'),(5,'Programa 5');
/*!40000 ALTER TABLE `programas_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_contrato` (
  `codigo_tipo_contrato` int NOT NULL,
  `valor` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `fk_id_cedula` int DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo_contrato`),
  KEY `FK_id_cedula_tipo_contrato` (`fk_id_cedula`),
  CONSTRAINT `FK_id_cedula_tipo_contrato` FOREIGN KEY (`fk_id_cedula`) REFERENCES `instructor` (`id_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contrato`
--

LOCK TABLES `tipo_contrato` WRITE;
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
INSERT INTO `tipo_contrato` VALUES (1,123.45,'2022-01-01',10,1),(2,678.9,'2022-02-02',20,2),(3,234.56,'2022-03-03',30,3),(4,789.01,'2022-04-04',40,4),(5,345.67,'2022-05-05',50,5);
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22 10:27:37
