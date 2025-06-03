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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `idAdministrator` int NOT NULL,
  `Inventario_idInventario` int NOT NULL,
  PRIMARY KEY (`idAdministrator`),
  KEY `fk_Administrator_Inventario1_idx` (`Inventario_idInventario`),
  CONSTRAINT `fk_Administrator_Inventario1` FOREIGN KEY (`Inventario_idInventario`) REFERENCES `inventario` (`idInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add mesa',7,'add_mesa'),(26,'Can change mesa',7,'change_mesa'),(27,'Can delete mesa',7,'delete_mesa'),(28,'Can view mesa',7,'view_mesa');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bebestibles`
--

DROP TABLE IF EXISTS `bebestibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebestibles` (
  `idBebestible` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idBebestible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebestibles`
--

LOCK TABLES `bebestibles` WRITE;
/*!40000 ALTER TABLE `bebestibles` DISABLE KEYS */;
/*!40000 ALTER TABLE `bebestibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `FKRestaurante` int NOT NULL AUTO_INCREMENT,
  `IDCliente` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Region` varchar(45) NOT NULL,
  `Comuna` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Reservas_idReservas` int NOT NULL,
  PRIMARY KEY (`FKRestaurante`),
  UNIQUE KEY `IDCliente_UNIQUE` (`IDCliente`),
  UNIQUE KEY `Password_UNIQUE` (`Password`),
  UNIQUE KEY `Correo_UNIQUE` (`Correo`),
  KEY `fk_Clientes_Reservas1_idx` (`Reservas_idReservas`),
  CONSTRAINT `fk_Clientes_Reservas1` FOREIGN KEY (`Reservas_idReservas`) REFERENCES `reservas` (`idReservas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'TableSelect','mesa');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'TableSelect','0001_initial','2025-05-11 23:15:10.486879'),(2,'contenttypes','0001_initial','2025-05-11 23:15:10.577217'),(3,'auth','0001_initial','2025-05-11 23:15:12.154882'),(4,'admin','0001_initial','2025-05-11 23:15:12.456497'),(5,'admin','0002_logentry_remove_auto_add','2025-05-11 23:15:12.467497'),(6,'admin','0003_logentry_add_action_flag_choices','2025-05-11 23:15:12.477496'),(7,'contenttypes','0002_remove_content_type_name','2025-05-11 23:15:12.687654'),(8,'auth','0002_alter_permission_name_max_length','2025-05-11 23:15:12.802940'),(9,'auth','0003_alter_user_email_max_length','2025-05-11 23:15:12.899698'),(10,'auth','0004_alter_user_username_opts','2025-05-11 23:15:12.905700'),(11,'auth','0005_alter_user_last_login_null','2025-05-11 23:15:12.999904'),(12,'auth','0006_require_contenttypes_0002','2025-05-11 23:15:13.004901'),(13,'auth','0007_alter_validators_add_error_messages','2025-05-11 23:15:13.013905'),(14,'auth','0008_alter_user_username_max_length','2025-05-11 23:15:13.207297'),(15,'auth','0009_alter_user_last_name_max_length','2025-05-11 23:15:13.476449'),(16,'auth','0010_alter_group_name_max_length','2025-05-11 23:15:13.630653'),(17,'auth','0011_update_proxy_permissions','2025-05-11 23:15:13.641656'),(18,'auth','0012_alter_user_first_name_max_length','2025-05-11 23:15:13.769165'),(19,'sessions','0001_initial','2025-05-11 23:15:13.843351');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `idEntrada` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idEntrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idInventario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `Proveedor` varchar(45) NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio` int NOT NULL,
  `ValorPorPorcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idInventario`),
  UNIQUE KEY `idProducto_UNIQUE` (`idInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kds`
--

DROP TABLE IF EXISTS `kds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds` (
  `idKDS` int NOT NULL,
  `Pedidos_IdPedido` int NOT NULL,
  PRIMARY KEY (`idKDS`),
  KEY `fk_KDS_Pedidos1_idx` (`Pedidos_IdPedido`),
  CONSTRAINT `fk_KDS_Pedidos1` FOREIGN KEY (`Pedidos_IdPedido`) REFERENCES `pedidos` (`IdPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kds`
--

LOCK TABLES `kds` WRITE;
/*!40000 ALTER TABLE `kds` DISABLE KEYS */;
/*!40000 ALTER TABLE `kds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `idMesas` int NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Pedidos_IdPedido` int NOT NULL,
  PRIMARY KEY (`idMesas`),
  UNIQUE KEY `idMesas_UNIQUE` (`idMesas`),
  KEY `fk_Mesas_Pedidos1_idx` (`Pedidos_IdPedido`),
  CONSTRAINT `fk_Mesas_Pedidos1` FOREIGN KEY (`Pedidos_IdPedido`) REFERENCES `pedidos` (`IdPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `pedidos_has_productostienda`
--

DROP TABLE IF EXISTS `pedidos_has_productostienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_has_productostienda` (
  `Pedidos_IdPedido` int NOT NULL,
  `ProductosTienda_idProductosTienda` int NOT NULL,
  PRIMARY KEY (`Pedidos_IdPedido`,`ProductosTienda_idProductosTienda`),
  KEY `fk_Pedidos_has_ProductosTienda_ProductosTienda1_idx` (`ProductosTienda_idProductosTienda`),
  KEY `fk_Pedidos_has_ProductosTienda_Pedidos1_idx` (`Pedidos_IdPedido`),
  CONSTRAINT `fk_Pedidos_has_ProductosTienda_Pedidos1` FOREIGN KEY (`Pedidos_IdPedido`) REFERENCES `pedidos` (`IdPedido`),
  CONSTRAINT `fk_Pedidos_has_ProductosTienda_ProductosTienda1` FOREIGN KEY (`ProductosTienda_idProductosTienda`) REFERENCES `productos` (`idProductosTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_has_productostienda`
--

LOCK TABLES `pedidos_has_productostienda` WRITE;
/*!40000 ALTER TABLE `pedidos_has_productostienda` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_has_productostienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosmesero`
--

DROP TABLE IF EXISTS `pedidosmesero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidosmesero` (
  `idPedidosMesero` int NOT NULL,
  `Pedidos_IdPedido` int NOT NULL,
  PRIMARY KEY (`idPedidosMesero`),
  KEY `fk_PedidosMesero_Pedidos1_idx` (`Pedidos_IdPedido`),
  CONSTRAINT `fk_PedidosMesero_Pedidos1` FOREIGN KEY (`Pedidos_IdPedido`) REFERENCES `pedidos` (`IdPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosmesero`
--

LOCK TABLES `pedidosmesero` WRITE;
/*!40000 ALTER TABLE `pedidosmesero` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidosmesero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `idPermisos` int NOT NULL,
  `Permisoscol` varchar(45) DEFAULT NULL,
  `Permisoscol1` varchar(45) DEFAULT NULL,
  `KDS_idKDS` int NOT NULL,
  `PedidosMesero_idPedidosMesero` int NOT NULL,
  `Administrator_idAdministrator` int NOT NULL,
  PRIMARY KEY (`idPermisos`),
  KEY `fk_Permisos_KDS1_idx` (`KDS_idKDS`),
  KEY `fk_Permisos_PedidosMesero1_idx` (`PedidosMesero_idPedidosMesero`),
  KEY `fk_Permisos_Administrator1_idx` (`Administrator_idAdministrator`),
  CONSTRAINT `fk_Permisos_Administrator1` FOREIGN KEY (`Administrator_idAdministrator`) REFERENCES `administrator` (`idAdministrator`),
  CONSTRAINT `fk_Permisos_KDS1` FOREIGN KEY (`KDS_idKDS`) REFERENCES `kds` (`idKDS`),
  CONSTRAINT `fk_Permisos_PedidosMesero1` FOREIGN KEY (`PedidosMesero_idPedidosMesero`) REFERENCES `pedidosmesero` (`idPedidosMesero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platosdefondo`
--

DROP TABLE IF EXISTS `platosdefondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platosdefondo` (
  `idPlatoDeFondo` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPlatoDeFondo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platosdefondo`
--

LOCK TABLES `platosdefondo` WRITE;
/*!40000 ALTER TABLE `platosdefondo` DISABLE KEYS */;
/*!40000 ALTER TABLE `platosdefondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postres`
--

DROP TABLE IF EXISTS `postres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postres` (
  `idPostre` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPostre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postres`
--

LOCK TABLES `postres` WRITE;
/*!40000 ALTER TABLE `postres` DISABLE KEYS */;
/*!40000 ALTER TABLE `postres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProductosTienda` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Agregado/Salsa` varchar(45) NOT NULL,
  `TipoProducto` varchar(45) NOT NULL,
  `Cantidad` int NOT NULL,
  PRIMARY KEY (`idProductosTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `idReservas` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `CantidadPersonas` int NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`idReservas`),
  UNIQUE KEY `idReservas_UNIQUE` (`idReservas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tableselect_mesa`
--

DROP TABLE IF EXISTS `tableselect_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tableselect_mesa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` int unsigned NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  CONSTRAINT `tableselect_mesa_chk_1` CHECK ((`numero` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableselect_mesa`
--

LOCK TABLES `tableselect_mesa` WRITE;
/*!40000 ALTER TABLE `tableselect_mesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tableselect_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `idTrabajador` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Rol` varchar(45) NOT NULL,
  `Permisos_idPermisos` int NOT NULL,
  PRIMARY KEY (`idTrabajador`,`Permisos_idPermisos`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idTrabajador`),
  UNIQUE KEY `Correo_UNIQUE` (`Correo`),
  UNIQUE KEY `Password_UNIQUE` (`Password`),
  KEY `fk_Trabajadores_Permisos1_idx` (`Permisos_idPermisos`),
  CONSTRAINT `fk_Trabajadores_Permisos1` FOREIGN KEY (`Permisos_idPermisos`) REFERENCES `permisos` (`idPermisos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 17:37:57
