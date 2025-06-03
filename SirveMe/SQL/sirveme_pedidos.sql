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
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `IdPedido` int NOT NULL AUTO_INCREMENT,
  `Mesa` int NOT NULL,
  `Fecha` datetime NOT NULL,
  `Valor` int NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `DetallePedido_idDetallePedido` int NOT NULL,
  `Bebestibles_idBebestible` int NOT NULL,
  `Postres_idPostre` int NOT NULL,
  `PlatosDeFondo_idPlatoDeFondo` int NOT NULL,
  `Entradas_idEntrada` int NOT NULL,
  PRIMARY KEY (`IdPedido`),
  UNIQUE KEY `IdPedido_UNIQUE` (`IdPedido`),
  UNIQUE KEY `Fecha_UNIQUE` (`Fecha`),
  KEY `fk_Pedidos_Bebestibles1_idx` (`Bebestibles_idBebestible`),
  KEY `fk_Pedidos_Postres1_idx` (`Postres_idPostre`),
  KEY `fk_Pedidos_PlatosDeFondo1_idx` (`PlatosDeFondo_idPlatoDeFondo`),
  KEY `fk_Pedidos_Entradas1_idx` (`Entradas_idEntrada`),
  CONSTRAINT `fk_Pedidos_Bebestibles1` FOREIGN KEY (`Bebestibles_idBebestible`) REFERENCES `bebestibles` (`idBebestible`),
  CONSTRAINT `fk_Pedidos_Entradas1` FOREIGN KEY (`Entradas_idEntrada`) REFERENCES `entradas` (`idEntrada`),
  CONSTRAINT `fk_Pedidos_PlatosDeFondo1` FOREIGN KEY (`PlatosDeFondo_idPlatoDeFondo`) REFERENCES `platosdefondo` (`idPlatoDeFondo`),
  CONSTRAINT `fk_Pedidos_Postres1` FOREIGN KEY (`Postres_idPostre`) REFERENCES `postres` (`idPostre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
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
