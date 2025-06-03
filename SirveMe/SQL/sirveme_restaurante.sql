-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sirveme
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `restaurante`
--

DROP TABLE IF EXISTS `restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurante` (
  `idRestaurante` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Owner` varchar(45) NOT NULL,
  `Mesero` varchar(45) DEFAULT NULL,
  `Clientes_FKRestaurante` int NOT NULL,
  `Inventario_idProducto` int NOT NULL,
  `Mesas_idMesas` int NOT NULL,
  `Trabajadores_idTrabajador` int NOT NULL,
  PRIMARY KEY (`idRestaurante`,`Clientes_FKRestaurante`,`Inventario_idProducto`,`Mesas_idMesas`,`Trabajadores_idTrabajador`),
  UNIQUE KEY `idRestaurante_UNIQUE` (`idRestaurante`),
  KEY `fk_Restaurante_Clientes_idx` (`Clientes_FKRestaurante`),
  KEY `fk_Restaurante_Inventario1_idx` (`Inventario_idProducto`),
  KEY `fk_Restaurante_Mesas1_idx` (`Mesas_idMesas`),
  KEY `fk_Restaurante_Trabajadores1_idx` (`Trabajadores_idTrabajador`),
  CONSTRAINT `fk_Restaurante_Clientes` FOREIGN KEY (`Clientes_FKRestaurante`) REFERENCES `clientes` (`FKRestaurante`),
  CONSTRAINT `fk_Restaurante_Inventario1` FOREIGN KEY (`Inventario_idProducto`) REFERENCES `inventario` (`idInventario`),
  CONSTRAINT `fk_Restaurante_Mesas1` FOREIGN KEY (`Mesas_idMesas`) REFERENCES `mesas` (`idMesas`),
  CONSTRAINT `fk_Restaurante_Trabajadores1` FOREIGN KEY (`Trabajadores_idTrabajador`) REFERENCES `trabajadores` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurante`
--

LOCK TABLES `restaurante` WRITE;
/*!40000 ALTER TABLE `restaurante` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 17:37:02
