CREATE DATABASE  IF NOT EXISTS `joinme` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `joinme`;
-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: aws-mysql.cmcpkzqjzdkd.us-west-2.rds.amazonaws.com    Database: joinme
-- ------------------------------------------------------
-- Server version	8.0.19

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `activity_images`
--

DROP TABLE IF EXISTS `activity_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_images` (
  `image_id` int unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int unsigned NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_id_UNIQUE` (`image_id`),
  KEY `activity_images_idx` (`activity_id`),
  CONSTRAINT `activity_images` FOREIGN KEY (`activity_id`) REFERENCES `created_activity_list` (`activity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_images`
--

LOCK TABLES `activity_images` WRITE;
/*!40000 ALTER TABLE `activity_images` DISABLE KEYS */;
INSERT INTO `activity_images` VALUES (29,550,'','550.jpg','2019-04-04 18:35:08'),(30,552,'','552.jpg','2019-04-05 14:54:55'),(31,553,'','553.jpg','2019-04-05 14:59:31'),(33,555,'','555.jpg','2019-04-06 14:49:54');
/*!40000 ALTER TABLE `activity_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_message`
--

DROP TABLE IF EXISTS `activity_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_message` (
  `activity_message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `message` varchar(45) NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(1) NOT NULL DEFAULT 'x',
  `reply_user_message_id` int DEFAULT NULL,
  PRIMARY KEY (`activity_message_id`),
  UNIQUE KEY `idactivity_message_id_UNIQUE` (`activity_message_id`),
  KEY `activity_id_idx` (`activity_id`),
  CONSTRAINT `activity_id` FOREIGN KEY (`activity_id`) REFERENCES `created_activity_list` (`activity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_message`
--

LOCK TABLES `activity_message` WRITE;
/*!40000 ALTER TABLE `activity_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_request`
--

DROP TABLE IF EXISTS `activity_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_request` (
  `activity_request_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `requested_activity_name` varchar(100) DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(2) NOT NULL,
  PRIMARY KEY (`activity_request_id`),
  UNIQUE KEY `activity_request_id_UNIQUE` (`activity_request_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id_activity_request` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_request`
--

LOCK TABLES `activity_request` WRITE;
/*!40000 ALTER TABLE `activity_request` DISABLE KEYS */;
INSERT INTO `activity_request` VALUES (4,62,'garba','2019-02-15 13:29:41','n');
/*!40000 ALTER TABLE `activity_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_status`
--

DROP TABLE IF EXISTS `app_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_status` (
  `app_status_id` int unsigned NOT NULL,
  `app_download` int unsigned DEFAULT NULL,
  `web_app_visit` int unsigned DEFAULT NULL,
  `app_visit` int unsigned DEFAULT NULL,
  PRIMARY KEY (`app_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_status`
--

LOCK TABLES `app_status` WRITE;
/*!40000 ALTER TABLE `app_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contact_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `friend_id` int unsigned NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `contact_f_idx` (`user_id`),
  CONSTRAINT `contact_foreign_key` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (11,70,65),(12,70,62),(13,70,76),(14,70,67),(15,70,66),(16,70,63),(17,70,68),(18,70,71),(19,63,76),(20,75,76),(21,79,70),(22,62,76),(23,62,70),(24,76,70),(25,64,76),(26,76,62),(27,64,62),(28,76,63);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `created_activity_list`
--

DROP TABLE IF EXISTS `created_activity_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `created_activity_list` (
  `activity_id` int unsigned NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(100) DEFAULT NULL,
  `activity_description` varchar(700) DEFAULT NULL,
  `status` char(1) DEFAULT 'A',
  `tag_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `activity_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cost` int unsigned DEFAULT NULL,
  `lat` varchar(30) DEFAULT NULL,
  `lng` varchar(30) DEFAULT NULL,
  `count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`activity_id`),
  UNIQUE KEY `activity_id_UNIQUE` (`activity_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `tag_id_idx` (`tag_id`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `created_activity_list`
--

LOCK TABLES `created_activity_list` WRITE;
/*!40000 ALTER TABLE `created_activity_list` DISABLE KEYS */;
INSERT INTO `created_activity_list` VALUES (56,'Hackfest Jabalpur','Central India\'s largest Hackathon','a',246,70,'2019-01-12 09:15:00','2019-01-12 12:06:51',0,'23.162148','79.919966',35),(57,'Grand Diwali Mela','Celebrate diwali in grand new style','\0',248,62,'2019-10-27 22:00:00','2019-01-12 18:27:59',2000,'28.599455564417937','77.37464522213747',54),(58,'Holi hai','celebrate holi with celebs','\0',249,76,'2018-03-02 10:00:00','2019-01-12 18:32:11',2500,'19.164606155478296','73.12400152382338',26),(60,'Indian F1 Grand Prix','The Indian Grand Prix was a Formula One race in the calendar of the FIA Formula One World Championship, which was held at the Buddh International Circuit in Sector 25 along Yamuna Expressway in Gautam Buddh Nagar district of Uttar Pradesh State.','a',308,76,'2019-03-31 10:30:00','2019-03-18 19:11:09',5000,'28.348422',' 77.532377',17),(72,'Bhopal Accounting Meetup','This will be a group whose main motive will be for the enrichment and development of Accounting, Commerce and Business Studies for Grades XI & XII. It will cover the CBSE, ISC and IGCSE Curriculum/Curricula. Its main focus will be on the conceptual aspects of the subject especially Accounting so that the students derive fun- learning and enjoyment while dealing with this subject.','A',277,62,'2019-04-05 12:51:02','2019-04-05 12:51:02',NULL,'23.276572112071356','77.435081688531',2),(73,'Bhopal Entrepreneurship Meetup','Bhopal Entrepreneurship Meetup Group is a non-profit youth-driven platform enabling Entrepreneurs/Startups to learn and grow from each other leading to greater business success.','A',277,62,'2019-04-05 12:51:02','2019-04-05 12:51:02',NULL,'23.237617107705827','77.42873110574942',1),(74,'The Road Trips Co - Bhopal','We are a family of road trippers who come together quite often on and off the road! So if you\'re looking to road trip with a bunch of like minded individuals and families, we\'d be happy to open our doors to you. There\'s at least one overnight drive organized each month; with chapter meetups and breakfast / brunch drives.','A',277,62,'2019-04-05 12:51:02','2019-04-05 12:51:02',NULL,'23.265450711629672','77.46392168802481',2),(75,'Bhopal Trekking and JT2 (Summers) Meetup','This is a group for anyone interested in hiking, rock climbing, camping, ,solo travelling, etc. All skills levels are welcome. I started this group because to meet other outdoor enthusiasts. Looking forward to exploring the outdoors with everybody.”','A',277,62,'2019-04-05 12:51:02','2019-04-05 12:51:02',NULL,'23.252912758456752','77.45070376199942',0),(76,'Bhopal Women in Machine Learning & Data Science','We are the Bhopal chapter of WiMLDS (http://www.wimlds.org) interested in learning about technologies like Machine Learning, Artificial Intelligence and the broader umbrella term encompassing Data Science. This group\'s mission is to support and promote women and gender minorities who are practicing, studying or are interested in the fields of ML and Data Science, and to grow the community in Bhopal.','A',277,62,'2019-04-05 12:51:02','2019-04-05 12:51:02',NULL,'23.222233173536452','77.45636858743887',0),(77,'Bhopal International Friends Meetup','This group is meant for foreigners, expats, folks who have spent significant amount of time outside India and want to socialize with like minded people on multiple fronts, be it technology, business, family, travel, music, social gatherings, cultural exchanges.','A',277,62,'2019-04-05 12:51:02','2019-04-05 12:51:02',NULL,'23.2530704758827','77.46117510599356',3),(79,'LNCT  photography club','Live life, take pictures,  relive memories,repeat','\0',304,62,'2019-04-30 13:00:00','2019-04-05 13:02:27',0,'23.251011143705963','77.524926940819',10),(80,'LNCT Photo phactory','I walk, I look, I see, I stop, I photograph','\0',304,62,'2019-04-30 13:00:00','2019-04-05 13:05:38',500,'23.251065811149207','77.52437146534317',6),(81,'code chef','Turn your interest in Tech ,into a productive skill','\0',300,62,'2019-04-26 14:00:00','2019-04-05 13:08:51',100,'23.41327884412648','77.30719524090637',3),(82,'Web development ','Learn HTML, CSS, Javascript, Nodejs,Java ','\0',300,62,'2019-04-26 14:00:00','2019-04-05 13:15:36',0,'22.755501590632726','77.72868702263168',2),(83,'The Artsy Lens Photography Club','The Artsy Lens Lifestyle Photography captures the celebrations, milestones & highlights of your lives! Creativity. It\'s endless. I want to capture your loved ones ','\0',304,62,'2019-04-09 18:00:00','2019-04-05 15:48:56',50,'23.2301290926779','77.43376072211151',1),(84,'Clash of chess','Its a fun game that makes you knowledgable, thinker, communicators, principled, risk takers, balanced and reflective','\0',298,62,'2019-04-11 12:00:00','2019-04-05 16:00:16',0,'23.86139938968917','77.21022558125003',6),(85,'Lavanya','houses exercise equipment for the purpose of physical exercise','\0',299,62,'2019-04-16 08:00:00','2019-04-05 16:03:03',1450,'22.76166940806826','75.90649969372248',2),(86,'LimeLight','Take more chances, dance more dances','\0',306,62,'2019-05-05 18:00:00','2019-04-05 16:05:32',100,'25.215999725769848','75.93312078889949',2),(87,'American Protege','The American Protégé International Vocal Competition is designed for singers who would like to challenge themselves in a very competitive environment. The Competition is open to solo vocalists and vocal groups of all ages, nationalities and countries.','\0',307,62,'2019-06-21 04:04:00','2019-04-05 16:11:10',20000,'47.176485483937974','-118.52137943477709',5),(88,'Dance Deewane','Dance Deewane (translation: Dance Lovers) is an Indian dance competition reality television show that gives opportunity for three different generations. ','\0',291,62,'2019-04-10 17:30:00','2019-04-05 16:21:25',1000,'19.036856537299215','73.03542089375003',2),(89,'India\'s Best Dramebaaz','India\'s Best Dramebaaz is an talent-search Indian reality television show on Zee TV which has children between the ages of 415 years as the participants.','\0',292,62,'2019-04-18 12:00:00','2019-04-05 16:25:30',500,'18.495940764347413','73.21120214375003',3),(90,'Code Beta','TCS CodeVita, a programming contest, is TCS\' way of attracting young impressionable college students to adopt this culture and experience joy of ...\r\n','\0',300,62,'2019-04-27 10:30:00','2019-04-05 16:27:37',100,'13.555941955520318','77.86940526875003',3),(91,'JOY Dil Se','\"Joy Dil Se\" is an open platform for artists and creative people. We try to provide platforms to showcase the talent like Poetry, Singing, stand-up comedy, ','\0',301,62,'2019-04-18 18:00:00','2019-04-05 16:34:50',0,'22.852815570567188','72.94753026875003',4),(92,'Java Developer Required','For kulchuri Software solutions pvt. ltd.','\0',283,62,'2019-04-12 17:00:00','2019-04-05 16:49:10',0,'22.994477040627096','77.47389745625003',1),(550,'PUBG','KHELO PUBG','\0',273,76,'2019-04-14 11:11:00','2019-04-04 18:34:52',0,'18.10499267639794','73.34134828957065',1),(551,'Meri Aawaz','an open mic event for young talents','\0',57,63,'2019-04-07 20:00:00','2019-04-05 12:40:58',0,'23','78',6),(552,'code vita','TCS CodeVita, a programming contest, is TCS\' way of attracting young impressionable college students to adopt this culture','\0',300,76,'2019-04-21 10:30:00','2019-04-05 14:54:41',100,'28.351691866306293','76.96683657082065',5),(553,'Cricket Tournament','Gully cricket tournament','\0',293,76,'2019-04-15 09:22:00','2019-04-05 14:59:11',100,'22.699604614381702','75.8954580193971',1),(555,'Musicians fest','musicians (especially a flute player','\0',54,87,'2019-04-14 11:11:00','2019-04-06 14:49:49',0,'24.12401495763931','78.25159054907306',0);
/*!40000 ALTER TABLE `created_activity_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_name` varchar(45) NOT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `event_id_UNIQUE` (`event_id`),
  UNIQUE KEY `event_name_UNIQUE` (`event_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (21,'Club'),(19,'Competition'),(18,'Devotional'),(10,'Festival Celebration'),(14,'Games'),(9,'Hackathons'),(17,'Jobs'),(20,'Learn Art'),(8,'Live Show'),(11,'Meetups'),(16,'Rent'),(13,'Sell and Buy'),(12,'Studies'),(15,'Tourism');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notification_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `activity_id` int unsigned NOT NULL,
  `status` varchar(2) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  UNIQUE KEY `notification_id_UNIQUE` (`notification_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `activity_id_idx` (`activity_id`),
  CONSTRAINT `activity_id_notification` FOREIGN KEY (`activity_id`) REFERENCES `created_activity_list` (`activity_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id_notification` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2518 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (9,70,56,'n','someone selected your activity','2019-01-12 19:56:01'),(16,70,56,'n','someone selected your activity','2019-02-15 13:27:54'),(17,76,58,'r','someone selected your activity','2019-04-03 12:31:55'),(20,70,56,'n','someone selected your activity','2019-03-30 15:19:07'),(2483,70,60,'n','Lokesh shared this Activity. Check it!','2019-04-04 18:47:49'),(2484,62,60,'r','Lokesh shared this Activity. Check it!','2019-04-06 10:59:22'),(2485,63,60,'n','Lokesh shared this Activity. Check it!','2019-04-04 18:47:51'),(2486,70,551,'n','Jatin created new Activity. Check it!','2019-04-05 12:40:58'),(2487,76,551,'n','Jatin created new Activity. Check it!','2019-04-05 12:40:58'),(2488,70,552,'n','Lokesh created new Activity. Check it!','2019-04-05 14:54:41'),(2489,63,552,'n','Lokesh created new Activity. Check it!','2019-04-05 14:54:42'),(2490,75,552,'n','Lokesh created new Activity. Check it!','2019-04-05 14:54:43'),(2491,62,552,'n','Lokesh created new Activity. Check it!','2019-04-05 14:54:43'),(2492,64,552,'n','Lokesh created new Activity. Check it!','2019-04-05 14:54:44'),(2493,70,553,'n','Lokesh created new Activity. Check it!','2019-04-05 14:59:12'),(2494,63,553,'n','Lokesh created new Activity. Check it!','2019-04-05 14:59:12'),(2495,75,553,'n','Lokesh created new Activity. Check it!','2019-04-05 14:59:12'),(2496,62,553,'n','Lokesh created new Activity. Check it!','2019-04-05 14:59:12'),(2497,64,553,'n','Lokesh created new Activity. Check it!','2019-04-05 14:59:12'),(2498,70,58,'n','Lokesh shared this Activity. Check it!','2019-04-06 10:57:05'),(2499,62,58,'n','Lokesh shared this Activity. Check it!','2019-04-06 10:57:06'),(2500,63,58,'n','Lokesh shared this Activity. Check it!','2019-04-06 10:57:06'),(2501,70,60,'n','Lokesh shared this Activity. Check it!','2019-04-06 10:58:16'),(2503,63,60,'n','Lokesh shared this Activity. Check it!','2019-04-06 10:58:16'),(2504,70,58,'n','Lokesh shared this Activity. Check it!','2019-04-06 11:41:33'),(2505,62,58,'n','Lokesh shared this Activity. Check it!','2019-04-06 11:41:34'),(2506,63,58,'n','Lokesh shared this Activity. Check it!','2019-04-06 11:41:34'),(2512,63,551,'n','someone selected your activity','2019-04-06 14:48:35'),(2513,76,552,'n','someone selected your activity','2019-04-06 15:46:17'),(2514,76,57,'n','Sudhanshu shared this Activity. Check it!','2020-07-04 10:05:11'),(2515,70,57,'n','Sudhanshu shared this Activity. Check it!','2020-07-04 10:05:11'),(2516,76,57,'n','Sudhanshu shared this Activity. Check it!','2020-07-04 10:05:17'),(2517,70,57,'n','Sudhanshu shared this Activity. Check it!','2020-07-04 10:05:17');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_activity_list`
--

DROP TABLE IF EXISTS `selected_activity_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selected_activity_list` (
  `selected_activity_list_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity_id` int unsigned NOT NULL,
  `status` char(2) NOT NULL DEFAULT 'AA',
  `feedback_message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`selected_activity_list_id`),
  UNIQUE KEY `idselected_activity_list_id_UNIQUE` (`selected_activity_list_id`),
  KEY `activity_id_idx` (`activity_id`),
  CONSTRAINT `select_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `created_activity_list` (`activity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_activity_list`
--

LOCK TABLES `selected_activity_list` WRITE;
/*!40000 ALTER TABLE `selected_activity_list` DISABLE KEYS */;
INSERT INTO `selected_activity_list` VALUES (60,76,'2019-01-12 19:56:00',56,'AA','its a good hackathon for aspiring entrepreneur'),(63,62,'2019-01-31 16:31:09',57,'AA','ghcvhjvjh'),(67,62,'2019-02-15 13:27:54',56,'AA',''),(71,76,'2019-03-10 22:00:17',57,'AA',''),(73,76,'2019-03-15 19:26:05',58,'AA','I Love Holi....'),(74,62,'2019-03-25 20:01:46',58,'AA',''),(75,63,'2019-03-27 09:29:51',60,'AA',''),(76,76,'2019-03-27 12:32:22',60,'AA',''),(77,64,'2019-03-30 15:19:07',56,'AA',''),(78,64,'2019-03-30 15:19:15',60,'AA',''),(79,87,'2019-04-06 14:48:34',551,'AA',''),(80,76,'2019-04-06 15:46:17',552,'AA','');
/*!40000 ALTER TABLE `selected_activity_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) NOT NULL,
  `tag_description` varchar(300) DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tag_image` varchar(100) DEFAULT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_id_UNIQUE` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (54,'music concert ',NULL,'2019-01-11 02:19:03',NULL,8),(55,'Dance show',NULL,'2019-01-11 02:19:03',NULL,8),(56,'Acts ',NULL,'2019-01-11 02:19:03',NULL,8),(57,'Open Mic',NULL,'2019-01-11 02:19:03',NULL,8),(58,'Puppet Show',NULL,'2019-01-11 02:19:03',NULL,8),(244,'College Level',NULL,'2019-01-11 02:58:29',NULL,9),(245,'Job Level',NULL,'2019-01-11 02:58:29',NULL,9),(246,'Code challenge',NULL,'2019-01-11 02:58:29',NULL,9),(247,'StartUps',NULL,'2019-01-11 02:58:29',NULL,9),(248,'Diwali',NULL,'2019-01-11 02:58:29',NULL,10),(249,'Holi',NULL,'2019-01-11 02:58:29',NULL,10),(250,'New Year',NULL,'2019-01-11 02:58:29',NULL,10),(251,'Christmas',NULL,'2019-01-11 02:58:29',NULL,10),(252,'valentine\'s day',NULL,'2019-01-11 02:58:29',NULL,10),(253,'eid',NULL,'2019-01-11 02:58:29',NULL,10),(254,'Reunion',NULL,'2019-01-11 02:58:29',NULL,11),(255,'Dating',NULL,'2019-01-11 02:58:29',NULL,11),(256,'Cultural MeetUps',NULL,'2019-01-11 02:58:29',NULL,11),(257,'Tourist',NULL,'2019-01-11 02:58:29',NULL,11),(258,'Coding',NULL,'2019-01-11 02:58:29',NULL,12),(259,'Math',NULL,'2019-01-11 02:58:29',NULL,12),(260,'Chemistry',NULL,'2019-01-11 02:58:29',NULL,12),(261,'English',NULL,'2019-01-11 02:58:29',NULL,12),(262,'Social Science',NULL,'2019-01-11 02:58:29',NULL,12),(263,'Handwriting',NULL,'2019-01-11 02:58:29',NULL,12),(264,'Geography',NULL,'2019-01-11 02:58:29',NULL,12),(265,'Business ',NULL,'2019-01-11 02:58:29',NULL,12),(266,'IOT',NULL,'2019-01-11 02:58:29',NULL,12),(267,'Sell',NULL,'2019-01-11 02:58:29',NULL,13),(268,'Buy',NULL,'2019-01-11 02:58:29',NULL,13),(269,'Indoor',NULL,'2019-01-11 02:58:29',NULL,14),(270,'Outdoor',NULL,'2019-01-11 02:58:29',NULL,14),(271,'Physical',NULL,'2019-01-11 02:58:29',NULL,14),(272,'Races',NULL,'2019-01-11 02:58:29',NULL,14),(273,'Pubg',NULL,'2019-01-11 02:58:29',NULL,14),(274,'Couchsurfing',NULL,'2019-01-11 02:58:29',NULL,15),(275,'Hitchhiking',NULL,'2019-01-11 02:58:29',NULL,15),(276,'Priority Things For Travel(CHEAP)',NULL,'2019-01-11 02:58:29',NULL,15),(277,'Meetups',NULL,'2019-01-11 02:58:29',NULL,15),(278,'Things TODO',NULL,'2019-01-11 02:58:29',NULL,15),(279,'Room',NULL,'2019-01-11 02:58:29',NULL,16),(280,'Flats',NULL,'2019-01-11 02:58:29',NULL,16),(281,'Vehicle',NULL,'2019-01-11 02:58:29',NULL,16),(282,'Equipment',NULL,'2019-01-11 02:58:29',NULL,16),(283,'Full Time',NULL,'2019-01-11 02:58:29',NULL,17),(284,'Part Time',NULL,'2019-01-11 02:58:29',NULL,17),(285,'Work From Home',NULL,'2019-01-11 02:58:29',NULL,17),(286,'IT',NULL,'2019-01-11 02:58:29',NULL,17),(287,'Managemant',NULL,'2019-01-11 02:58:29',NULL,17),(288,'Special pooja',NULL,'2019-01-11 02:58:29',NULL,18),(289,'Bhajan',NULL,'2019-01-11 02:58:29',NULL,18),(290,'Statsang',NULL,'2019-01-11 02:58:29',NULL,18),(291,'Dance',NULL,'2019-01-11 02:58:29',NULL,19),(292,'Acting',NULL,'2019-01-11 02:58:29',NULL,19),(293,'Cricket',NULL,'2019-01-11 02:58:29',NULL,19),(294,'FootBall',NULL,'2019-01-11 02:58:29',NULL,19),(295,'art and craft',NULL,'2019-01-11 02:58:29',NULL,20),(296,'Singing',NULL,'2019-01-11 02:58:29',NULL,20),(298,'Chess',NULL,'2019-01-11 02:58:29',NULL,21),(299,'Gym',NULL,'2019-01-11 02:58:29',NULL,21),(300,'Coading',NULL,'2019-01-11 13:09:59',NULL,19),(301,'Open Mic',NULL,'2019-01-11 13:09:59',NULL,19),(302,'Dance',NULL,'2019-01-11 13:09:59',NULL,20),(303,'Singing',NULL,'2019-01-11 13:09:59',NULL,20),(304,'Photography',NULL,'2019-01-11 02:58:29',NULL,21),(305,'Coading',NULL,'2019-01-11 13:10:00',NULL,21),(306,'Dancing',NULL,'2019-01-12 12:56:47',NULL,21),(307,'Singing',NULL,'2019-01-12 12:56:48',NULL,21),(308,'Racing','','2019-01-12 12:58:59','',19);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `about` varchar(500) DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(45) NOT NULL,
  `rating` int DEFAULT NULL,
  `coins` int DEFAULT NULL,
  `lat` varchar(30) DEFAULT '-15',
  `lng` varchar(30) DEFAULT '80',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `unique_id_UNIQUE` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (62,'sud','Sudhanshu','Gour','1998-12-03','sudhanshugour@gmail.com','8109049748','m','Interested in game development','2018-10-25 14:25:20','8109049748',0,0,'26.3063911887964','79.77764677914126'),(63,'jatin','Jatin','Namdev','1997-06-24','jatinnamdev24@gmail.com','7047059357','m','Worker','2018-10-25 14:25:20','7047059357',0,0,'23','78'),(64,'ashu','Lokesh','Sarathe',NULL,NULL,'7999753211','m',NULL,'2018-10-25 14:25:20','7999753211',NULL,NULL,'23','78'),(65,'sumit','Sumit','Mishra',NULL,NULL,'7049458212','m',NULL,'2018-10-25 14:31:05','7049458212',NULL,NULL,NULL,NULL),(66,'akshay','Akshay','Upadhyay',NULL,NULL,'8982405026','m',NULL,'2018-10-25 14:31:05','8982405026',NULL,NULL,NULL,NULL),(67,'ajay','Ajay','Singh','1997-10-25',NULL,'9752342810','m','','2018-10-25 14:31:05','9752342810',7,NULL,NULL,NULL),(68,'akash','Akash','jain',NULL,NULL,'7987295842','m',NULL,'2018-10-25 14:44:27','7987295842',NULL,NULL,NULL,NULL),(69,'akshat','Akshat','Tamrakar',NULL,NULL,'8962303313','m',NULL,'2018-10-25 14:44:27','8962303313',NULL,NULL,NULL,NULL),(70,'aman','Aman','Gupta',NULL,NULL,'9754810898','m',NULL,'2018-10-25 14:44:27','9754810898',NULL,NULL,'23','78'),(71,'geetu','Geetesh','Namdev',NULL,NULL,'8839835430','m',NULL,'2018-10-25 14:44:27','8839835430',NULL,NULL,NULL,NULL),(72,'loki','lok','lok',NULL,NULL,'8888888888','m',NULL,'2018-10-26 21:10:36','8888888888',0,0,NULL,NULL),(73,'sudha','sssss','sssss',NULL,NULL,'9999999999','m',NULL,'2018-10-26 21:20:12','9999999999',0,0,NULL,NULL),(74,'vijit','vijit','wedigt',NULL,NULL,'9911221122','m',NULL,'2018-10-29 18:09:11','9911221122',0,0,NULL,NULL),(75,'rajeshrai','Rajesh','Rai',NULL,NULL,'1234543216','m',NULL,'2018-10-29 18:26:34','9993166917',0,0,NULL,NULL),(76,'lokesh','Lokesh','Sarathe','1997-10-18','lokesh.sarathe.560@gmail.com','7748993409','m','Student, interested in web and mobile app development','2018-10-29 18:45:00','7748993409',0,0,'23','78'),(77,'rajesh','Rajesh','Rai',NULL,NULL,'9993166917','m',NULL,'2018-10-29 19:34:41','@0126it96#',0,0,NULL,NULL),(78,'sabdar','sabdar','khan',NULL,NULL,'9300480696','m',NULL,'2018-10-30 11:11:21','123456789',0,0,NULL,NULL),(79,'sumitmishra','Sumit','Mishra',NULL,NULL,'8770341360','m',NULL,'2018-10-30 14:48:11','asdfghhbvvc@1',0,0,NULL,NULL),(80,'rahul','rahul','kumar',NULL,NULL,'9589668780','m',NULL,'2018-12-10 19:39:58','9589668780Rahul@123',0,0,NULL,NULL),(81,'sud1','sud','sud',NULL,NULL,'8888888887','m',NULL,'2019-01-01 19:29:45','8888888887',0,0,NULL,NULL),(82,'swati','swati','gour',NULL,NULL,'8871016454','f',NULL,'2019-01-01 19:31:53','887101645',0,0,NULL,NULL),(83,'sanjeet','Sanjeet','Anand',NULL,NULL,'8319395305','m',NULL,'2019-01-09 13:40:59','8319395305',0,0,NULL,NULL),(84,'anand','anand','sajeet',NULL,NULL,'8987045110','m',NULL,'2019-01-09 13:44:13','8987045110',0,0,NULL,NULL),(85,'riyabg','riya','george',NULL,NULL,'8989160267','f',NULL,'2019-02-12 16:36:07','riya123456',0,0,NULL,NULL),(86,'roopal','roopal','buwade',NULL,'roopal@gmail.com','8517099913','f','student','2019-02-15 12:57:57','roopal123',0,0,NULL,NULL),(87,'rashmi','rashmi','dubey',NULL,NULL,'9584035516','m',NULL,'2019-02-15 14:54:19','rashmi1234',0,0,NULL,NULL),(88,'ozas','ozas','sahu',NULL,NULL,'8989238560','\0',NULL,'2019-03-04 14:03:19','12345678',0,0,NULL,NULL),(89,'workspace','priyank','jain',NULL,NULL,'8050088219','\0',NULL,'2019-04-06 15:01:50','12345678',0,0,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_message` (
  `user_message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int unsigned NOT NULL,
  `reciever_id` int unsigned NOT NULL,
  `message` varchar(100) NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT 'x',
  PRIMARY KEY (`user_message_id`),
  UNIQUE KEY `idactivity_message_id_UNIQUE` (`user_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
INSERT INTO `user_message` VALUES (1,76,62,'gfch bn','2019-04-04 12:15:52','x'),(2,76,62,'hi','2019-04-04 12:16:03','x'),(3,62,76,'hello','2019-04-04 12:16:47','x'),(4,76,62,'hi','2019-04-04 12:16:52','x'),(5,76,70,'sdfgh','2019-04-04 14:40:30','x'),(6,76,70,'sdfgh','2019-04-04 14:40:37','x'),(7,76,62,'hi','2019-04-04 14:41:52','x'),(8,76,62,'sendsadfgh','2019-04-04 14:42:21','x'),(9,62,76,'lokesh','2019-04-04 14:42:49','x'),(10,76,62,'sendsadfgh','2019-04-04 14:42:54','x'),(11,76,62,'hello sud','2019-04-05 11:43:55','x'),(12,63,76,'hlo\r\n','2019-04-05 11:45:38','x'),(13,76,63,'hi','2019-04-05 11:45:58','x'),(14,76,62,'asrdtfygjhkj,','2019-04-05 13:40:16','x'),(15,62,76,'asdfghjkl;','2019-04-05 13:53:45','x'),(16,62,76,'hello\r\n','2019-04-06 11:34:09','x'),(17,76,63,'srijan is here\r\n','2019-04-06 13:09:02','x');
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-29 12:43:21
