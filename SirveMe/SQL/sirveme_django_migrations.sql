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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 17:37:04
