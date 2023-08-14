-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: hindiwor_Ashish
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `hindiwor_Ashish`
--


--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(1) NOT NULL,
  `is_superadmin` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`, `username`, `password`, `level`, `is_superadmin`) VALUES (1,'admin','9c99ea17ef6f233bf515953c811d555b',1,'Y');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `an` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parents` varchar(100) COLLATE utf8_unicode_ci DEFAULT '|',
  `parentsarray` text COLLATE utf8_unicode_ci,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `child` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `list_ord` int(1) DEFAULT '0',
  `ord` int(4) DEFAULT '0',
  `flag_new` int(2) DEFAULT '0',
  `flag_updated` int(2) DEFAULT '0',
  `flag_hot` int(2) DEFAULT '0',
  `files` int(5) DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_parents_index` (`parents`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_history`
--

DROP TABLE IF EXISTS `download_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(8) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `extension` varchar(4) DEFAULT NULL,
  `hits` int(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `df` (`date`,`file_id`),
  KEY `download_history_date_index` (`date`),
  KEY `download_history_FI_1` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_history`
--

LOCK TABLES `download_history` WRITE;
/*!40000 ALTER TABLE `download_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `download_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `singer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(9) DEFAULT '0',
  `today` int(5) DEFAULT '0',
  `download` int(6) DEFAULT '0',
  `extension` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ord` int(4) DEFAULT '0',
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_file_name_index` (`file_name`),
  KEY `files_category_id_index` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_history`
--

DROP TABLE IF EXISTS `log_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(8) DEFAULT '0',
  `host` int(6) DEFAULT '0',
  `hits` int(6) DEFAULT '0',
  `download` int(8) DEFAULT '0',
  `files` varchar(255) COLLATE utf8_unicode_ci DEFAULT '|',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_history`
--

LOCK TABLES `log_history` WRITE;
/*!40000 ALTER TABLE `log_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hits` int(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `df` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `device` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` (`id`, `meta`, `description`, `value`, `device`, `updated_at`) VALUES (1,'TITLE','Bhojpuri Songs, Hitt Songs, Free Download, Movie Songs, Chaita Songs, Hitt Gana',':: Bhojpuri Songs, Hitt Songs, Free Download, Movie Songs, Chaita Songs, Hitt Gana','P','2020-04-28 07:12:05'),(2,'THUMB_DOMAIN','','https://hindiworth.com/siteuploads/thumb','P','2020-04-28 07:06:02'),(3,'ONLINE_COUNTER','VALUE=ON, OFF','OFF','P','2017-01-05 12:29:47'),(4,'CATEGORY_PER_PAGE','','15','P','2017-01-11 05:47:12'),(5,'FILES_PER_PAGE','','10','P','2017-01-11 05:47:34'),(6,'ADVT_AFTER_EACH_FILES','','3','P','2016-09-30 15:46:09'),(7,'MOB_DATA_DOMAIN','','https://hindiworth.com/siteuploads','P','2020-04-28 07:05:25'),(8,'UPDATES_PER_PAGE','','20','P','2016-09-30 15:46:27'),(9,'PC_DATA_DOMAIN','','https://hindiworth.com/siteuploads','P','2020-04-28 07:05:39'),(10,'FEATURED_FILES','','5','P','2017-01-01 00:42:48'),(11,'WALLPAPER_SIZE','','128x160,176x220,240x320,,240x400,320x240,320x480,,360x640,480x320,480x800,,640x480,720x1280,960x800,,1080x960,1440x1280','P','2016-09-30 15:47:41'),(12,'SEARCH_TYPE','VALUE= CAT,EXT','EXT','P','2016-09-30 16:50:55'),(13,'SEARCH_EXTENSIONS','','JPG,3GP,MP3,MP4','P','2016-09-30 15:48:56'),(14,'ONLINE_SHOW_COUNT','VALUE= ON,OFF','OFF','P','2017-01-05 12:29:39'),(15,'MP3_PLAY_LIMIT','','10','P','2016-09-30 15:49:14'),(16,'THUMB_CAT_TOP','','4','P','2016-09-30 15:49:22'),(17,'THUMB_CAT_LIST','','2','P','2016-09-30 16:23:06'),(18,'THUMB_FILE_LIST','','2','P','2016-09-30 16:23:40'),(19,'THUMB_FILE_TOP','','3','P','2017-01-19 05:19:12'),(20,'WALLPAPER_WATERMARK','VALUE= ON,OFF','ON','P','2016-09-30 16:43:49'),(21,'UPDATES','VALUE= ON,OFF','ON','P','2017-01-11 05:48:10'),(22,'LATEST_FILES','VALUE= ON,OFF','ON','P','2017-01-11 05:52:52'),(23,'LATEST_FILES_LIST','','ON','P','2017-01-18 09:17:00'),(24,'TITLE_HOME','\"Bhojpuri Songs, Hitt Songs, Free Download, Movie Songs, Chaita Songs, Hitt Gana','::  Bhojpuri Songs, Hitt Songs, Free Download, Movie Songs, Chaita Songs, Hitt Gana','P','2020-04-28 07:12:22'),(25,'ARTIST_PER_PAGE','','10','P','2016-09-30 16:28:00'),(26,'MP3TAG_OVERWRITE','VALUE= ON,OFF','ON','A','2016-09-30 16:37:52'),(27,'TITLE','Bhojpuri Songs, Hitt Songs, Free Download, Movie Songs',':: Bhojpuri Songs, Hitt Songs, Free Download, Movie Songs','M','2020-04-28 07:11:21'),(28,'THUMB_DOMAIN','','https://hindiworth.com/siteuploads/thumb','M','2020-04-28 07:05:09'),(29,'ONLINE_COUNTER','VALUE=ON, OFF','OFF','M','2017-01-05 12:25:16'),(30,'CATEGORY_PER_PAGE','','15','M','2017-01-11 05:45:10'),(31,'FILES_PER_PAGE','','10','M','2017-01-11 05:45:37'),(32,'ADVT_AFTER_EACH_FILES','','3','M','2016-09-30 15:46:09'),(33,'MOB_DATA_DOMAIN','','https://hindiworth.com/siteuploads','M','2020-04-28 07:04:45'),(34,'UPDATES_PER_PAGE','','20','M','2016-09-30 15:46:27'),(35,'PC_DATA_DOMAIN','','https://hindiworth.com/siteuploads','M','2020-04-28 07:04:57'),(36,'FEATURED_FILES','','5','M','2017-01-11 05:45:21'),(37,'WALLPAPER_SIZE','','128x160,176x220,240x320,,240x400,320x240,320x480,,360x640,480x320,480x800,,640x480,720x1280,960x800,,1080x960,1440x1280','M','2016-09-30 15:47:41'),(38,'SEARCH_TYPE','VALUE= CAT,EXT','EXT','M','2016-09-30 16:50:55'),(39,'SEARCH_EXTENSIONS','','JPG,3GP,MP3,MP4','M','2016-09-30 15:48:56'),(40,'ONLINE_SHOW_COUNT','VALUE= ON,OFF','OFF','M','2017-01-05 12:25:23'),(41,'MP3_PLAY_LIMIT','','10','M','2016-09-30 15:49:14'),(42,'THUMB_CAT_TOP','','4','M','2016-09-30 15:49:22'),(43,'THUMB_CAT_LIST','','2','M','2016-09-30 16:23:06'),(44,'THUMB_FILE_LIST','','2','M','2016-09-30 16:23:40'),(45,'THUMB_FILE_TOP','','2','M','2016-09-30 16:24:20'),(46,'WALLPAPER_WATERMARK','VALUE= ON,OFF','ON','M','2016-09-30 16:43:49'),(47,'UPDATES','VALUE= ON,OFF','ON','M','2016-09-30 16:43:19'),(48,'LATEST_FILES','VALUE= ON,OFF','OFF','M','2016-09-30 16:26:04'),(49,'LATEST_FILES_LIST','','ON','M','2017-01-18 09:16:43'),(50,'TITLE_HOME',':: Bhojpuri Songs, Hitt Songs, Free Download, Movie Songs, Chaita Songs, Hitt Gana',':: Bhojpuri Songs, Hitt Songs, Free Download, Movie Songs, Chaita Songs, Hitt Gana','M','2020-04-28 07:11:49'),(51,'ARTIST_PER_PAGE','','10','M','2016-09-30 16:28:00');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates_app`
--

DROP TABLE IF EXISTS `updates_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'c',
  `thumb` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates_app`
--

LOCK TABLES `updates_app` WRITE;
/*!40000 ALTER TABLE `updates_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `updates_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hindiwor_Ashish'
--

--
-- Dumping routines for database 'hindiwor_Ashish'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-28 13:16:00
