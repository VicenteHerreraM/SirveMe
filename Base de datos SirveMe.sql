-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbtest
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add mesa',6,'add_mesa'),(22,'Can change mesa',6,'change_mesa'),(23,'Can delete mesa',6,'delete_mesa'),(24,'Can view mesa',6,'view_mesa'),(25,'Can add bebestibles',7,'add_bebestibles'),(26,'Can change bebestibles',7,'change_bebestibles'),(27,'Can delete bebestibles',7,'delete_bebestibles'),(28,'Can view bebestibles',7,'view_bebestibles'),(29,'Can add entrada',8,'add_entrada'),(30,'Can change entrada',8,'change_entrada'),(31,'Can delete entrada',8,'delete_entrada'),(32,'Can view entrada',8,'view_entrada'),(33,'Can add inventario',9,'add_inventario'),(34,'Can change inventario',9,'change_inventario'),(35,'Can delete inventario',9,'delete_inventario'),(36,'Can view inventario',9,'view_inventario'),(37,'Can add mesas',10,'add_mesas'),(38,'Can change mesas',10,'change_mesas'),(39,'Can delete mesas',10,'delete_mesas'),(40,'Can view mesas',10,'view_mesas'),(41,'Can add plato de fondo',11,'add_platodefondo'),(42,'Can change plato de fondo',11,'change_platodefondo'),(43,'Can delete plato de fondo',11,'delete_platodefondo'),(44,'Can view plato de fondo',11,'view_platodefondo'),(45,'Can add postre',12,'add_postre'),(46,'Can change postre',12,'change_postre'),(47,'Can delete postre',12,'delete_postre'),(48,'Can view postre',12,'view_postre'),(49,'Can add productos',13,'add_productos'),(50,'Can change productos',13,'change_productos'),(51,'Can delete productos',13,'delete_productos'),(52,'Can view productos',13,'view_productos'),(53,'Can add pedidos',14,'add_pedidos'),(54,'Can change pedidos',14,'change_pedidos'),(55,'Can delete pedidos',14,'delete_pedidos'),(56,'Can view pedidos',14,'view_pedidos'),(57,'Can add clientes',15,'add_clientes'),(58,'Can change clientes',15,'change_clientes'),(59,'Can delete clientes',15,'delete_clientes'),(60,'Can view clientes',15,'view_clientes'),(61,'Can add trabajadores',16,'add_trabajadores'),(62,'Can change trabajadores',16,'change_trabajadores'),(63,'Can delete trabajadores',16,'delete_trabajadores'),(64,'Can view trabajadores',16,'view_trabajadores'),(65,'Can add reservas',17,'add_reservas'),(66,'Can change reservas',17,'change_reservas'),(67,'Can delete reservas',17,'delete_reservas'),(68,'Can view reservas',17,'view_reservas'),(69,'Can add permisos',18,'add_permisos'),(70,'Can change permisos',18,'change_permisos'),(71,'Can delete permisos',18,'delete_permisos'),(72,'Can view permisos',18,'view_permisos'),(73,'Can add user',19,'add_customuser'),(74,'Can change user',19,'change_customuser'),(75,'Can delete user',19,'delete_customuser'),(76,'Can view user',19,'view_customuser'),(77,'Can add detalle pedido',20,'add_detallepedido'),(78,'Can change detalle pedido',20,'change_detallepedido'),(79,'Can delete detalle pedido',20,'delete_detallepedido'),(80,'Can view detalle pedido',20,'view_detallepedido'),(81,'Can add agregado salsa',21,'add_agregadosalsa'),(82,'Can change agregado salsa',21,'change_agregadosalsa'),(83,'Can delete agregado salsa',21,'delete_agregadosalsa'),(84,'Can view agregado salsa',21,'view_agregadosalsa');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-24 22:48:14.152072','1','Vicente Herrera (None) ',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',19,1),(2,'2025-05-24 22:48:19.151100','1','Vicente Herrera (admin) ',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',19,1),(3,'2025-05-25 00:55:59.450398','1','Mesas object (1)',1,'[{\"added\": {}}]',10,1),(4,'2025-05-25 00:56:01.343424','2','Mesas object (2)',1,'[{\"added\": {}}]',10,1),(5,'2025-05-25 00:56:02.997506','3','Mesas object (3)',1,'[{\"added\": {}}]',10,1),(6,'2025-05-25 00:56:04.982519','2','Mesas object (2)',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(7,'2025-05-25 00:56:06.952741','1','Mesas object (1)',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(8,'2025-05-25 01:20:12.138267','1','Semola con leche',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',12,1),(9,'2025-05-25 01:20:15.842662','1','Ravioles de jamon queso',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(10,'2025-05-25 01:20:20.425848','3','Crema de zapallo',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(11,'2025-05-25 01:20:21.961053','2','Crema de verduras',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(12,'2025-05-25 01:20:23.756483','1','Ensalada',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(13,'2025-05-25 01:24:10.264346','1','Ensalada',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(14,'2025-05-26 14:47:49.114768','2','Pollo a la mongoliana',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(15,'2025-05-26 14:47:53.921302','3','Carne Mongoliana',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(16,'2025-05-26 14:48:05.115303','1','Ravioles de jamon queso',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(17,'2025-05-26 14:48:14.998138','3','Crema de zapallo',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(18,'2025-05-26 14:48:17.426879','2','Crema de verduras',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(19,'2025-05-26 14:48:19.786951','1','Ensalada',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(20,'2025-05-31 19:09:26.451891','1','Semola con leche',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',12,1),(21,'2025-05-31 21:32:02.591308','1','Mesa 1',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(22,'2025-06-01 00:53:45.814330','1','Semola con leche',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',12,1),(23,'2025-06-01 00:53:52.019821','1','Semola con leche',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',12,1),(24,'2025-06-01 01:01:52.042648','1','Mesa 1',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(25,'2025-06-01 01:01:54.449882','3','Mesa 3',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(26,'2025-06-01 01:01:56.608763','2','Mesa 2',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(27,'2025-06-01 01:02:58.422474','1','Ensalada',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(28,'2025-06-01 01:04:18.486314','3','Carne Mongoliana',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(29,'2025-06-01 01:04:21.878063','1','Ravioles de jamon queso',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(30,'2025-06-01 01:04:24.505384','2','Pollo a la mongoliana',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(31,'2025-06-01 01:14:30.496185','3','Crema de zapallo',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(32,'2025-06-01 01:14:32.849253','2','Crema de verduras',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(33,'2025-06-01 01:14:34.784244','1','Ensalada',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(34,'2025-06-01 01:14:41.259386','1','Semola con leche',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',12,1),(35,'2025-06-01 01:16:52.296141','1','Semola con leche',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',12,1),(36,'2025-06-01 02:30:59.265155','1','Mesa 1',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(37,'2025-06-01 02:31:01.081720','2','Mesa 2',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(38,'2025-06-01 02:31:02.810862','3','Mesa 3',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(39,'2025-06-01 02:31:25.735617','3','Crema de zapallo',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(40,'2025-06-01 02:31:28.660661','2','Crema de verduras',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(41,'2025-06-01 02:31:32.327103','1','Ensalada',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',8,1),(42,'2025-06-01 02:31:38.578171','3','Carne Mongoliana',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(43,'2025-06-01 02:31:40.552230','2','Pollo a la mongoliana',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(44,'2025-06-01 02:31:42.868342','1','Ravioles de jamon queso',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',11,1),(45,'2025-06-01 02:31:56.684226','1','Semola con leche',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',12,1),(46,'2025-06-01 02:57:11.833505','1','Coca-Cola Zero',1,'[{\"added\": {}}]',7,1),(47,'2025-06-03 01:06:35.017216','1','Arroz',1,'[{\"added\": {}}]',21,1),(48,'2025-06-03 01:06:42.793611','2','Papas rusticas',1,'[{\"added\": {}}]',21,1),(49,'2025-06-03 01:06:56.720379','3','Verduras salteadas',1,'[{\"added\": {}}]',21,1),(50,'2025-06-03 01:15:11.492679','1','Mesa 1',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(51,'2025-06-03 01:15:13.092897','2','Mesa 2',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(52,'2025-06-03 01:15:14.917368','3','Mesa 3',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(53,'2025-06-03 02:18:28.465998','4','Salsa bolognesa',1,'[{\"added\": {}}]',21,1),(54,'2025-06-03 02:18:48.489415','5','Pesto',1,'[{\"added\": {}}]',21,1),(55,'2025-06-03 16:42:20.898641','4','Noquis',1,'[{\"added\": {}}]',11,1),(56,'2025-06-03 16:42:50.901311','1','Ravioles de jamon queso',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',11,1),(57,'2025-06-03 16:44:45.541959','1','Coca-Cola Zero',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',7,1),(58,'2025-06-04 03:53:49.445503','1','Mesa 1',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(59,'2025-06-04 03:59:24.345559','3','Mesa 3',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(60,'2025-06-04 03:59:25.538526','3','Mesa 3',2,'[]',10,1),(61,'2025-06-04 03:59:27.055231','2','Mesa 2',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(62,'2025-06-04 03:59:28.405956','1','Mesa 1',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(63,'2025-06-04 04:06:38.410057','1','Mesa 1',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(64,'2025-06-04 04:06:40.346645','2','Mesa 2',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(65,'2025-06-04 04:06:41.886497','3','Mesa 3',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',10,1),(66,'2025-06-09 02:21:25.065364','5','Pesto',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',21,1),(67,'2025-06-09 02:21:26.957410','4','Salsa bolognesa',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',21,1),(68,'2025-06-09 02:21:29.373582','3','Verduras salteadas',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',21,1),(69,'2025-06-09 02:21:31.026154','2','Papas rusticas',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',21,1),(70,'2025-06-09 02:21:33.056198','1','Arroz',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',21,1),(71,'2025-06-09 02:21:34.971593','2','Papas rusticas',2,'[]',21,1),(72,'2025-06-10 20:33:51.000161','1','Coca-Cola Zero',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',7,1),(73,'2025-06-10 21:01:45.172444','58','Orden para mesa  - Estado: listo',2,'[{\"changed\": {\"fields\": [\"Fk mesa\", \"Mesero\"]}}]',14,1),(74,'2025-06-10 21:03:06.451855','58','Orden para mesa  - Estado: listo',3,'',14,1),(75,'2025-06-12 22:39:13.247527','59','Orden para mesa- Estado: listo',2,'[{\"changed\": {\"fields\": [\"Fk mesa\", \"Mesero\"]}}]',14,1),(76,'2025-06-13 01:06:19.715982','69','Orden para mesa 1 - Estado: listo',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',14,1),(77,'2025-06-13 01:13:52.457068','68','Pedido en línea - Estado: listo',3,'',14,1),(78,'2025-06-13 01:13:52.465818','67','Pedido en línea - Estado: listo',3,'',14,1),(79,'2025-06-13 01:13:52.471838','66','Pedido en línea - Estado: listo',3,'',14,1),(80,'2025-06-13 01:13:52.479060','65','Pedido en línea - Estado: listo',3,'',14,1),(81,'2025-06-13 01:13:52.485059','64','Pedido en línea - Estado: listo',3,'',14,1),(82,'2025-06-13 01:13:52.492060','63','Pedido en línea - Estado: listo',3,'',14,1),(83,'2025-06-13 01:13:52.501060','62','Pedido en línea - Estado: listo',3,'',14,1),(84,'2025-06-13 01:24:39.500936','70','Pedido en línea - Estado: listo',3,'',14,1),(85,'2025-06-13 01:30:51.260899','71','Pedido en línea - Estado: listo',3,'',14,1),(86,'2025-06-13 04:44:36.444111','2','Pollo a la mongoliana',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(21,'restaurant','agregadosalsa'),(7,'restaurant','bebestibles'),(20,'restaurant','detallepedido'),(8,'restaurant','entrada'),(9,'restaurant','inventario'),(10,'restaurant','mesas'),(14,'restaurant','pedidos'),(11,'restaurant','platodefondo'),(12,'restaurant','postre'),(13,'restaurant','productos'),(5,'sessions','session'),(6,'TableSelect','mesa'),(15,'users','clientes'),(19,'users','customuser'),(18,'users','permisos'),(17,'users','reservas'),(16,'users','trabajadores');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'TableSelect','0001_initial','2025-05-24 22:32:30.577233'),(2,'restaurant','0001_initial','2025-05-24 22:32:31.795259'),(3,'contenttypes','0001_initial','2025-05-24 22:32:31.876478'),(4,'contenttypes','0002_remove_content_type_name','2025-05-24 22:32:32.095043'),(5,'auth','0001_initial','2025-05-24 22:32:32.646905'),(6,'auth','0002_alter_permission_name_max_length','2025-05-24 22:32:32.779905'),(7,'auth','0003_alter_user_email_max_length','2025-05-24 22:32:32.788906'),(8,'auth','0004_alter_user_username_opts','2025-05-24 22:32:32.798905'),(9,'auth','0005_alter_user_last_login_null','2025-05-24 22:32:32.808905'),(10,'auth','0006_require_contenttypes_0002','2025-05-24 22:32:32.816356'),(11,'auth','0007_alter_validators_add_error_messages','2025-05-24 22:32:32.825897'),(12,'auth','0008_alter_user_username_max_length','2025-05-24 22:32:32.838907'),(13,'auth','0009_alter_user_last_name_max_length','2025-05-24 22:32:32.848911'),(14,'auth','0010_alter_group_name_max_length','2025-05-24 22:32:32.872909'),(15,'auth','0011_update_proxy_permissions','2025-05-24 22:32:32.884910'),(16,'auth','0012_alter_user_first_name_max_length','2025-05-24 22:32:32.894908'),(17,'users','0001_initial','2025-05-24 22:32:34.542303'),(18,'admin','0001_initial','2025-05-24 22:32:34.835094'),(19,'admin','0002_logentry_remove_auto_add','2025-05-24 22:32:34.846095'),(20,'admin','0003_logentry_add_action_flag_choices','2025-05-24 22:32:34.857110'),(21,'restaurant','0002_initial','2025-05-24 22:32:34.995375'),(22,'sessions','0001_initial','2025-05-24 22:32:35.094511'),(23,'restaurant','0003_entrada_cantidad_platodefondo_cantidad_and_more','2025-05-25 00:39:25.526991'),(24,'users','0002_alter_customuser_managers','2025-05-25 00:39:25.538977'),(25,'restaurant','0004_remove_detallepedido_producto_and_more','2025-05-25 00:46:52.590918'),(26,'restaurant','0005_alter_detallepedido_tipo','2025-05-25 01:02:06.942263'),(27,'restaurant','0006_pedidos_cantidad_menus_pedidos_valor_finsemana_and_more','2025-06-01 02:10:32.003241'),(28,'restaurant','0007_alter_pedidos_valor','2025-06-01 02:39:57.488133'),(29,'restaurant','0008_agregadosalsa','2025-06-03 01:04:39.515913'),(30,'restaurant','0009_remove_agregadosalsa_tipo','2025-06-03 01:05:07.798155'),(31,'restaurant','0010_detallepedido_agregadosalsa','2025-06-03 01:18:19.233765'),(32,'restaurant','0011_bebestibles_imagen_platodefondo_imagen','2025-06-03 16:29:22.478924'),(33,'users','0003_clientes_direccion_clientes_numero','2025-06-04 01:15:39.591742'),(34,'restaurant','0012_alter_pedidos_mesero','2025-06-10 20:36:14.715725'),(35,'restaurant','0013_entrada_imagen_postre_imagen','2025-06-13 04:30:00.178261');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0301z4h9qidhtzwfcls105rwyldjlfga','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uOQtY:Lf-njv8BtEg7QcOutX1-7olIhi2OyCHlqe-rLFmt6iU','2025-06-23 01:01:48.627965'),('0obm2gqqtq5xyp6lfloum5wdfx5xc3kk','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uONtk:tml06O3qwt4ltxsk1mTD9igcSoF1heYcDg6GKG3fuNA','2025-06-22 21:49:48.164749'),('42bgm6q7lxazgycd23j6njg4nwc86ogj','.eJxVjDkOwjAUBe_iGlmxvx0nlPScwfqbcQAlUpYKcXeIlALaNzPvZTJua83bonMexJyNN6ffjZAfOu5A7jjeJsvTuM4D2V2xB13sdRJ9Xg7376DiUr-1pgawYWEAFmpZfInOQUpEQCEI96hKXhpgLQClD6kPXaBYYqexdeb9AQqfOI0:1uPx9U:k9KLq0HjX8Ot7DIV6VBRgjNKeNRuZUAnmY_a6crCKDo','2025-06-27 05:40:32.656469'),('6vhyzfvacdidskooh89bpjkqh7tfwyec','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uOSB3:VfYdLPGb2wBxckKugAohbH7uNb9fRpEtkRWWZDZCA3Y','2025-06-23 02:23:57.683793'),('7en8u60fej422cc7lpezj9itasnp5r1n','.eJxVjEEOwiAQAP_C2RAqpYBH730D2WV3bdXQpLQn49-VpAe9zkzmpRLs25T2ymuaSV2UVadfhpAfXJqgO5TbovNStnVG3RJ92KrHhfh5Pdq_wQR1atvYC5Ln3DH2hGaIA1oQpuCZIBgJzlLsBK03WeA7jjZbceaMJE4G9f4AHlE5iQ:1uLZqm:pw5zXdIG7BRn38FyYxiBYDzViSPwyfv61q1WwTXt7H0','2025-06-15 03:59:08.403673'),('8v9p53j1g0vndx2cj8j9a89lt7eqvcpu','.eJxVjDkOwjAUBe_iGlmxvx0nlPScwfqbcQAlUpYKcXeIlALaNzPvZTJua83bonMexJyNN6ffjZAfOu5A7jjeJsvTuM4D2V2xB13sdRJ9Xg7376DiUr-1pgawYWEAFmpZfInOQUpEQCEI96hKXhpgLQClD6kPXaBYYqexdeb9AQqfOI0:1uJ3pu:BNZ2LWpxktTT3wvm-aTmfdNMSMXB-VBdiGzbMeHrWOs','2025-06-08 05:23:50.266472'),('9gbsndi5pzjhbba4ytdhv1bpz1r68s60','.eJxVjLsOAiEQAP-F2pDl5R6W9vcNBPYWOTWQ3KMy_ruSXKHtzGReIsR9K2FfeQnzJC7CiNMvS5EeXLuY7rHemqRWt2VOsifysKsc28TP69H-DUpcS9-SigNqmzRThgwDeGDWyrFNRhGfwQC7L0GLSN4CMmRDCR2BRvTi_QHb5zdo:1uOQs6:01aK5JiT3RRQqJlhvdBsOR8yx-fPF7vyKcOhZe4bq3k','2025-06-23 01:00:18.521909'),('acwh6did1amdb3a9gkjt30ir8owdcfly','.eJxVjMsOwiAQRf-FtSHA8Cgu3fsNZGBAqoYmpV0Z_11JutDtOefeFwu4bzXsPa9hJnZmwE6_LGJ65DYE3bHdFp6Wtq1z5CPhh-38ulB-Xo7276Bir2MtBVhjTLKOMGkq0gKq5FTWxnyZJvQCaLKl-FJoUl4YIIHgoyQXJXt_AN2EN9g:1uOOZI:nR9mS3O2RjmRX_qdeRqrKMoSjQVVLRq52l8QAtTfuaU','2025-06-22 22:32:44.836512'),('cp7sht8e0nkwv5hyw2pesk76z8qnr43h','.eJxVjDkOwjAUBe_iGlmxvx0nlPScwfqbcQAlUpYKcXeIlALaNzPvZTJua83bonMexJyNN6ffjZAfOu5A7jjeJsvTuM4D2V2xB13sdRJ9Xg7376DiUr-1pgawYWEAFmpZfInOQUpEQCEI96hKXhpgLQClD6kPXaBYYqexdeb9AQqfOI0:1uPMRu:DjwDwvgzMB8CRC-0UuheWiom6bhulGsu2lIoahiqx9k','2025-06-25 14:29:06.486261'),('hbozhgrimulzp6265j4p4ihaeioj53ky','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uLX5A:TcmAx6hW2pY0CWORZ4deZY1-dMlBNxGb-3ljvnUo4nk','2025-06-15 01:01:48.726121'),('ocg74rcrvo4tvhtuo9r0ll2bu42pp67i','.eJxVjMsOwiAQRf-FtSHA8Cgu3fsNZGBAqoYmpV0Z_11JutDtOefeFwu4bzXsPa9hJnZmwE6_LGJ65DYE3bHdFp6Wtq1z5CPhh-38ulB-Xo7276Bir2MtBVhjTLKOMGkq0gKq5FTWxnyZJvQCaLKl-FJoUl4YIIHgoyQXJXt_AN2EN9g:1uONnB:LOQXpqY0NNaPjmDuTXxHTzytjv4ulcUpcK5hxcs7NuU','2025-06-22 21:43:01.363775'),('ppfhmkw9x2o2zbg0xrkbzbiw52hp0qyh','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uMU1m:msj4ScYeDuiqqv3TO4EcJEbK8TDR0h3qNEFL3QuZrH8','2025-06-17 15:58:14.996368'),('qdip1wm9hrm5p45xt805krbqs1hgmua8','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uMdbX:3e_RcNjBfiE4jltCX-Vail95oGletlsvvUHAK2W9KEo','2025-06-18 02:11:47.427511'),('qi6arn7s8viiwfqttq7ihvgb63g6ygpv','.eJxVjEEOwiAQAP_C2RAqpYBH730D2WV3bdXQpLQn49-VpAe9zkzmpRLs25T2ymuaSV2UVadfhpAfXJqgO5TbovNStnVG3RJ92KrHhfh5Pdq_wQR1atvYC5Ln3DH2hGaIA1oQpuCZIBgJzlLsBK03WeA7jjZbceaMJE4G9f4AHlE5iQ:1uJZ5c:agvA3g2MKZfcdXvIRJvOtGD4ztAKYbsx-YCSNihrxNQ','2025-06-09 14:46:08.885311'),('rex1gagckgo90p6uvn4njjds7xz1808r','.eJxVjDkOwjAUBe_iGlmxvx0nlPScwfqbcQAlUpYKcXeIlALaNzPvZTJua83bonMexJyNN6ffjZAfOu5A7jjeJsvTuM4D2V2xB13sdRJ9Xg7376DiUr-1pgawYWEAFmpZfInOQUpEQCEI96hKXhpgLQClD6kPXaBYYqexdeb9AQqfOI0:1uJ3Jf:uHEPVOhLEZ772yq6jnOQk8ont08H3T-axEoiF7ptO9g','2025-06-08 04:50:31.476773'),('roodi8q8q7tmavq3zrj4t92xcfyxt13o','.eJxVjDkOwjAUBe_iGlmxvx0nlPScwfqbcQAlUpYKcXeIlALaNzPvZTJua83bonMexJyNN6ffjZAfOu5A7jjeJsvTuM4D2V2xB13sdRJ9Xg7376DiUr-1pgawYWEAFmpZfInOQUpEQCEI96hKXhpgLQClD6kPXaBYYqexdeb9AQqfOI0:1uLTyB:x-ieFcP-iLwmCqkCxG6QTVJ0L0uzOkdGa5wLFyCsYSc','2025-06-14 21:42:23.488968'),('sat13lvkje79irmuzgw84etjo3dbuved','.eJxVjDsOwjAQBe_iGlkm_i4lPWew1l4vDiBHipMKcXcSKQW0M_PeW0RclxrXXuY4krgIL06_LGF-lrYLemC7TzJPbZnHJPdEHrbL20TldT3av4OKvW5rDZazykz2DEMhDAbYcSAI7PNARntjU9AmWOXRbQhcVpiKs9oCaxCfL-xoN6Y:1uPtuN:jQLTYZR86NqpaWr01-8qP0vy0tf1rlTORIkU_y0kWNM','2025-06-27 02:12:43.387503'),('sfqo5r7iz93qxo6ir6juwlc2lh9ffu0t','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uO5eR:_i2N94m0RbrMlQ7ySoZ6kwCnSMOLDN9HXdX3mP1VJE8','2025-06-22 02:20:47.166346'),('vmfkuvjbk08p1u08ch1ridl2a2su5iyr','.eJxVjDkOwjAUBe_iGlmxvx0nlPScwfqbcQAlUpYKcXeIlALaNzPvZTJua83bonMexJyNN6ffjZAfOu5A7jjeJsvTuM4D2V2xB13sdRJ9Xg7376DiUr-1pgawYWEAFmpZfInOQUpEQCEI96hKXhpgLQClD6kPXaBYYqexdeb9AQqfOI0:1uLZtN:SQ6FmcGHMCyeV_RRoxDvdKW0U3aGRgWAypSGjteYCCI','2025-06-15 04:01:49.439195'),('vo0d862y0w6zn4r9fxukjupwvhg29o93','.eJxVjMsOgjAQRf-la9MgfQ5L93yBMWQ60wpq2qTAyvjvQsJCt-ece99iwHUZh3WOdZhYdMKJ0y8LSM-Yd8EPzPciqeSlTkHuiTzsLPvC8XU52r-DEedxWyswiRpKbM7QRkavIdnkGXxy1LJWTpvglfamcWg3BJYaDNEaZSAp2E4Jay2iu94-X2LKOx8:1uPtGB:9KT9CRhfN1K1PfPD_y9GqnyfdqpKvuIoFbfO-e4gHoo','2025-06-27 01:31:11.386774'),('vyiztehoxunx82cf0c6fgm8046euln8e','.eJxNjsEKwjAQRH9F9twYRLz02r9QRDbJEiJJNqTppaX_7qpYe1gYhjezs4DFWhn62wItFBFgyNDYgokEHZTKbrKNH8FBf-ogczKVhBrYoho44uFKku-kJ7fg8ItRbhUdflJ5ivHvbAUSQV_Jo-Mdtll7LiT0lEXrRC6g_o0atbVqlvfvU-eLjcdn8bDe1xfHvUmz:1uPxRD:xzASoTgF6Ap3-3YMyPAUrUIa5h4T0uwnUhF4UWctARE','2025-06-27 05:58:51.324132'),('wscq5hq5hlqd6kjko6r5irabz55klv6j','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uPsTB:yMOh8mrpjTka8qP-C57gz8YKiANVO35AN7CA51mKx-I','2025-06-27 00:40:33.846497'),('y1mcrqg0ch218ju5r60pqymidk9x2q06','.eJxVjEEOwiAQRe_C2pBSygAu3XsGAsyMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hRnEWSpx-txTzg-oO8B7rrcnc6rrMSe6KPGiX14b0vBzu30GJvXzr7FxyEWhiM2al0UJG8h48K82gB2U1GD9OxrHhIRE6nUgjUPTWZmbx_gDjAzgu:1uOOcZ:EH26Tx0jq_h5JZWlobMuBG2TkDV5BcWRis2cOPaek74','2025-06-22 22:36:07.230150'),('z6uk4hmqyxf5mnd4s55jcvf4cwf76892','.eJxVjDkOwjAUBe_iGlmxvx0nlPScwfqbcQAlUpYKcXeIlALaNzPvZTJua83bonMexJyNN6ffjZAfOu5A7jjeJsvTuM4D2V2xB13sdRJ9Xg7376DiUr-1pgawYWEAFmpZfInOQUpEQCEI96hKXhpgLQClD6kPXaBYYqexdeb9AQqfOI0:1uP5SP:xc_jsRunuut-MtC1PkrlNgPiCEFNQlkV2B5LWYqQDCA','2025-06-24 20:20:29.526196');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_agregadosalsa`
--

DROP TABLE IF EXISTS `restaurant_agregadosalsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_agregadosalsa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_agregadosalsa`
--

LOCK TABLES `restaurant_agregadosalsa` WRITE;
/*!40000 ALTER TABLE `restaurant_agregadosalsa` DISABLE KEYS */;
INSERT INTO `restaurant_agregadosalsa` VALUES (1,'Arroz',3),(4,'Salsa bolognesa',5),(5,'Pesto',-1),(6,'Papas mayo',2),(7,'Salsa Alfredo',5);
/*!40000 ALTER TABLE `restaurant_agregadosalsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_bebestibles`
--

DROP TABLE IF EXISTS `restaurant_bebestibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_bebestibles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `tipoBebestible` varchar(100) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_bebestibles`
--

LOCK TABLES `restaurant_bebestibles` WRITE;
/*!40000 ALTER TABLE `restaurant_bebestibles` DISABLE KEYS */;
INSERT INTO `restaurant_bebestibles` VALUES (1,'Coca-Cola Zero',21,1890,'No alcohoica','productos/cc-zerozero-35cl.jpg'),(2,'Sprite',8,1890,'','productos/Sprite_2.png');
/*!40000 ALTER TABLE `restaurant_bebestibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_detallepedido`
--

DROP TABLE IF EXISTS `restaurant_detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_detallepedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `pedido_id` bigint NOT NULL,
  `bebestible_id` bigint DEFAULT NULL,
  `entrada_id` bigint DEFAULT NULL,
  `platoDeFondo_id` bigint DEFAULT NULL,
  `postre_id` bigint DEFAULT NULL,
  `agregadoSalsa_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_detallepe_pedido_id_4b1badf8_fk_restauran` (`pedido_id`),
  KEY `restaurant_detallepe_bebestible_id_fb0fd064_fk_restauran` (`bebestible_id`),
  KEY `restaurant_detallepe_entrada_id_d49e6c48_fk_restauran` (`entrada_id`),
  KEY `restaurant_detallepe_platoDeFondo_id_b952e8e8_fk_restauran` (`platoDeFondo_id`),
  KEY `restaurant_detallepe_postre_id_7d7d16ed_fk_restauran` (`postre_id`),
  KEY `restaurant_detallepe_agregadoSalsa_id_e92de6b0_fk_restauran` (`agregadoSalsa_id`),
  CONSTRAINT `restaurant_detallepe_agregadoSalsa_id_e92de6b0_fk_restauran` FOREIGN KEY (`agregadoSalsa_id`) REFERENCES `restaurant_agregadosalsa` (`id`),
  CONSTRAINT `restaurant_detallepe_bebestible_id_fb0fd064_fk_restauran` FOREIGN KEY (`bebestible_id`) REFERENCES `restaurant_bebestibles` (`id`),
  CONSTRAINT `restaurant_detallepe_entrada_id_d49e6c48_fk_restauran` FOREIGN KEY (`entrada_id`) REFERENCES `restaurant_entrada` (`id`),
  CONSTRAINT `restaurant_detallepe_pedido_id_4b1badf8_fk_restauran` FOREIGN KEY (`pedido_id`) REFERENCES `restaurant_pedidos` (`id`),
  CONSTRAINT `restaurant_detallepe_platoDeFondo_id_b952e8e8_fk_restauran` FOREIGN KEY (`platoDeFondo_id`) REFERENCES `restaurant_platodefondo` (`id`),
  CONSTRAINT `restaurant_detallepe_postre_id_7d7d16ed_fk_restauran` FOREIGN KEY (`postre_id`) REFERENCES `restaurant_postre` (`id`),
  CONSTRAINT `restaurant_detallepedido_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_detallepedido`
--

LOCK TABLES `restaurant_detallepedido` WRITE;
/*!40000 ALTER TABLE `restaurant_detallepedido` DISABLE KEYS */;
INSERT INTO `restaurant_detallepedido` VALUES (1,1,NULL,1,NULL,2,1,1,NULL),(2,5,NULL,2,NULL,1,1,1,NULL),(3,2,NULL,3,NULL,1,1,1,NULL),(4,1,NULL,4,NULL,3,1,1,NULL),(5,1,NULL,5,NULL,2,1,1,NULL),(6,1,NULL,6,NULL,1,1,1,NULL),(7,2,NULL,7,NULL,1,1,1,NULL),(8,1,NULL,7,NULL,3,1,1,NULL),(9,2,NULL,8,NULL,1,1,1,NULL),(10,3,NULL,8,NULL,3,1,1,NULL),(11,2,NULL,9,NULL,1,1,1,NULL),(12,1,NULL,9,NULL,2,1,1,NULL),(13,1,NULL,10,NULL,2,3,1,NULL),(14,1,NULL,11,NULL,2,3,1,NULL),(15,1,NULL,11,NULL,1,2,1,NULL),(16,1,NULL,12,NULL,2,1,1,NULL),(17,1,NULL,12,NULL,2,2,1,NULL),(18,2,NULL,13,NULL,1,2,1,NULL),(19,1,NULL,13,NULL,2,1,1,NULL),(20,1,NULL,14,NULL,1,1,1,NULL),(21,1,NULL,15,NULL,1,1,1,NULL),(22,1,NULL,16,NULL,1,1,1,NULL),(23,1,NULL,17,NULL,2,1,1,NULL),(24,1,NULL,18,NULL,2,2,1,NULL),(25,1,NULL,19,NULL,3,3,NULL,NULL),(26,7,NULL,20,NULL,3,1,NULL,NULL),(27,7,NULL,21,NULL,NULL,3,NULL,NULL),(28,1,NULL,22,NULL,1,3,NULL,NULL),(29,12,NULL,23,NULL,1,2,1,NULL),(30,10,NULL,24,NULL,2,1,1,NULL),(31,14,NULL,25,NULL,3,1,NULL,NULL),(32,14,NULL,25,NULL,2,3,NULL,NULL),(33,14,NULL,25,NULL,2,3,NULL,NULL),(34,14,NULL,25,NULL,3,1,NULL,NULL),(35,14,NULL,25,NULL,2,3,NULL,NULL),(36,1,NULL,26,NULL,2,1,1,NULL),(37,3,NULL,27,NULL,2,1,1,NULL),(38,1,NULL,28,1,1,1,1,NULL),(39,1,NULL,29,1,1,1,1,NULL),(40,2,NULL,30,1,1,2,1,NULL),(41,1,NULL,31,1,2,2,1,NULL),(42,1,NULL,32,1,1,2,1,NULL),(43,1,NULL,33,1,3,2,1,NULL),(44,1,NULL,34,1,3,2,1,NULL),(45,1,NULL,35,1,1,2,1,NULL),(46,1,NULL,36,1,2,3,NULL,NULL),(47,1,NULL,37,1,1,2,NULL,NULL),(48,4,NULL,38,1,3,2,NULL,1),(49,4,NULL,39,1,3,3,NULL,1),(50,1,NULL,40,1,2,1,NULL,5),(51,1,NULL,41,1,2,3,NULL,NULL),(52,1,NULL,42,1,2,3,NULL,1),(53,1,NULL,43,1,1,1,NULL,5),(54,1,NULL,44,1,1,3,NULL,NULL),(55,2,NULL,45,1,1,3,NULL,NULL),(56,1,NULL,46,1,1,1,NULL,5),(57,3,NULL,47,1,2,3,NULL,NULL),(58,1,NULL,48,NULL,3,4,NULL,4),(59,1,NULL,49,NULL,3,1,NULL,4),(60,1,NULL,50,NULL,1,1,1,4),(61,3,NULL,51,NULL,2,1,1,4),(62,2,NULL,52,NULL,1,1,1,5),(63,1,NULL,53,NULL,1,1,1,5),(64,3,NULL,53,NULL,1,3,1,5),(65,2,NULL,54,NULL,1,1,1,NULL),(66,2,NULL,55,NULL,1,2,1,NULL),(67,1,NULL,56,NULL,1,2,1,NULL),(68,1,NULL,56,NULL,2,3,1,NULL),(69,2,NULL,57,NULL,1,1,1,5),(70,1,NULL,57,NULL,2,1,1,4),(73,1,'fondo',59,NULL,NULL,1,NULL,NULL),(74,1,'bebestible',59,1,NULL,NULL,NULL,NULL),(75,2,NULL,60,1,2,2,1,1),(76,1,NULL,61,1,1,3,1,6),(77,2,NULL,61,1,1,4,1,5),(92,1,NULL,69,1,1,3,NULL,1),(97,1,'fondo',72,NULL,NULL,1,NULL,NULL),(98,1,'bebestible',72,1,NULL,NULL,NULL,NULL),(99,2,NULL,73,1,1,2,1,6),(100,2,NULL,74,2,2,4,1,5);
/*!40000 ALTER TABLE `restaurant_detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_entrada`
--

DROP TABLE IF EXISTS `restaurant_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_entrada` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_entrada`
--

LOCK TABLES `restaurant_entrada` WRITE;
/*!40000 ALTER TABLE `restaurant_entrada` DISABLE KEYS */;
INSERT INTO `restaurant_entrada` VALUES (1,'Ensalada',14,''),(2,'Crema de verduras',14,''),(3,'Crema de zapallo',23,NULL);
/*!40000 ALTER TABLE `restaurant_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_inventario`
--

DROP TABLE IF EXISTS `restaurant_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_inventario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `proovedor` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` int NOT NULL,
  `valorPorPorcion` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_inventario`
--

LOCK TABLES `restaurant_inventario` WRITE;
/*!40000 ALTER TABLE `restaurant_inventario` DISABLE KEYS */;
INSERT INTO `restaurant_inventario` VALUES (1,'Leche entera','Lider','Lider',5,5290,600),(3,'Jugo de Mango','Guayarauco','Lider',5,3590,1100);
/*!40000 ALTER TABLE `restaurant_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_mesas`
--

DROP TABLE IF EXISTS `restaurant_mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_mesas` (
  `idMesas` int NOT NULL AUTO_INCREMENT,
  `numeroMesa` int DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idMesas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_mesas`
--

LOCK TABLES `restaurant_mesas` WRITE;
/*!40000 ALTER TABLE `restaurant_mesas` DISABLE KEYS */;
INSERT INTO `restaurant_mesas` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `restaurant_mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_pedidos`
--

DROP TABLE IF EXISTS `restaurant_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_pedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `valor` int DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  `fk_mesa_id` int DEFAULT NULL,
  `mesero_id` bigint DEFAULT NULL,
  `cantidad_menus` int unsigned NOT NULL,
  `valor_finsemana` int NOT NULL,
  `valor_semana` int NOT NULL,
  `valor_total` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_pedidos_fk_mesa_id_e361b6a8_fk_restauran` (`fk_mesa_id`),
  KEY `restaurant_pedidos_mesero_id_039c61e2_fk_users_customuser_id` (`mesero_id`),
  CONSTRAINT `restaurant_pedidos_fk_mesa_id_e361b6a8_fk_restauran` FOREIGN KEY (`fk_mesa_id`) REFERENCES `restaurant_mesas` (`idMesas`),
  CONSTRAINT `restaurant_pedidos_mesero_id_039c61e2_fk_users_customuser_id` FOREIGN KEY (`mesero_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `restaurant_pedidos_chk_1` CHECK ((`cantidad_menus` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_pedidos`
--

LOCK TABLES `restaurant_pedidos` WRITE;
/*!40000 ALTER TABLE `restaurant_pedidos` DISABLE KEYS */;
INSERT INTO `restaurant_pedidos` VALUES (1,'2025-05-25 01:02:14.916234',0,'finalizado',2,2,0,15990,12990,0),(2,'2025-05-25 01:05:22.209590',0,'finalizado',1,2,0,15990,12990,0),(3,'2025-05-25 01:23:22.453093',0,'finalizado',1,2,0,15990,12990,0),(4,'2025-05-25 01:24:30.779816',0,'finalizado',1,1,0,15990,12990,0),(5,'2025-05-25 01:26:54.926715',0,'finalizado',3,2,0,15990,12990,0),(6,'2025-05-25 04:35:55.040857',0,'finalizado',2,2,0,15990,12990,0),(7,'2025-05-25 04:57:42.231985',0,'finalizado',1,2,0,15990,12990,0),(8,'2025-05-25 04:57:58.431012',0,'finalizado',1,2,0,15990,12990,0),(9,'2025-05-25 04:58:16.030867',0,'finalizado',1,2,0,15990,12990,0),(10,'2025-05-25 05:19:55.916982',0,'finalizado',1,2,0,15990,12990,0),(11,'2025-05-25 05:24:32.767003',0,'finalizado',1,2,0,15990,12990,0),(12,'2025-05-25 05:31:10.425520',0,'finalizado',3,1,0,15990,12990,0),(13,'2025-05-26 14:46:28.618328',0,'finalizado',1,2,0,15990,12990,0),(14,'2025-05-31 21:43:42.910384',0,'finalizado',2,2,0,15990,12990,0),(15,'2025-05-31 21:47:44.853774',0,'finalizado',2,2,0,15990,12990,0),(16,'2025-05-31 21:48:41.030539',0,'finalizado',2,2,0,15990,12990,0),(17,'2025-06-01 00:48:27.699466',0,'finalizado',1,2,0,15990,12990,0),(18,'2025-06-01 01:02:06.607684',0,'finalizado',2,1,0,15990,12990,0),(19,'2025-06-01 01:03:09.494485',0,'finalizado',1,2,0,15990,12990,0),(20,'2025-06-01 01:03:22.349471',0,'finalizado',2,1,0,15990,12990,0),(21,'2025-06-01 01:03:32.598403',0,'finalizado',2,1,0,15990,12990,0),(22,'2025-06-01 01:16:00.443236',0,'finalizado',1,2,0,15990,12990,0),(23,'2025-06-01 01:16:21.642829',0,'finalizado',1,2,0,15990,12990,0),(24,'2025-06-01 01:17:01.031588',0,'finalizado',1,2,0,15990,12990,0),(25,'2025-06-01 01:18:46.764471',0,'finalizado',3,2,0,15990,12990,0),(26,'2025-06-01 02:40:03.517432',NULL,'finalizado',3,2,1,15990,12990,15990),(27,'2025-06-01 02:46:12.437970',NULL,'finalizado',3,2,3,15990,12990,47970),(28,'2025-06-01 02:57:21.792045',NULL,'finalizado',3,2,1,15990,12990,15990),(29,'2025-06-01 03:42:06.050755',NULL,'finalizado',3,2,1,15990,12990,17880),(30,'2025-06-01 03:57:39.010189',NULL,'finalizado',1,2,2,15990,12990,35760),(31,'2025-06-03 01:00:58.620713',NULL,'finalizado',2,2,1,15990,12990,14880),(32,'2025-06-03 01:23:09.186904',NULL,'finalizado',1,2,1,15990,12990,14880),(33,'2025-06-03 17:27:10.693883',NULL,'finalizado',2,2,1,15990,12990,14880),(34,'2025-06-03 17:27:29.228336',NULL,'finalizado',2,2,1,15990,12990,14880),(35,'2025-06-04 03:48:56.408504',NULL,'finalizado',1,2,1,15990,12990,14880),(36,'2025-06-04 03:54:08.506659',NULL,'finalizado',1,1,1,15990,12990,14880),(37,'2025-06-04 03:55:38.862511',NULL,'finalizado',2,2,1,15990,12990,14880),(38,'2025-06-04 03:58:02.897641',NULL,'finalizado',3,2,4,15990,12990,59520),(39,'2025-06-04 03:59:51.536928',NULL,'finalizado',3,1,4,15990,12990,59520),(40,'2025-06-04 04:06:52.935864',NULL,'finalizado',1,2,1,15990,12990,14880),(41,'2025-06-04 04:10:20.822496',NULL,'finalizado',2,2,1,15990,12990,14880),(42,'2025-06-04 04:10:55.984291',NULL,'finalizado',3,2,1,15990,12990,14880),(43,'2025-06-04 14:28:00.007637',NULL,'finalizado',1,2,1,15990,12990,14880),(44,'2025-06-04 14:40:07.731981',NULL,'finalizado',1,2,1,15990,12990,14880),(45,'2025-06-07 23:53:37.253815',NULL,'finalizado',1,2,2,15990,12990,35760),(46,'2025-06-08 00:06:27.857754',NULL,'finalizado',1,2,1,15990,12990,17880),(47,'2025-06-08 00:11:21.256167',NULL,'finalizado',2,2,3,15990,12990,53640),(48,'2025-06-08 21:43:12.851214',NULL,'finalizado',1,2,1,15990,12990,15990),(49,'2025-06-08 21:45:50.313167',NULL,'finalizado',1,2,1,15990,12990,15990),(50,'2025-06-08 21:47:53.414567',NULL,'finalizado',1,2,1,15990,12990,15990),(51,'2025-06-08 22:33:34.666051',NULL,'finalizado',1,2,3,15990,12990,47970),(52,'2025-06-09 00:49:11.667041',NULL,'finalizado',1,2,2,15990,12990,25980),(53,'2025-06-09 00:54:51.124835',NULL,'finalizado',2,2,4,15990,12990,51960),(54,'2025-06-09 00:59:44.242254',NULL,'finalizado',1,2,2,15990,12990,25980),(55,'2025-06-09 01:04:24.288143',NULL,'finalizado',1,2,2,15990,12990,25980),(56,'2025-06-09 01:07:20.273867',NULL,'finalizado',2,2,2,15990,12990,25980),(57,'2025-06-09 02:22:36.671678',NULL,'finalizado',1,2,3,15990,12990,38970),(59,'2025-06-11 14:40:12.774571',NULL,'listo',2,2,0,15990,12990,1890),(60,'2025-06-11 14:42:36.191757',NULL,'finalizado',2,2,2,15990,12990,29760),(61,'2025-06-11 14:43:10.075391',NULL,'finalizado',1,2,3,15990,12990,44640),(69,'2025-06-13 01:04:39.155880',NULL,'finalizado',1,2,1,15990,12990,14880),(72,'2025-06-13 01:31:11.343752',NULL,'Finalizado',NULL,NULL,0,15990,12990,1890),(73,'2025-06-13 05:40:44.137728',NULL,'finalizado',1,2,2,15990,12990,29760),(74,'2025-06-13 05:42:08.357911',NULL,'finalizado',1,2,2,15990,12990,29760);
/*!40000 ALTER TABLE `restaurant_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_platodefondo`
--

DROP TABLE IF EXISTS `restaurant_platodefondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_platodefondo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_platodefondo`
--

LOCK TABLES `restaurant_platodefondo` WRITE;
/*!40000 ALTER TABLE `restaurant_platodefondo` DISABLE KEYS */;
INSERT INTO `restaurant_platodefondo` VALUES (1,'Ravioles de jamon queso',29,'productos/Ravioles.png'),(2,'Pollo a la mongoliana',10,'productos/Pollo_Mongoliano.jpg'),(3,'Carne Mongoliana',17,'productos/Carne_mongoliana_ZOUUVrR.jpg'),(4,'Noquis',19,'productos/Noquis.png');
/*!40000 ALTER TABLE `restaurant_platodefondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_postre`
--

DROP TABLE IF EXISTS `restaurant_postre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_postre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_postre`
--

LOCK TABLES `restaurant_postre` WRITE;
/*!40000 ALTER TABLE `restaurant_postre` DISABLE KEYS */;
INSERT INTO `restaurant_postre` VALUES (1,'Semola con leche',16,'');
/*!40000 ALTER TABLE `restaurant_postre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_productos`
--

DROP TABLE IF EXISTS `restaurant_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_productos` (
  `idProductos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `agregados` varchar(100) NOT NULL,
  `tipoProducto` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idProductos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_productos`
--

LOCK TABLES `restaurant_productos` WRITE;
/*!40000 ALTER TABLE `restaurant_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_productos` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableselect_mesa`
--

LOCK TABLES `tableselect_mesa` WRITE;
/*!40000 ALTER TABLE `tableselect_mesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tableselect_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_clientes`
--

DROP TABLE IF EXISTS `users_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `region` varchar(100) DEFAULT NULL,
  `comuna` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_clientes`
--

LOCK TABLES `users_clientes` WRITE;
/*!40000 ALTER TABLE `users_clientes` DISABLE KEYS */;
INSERT INTO `users_clientes` VALUES (1,'Kaylah','Harris','zzz@gmail.com','1q2w3e','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `rut` varchar(12) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `comuna` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `rut` (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser`
--

LOCK TABLES `users_customuser` WRITE;
/*!40000 ALTER TABLE `users_customuser` DISABLE KEYS */;
INSERT INTO `users_customuser` VALUES (1,'pbkdf2_sha256$600000$aB9m5EErzXr4XDaJzALORO$1itxU+od/7JnOHL5G37D5Q8Mc/3jJ/saZJFujsINgZk=','2025-06-13 15:04:39.596712',1,'Vicente','Herrera',1,1,'2025-05-24 22:47:34.000000',NULL,'aaa@gmail.com',NULL,'admin','Achupallas 1234','Santiago','Providencia'),(2,'pbkdf2_sha256$600000$vXbcJ4jcBoqHRSDLzGSs1A$m4x/8feKgZyyQaG/07hNAyQTWm1urolgk9gWVTWD/fI=','2025-06-13 05:40:32.646470',0,'Alex','Tintor',0,1,'2025-05-24 22:50:02.182180',NULL,'bbb@gmail.com',NULL,'mesero',NULL,NULL,NULL),(3,'pbkdf2_sha256$600000$BA91C7f1Z559phQ80nviT4$cC8BywmvGHIyVYtwgQhRqJ+dMOk6tR1jykLiFSZ9s3g=','2025-06-13 05:40:22.776235',0,'Alex','Tintor',0,1,'2025-05-25 01:07:57.618229',NULL,'a.tintor304@gmail.com',NULL,'cocinero',NULL,NULL,NULL),(4,'pbkdf2_sha256$600000$GvMYxDxhecIi7F3F1ogcva$vBhf2jADo4e5FERW/VP8x8ps0vYS+U/9+hPDLbGnjrE=',NULL,0,'John','Titor',0,1,'2025-05-26 14:39:05.802884',NULL,'ccc@gmail.com','22.222.222-2','cocinero',NULL,NULL,NULL),(5,'pbkdf2_sha256$600000$zxRXxcDoa8isD2u7XMiMLW$mrVPQOFXHGgZhJjNcw1hNVRf9rRF/u1NFqnNY+0Mrf8=','2025-06-03 03:09:52.375869',0,'Marcelo','Mcknight',0,1,'2025-06-03 03:09:43.589491',NULL,'xxx@gmail.com',NULL,'cliente',NULL,NULL,NULL),(6,'pbkdf2_sha256$600000$O6VRQ6JYrc0UWtfl6YTLTU$tCFpAMCsUGmX2w/iiuboOQTInmX3buu8v89DsDIXqec=','2025-06-04 14:43:35.247633',0,'Lilianna','Bernard',0,1,'2025-06-03 21:04:44.443056',NULL,'fff@gmail.com',NULL,'cliente',NULL,NULL,NULL),(7,'pbkdf2_sha256$600000$SarP7PSGW6gvWxDEdk7u6W$7++CJOjYeHY+IEvKNnAsDqRhDEdVE0GduvDAokai1PA=','2025-06-13 15:03:28.347108',0,'Travis','Touchdown',0,1,'2025-06-08 01:09:48.528808',NULL,'ddd@gmail.com',NULL,'cliente','asgeragsdfse','Santiago','Ñuñoa'),(8,'pbkdf2_sha256$600000$jpakgT8pekY94Gwi58olP0$hA1PUbnY7qaODdID0td++y7KL+5GafYYrkU8QjOcqOg=','2025-06-11 14:49:43.310482',0,'Alex','Delarge',0,1,'2025-06-11 14:25:15.771571',NULL,'kexago5231@jio1.com',NULL,'cliente','Achupallas 123','Quilpué','Quilpué');
/*!40000 ALTER TABLE `users_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_groups`
--

LOCK TABLES `users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `users_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_user_permissions`
--

LOCK TABLES `users_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permisos`
--

DROP TABLE IF EXISTS `users_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_permisos` (
  `idPermisos` int NOT NULL AUTO_INCREMENT,
  `fk_cocinero_id` int NOT NULL,
  `fk_mesa_id` int NOT NULL,
  `fk_mesero_id` int NOT NULL,
  `fk_trabajador_id` int NOT NULL,
  PRIMARY KEY (`idPermisos`),
  KEY `users_permisos_fk_cocinero_id_ffb92ac4_fk_users_tra` (`fk_cocinero_id`),
  KEY `users_permisos_fk_mesa_id_86fedd2f_fk_restaurant_mesas_idMesas` (`fk_mesa_id`),
  KEY `users_permisos_fk_mesero_id_a888b753_fk_users_tra` (`fk_mesero_id`),
  KEY `users_permisos_fk_trabajador_id_b53b9ec4_fk_users_tra` (`fk_trabajador_id`),
  CONSTRAINT `users_permisos_fk_cocinero_id_ffb92ac4_fk_users_tra` FOREIGN KEY (`fk_cocinero_id`) REFERENCES `users_trabajadores` (`idTrabajador`),
  CONSTRAINT `users_permisos_fk_mesa_id_86fedd2f_fk_restaurant_mesas_idMesas` FOREIGN KEY (`fk_mesa_id`) REFERENCES `restaurant_mesas` (`idMesas`),
  CONSTRAINT `users_permisos_fk_mesero_id_a888b753_fk_users_tra` FOREIGN KEY (`fk_mesero_id`) REFERENCES `users_trabajadores` (`idTrabajador`),
  CONSTRAINT `users_permisos_fk_trabajador_id_b53b9ec4_fk_users_tra` FOREIGN KEY (`fk_trabajador_id`) REFERENCES `users_trabajadores` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permisos`
--

LOCK TABLES `users_permisos` WRITE;
/*!40000 ALTER TABLE `users_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_reservas`
--

DROP TABLE IF EXISTS `users_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_reservas` (
  `idReservas` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `hora` time(6) NOT NULL,
  `cantidadPersonas` int NOT NULL,
  `fk_cliente_id` int NOT NULL,
  `fk_mesa_id` int NOT NULL,
  PRIMARY KEY (`idReservas`),
  KEY `users_reservas_fk_cliente_id_9e33907c_fk_users_cli` (`fk_cliente_id`),
  KEY `users_reservas_fk_mesa_id_3278a442_fk_restaurant_mesas_idMesas` (`fk_mesa_id`),
  CONSTRAINT `users_reservas_fk_cliente_id_9e33907c_fk_users_cli` FOREIGN KEY (`fk_cliente_id`) REFERENCES `users_clientes` (`idCliente`),
  CONSTRAINT `users_reservas_fk_mesa_id_3278a442_fk_restaurant_mesas_idMesas` FOREIGN KEY (`fk_mesa_id`) REFERENCES `restaurant_mesas` (`idMesas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_reservas`
--

LOCK TABLES `users_reservas` WRITE;
/*!40000 ALTER TABLE `users_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_trabajadores`
--

DROP TABLE IF EXISTS `users_trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_trabajadores` (
  `idTrabajador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `fk_mesa_id` int DEFAULT NULL,
  PRIMARY KEY (`idTrabajador`),
  KEY `users_trabajadores_fk_mesa_id_11807d53_fk_restauran` (`fk_mesa_id`),
  CONSTRAINT `users_trabajadores_fk_mesa_id_11807d53_fk_restauran` FOREIGN KEY (`fk_mesa_id`) REFERENCES `restaurant_mesas` (`idMesas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_trabajadores`
--

LOCK TABLES `users_trabajadores` WRITE;
/*!40000 ALTER TABLE `users_trabajadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_trabajadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-13 11:09:52
