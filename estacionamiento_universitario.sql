-- MySQL dump 10.13  Distrib 9.2.0, for macos15 (arm64)
--
-- Host: localhost    Database: estacionamiento_universitario
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `Asignacion_Cajones`
--

DROP TABLE IF EXISTS `Asignacion_Cajones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asignacion_Cajones` (
  `ID_Asignacion` int NOT NULL AUTO_INCREMENT,
  `ID_Cajon` int NOT NULL,
  `ID_Vehiculo` int DEFAULT NULL,
  PRIMARY KEY (`ID_Asignacion`),
  KEY `ID_Cajon` (`ID_Cajon`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  CONSTRAINT `asignacion_cajones_ibfk_1` FOREIGN KEY (`ID_Cajon`) REFERENCES `Cajones_Estacionamiento` (`ID_Cajon`),
  CONSTRAINT `asignacion_cajones_ibfk_2` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `Vehiculos` (`ID_Vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asignacion_Cajones`
--

LOCK TABLES `Asignacion_Cajones` WRITE;
/*!40000 ALTER TABLE `Asignacion_Cajones` DISABLE KEYS */;
INSERT INTO `Asignacion_Cajones` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `Asignacion_Cajones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cajones_Estacionamiento`
--

DROP TABLE IF EXISTS `Cajones_Estacionamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cajones_Estacionamiento` (
  `ID_Cajon` int NOT NULL AUTO_INCREMENT,
  `ID_Estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Cajon`),
  KEY `ID_Estado` (`ID_Estado`),
  CONSTRAINT `cajones_estacionamiento_ibfk_1` FOREIGN KEY (`ID_Estado`) REFERENCES `Estados_Cajones` (`ID_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cajones_Estacionamiento`
--

LOCK TABLES `Cajones_Estacionamiento` WRITE;
/*!40000 ALTER TABLE `Cajones_Estacionamiento` DISABLE KEYS */;
INSERT INTO `Cajones_Estacionamiento` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `Cajones_Estacionamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discapacidad_Vehiculos`
--

DROP TABLE IF EXISTS `Discapacidad_Vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discapacidad_Vehiculos` (
  `ID_Discapacidad` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Discapacidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discapacidad_Vehiculos`
--

LOCK TABLES `Discapacidad_Vehiculos` WRITE;
/*!40000 ALTER TABLE `Discapacidad_Vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Discapacidad_Vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estados_Cajones`
--

DROP TABLE IF EXISTS `Estados_Cajones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados_Cajones` (
  `ID_Estado` int NOT NULL AUTO_INCREMENT,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estados_Cajones`
--

LOCK TABLES `Estados_Cajones` WRITE;
/*!40000 ALTER TABLE `Estados_Cajones` DISABLE KEYS */;
INSERT INTO `Estados_Cajones` VALUES (1,'Disponible'),(2,'Ocupado'),(3,'Reservado'),(4,'Mantenimiento'),(5,'Bloqueado');
/*!40000 ALTER TABLE `Estados_Cajones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca_Vehiculos`
--

DROP TABLE IF EXISTS `Marca_Vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marca_Vehiculos` (
  `ID_Marca` int NOT NULL AUTO_INCREMENT,
  `Marca` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Marca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca_Vehiculos`
--

LOCK TABLES `Marca_Vehiculos` WRITE;
/*!40000 ALTER TABLE `Marca_Vehiculos` DISABLE KEYS */;
INSERT INTO `Marca_Vehiculos` VALUES (1,'Toyota'),(2,'Honda');
/*!40000 ALTER TABLE `Marca_Vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registros_Acceso`
--

DROP TABLE IF EXISTS `Registros_Acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registros_Acceso` (
  `ID_Acceso` int NOT NULL AUTO_INCREMENT,
  `ID_Vehiculo` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Hora_Entrada` datetime NOT NULL,
  `Hora_Salida` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Acceso`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `registros_acceso_ibfk_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `Vehiculos` (`ID_Vehiculo`),
  CONSTRAINT `registros_acceso_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuarios` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registros_Acceso`
--

LOCK TABLES `Registros_Acceso` WRITE;
/*!40000 ALTER TABLE `Registros_Acceso` DISABLE KEYS */;
INSERT INTO `Registros_Acceso` VALUES (1,1,1,'2025-03-12 20:18:15','2025-03-12 08:00:00',NULL),(2,2,2,'2025-03-12 20:18:15','2025-03-12 09:15:00',NULL);
/*!40000 ALTER TABLE `Registros_Acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Usuario`
--

DROP TABLE IF EXISTS `Tipo_Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_Usuario` (
  `ID_Tipo_Usuario` int NOT NULL AUTO_INCREMENT,
  `Rol` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Usuario`
--

LOCK TABLES `Tipo_Usuario` WRITE;
/*!40000 ALTER TABLE `Tipo_Usuario` DISABLE KEYS */;
INSERT INTO `Tipo_Usuario` VALUES (1,'Administrador'),(2,'Alumno');
/*!40000 ALTER TABLE `Tipo_Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre_Completo` varchar(100) NOT NULL,
  `ID_Tipo_Usuario` int NOT NULL,
  `Matricula` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL DEFAULT (curdate()),
  `Horario` time DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Correo` (`Correo`),
  UNIQUE KEY `Matricula` (`Matricula`),
  UNIQUE KEY `Telefono` (`Telefono`),
  KEY `ID_Tipo_Usuario` (`ID_Tipo_Usuario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_Tipo_Usuario`) REFERENCES `Tipo_Usuario` (`ID_Tipo_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Juan Pérez',2,'A012345','juanperez@universidad.edu','2291234567','2025-03-12',NULL),(2,'Ana Gómez',1,NULL,'ana@admin.com','2297654321','2025-03-12',NULL),(4,'Luis Martínez',2,'A098765','luis@uni.edu','2295554444','2025-03-26',NULL),(7,'Fernando Castro',2,'A901234','fernando.castro@uni.edu','2299012345','2025-03-26',NULL),(8,'Carlos Ramírez',1,'A234567','carlos.ramirez@uni.edu','2292345678','2025-03-26',NULL);
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehiculos`
--

DROP TABLE IF EXISTS `Vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehiculos` (
  `ID_Vehiculo` int NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int DEFAULT NULL,
  `Placa` varchar(10) NOT NULL,
  `ID_Marca` int NOT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `ID_Discapacidad` int DEFAULT NULL,
  `Fecha_Registro` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`ID_Vehiculo`),
  UNIQUE KEY `Placa` (`Placa`),
  KEY `ID_Usuario` (`ID_Usuario`),
  KEY `ID_Marca` (`ID_Marca`),
  KEY `ID_Discapacidad` (`ID_Discapacidad`),
  CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuarios` (`ID_Usuario`),
  CONSTRAINT `vehiculos_ibfk_2` FOREIGN KEY (`ID_Marca`) REFERENCES `Marca_Vehiculos` (`ID_Marca`),
  CONSTRAINT `vehiculos_ibfk_3` FOREIGN KEY (`ID_Discapacidad`) REFERENCES `Discapacidad_Vehiculos` (`ID_Discapacidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehiculos`
--

LOCK TABLES `Vehiculos` WRITE;
/*!40000 ALTER TABLE `Vehiculos` DISABLE KEYS */;
INSERT INTO `Vehiculos` VALUES (1,1,'XYZ123',1,'Corolla','Blanco',NULL,'2025-03-12'),(2,2,'ABC789',2,'Civic','Negro',NULL,'2025-03-12');
/*!40000 ALTER TABLE `Vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-29 19:42:26
