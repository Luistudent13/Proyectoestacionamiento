-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: estacionamiento_universitario
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `asignacion_cajones`
--

DROP TABLE IF EXISTS `asignacion_cajones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion_cajones` (
  `ID_Asignacion` int NOT NULL AUTO_INCREMENT,
  `ID_Cajon` int NOT NULL,
  `ID_Vehiculo` int DEFAULT NULL,
  PRIMARY KEY (`ID_Asignacion`),
  KEY `ID_Cajon` (`ID_Cajon`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  CONSTRAINT `asignacion_cajones_ibfk_1` FOREIGN KEY (`ID_Cajon`) REFERENCES `cajones_estacionamiento` (`ID_Cajon`),
  CONSTRAINT `asignacion_cajones_ibfk_2` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `vehiculos` (`ID_Vehiculo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion_cajones`
--

LOCK TABLES `asignacion_cajones` WRITE;
/*!40000 ALTER TABLE `asignacion_cajones` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacion_cajones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajones_estacionamiento`
--

DROP TABLE IF EXISTS `cajones_estacionamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajones_estacionamiento` (
  `ID_Cajon` int NOT NULL AUTO_INCREMENT,
  `ID_Estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Cajon`),
  KEY `ID_Estado` (`ID_Estado`),
  CONSTRAINT `cajones_estacionamiento_ibfk_1` FOREIGN KEY (`ID_Estado`) REFERENCES `estados_cajones` (`ID_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajones_estacionamiento`
--

LOCK TABLES `cajones_estacionamiento` WRITE;
/*!40000 ALTER TABLE `cajones_estacionamiento` DISABLE KEYS */;
INSERT INTO `cajones_estacionamiento` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `cajones_estacionamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discapacidad_vehiculos`
--

DROP TABLE IF EXISTS `discapacidad_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discapacidad_vehiculos` (
  `ID_Discapacidad` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Discapacidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discapacidad_vehiculos`
--

LOCK TABLES `discapacidad_vehiculos` WRITE;
/*!40000 ALTER TABLE `discapacidad_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `discapacidad_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_cajones`
--

DROP TABLE IF EXISTS `estados_cajones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_cajones` (
  `ID_Estado` int NOT NULL AUTO_INCREMENT,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_cajones`
--

LOCK TABLES `estados_cajones` WRITE;
/*!40000 ALTER TABLE `estados_cajones` DISABLE KEYS */;
INSERT INTO `estados_cajones` VALUES (1,'Disponible'),(2,'Ocupado'),(3,'Reservado'),(4,'Mantenimiento'),(5,'Bloqueado');
/*!40000 ALTER TABLE `estados_cajones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca_vehiculos`
--

DROP TABLE IF EXISTS `marca_vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca_vehiculos` (
  `ID_Marca` int NOT NULL AUTO_INCREMENT,
  `Marca` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Marca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca_vehiculos`
--

LOCK TABLES `marca_vehiculos` WRITE;
/*!40000 ALTER TABLE `marca_vehiculos` DISABLE KEYS */;
INSERT INTO `marca_vehiculos` VALUES (1,'Toyota'),(2,'Honda'),(3,'Chevrolet'),(4,'Mercedes-Benz');
/*!40000 ALTER TABLE `marca_vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_acceso`
--

DROP TABLE IF EXISTS `registros_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_acceso` (
  `ID_Acceso` int NOT NULL AUTO_INCREMENT,
  `ID_Vehiculo` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Hora_Entrada` datetime NOT NULL,
  `Hora_Salida` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Acceso`),
  KEY `ID_Vehiculo` (`ID_Vehiculo`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `registros_acceso_ibfk_1` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `vehiculos` (`ID_Vehiculo`) ON DELETE CASCADE,
  CONSTRAINT `registros_acceso_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_acceso`
--

LOCK TABLES `registros_acceso` WRITE;
/*!40000 ALTER TABLE `registros_acceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `ID_Tipo_Usuario` int NOT NULL AUTO_INCREMENT,
  `Rol` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Administrador'),(2,'Alumno'),(3,'Catedr├ítico');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre_Completo` varchar(100) NOT NULL,
  `ID_Tipo_Usuario` int NOT NULL,
  `Matricula` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL DEFAULT (curdate()),
  `Horario` time DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Correo` (`Correo`),
  UNIQUE KEY `Matricula` (`Matricula`),
  UNIQUE KEY `Telefono` (`Telefono`),
  KEY `ID_Tipo_Usuario` (`ID_Tipo_Usuario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_Tipo_Usuario`) REFERENCES `tipo_usuario` (`ID_Tipo_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (23,'Ricardo Morales',2,'201940004',NULL,NULL,'2025-04-07',NULL),(24,'Luis Aldama',2,'2010000',NULL,NULL,'2025-04-07',NULL),(28,'Luis Aldama',2,'201123123123321',NULL,NULL,'2025-04-07',NULL),(29,'sd 123',2,'35435325',NULL,NULL,'2025-04-07',NULL),(30,'dwq blkn',2,'12323534534',NULL,NULL,'2025-04-07',NULL),(33,'JOSE ALBERTO',2,'46YG73',NULL,NULL,'2025-04-07',NULL),(35,'JOSE ZAPO',3,'13419381',NULL,NULL,'2025-04-07',NULL),(36,'JOSE ZAPO',3,'TFYTVYIV245',NULL,NULL,'2025-04-07',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
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
  CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`) ON DELETE CASCADE,
  CONSTRAINT `vehiculos_ibfk_2` FOREIGN KEY (`ID_Marca`) REFERENCES `marca_vehiculos` (`ID_Marca`),
  CONSTRAINT `vehiculos_ibfk_3` FOREIGN KEY (`ID_Discapacidad`) REFERENCES `discapacidad_vehiculos` (`ID_Discapacidad`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (12,23,'YZX-12-34',4,'','Azul',NULL,'2025-04-07'),(13,28,'SDVS',4,'','Gris',NULL,'2025-04-07'),(14,29,'3124432',3,'','Rojoo',NULL,'2025-04-07'),(15,30,'342',3,'','red',NULL,'2025-04-07'),(19,36,'BUAYDV6343',3,'','Gris',NULL,'2025-04-07');
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07 17:55:02
