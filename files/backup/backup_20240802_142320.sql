-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: slims_library
-- ------------------------------------------------------
-- Server version 	8.0.30
-- Date: Fri, 02 Aug 2024 14:23:20 +0630

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backup_log`
--

DROP TABLE IF EXISTS `backup_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_log` (
  `backup_log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `backup_time` datetime NOT NULL,
  `backup_file` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`backup_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_log`
--

/*!40000 ALTER TABLE `backup_log` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `backup_log` ENABLE KEYS */;
COMMIT;

-- Dumped table `backup_log` with 0 row(s)
--

--
-- Table structure for table `biblio`
--

DROP TABLE IF EXISTS `biblio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio` (
  `biblio_id` int NOT NULL AUTO_INCREMENT,
  `gmd_id` int DEFAULT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sor` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `edition` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isbn_issn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `publish_year` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `collation` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `series_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `call_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `language_id` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'en',
  `source` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `publish_place_id` int DEFAULT NULL,
  `classification` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_att` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `opac_hide` smallint DEFAULT '0',
  `promoted` smallint DEFAULT '0',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `frequency_id` int NOT NULL DEFAULT '0',
  `spec_detail_info` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `content_type_id` int DEFAULT NULL,
  `media_type_id` int DEFAULT NULL,
  `carrier_type_id` int DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`biblio_id`),
  KEY `references_idx` (`gmd_id`,`publisher_id`,`language_id`,`publish_place_id`),
  KEY `classification` (`classification`),
  KEY `biblio_flag_idx` (`opac_hide`,`promoted`),
  KEY `rda_idx` (`content_type_id`,`media_type_id`,`carrier_type_id`),
  KEY `uid` (`uid`),
  FULLTEXT KEY `title_ft_idx` (`title`,`series_title`),
  FULLTEXT KEY `notes_ft_idx` (`notes`),
  FULLTEXT KEY `labels` (`labels`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio`
--

/*!40000 ALTER TABLE `biblio` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `biblio` ENABLE KEYS */;
COMMIT;

-- Dumped table `biblio` with 0 row(s)
--

--
-- Table structure for table `biblio_attachment`
--

DROP TABLE IF EXISTS `biblio_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_attachment` (
  `biblio_id` int NOT NULL,
  `file_id` int NOT NULL,
  `placement` enum('link','popup','embed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `access_type` enum('public','private') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `access_limit` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  KEY `biblio_id` (`biblio_id`),
  KEY `file_id` (`file_id`),
  KEY `biblio_id_2` (`biblio_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_attachment`
--

/*!40000 ALTER TABLE `biblio_attachment` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `biblio_attachment` ENABLE KEYS */;
COMMIT;

-- Dumped table `biblio_attachment` with 0 row(s)
--

--
-- Table structure for table `biblio_author`
--

DROP TABLE IF EXISTS `biblio_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_author` (
  `biblio_id` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`author_id`),
  KEY `biblio_id` (`biblio_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_author`
--

/*!40000 ALTER TABLE `biblio_author` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `biblio_author` ENABLE KEYS */;
COMMIT;

-- Dumped table `biblio_author` with 0 row(s)
--

--
-- Table structure for table `biblio_custom`
--

DROP TABLE IF EXISTS `biblio_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_custom` (
  `biblio_id` int NOT NULL,
  PRIMARY KEY (`biblio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='one to one relation with real biblio table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_custom`
--

/*!40000 ALTER TABLE `biblio_custom` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `biblio_custom` ENABLE KEYS */;
COMMIT;

-- Dumped table `biblio_custom` with 0 row(s)
--

--
-- Table structure for table `biblio_log`
--

DROP TABLE IF EXISTS `biblio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_log` (
  `biblio_log_id` int NOT NULL AUTO_INCREMENT,
  `biblio_id` int NOT NULL,
  `user_id` int NOT NULL,
  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `affectedrow` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rawdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`biblio_log_id`),
  KEY `realname` (`realname`),
  KEY `biblio_id` (`biblio_id`),
  KEY `user_id` (`user_id`),
  KEY `ip` (`ip`),
  KEY `action` (`action`),
  KEY `affectedrow` (`affectedrow`),
  KEY `date` (`date`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `rawdata` (`rawdata`),
  FULLTEXT KEY `additional_information` (`additional_information`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_log`
--

/*!40000 ALTER TABLE `biblio_log` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `biblio_log` ENABLE KEYS */;
COMMIT;

-- Dumped table `biblio_log` with 0 row(s)
--

--
-- Table structure for table `biblio_mark`
--

DROP TABLE IF EXISTS `biblio_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_mark` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biblio_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `biblio_id_idx` (`biblio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_mark`
--

/*!40000 ALTER TABLE `biblio_mark` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `biblio_mark` ENABLE KEYS */;
COMMIT;

-- Dumped table `biblio_mark` with 0 row(s)
--

--
-- Table structure for table `biblio_relation`
--

DROP TABLE IF EXISTS `biblio_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_relation` (
  `biblio_id` int NOT NULL DEFAULT '0',
  `rel_biblio_id` int NOT NULL DEFAULT '0',
  `rel_type` int DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`rel_biblio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_relation`
--

/*!40000 ALTER TABLE `biblio_relation` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `biblio_relation` ENABLE KEYS */;
COMMIT;

-- Dumped table `biblio_relation` with 0 row(s)
--

--
-- Table structure for table `biblio_topic`
--

DROP TABLE IF EXISTS `biblio_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_topic` (
  `biblio_id` int NOT NULL DEFAULT '0',
  `topic_id` int NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`biblio_id`,`topic_id`),
  KEY `biblio_id` (`biblio_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_topic`
--

/*!40000 ALTER TABLE `biblio_topic` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `biblio_topic` ENABLE KEYS */;
COMMIT;

-- Dumped table `biblio_topic` with 0 row(s)
--

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
COMMIT;

-- Dumped table `cache` with 0 row(s)
--

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `biblio_id` int NOT NULL,
  `member_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
COMMIT;

-- Dumped table `comment` with 0 row(s)
--

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `content_id` int NOT NULL AUTO_INCREMENT,
  `content_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content_path` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_news` smallint DEFAULT NULL,
  `is_draft` smallint DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `content_ownpage` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `content_path` (`content_path`),
  FULLTEXT KEY `content_title` (`content_title`),
  FULLTEXT KEY `content_desc` (`content_desc`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

/*!40000 ALTER TABLE `content` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `content` VALUES (1,'Library Information','<h3>Contact Information</h3>\r\n<p><strong>Address :</strong> <br /> Jenderal Sudirman Road, Senayan, Jakarta, Indonesia - Postal Code : 10270 <br /> <strong>Phone Number :</strong> <br /> (021) 5711144 <br /> <strong>Fax Number :</strong> <br /> (021) 5711144</p>\r\n<h3>Opening Hours</h3>\r\n<p><strong>Monday - Friday :</strong> <br /> Open : 08.00 AM<br /> Break : 12.00 - 13.00 PM<br /> Close : 20.00 PM <br /> <strong>Saturday  :</strong> <br /> Open : 08.00 AM<br /> Break : 12.00 - 13.00 PM<br /> Close : 17.00 PM</p>\r\n<h3>Collections</h3>\r\n<p>We have many types of collections in our library, range from Fictions to Sciences Material, from printed material to digital collections such CD-ROM, CD, VCD and DVD. We also collect daily serials publications such as newspaper and also monthly serials such as magazines.</p>\r\n<h3>Library Membership</h3>\r\n<p>To be able to loan our library collections, you must first become library member. There is terms and conditions that you must obey.</p>','libinfo',NULL,0,NULL,'2009-09-13 19:48:16','2009-09-13 19:48:16','1');
INSERT INTO `content` VALUES (2,'Help On Usage','<h3>Searching</h3>\r\n<p>There are 2 methods available on searching library catalog. The first one is <strong>SIMPLE SEARCH</strong>, which is the simplest method on searching catalog. You just enter any keyword, either it containes in titles, author(s) names or subjects. You can supply more than one keywords in Simple Search method and it will expanding your search results.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ADVANCED SEARCH</strong>, lets you define keywords in more specific fields. If you want your keywords only contained in title field, then type your keyword in Title field and the system will limit its search within <strong>Title</strong> fields only, not in other fields. Location field lets you narrowing search results by specific location, so only collection that exists in selected location get fetched by system.</p>','help',NULL,0,NULL,'2009-09-13 19:48:16','2009-09-13 19:48:16','1');
INSERT INTO `content` VALUES (3,'Welcome To Admin Page','<div class=\"container admin_home\">\r\n<div class=\"row\">\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Bibliography</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon biblioIcon notAJAX\" href=\"index.php?mod=bibliography\"></a></div>\r\n<div class=\"col-sm-8\">The Bibliography module lets you manage your library bibliographical data. It also include collection items management to manage a copies of your library collection so it can be used in library circulation.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Circulation</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon circulationIcon notAJAX\" href=\"index.php?mod=circulation\"></a></div>\r\n<div class=\"col-sm-8\">The Circulation module is used for doing library circulation transaction such as collection loans and return. In this module you can also create loan rules that will be used in loan transaction proccess.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Membership</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon memberIcon notAJAX\" href=\"index.php?mod=membership\"></a></div>\r\n<div class=\"col-sm-8\">The Membership module lets you manage library members such adding, updating and also removing. You can also manage membership type in this module.</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Stock Take</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon stockTakeIcon notAJAX\" href=\"index.php?mod=stock_take\"></a></div>\r\n<div class=\"col-sm-8\">The Stock Take module is the easy way to do Stock Opname for your library collections. Follow several steps that ease your pain in Stock Opname proccess.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Serial Control</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon serialIcon notAJAX\" href=\"index.php?mod=serial_control\"></a></div>\r\n<div class=\"col-sm-8\">Serial Control module help you manage library\'s serial publication subscription. You can track issues for each subscription.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Reporting</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon reportIcon notAJAX\" href=\"index.php?mod=reporting\"></a></div>\r\n<div class=\"col-sm-8\">Reporting lets you view various type of reports regardings membership data, circulation data and bibliographic data. All compiled on-the-fly from current library database.</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>Master File</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon masterFileIcon notAJAX\" href=\"index.php?mod=master_file\"></a></div>\r\n<div class=\"col-sm-8\">The Master File modules lets you manage referential data that will be used by another modules. It include Authority File management such as Authority, Subject/Topic List, GMD and other data.</div>\r\n</div>\r\n</div>\r\n<div class=\"col-xs-6 col-md-4\">\r\n<h3>System</h3>\r\n<div class=\"row\">\r\n<div class=\"col-sm-2\"><a class=\"icon systemIcon notAJAX\" href=\"index.php?mod=system\"></a></div>\r\n<div class=\"col-sm-8\">The System module is used to configure application globally, manage index, manage librarian, and also backup database.</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>','adminhome',NULL,0,NULL,'2009-09-13 19:48:16','2009-09-13 22:02:11','1');
INSERT INTO `content` VALUES (4,'Homepage Info','<p>Welcome To <strong>SLiMS Library</strong> Online Public Access Catalog (OPAC). Use OPAC to search collection in our library.</p>','headerinfo',NULL,0,NULL,'2009-09-13 19:48:16','2009-09-13 19:48:16','1');
INSERT INTO `content` VALUES (5,'Tentang SLiMS','<p><!--intro_awal--><strong>SLiMS</strong> adalah akronim dari Senayan Library Management System. Awalnya dikembangkan oleh Perpustakaan Kementerian Pendidikan Nasional untuk menggantikan Alice (http://www2.softlinkint.com). Tujuan utamanya agar Perpustakaan Kemdiknas mempunyai kebebasan untuk menggunakan, mempelajari, memodifikasi dan mendistribusikan perangkat lunak yang digunakan. SLiMS, maka dirilis dengan lisensi GPL dan sekarang pengembangan SLiMS dilakukan oleh komunitas penggunanya.<!--intro_akhir--></p>\r\n<p><strong>Asal Mula</strong></p>\r\n<p>Setelah beroperasi 50 tahun lebih, karena beberapa alasan Perpustakaan BC Indonesia yang telah selama bertahun-tahun menjadi andalan layanan BC di Indonesia harus ditutup. Pengelola BC Indonesia kemudian berinisiatif untuk menghibahkan pengelolaan aset perpustakaanya ke tangan institusi pemerintah. Dalam hal ini, institusi pemerintah yang dianggap sesuai bidangnya dan strategis tempatnya, adalah Departemen Pendidikan Nasional (Depdiknas). Yang dihibahkan tidak hanya koleksi, tetapi juga rak koleksi, hardware (server dan workstation) serta sistem termasuk untuk aplikasi manajemen administrasi perpustakaan (Alice).</p>\r\n<p>Seiring dengan berjalannya waktu, manajemen Perpustakaan Depdiknas mulai menghadapi beberapa kendala dalam penggunaan sistem Alice. Pertama, keterbatasan dalam menambahkan fitur-fitur baru. Antara lain: kebutuhan manajemen serial, meng-online-kan katalog di web dan kustomisasi report yang sering berubah-ubah kebutuhannya. Penambahan fitur jika harus meminta modul resmi dari developer Alice, berarti membutuhkan dana tambahan yang tidak kecil. Apalagi tidak ada distributor resminya di Indonesia sehingga harus mengharapkan support dari Inggris. Ditambah lagi beberapa persyaratan yang membutuhkan infrastruktur biaya mahal seperti dedicated public IP agar bisa meng-online-kan Alice di web.<br /><br />Saat itu untuk mengatasi sebagian kebutuhan (utamanya kustomisasi report), dilakukan dengan ujicoba mengakses langsung database yang disimpan dalam format DBase. Terkadang berhasil terkadang tidak karena struktur datanya proprietary dan kompleks serta jumlah rekodnya banyak. Untuk mempelajari struktur database, dicoba melakukan kontak via email ke developer Alice. Tetapi tidak ada respon sama sekali. Disini muncul masalah kedua. Sulitnya mempelajari lebih mendalam cara kerja perangkat lunak Alice. Karena Alice merupakan sistem proprietary yang serba tertutup, segala sesuatunya sangat tergantung vendor. Dibutuhkan sejumlah uang untuk mendapatkan layanan resmi untuk kustomisasi.<br /><br />Perpustakaan Depdiknas salah satu tupoksinya adalah melakukan koordinasi pengelolaan perpustakaan unit kerja dibawah lingkungan Depdiknas. Dalam implementasinya, seringkali muncul kebutuhan untuk bisa mendistribusikan perangkat lunak sistem perpustakaan ke berbagai unit kerja tersebut. Disini masalah ketiga: sulit (atau tidak mungkin) untuk melakukan redistribusi sistem Alice. Alice merupakan perangkat lunak yang secara lisensi tidak memungkinkan diredistribusi oleh pengelola Perpustakaan Depdiknas secara bebas. Semuanya harus ijin dan membutuhkan biaya.<br /><br />November 2006, perpustakaan dihadapkan oleh sebuah masalah mendasar. Sistem Alice tiba-tiba tidak bisa digunakan. Ternyata Alice yang digunakan selama ini diimplementasikan dengan sistem sewa. Pantas saja biayanya relatif murah. Tiap tahun pengguna harus membayar kembali untuk memperpanjang masa sewa pakainya. Tetapi yang mengkhawatirkan adalah fakta bahwa perpustakaan harus menyimpan semua informasi penting dan kritikal di sebuah sistem yang tidak pernah dimiliki. Yang kalau lupa atau tidak mau membayar sewa lagi, hilanglah akses terhadap data kita sendiri. Konyol sekali. Itu sama saja dengan bunuh diri kalau masih tergantung dengan sistem berlisensi seperti itu.<br /><br />Akhirnya pengelola Perpustakaan Depdiknas me-review kembali penggunaan sistem Alice di perpustakaan Depdiknas. Beberapa poin pentingnya antara lain:<br />&bull;&nbsp;&nbsp;&nbsp; Alice memang handal (reliable), tapi punya banyak keterbatasan. Biaya sewanya memang relatif murah, tetapi kalau membutuhkan support tambahan, baik sederhana ataupun kompleks, sangat tergantung dengan developer Alice yang berpusat di Inggris. Butuh biaya yang kalau di total juga tidak murah.<br />&bull;&nbsp;&nbsp;&nbsp; Model lisensi proprietary yang digunakan developer Alice tidak cocok dengan kondisi kebanyakan perpustakaan di Indonesia. Padahal pengelola Perpustakaan Depdiknas sebagai koordinator banyak perpustakaan di lingkungan Depdiknas, punya kepentingan untuk bisa dengan bebas melakukan banyak hal terhadap software yang digunakan.<br />&bull;&nbsp;&nbsp;&nbsp; Menyimpan data penting dan kritikal untuk operasional perpustakaan di suatu software yang proprietary dan menggunakan sistem sewa, dianggap sesuatu yang konyol dan mengancam independensi dan keberlangsungan perpustakaan itu sendiri.<br />&bull;&nbsp;&nbsp;&nbsp; Alice berjalan diatas sistem operasi Windows yang juga proprietary padahal pengelola Perpustakaan Depdiknas ingin beralih menggunakan Sistem Operasi open source (seperti GNU/Linux dan FreeBSD).<br />&bull;&nbsp;&nbsp;&nbsp; Masalah devisa negara yang terbuang untuk membayar software yang tidak pernah dimiliki.<br />&bull;&nbsp;&nbsp;&nbsp; Intinya: pengelola Perpustakaan Depdiknas ingin menggunakan software yang memberikan dan menjamin kebebasan untuk: menggunakan, mempelajari, memodifikasi dan melakukan redistribusi. Lisensi Alice tidak memungkinkan untuk itu.<br /><br />Setelah memutuskan untuk hijrah menggunakan sistem yang lain, maka langkah berikutnya adalah mencari sistem yang ada untuk digunakan atau mengembangkan sendiri sistem yang dibutuhkan. Beberapa pertimbangan yang harus dipenuhi:<br />&bull;&nbsp;&nbsp;&nbsp; Dirilis dibawah lisensi yang menjamin kebebasan untuk: menggunakan, mempelajari, memodifikasi dan melakukan redistribusi. Model lisensi open source (www.openosurce.org) dianggap sebagai model yang paling ideal dan sesuai.<br />&bull;&nbsp;&nbsp;&nbsp; Teknologi yang digunakan untuk membangun sistem juga harus berlisensi open source.<br />&bull;&nbsp;&nbsp;&nbsp; Teknologi yang digunakan haruslah teknologi yang relatif mudah dipelajari oleh pengelola perpustakaan Depdiknas yang berlatarbelakang pendidiknas pustakawan, seperti PHP (scripting language) dan MySQL (database). Jika tidak menguasai sisi teknis teknologi, maka akan terjebak kembali terhadap ketergantungan pada developer.<br /><br />Langkah berikutnya adalah melakukan banding software sistem perpustakaan open source yang bisa diperoleh di internet. Beberapa software yang dicoba antara lain: phpMyLibrary, OpenBiblio, KOHA, EverGreen. Pengelola perpustakaan Depdiknas merasa tidak cocok dengan software yang ada, dengan beberapa alasan:<br />&bull;&nbsp;&nbsp;&nbsp; Desain aplikasi dan database yang tidak baik atau kurang menerapkan secara serius prinsip-prinsip pengembangan aplikasi dan database yang baik sesuai dengan teori yang ada (PHPMyLibrary, OpenBiblio).<br />&bull;&nbsp;&nbsp;&nbsp; Menggunakan teknologi yang sulit dikuasai oleh pengelola perpustakaan Depdiknas (KOHA dan EverGreen dikembangkan menggunakan Perl dan C++ Language yang relatif lebih sulit dipelajari).<br />&bull;&nbsp;&nbsp;&nbsp; Beberapa sudah tidak aktif atau lama sekali tidak di rilis versi terbarunya (PHPMyLibrary dan OpenBiblio).<br /><br />Karena tidak menemukan sistem yang dibutuhkan, maka diputuskan untuk mengembangkan sendiri aplikasi sistem perpustakaan yang dibutuhkan. Dalam dunia pengembangan software, salah satu best practice-nya adalah memberikan nama kode (codename) pengembangan. Nama kode berbeda dengan nama aplikasinya itu sendiri. Nama kode biasanya berbeda-beda tiap versi. Misalnya kode nama &ldquo;Hardy Heron&rdquo; untuk Ubuntu Linux 8.04 dan &ldquo;Jaunty Jackalope&rdquo; untuk Ubuntu Linux 9.04. Pengelola perpustakaan Depdiknas Untuk versi awal (1.0) aplikasi yang akan dikembangkan, memberikan nama kode &ldquo;Senayan&rdquo;. Alasannya sederhana, karena awal dikembangkan di perpustakaan Depdiknas yang berlokasi di Senayan. Apalagi Perpustakaan Depdiknas mempunyai brand sebagai library@senayan. Belakangan karena dirasa nama &ldquo;Senayan&rdquo; dirasa cocok dan punya nilai marketing yang bagus, maka nama &ldquo;Senayan&rdquo; dijadikan nama resmi aplikasi sistem perpustakaan yang dikembangkan.<br /><br />Mengembangkan Senayan<br /><br />Sebelum mulai mengembangkan Senayan, ada beberapa keputusan desain aplikasi yang harus dibuat. Aspek desain ini penting diantaranya untuk pengambilankeputusan dari berbagai masukan yang datang dari komunitas. Antara lain:<br /><br />Pertama,&nbsp; Senayan adalah aplikasi untuk kebutuhan administrasi dan konten perpustakaan (Library Automation System). Senayan didesain untuk kebutuhan skala menengah maupun besar. Cocok untuk perpustakaan yang memiliki koleksi, anggota dan staf banyak di lingkungan jaringan, baik itu lokal (intranet) dan internet.<br /><br />Kedua, Senayan dibangun dengan memperhatikan best practice dalam pengembangan software seperti dalam hal penulisan source code, dokumentasi, dan desain database.<br /><br />Ketiga, Senayan dirancang untuk compliant dengan standar pengelolaan koleksi di perpustakaan. Untuk standar pengatalogan minimal memenuhi syarat AACR 2 level 2 (Anglo-American Cataloging Rules). Kebutuhan untuk kesesuaian dengan standar di perpustakaan terus berkembang dan pengelola perpustakaan Depdiknas dan developer Senayan berkomitmen untuk terus mengembangkan Senayan agar mengikuti standar-standar tersebut.<br /><br />Keempat, Senayan didesain agar bisa juga menjadi middleware bagi aplikasi lain untuk menggunakan data yang ada didalam Senayan. Untuk itu Senayan akan menyediakan API (application programming Interface) yang berbasis web service.<br /><br />Kelima, Senayan merupakan aplikasi yang cross-platform, baik dari sisi aplikasinya itu sendiri dan akses terhadap aplikasi. Untuk itu basis yang paling tepat ada basis web.<br /><br />Keenam, teknologi yang digunakan untuk membangun Senayan, haruslah terbukti bisa diinstall di banyak platform sistem operasi, berlisensi open source dan mudah dipelajari oleh pengelola perpustakaan Depdiknas. Diputuskan untuk menggunakan PHP (www.php.net) untuk web scripting languange dan MySQL (www.mysql.com) untuk server database.<br /><br />Ketujuh, diputuskan untuk mengembangkan library PHP sendiri yang didesain spesifik untuk kebutuhan membangun library automation system. Tidak menggunakan library PHP yang sudah terkenal seperti PEAR (pear.php.net) karena alasan penguasaan terhadap teknologi dan kesederhanaan. Library tersebut diberinama &ldquo;simbio&rdquo;.<br /><br />Kedelapan, untuk mempercepat proses pengembangan, beberapa modul atau fungsi yang dibutuhkan yang dirasa terlalu lama dan rumit untuk dikembangkan sendiri, akan menggunakan software open source yang berlisensi open source juga. Misalnya: flowplayer untuk dukungan multimedia, jQuery untuk dukungan AJAX (Asynchronous Javascript and XML), genbarcode untuk dukungan pembuatan barcode, PHPThumb untuk dukungan generate image on-the-fly, tinyMCE untuk web-based text editor, dan lain-lain.<br /><br />Kesembilan, untuk menjaga spirit open source, proses pengembangan Senayan dilakukan dengan infrastruktur yang berbasis open source. Misalnya: server web menggunakan Apache, server produksi menggunakan OS Linux Centos dan OpenSuse, para developer melakukan pengembangan dengan OS Ubuntu Linux, manajemen source code menggunakan software git, dan lain-lain.<br /><br />Kesepuluh, Senayan dirilis ke masyarakat umum dengan lisensi GNU/GPL versi 3 yang menjamin kebebasan penggunanya untuk mempelajari, menggunakan, memodifikasi dan redistribusi Senayan.<br /><br />Kesebelas, para developer dan pengelola perpustakaan Depdiknas berkomitmen untuk terus mengembangkan Senayan dan menjadikannya salah satu contoh software perpustakaan yang open source, berbasis di indonesia dan menjadi salah satu contoh bagi model pengembangan open source yang terbukti berjalan dengan baik.<br /><br />Keduabelas, model pengembangan Senayan adalah open source yang artinya setiap orang dipersilahkan memberikan kontribusinya. Baik dari sisi pemrogaman, template, dokumentasi, dan lain-lain. Tentu saja ada mekanisme mana kontribusi yang bagus untuk dimasukkan dalam rilis resmi, mana yang tidak. Mengacu ke dokumen &hellip; (TAMBAHKAN DENGAN TULISAN ERIC S RAYMOND)<br /><br />Model pengembangan senayan<br /><br />Pengembangan Senayan awalnya diinisiasi oleh pengelola Perpustakaan Depdiknas. Tetapi sekarang komunitas pengembang Senayan (Senayan Developer Community) yang lebih banyak mengambil peran dalam mengembangkan Senayan. Beberapa hal dibawah ini merupakan kultur yang dibangun dalam mengembangkan Senayan:<br />1.&nbsp;&nbsp;&nbsp; Meritokrasi. Siapa saja bisa berkontribusi. Mereka yang banyak memberikan kontribusi, akan mendapatkan privilege lebih dibandingkan yang lain.<br />2.&nbsp;&nbsp;&nbsp; Minimal punya concern terhadap pengembangan perpustakaan. Contoh lain: berlatar belakang pendidikan ilmu perpustakaan dan informasi, bekerja di perpustakaan, mengelola perpustakaan, dan lain-lain. Diharapkan dengan kondisi ini, sense of librarianship melekat di tiap developer/pengguna Senayan. Sejauh ini, semua developer senayan merupakan pustakawan atau berlatarbelakang pendidikan kepustakawanan (Information and Librarianship).<br />3.&nbsp;&nbsp;&nbsp; Release early, release often, and listen to your customer. Release early artinya setiap perbaikan dan penambahan fitur, secepat mungkin dirilis ke publik. Diharapkan bugs yang ada, bisa cepat ditemukan oleh komunitas, dilaporkan ke developer, untuk kemudian dirilis perbaikannya. Release often, artinya sesering mungkin memberikan update perbaikan bugs dan penambahan fitur. Ini &ldquo;memaksa&rdquo; developer Senayan untuk terus kreatif menambahkan fitur Senayan. Release often juga membuat pengguna berkeyakinan bahwa Senayan punya sustainability yang baik dan terus aktif dikembangkan. Selain itu, release often juga mempunyai dampak pemasaran. Pengguna dan calon pengguna, selalu diingatkan tentang keberadaan Senayan. Tentunya dengan cara yang elegan, yaitu rilis-rilis Senayan. Sejak dirilis ke publi pertama kali November 2007 sampai Juli 2009 (kurang lebih 20 bulan) telah dirilis 18 rilis resmi Senayan. Listen to your customer. Developer Senayan selalu berusaha mengakomodasi kebutuhan pengguna baik yang masuk melalui report di mailing list, ataupun melalui bugs tracking system. Tentu tidak semua masukan diakomodasi, harus disesuaikan dengan desain dan roadmap pengembangan Senayan.<br />4.&nbsp;&nbsp;&nbsp; Dokumentasi. Developer Senayan meyakini pentingnya dokumentasi yang baik dalam mensukseskan implementasi Senayan dibanyak tempat. Karena itu pengembang Senayan mempunyai tim khusus yang bertanggungjawab yang mengembangkan dokumentasi Senayan agar terus uo-to-date mengikuti rilis terbaru.<br />5.&nbsp;&nbsp;&nbsp; Agar ada percepatan dalam pengembangan dan untuk mengakrabkan antar pengembang Senayan, minimal setahun sekali diadakan Senayan Developers Day yang mengumpulkan para developer Senayan dari berbagai kota, dan melakukan coding bersama-sama.<br />Fitur Senayan<br />Sebagai sebuah Sistem Automasi Perpustakaan yang terintergrasi, modul-modul yang telah terdapat di SENAYAN adalah sebagai berikut:<br />Modul Pengatalogan (Cataloging Module)<br />1)&nbsp;&nbsp;&nbsp; Compliance dengan standar AACR2 (Anglo-American Cataloging Rules).<br />2)&nbsp;&nbsp;&nbsp; Fitur untuk membuat, mengedit, dan menghapus data bibliografi sesuai dengan standar deskripsi bibliografi AACR2 level ke dua.<br />3)&nbsp;&nbsp;&nbsp; Mendukung pengelolaan koleksi dalam berbagai macam format seperti monograph, terbitan berseri, audio visual, dsb.<br />4)&nbsp;&nbsp;&nbsp; Mendukung penyimpanan data bibliografi dari situs di Internet.<br />5)&nbsp;&nbsp;&nbsp; Mendukung penggunaan Barcode.<br />6)&nbsp;&nbsp;&nbsp; Manajemen item koleksi untuk dokumen dengan banyak kopi dan format yang berbeda.<br />7)&nbsp;&nbsp;&nbsp; Mendukung format XML untuk pertukaran data dengan menggunakan standar metadata MODS (Metadata Object Description Schema).<br />8)&nbsp;&nbsp;&nbsp; Pencetakan Barcode item/kopi koleksi Built-in.<br />9)&nbsp;&nbsp;&nbsp; Pencetakan Label Punggung koleksi Built-in.<br />10)&nbsp;&nbsp;&nbsp; Pengambilan data katalog melalui protokol Z3950 ke database koleksi Library of Congress.<br />11)&nbsp;&nbsp;&nbsp; Pengelolaan koleksi yang hilang, dalam perbaikan, dan rusak serta pencatatan statusnya untuk dilakukan pergantian/perbaikan terhadap koleksi.<br />12)&nbsp;&nbsp;&nbsp; Daftar kendali untuk pengarang (baik pengarang orang, badan/lembaga, dan pertemuan) sebagai standar konsistensi penuliasn<br />13)&nbsp;&nbsp;&nbsp; Pengaturan hak akses pengelolaan data bibliografi hanya untuk staf yang berhak.<br /><br />Modul Penelusuran (OPAC/Online Public Access catalog Module)<br />1)&nbsp;&nbsp;&nbsp; Pencarian sederhana.<br />2)&nbsp;&nbsp;&nbsp; Pencarian tingkat lanjut (Advanced).<br />3)&nbsp;&nbsp;&nbsp; Dukungan penggunaan Boolean\'s Logic dan implementasi CQL (Common Query Language).<br />4)&nbsp;&nbsp;&nbsp; OPAC Web Services berbasis XML.<br />5)&nbsp;&nbsp;&nbsp; Mendukung akses OPAC melalui peralatan portabel (mobile device)<br />6)&nbsp;&nbsp;&nbsp; Menampilkan informasi lengkap tetang status koleksi di perpustakaan, tanggal pengembalian, dan pemesanan item/koleksi<br />7)&nbsp;&nbsp;&nbsp; Detil informasi juga menampilkan gambar sampul buku, lampiran dalam format elektronik yang tersedia (jika ada) serta fasilitas menampilkan koleksi audio dan visual.<br />8)&nbsp;&nbsp;&nbsp; Menyediakan hyperlink tambahan untuk pencarian lanjutan berdasarkan penulis, dan subjek.<br /><br />Modul Sirkulasi (Circulation Module)<br />1)&nbsp;&nbsp;&nbsp; Mampu memproses peminjaman dan pengembalian koleksi secara efisien, efektif dan aman.<br />2)&nbsp;&nbsp;&nbsp; Mendukung fitur reservasi koleksi yang sedang dipinjam, termasuk reminder/pemberitahuan-nya.<br />3)&nbsp;&nbsp;&nbsp; Mendukung fitur manajemen denda. Dilengkapi fleksibilitas untuk pemakai membayar denda secara cicilan.<br />4)&nbsp;&nbsp;&nbsp; Mendukung fitur reminder untuk berbagai keperluan seperti melakukan black list terhadap pemakai yang bermasalah atau habis keanggotaannya.<br />5)&nbsp;&nbsp;&nbsp; Mendukung fitur pengkalenderan (calendaring) untuk diintegrasikan dengan penghitungan masa peminjaman, denda, dan lain-lain.<br />6)&nbsp;&nbsp;&nbsp; Memungkinkan penentuan hari-hari libur non-standar yang spesifik.<br />7)&nbsp;&nbsp;&nbsp; Dukungan terhadap ragam jenis tipe pemakai dengan masa pinjam beragam untuk berbagai jenis keanggotaan.<br />8)&nbsp;&nbsp;&nbsp; Menyimpan histori peminjaman anggota.<br />9)&nbsp;&nbsp;&nbsp; Mendukung pembuatan peraturan peminjaman yang sangat rinci dengan mengkombinasikan parameter keanggotaan, jenis koleksi, dan gmd selain aturan peminjaman standar berdasarkan jenis keanggotaan<br /><br />Modul Manajemen Keanggotaan (Membership Management Module)<br />1)&nbsp;&nbsp;&nbsp; Memungkinkan beragam tipe pemakai dengan ragam jenis kategori peminjaman, ragam jenis keanggotaan dan pembedaan setiap layanan sirkulasi dalam jumlah koleksi serta lama peminjaman untuk jenis koleksi untuk setiap jenis/kategori.<br />2)&nbsp;&nbsp;&nbsp; Dukungan terhadap input menggunakan barcode reader<br />3)&nbsp;&nbsp;&nbsp; Memungkinkan untuk menyimpan informasi preferensi pemakai atau subject interest.<br />4)&nbsp;&nbsp;&nbsp; Memungkinkan untuk menyimpan informasi tambahan untuk keperluan reminder pada saat transaksi.<br />5)&nbsp;&nbsp;&nbsp; Memungkinkan menyimpan informasi detail pemakai yang lebih lengkap.<br />6)&nbsp;&nbsp;&nbsp; Pencarian informasi anggota minimal berdasarkan nomor dan nama anggota.<br />7)&nbsp;&nbsp;&nbsp; Pembuatan kartu anggota yang dilengkapi dengan barcode untuk transaksi peminjaman.<br /><br />Modul Inventarisasi Koleksi (Stocktaking Module)<br />1)&nbsp;&nbsp;&nbsp; Proses inventarisasi koleksi bisa dilakukan secara bertahap dan parsial tanpa harus menutup layanan perpustakaan secara keseluruhan.<br />2)&nbsp;&nbsp;&nbsp; Proses inventarisasi bisa dilakukan secara efisien dan efektif.<br />3)&nbsp;&nbsp;&nbsp; Terdapat pilihan untuk menghapus data secara otomatis pada saat akhir proses inventarisasi terhadap koleksi yang dianggap hilang.<br /><br />Modul Statistik/Pelaporan (Report Module)<br />1)&nbsp;&nbsp;&nbsp; Meliputi pelaporan untuk semua modul-modul yang tersedia di Senayan.<br />2)&nbsp;&nbsp;&nbsp; Laporan Judul.<br />3)&nbsp;&nbsp;&nbsp; Laporan Items/Kopi koleksi.<br />4)&nbsp;&nbsp;&nbsp; Laporan Keanggotaan.<br />5)&nbsp;&nbsp;&nbsp; Laporan jumlah koleksi berdasarkan klasifikasi.<br />6)&nbsp;&nbsp;&nbsp; Laporan Keterlambatan.<br />7)&nbsp;&nbsp;&nbsp; Berbagai macam statistik seperti statistik koleksi, peminjaman, keanggotaan, keterpakaian koleksi.<br />8)&nbsp;&nbsp;&nbsp; Tampilan laporan yang sudah didesain printer-friendly, sehingga memudahkan untuk dicetak.<br />9)&nbsp;&nbsp;&nbsp; Filter data yang lengkap untuk setiap laporan.<br />10)&nbsp;&nbsp;&nbsp; API untuk pelaporan yang relatif mudah dipelajari untuk membuat custom report baru.<br /><br />Modul Manajemen Terbitan Berseri (Serial Control)<br />1)&nbsp;&nbsp;&nbsp; Manajemen data langganan.<br />2)&nbsp;&nbsp;&nbsp; Manajemen data Kardex.<br />3)&nbsp;&nbsp;&nbsp; Manajemen tracking data terbitan yang akan terbit dan yang sudah ada.<br />4)&nbsp;&nbsp;&nbsp; Memungkinkan tracking data terbitan berseri yang jadwal terbitnya tidak teratur (pengaturan yang fleksibel).<br /><br />Modul Lain-lain<br />1)&nbsp;&nbsp;&nbsp; Dukungan antar muka yang multi bahasa (internasionalisasi) dengan Gettext.<br />2)&nbsp;&nbsp;&nbsp; Dukungan terhadap penggunaan huruf bukan latin untuk pengisian data dan pencarian.<br /><br />Roadmap Pengembangan Senayan<br />SENAYAN akan terus dikembangkan oleh para pengembangnya beserta komunitas pengguna SENAYAN lainnya. Berikut adalah Roadmap pengembangan SENAYAN ke depannya:<br /><br />Pengembangan aplikasi:<br />1.&nbsp;&nbsp;&nbsp; Kompatibilitas dengan MARC dan standar pertukaran data yang komplit. Contoh implementasinya:<br />&bull;&nbsp;&nbsp;&nbsp; Memastikan bahwa format data bibliografi kompatibel dengan MARC secara lebih baik (minimal MARC light).<br />&bull;&nbsp;&nbsp;&nbsp; Dukungan terhadap RFID.<br />&bull;&nbsp;&nbsp;&nbsp; Fitur untuk impor / ekspor rekod dari The Online Computer Library Centre (OCLC), Research Libraries Information Network (RLIN), vendor sistem lain yang compliant dengan MARC.<br />&bull;&nbsp;&nbsp;&nbsp; Validasi data ISBN menggunakan modulus seven.<br />&bull;&nbsp;&nbsp;&nbsp; Dukungan terhadap standar di perpustakaan, seperti: Library of Congress Subject Headings, Library of Congress Classification, ALA filing rules, International Standard Bibliographic Description, ANSI Standard for Bibliographic Information Exchange on magnetic tape, Common communication format (ISO 2709).<br />2.&nbsp;&nbsp;&nbsp; Katalog induk/bersama (union catalog)<br />3.&nbsp;&nbsp;&nbsp; Implementasi Thesaurus. Contoh implementasinya:<br />&bull;&nbsp;&nbsp;&nbsp; Pemanfaatan tesaurus untuk proses pengatalogan.<br />&bull;&nbsp;&nbsp;&nbsp; Pemanfaatan tesaurus untuk proses pencarian, misalnya memberikan advis pencarian menggunakan knowledge base yang dibangun dengan sistem tesaurus.<br />4.&nbsp;&nbsp;&nbsp; Implementasi Library 2.0. Contoh implementasinya:<br />&bull;&nbsp;&nbsp;&nbsp; User bisa login dan mempunyai halaman personalisasi.<br />&bull;&nbsp;&nbsp;&nbsp; User bisa melakukan reservasi koleksi dan memperpanjang peminjaman.<br />&bull;&nbsp;&nbsp;&nbsp; User bisa melakukan komunikasi dengan pustakawan via messaging system.<br />&bull;&nbsp;&nbsp;&nbsp; User bisa melakukan tagging, rekomendasi koleksi dan menyimpannya didalam daftar koleksi favoritnya.<br />&bull;&nbsp;&nbsp;&nbsp; User bisa memberikan komentar terhadap koleksi.<br />&bull;&nbsp;&nbsp;&nbsp; Pustakawan bisa memasukkan preferensi pemakai didalam data keanggotaan. Preferensi tersebut bisa dimanfaatkan salah satunya untuk men-generate semacam daftar koleksi terpilih untuk dicetak atau ditampilkan ketika user login.<br />5.&nbsp;&nbsp;&nbsp; Peningkatan dukungan manajemen konten digital dan entri analitikal<br /><br />Pengembangan basis komunitas pengguna:<br />&bull;&nbsp;&nbsp;&nbsp; Membangun komunitas pengguna di berbagai kota <br />&bull;&nbsp;&nbsp;&nbsp; Mengadakan Senayan Developers Day untuk silaturahmi antar developer Senayan, update dokumentasi, penambahan fitur baru dan bug fixing dan mencari bibit pengembang yang baru.<br />&bull;&nbsp;&nbsp;&nbsp; Workshop/Seminar Nasional Tahunan<br />&bull;&nbsp;&nbsp;&nbsp; Jam Sessions rutin setiap 3 bulan</p>','about_slims',NULL,0,NULL,'2010-08-28 23:29:55','2010-11-12 18:21:01','1');
INSERT INTO `content` VALUES (6,'Modul yang Tersedia','<p><!--intro_awal-->Sebagai sebuah Sistem Automasi Perpustakaan yang terintergrasi, modul-modul yang telah terdapat di SENAYAN antara lain: pengatalogan/bibliografi, keanggotaan, sirkulasi, masterfile, stock opname (inventarisasi koleksi), pelaporan/reporting, manajemen kontrol serial, digital library, dan lain-lain.<!--intro_akhir--></p>\r\n<p>Modul Pengatalogan (Cataloging Module)<br />1)&nbsp;&nbsp;&nbsp; Compliance dengan standar AACR2 (Anglo-American Cataloging Rules).<br />2)&nbsp;&nbsp;&nbsp; Fitur untuk membuat, mengedit, dan menghapus data bibliografi sesuai dengan standar deskripsi bibliografi AACR2 level ke dua.<br />3)&nbsp;&nbsp;&nbsp; Mendukung pengelolaan koleksi dalam berbagai macam format seperti monograph, terbitan berseri, audio visual, dsb.<br />4)&nbsp;&nbsp;&nbsp; Mendukung penyimpanan data bibliografi dari situs di Internet.<br />5)&nbsp;&nbsp;&nbsp; Mendukung penggunaan Barcode.<br />6)&nbsp;&nbsp;&nbsp; Manajemen item koleksi untuk dokumen dengan banyak kopi dan format yang berbeda.<br />7)&nbsp;&nbsp;&nbsp; Mendukung format XML untuk pertukaran data dengan menggunakan standar metadata MODS (Metadata Object Description Schema).<br />8)&nbsp;&nbsp;&nbsp; Pencetakan Barcode item/kopi koleksi Built-in.<br />9)&nbsp;&nbsp;&nbsp; Pencetakan Label Punggung koleksi Built-in.<br />10)&nbsp;&nbsp;&nbsp; Pengambilan data katalog melalui protokol Z3950 ke database koleksi Library of Congress.<br />11)&nbsp;&nbsp;&nbsp; Pengelolaan koleksi yang hilang, dalam perbaikan, dan rusak serta pencatatan statusnya untuk dilakukan pergantian/perbaikan terhadap koleksi.<br />12)&nbsp;&nbsp;&nbsp; Daftar kendali untuk pengarang (baik pengarang orang, badan/lembaga, dan pertemuan) sebagai standar konsistensi penuliasn<br />13)&nbsp;&nbsp;&nbsp; Pengaturan hak akses pengelolaan data bibliografi hanya untuk staf yang berhak.<br /><br />Modul Penelusuran (OPAC/Online Public Access catalog Module)<br />1)&nbsp;&nbsp;&nbsp; Pencarian sederhana.<br />2)&nbsp;&nbsp;&nbsp; Pencarian tingkat lanjut (Advanced).<br />3)&nbsp;&nbsp;&nbsp; Dukungan penggunaan Boolean\'s Logic dan implementasi CQL (Common Query Language).<br />4)&nbsp;&nbsp;&nbsp; OPAC Web Services berbasis XML.<br />5)&nbsp;&nbsp;&nbsp; Mendukung akses OPAC melalui peralatan portabel (mobile device)<br />6)&nbsp;&nbsp;&nbsp; Menampilkan informasi lengkap tetang status koleksi di perpustakaan, tanggal pengembalian, dan pemesanan item/koleksi<br />7)&nbsp;&nbsp;&nbsp; Detil informasi juga menampilkan gambar sampul buku, lampiran dalam format elektronik yang tersedia (jika ada) serta fasilitas menampilkan koleksi audio dan visual.<br />8)&nbsp;&nbsp;&nbsp; Menyediakan hyperlink tambahan untuk pencarian lanjutan berdasarkan penulis, dan subjek.<br /><br />Modul Sirkulasi (Circulation Module)<br />1)&nbsp;&nbsp;&nbsp; Mampu memproses peminjaman dan pengembalian koleksi secara efisien, efektif dan aman.<br />2)&nbsp;&nbsp;&nbsp; Mendukung fitur reservasi koleksi yang sedang dipinjam, termasuk reminder/pemberitahuan-nya.<br />3)&nbsp;&nbsp;&nbsp; Mendukung fitur manajemen denda. Dilengkapi fleksibilitas untuk pemakai membayar denda secara cicilan.<br />4)&nbsp;&nbsp;&nbsp; Mendukung fitur reminder untuk berbagai keperluan seperti melakukan black list terhadap pemakai yang bermasalah atau habis keanggotaannya.<br />5)&nbsp;&nbsp;&nbsp; Mendukung fitur pengkalenderan (calendaring) untuk diintegrasikan dengan penghitungan masa peminjaman, denda, dan lain-lain.<br />6)&nbsp;&nbsp;&nbsp; Memungkinkan penentuan hari-hari libur non-standar yang spesifik.<br />7)&nbsp;&nbsp;&nbsp; Dukungan terhadap ragam jenis tipe pemakai dengan masa pinjam beragam untuk berbagai jenis keanggotaan.<br />8)&nbsp;&nbsp;&nbsp; Menyimpan histori peminjaman anggota.<br />9)&nbsp;&nbsp;&nbsp; Mendukung pembuatan peraturan peminjaman yang sangat rinci dengan mengkombinasikan parameter keanggotaan, jenis koleksi, dan gmd selain aturan peminjaman standar berdasarkan jenis keanggotaan<br /><br />Modul Manajemen Keanggotaan (Membership Management Module)<br />1)&nbsp;&nbsp;&nbsp; Memungkinkan beragam tipe pemakai dengan ragam jenis kategori peminjaman, ragam jenis keanggotaan dan pembedaan setiap layanan sirkulasi dalam jumlah koleksi serta lama peminjaman untuk jenis koleksi untuk setiap jenis/kategori.<br />2)&nbsp;&nbsp;&nbsp; Dukungan terhadap input menggunakan barcode reader<br />3)&nbsp;&nbsp;&nbsp; Memungkinkan untuk menyimpan informasi preferensi pemakai atau subject interest.<br />4)&nbsp;&nbsp;&nbsp; Memungkinkan untuk menyimpan informasi tambahan untuk keperluan reminder pada saat transaksi.<br />5)&nbsp;&nbsp;&nbsp; Memungkinkan menyimpan informasi detail pemakai yang lebih lengkap.<br />6)&nbsp;&nbsp;&nbsp; Pencarian informasi anggota minimal berdasarkan nomor dan nama anggota.<br />7)&nbsp;&nbsp;&nbsp; Pembuatan kartu anggota yang dilengkapi dengan barcode untuk transaksi peminjaman.<br /><br />Modul Inventarisasi Koleksi (Stocktaking Module)<br />1)&nbsp;&nbsp;&nbsp; Proses inventarisasi koleksi bisa dilakukan secara bertahap dan parsial tanpa harus menutup layanan perpustakaan secara keseluruhan.<br />2)&nbsp;&nbsp;&nbsp; Proses inventarisasi bisa dilakukan secara efisien dan efektif.<br />3)&nbsp;&nbsp;&nbsp; Terdapat pilihan untuk menghapus data secara otomatis pada saat akhir proses inventarisasi terhadap koleksi yang dianggap hilang.<br /><br />Modul Statistik/Pelaporan (Report Module)<br />1)&nbsp;&nbsp;&nbsp; Meliputi pelaporan untuk semua modul-modul yang tersedia di Senayan.<br />2)&nbsp;&nbsp;&nbsp; Laporan Judul.<br />3)&nbsp;&nbsp;&nbsp; Laporan Items/Kopi koleksi.<br />4)&nbsp;&nbsp;&nbsp; Laporan Keanggotaan.<br />5)&nbsp;&nbsp;&nbsp; Laporan jumlah koleksi berdasarkan klasifikasi.<br />6)&nbsp;&nbsp;&nbsp; Laporan Keterlambatan.<br />7)&nbsp;&nbsp;&nbsp; Berbagai macam statistik seperti statistik koleksi, peminjaman, keanggotaan, keterpakaian koleksi.<br />8)&nbsp;&nbsp;&nbsp; Tampilan laporan yang sudah didesain printer-friendly, sehingga memudahkan untuk dicetak.<br />9)&nbsp;&nbsp;&nbsp; Filter data yang lengkap untuk setiap laporan.<br />10)&nbsp;&nbsp;&nbsp; API untuk pelaporan yang relatif mudah dipelajari untuk membuat custom report baru.<br /><br />Modul Manajemen Terbitan Berseri (Serial Control)<br />1)&nbsp;&nbsp;&nbsp; Manajemen data langganan.<br />2)&nbsp;&nbsp;&nbsp; Manajemen data Kardex.<br />3)&nbsp;&nbsp;&nbsp; Manajemen tracking data terbitan yang akan terbit dan yang sudah ada.<br />4)&nbsp;&nbsp;&nbsp; Memungkinkan tracking data terbitan berseri yang jadwal terbitnya tidak teratur (pengaturan yang fleksibel).<br /><br />Modul Lain-lain<br />1)&nbsp;&nbsp;&nbsp; Dukungan antar muka yang multi bahasa (internasionalisasi) dengan Gettext.<br />2)&nbsp;&nbsp;&nbsp; Dukungan terhadap penggunaan huruf bukan latin untuk pengisian data dan pencarian.</p>','modul_tersedia',NULL,0,NULL,'2010-08-29 04:03:09','2010-08-29 04:05:49','1');
INSERT INTO `content` VALUES (7,'Lisensi SLiMS','<p><!--intro_awal--><strong>SLiMS</strong> dilisensikan dibawah GNU/GPL (http://www.gnu.org/licenses/gpl.html) untuk menjamin kebebasan pengguna dalam menggunakannya. GNU General Public License (disingkat GNU GPL atau cukup GPL) merupakan suatu lisensi perangkat lunak bebas yang aslinya ditulis oleh Richard Stallman untuk proyek GNU. Lisensi GPL memberikan penerima salinan perangkat lunak hak dari perangkat lunak bebas dan menggunakan copyleft&nbsp; untuk memastikan kebebasan yang sama diterapkan pada versi berikutnya dari karya tersebut.<!--intro_akhir--></p>\r\n<p>&nbsp;GNU LESSER GENERAL PUBLIC LICENSE<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Version 3, 29 June 2007<br /><br />&nbsp;Copyright (C) 2007 Free Software Foundation, Inc. &lt;http://fsf.org/&gt;<br />&nbsp;Everyone is permitted to copy and distribute verbatim copies<br />&nbsp;of this license document, but changing it is not allowed.<br /><br /><br />&nbsp; This version of the GNU Lesser General Public License incorporates<br />the terms and conditions of version 3 of the GNU General Public<br />License, supplemented by the additional permissions listed below.<br /><br />&nbsp; 0. Additional Definitions.<br /><br />&nbsp; As used herein, \"this License\" refers to version 3 of the GNU Lesser<br />General Public License, and the \"GNU GPL\" refers to version 3 of the GNU<br />General Public License.<br /><br />&nbsp; \"The Library\" refers to a covered work governed by this License,<br />other than an Application or a Combined Work as defined below.<br /><br />&nbsp; An \"Application\" is any work that makes use of an interface provided<br />by the Library, but which is not otherwise based on the Library.<br />Defining a subclass of a class defined by the Library is deemed a mode<br />of using an interface provided by the Library.<br /><br />&nbsp; A \"Combined Work\" is a work produced by combining or linking an<br />Application with the Library.&nbsp; The particular version of the Library<br />with which the Combined Work was made is also called the \"Linked<br />Version\".<br /><br />&nbsp; The \"Minimal Corresponding Source\" for a Combined Work means the<br />Corresponding Source for the Combined Work, excluding any source code<br />for portions of the Combined Work that, considered in isolation, are<br />based on the Application, and not on the Linked Version.<br /><br />&nbsp; The \"Corresponding Application Code\" for a Combined Work means the<br />object code and/or source code for the Application, including any data<br />and utility programs needed for reproducing the Combined Work from the<br />Application, but excluding the System Libraries of the Combined Work.<br /><br />&nbsp; 1. Exception to Section 3 of the GNU GPL.<br /><br />&nbsp; You may convey a covered work under sections 3 and 4 of this License<br />without being bound by section 3 of the GNU GPL.<br /><br />&nbsp; 2. Conveying Modified Versions.<br /><br />&nbsp; If you modify a copy of the Library, and, in your modifications, a<br />facility refers to a function or data to be supplied by an Application<br />that uses the facility (other than as an argument passed when the<br />facility is invoked), then you may convey a copy of the modified<br />version:<br /><br />&nbsp;&nbsp; a) under this License, provided that you make a good faith effort to<br />&nbsp;&nbsp; ensure that, in the event an Application does not supply the<br />&nbsp;&nbsp; function or data, the facility still operates, and performs<br />&nbsp;&nbsp; whatever part of its purpose remains meaningful, or<br /><br />&nbsp;&nbsp; b) under the GNU GPL, with none of the additional permissions of<br />&nbsp;&nbsp; this License applicable to that copy.<br /><br />&nbsp; 3. Object Code Incorporating Material from Library Header Files.<br /><br />&nbsp; The object code form of an Application may incorporate material from<br />a header file that is part of the Library.&nbsp; You may convey such object<br />code under terms of your choice, provided that, if the incorporated<br />material is not limited to numerical parameters, data structure<br />layouts and accessors, or small macros, inline functions and templates<br />(ten or fewer lines in length), you do both of the following:<br /><br />&nbsp;&nbsp; a) Give prominent notice with each copy of the object code that the<br />&nbsp;&nbsp; Library is used in it and that the Library and its use are<br />&nbsp;&nbsp; covered by this License.<br /><br />&nbsp;&nbsp; b) Accompany the object code with a copy of the GNU GPL and this license<br />&nbsp;&nbsp; document.<br /><br />&nbsp; 4. Combined Works.<br /><br />&nbsp; You may convey a Combined Work under terms of your choice that,<br />taken together, effectively do not restrict modification of the<br />portions of the Library contained in the Combined Work and reverse<br />engineering for debugging such modifications, if you also do each of<br />the following:<br /><br />&nbsp;&nbsp; a) Give prominent notice with each copy of the Combined Work that<br />&nbsp;&nbsp; the Library is used in it and that the Library and its use are<br />&nbsp;&nbsp; covered by this License.<br /><br />&nbsp;&nbsp; b) Accompany the Combined Work with a copy of the GNU GPL and this license<br />&nbsp;&nbsp; document.<br /><br />&nbsp;&nbsp; c) For a Combined Work that displays copyright notices during<br />&nbsp;&nbsp; execution, include the copyright notice for the Library among<br />&nbsp;&nbsp; these notices, as well as a reference directing the user to the<br />&nbsp;&nbsp; copies of the GNU GPL and this license document.<br /><br />&nbsp;&nbsp; d) Do one of the following:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0) Convey the Minimal Corresponding Source under the terms of this<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; License, and the Corresponding Application Code in a form<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suitable for, and under terms that permit, the user to<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recombine or relink the Application with a modified version of<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the Linked Version to produce a modified Combined Work, in the<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; manner specified by section 6 of the GNU GPL for conveying<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Corresponding Source.<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1) Use a suitable shared library mechanism for linking with the<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Library.&nbsp; A suitable mechanism is one that (a) uses at run time<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a copy of the Library already present on the user\'s computer<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; system, and (b) will operate properly with a modified version<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of the Library that is interface-compatible with the Linked<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Version.<br /><br />&nbsp;&nbsp; e) Provide Installation Information, but only if you would otherwise<br />&nbsp;&nbsp; be required to provide such information under section 6 of the<br />&nbsp;&nbsp; GNU GPL, and only to the extent that such information is<br />&nbsp;&nbsp; necessary to install and execute a modified version of the<br />&nbsp;&nbsp; Combined Work produced by recombining or relinking the<br />&nbsp;&nbsp; Application with a modified version of the Linked Version. (If<br />&nbsp;&nbsp; you use option 4d0, the Installation Information must accompany<br />&nbsp;&nbsp; the Minimal Corresponding Source and Corresponding Application<br />&nbsp;&nbsp; Code. If you use option 4d1, you must provide the Installation<br />&nbsp;&nbsp; Information in the manner specified by section 6 of the GNU GPL<br />&nbsp;&nbsp; for conveying Corresponding Source.)<br /><br />&nbsp; 5. Combined Libraries.<br /><br />&nbsp; You may place library facilities that are a work based on the<br />Library side by side in a single library together with other library<br />facilities that are not Applications and are not covered by this<br />License, and convey such a combined library under terms of your<br />choice, if you do both of the following:<br /><br />&nbsp;&nbsp; a) Accompany the combined library with a copy of the same work based<br />&nbsp;&nbsp; on the Library, uncombined with any other library facilities,<br />&nbsp;&nbsp; conveyed under the terms of this License.<br /><br />&nbsp;&nbsp; b) Give prominent notice with the combined library that part of it<br />&nbsp;&nbsp; is a work based on the Library, and explaining where to find the<br />&nbsp;&nbsp; accompanying uncombined form of the same work.<br /><br />&nbsp; 6. Revised Versions of the GNU Lesser General Public License.<br /><br />&nbsp; The Free Software Foundation may publish revised and/or new versions<br />of the GNU Lesser General Public License from time to time. Such new<br />versions will be similar in spirit to the present version, but may<br />differ in detail to address new problems or concerns.<br /><br />&nbsp; Each version is given a distinguishing version number. If the<br />Library as you received it specifies that a certain numbered version<br />of the GNU Lesser General Public License \"or any later version\"<br />applies to it, you have the option of following the terms and<br />conditions either of that published version or of any later version<br />published by the Free Software Foundation. If the Library as you<br />received it does not specify a version number of the GNU Lesser<br />General Public License, you may choose any version of the GNU Lesser<br />General Public License ever published by the Free Software Foundation.<br /><br />&nbsp; If the Library as you received it specifies that a proxy can decide<br />whether future versions of the GNU Lesser General Public License shall<br />apply, that proxy\'s public statement of acceptance of any version is<br />permanent authorization for you to choose that version for the<br />Library.</p>','lisensi_slims',NULL,0,NULL,'2010-08-29 04:04:33','2010-11-12 22:15:43','1');
INSERT INTO `content` VALUES (8,'Model Pengembangan Open Source','<p><!--intro_awal-->Sumber terbuka (Inggris: open source) adalah sistem pengembangan yang tidak dikoordinasi oleh suatu individu / lembaga pusat, tetapi oleh para pelaku yang bekerja sama dengan memanfaatkan kode sumber (source-code) yang tersebar dan tersedia bebas (biasanya menggunakan fasilitas komunikasi internet). Pola pengembangan ini mengambil model ala bazaar, sehingga pola Open Source ini memiliki ciri bagi komunitasnya yaitu adanya dorongan yang bersumber dari budaya memberi.<!--intro_akhir--><br /><br />Pola Open Source lahir karena kebebasan berkarya, tanpa intervensi berpikir dan mengungkapkan apa yang diinginkan dengan menggunakan pengetahuan dan produk yang cocok. Kebebasan menjadi pertimbangan utama ketika dilepas ke publik. Komunitas yang lain mendapat kebebasan untuk belajar, mengutak-ngatik, merevisi ulang, membenarkan ataupun bahkan menyalahkan, tetapi kebebasan ini juga datang bersama dengan tanggung jawab, bukan bebas tanpa tanggung jawab.<br /><br />Pada intinya konsep sumber terbuka adalah membuka \"kode sumber\" dari sebuah perangkat lunak. Konsep ini terasa aneh pada awalnya dikarenakan kode sumber merupakan kunci dari sebuah perangkat lunak. Dengan diketahui logika yang ada di kode sumber, maka orang lain semestinya dapat membuat perangkat lunak yang sama fungsinya. Sumber terbuka hanya sebatas itu. Artinya, dia tidak harus gratis. Definisi sumber terbuka yang asli adalah seperti tertuang dalam OSD (Open Source Definition)/Definisi sumber terbuka.</p>\r\n<p>Pengembangan Senayan awalnya diinisiasi oleh pengelola Perpustakaan Depdiknas. Tetapi sekarang komunitas pengembang Senayan (Senayan Developer Community) yang lebih banyak mengambil peran dalam mengembangkan Senayan. Beberapa hal dibawah ini merupakan kultur yang dibangun dalam mengembangkan Senayan:<br />1.&nbsp;&nbsp;&nbsp; Meritokrasi. Siapa saja bisa berkontribusi. Mereka yang banyak memberikan kontribusi, akan mendapatkan privilege lebih dibandingkan yang lain.<br />2.&nbsp;&nbsp;&nbsp; Minimal punya concern terhadap pengembangan perpustakaan. Contoh lain: berlatar belakang pendidikan ilmu perpustakaan dan informasi, bekerja di perpustakaan, mengelola perpustakaan, dan lain-lain. Diharapkan dengan kondisi ini, sense of librarianship melekat di tiap developer/pengguna Senayan. Sejauh ini, semua developer senayan merupakan pustakawan atau berlatarbelakang pendidikan kepustakawanan (Information and Librarianship).<br />3.&nbsp;&nbsp;&nbsp; Release early, release often, and listen to your customer. Release early artinya setiap perbaikan dan penambahan fitur, secepat mungkin dirilis ke publik. Diharapkan bugs yang ada, bisa cepat ditemukan oleh komunitas, dilaporkan ke developer, untuk kemudian dirilis perbaikannya. Release often, artinya sesering mungkin memberikan update perbaikan bugs dan penambahan fitur. Ini &ldquo;memaksa&rdquo; developer Senayan untuk terus kreatif menambahkan fitur Senayan. Release often juga membuat pengguna berkeyakinan bahwa Senayan punya sustainability yang baik dan terus aktif dikembangkan. Selain itu, release often juga mempunyai dampak pemasaran. Pengguna dan calon pengguna, selalu diingatkan tentang keberadaan Senayan. Tentunya dengan cara yang elegan, yaitu rilis-rilis Senayan. Sejak dirilis ke publi pertama kali November 2007 sampai Juli 2009 (kurang lebih 20 bulan) telah dirilis 18 rilis resmi Senayan. Listen to your customer. Developer Senayan selalu berusaha mengakomodasi kebutuhan pengguna baik yang masuk melalui report di mailing list, ataupun melalui bugs tracking system. Tentu tidak semua masukan diakomodasi, harus disesuaikan dengan desain dan roadmap pengembangan Senayan.<br />4.&nbsp;&nbsp;&nbsp; Dokumentasi. Developer Senayan meyakini pentingnya dokumentasi yang baik dalam mensukseskan implementasi Senayan dibanyak tempat. Karena itu pengembang Senayan mempunyai tim khusus yang bertanggungjawab yang mengembangkan dokumentasi Senayan agar terus uo-to-date mengikuti rilis terbaru.<br />5.&nbsp;&nbsp;&nbsp; Agar ada percepatan dalam pengembangan dan untuk mengakrabkan antar pengembang Senayan, minimal setahun sekali diadakan Senayan Developers Day yang mengumpulkan para developer Senayan dari berbagai kota, dan melakukan coding bersama-sama.</p>','opensource',NULL,0,NULL,'2010-08-29 04:05:16','2010-08-29 04:34:04','1');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
COMMIT;

-- Dumped table `content` with 8 row(s)
--

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file_dir` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mime_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `uploader_id` int NOT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  FULLTEXT KEY `file_name` (`file_name`),
  FULLTEXT KEY `file_dir` (`file_dir`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

/*!40000 ALTER TABLE `files` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
COMMIT;

-- Dumped table `files` with 0 row(s)
--

--
-- Table structure for table `files_read`
--

DROP TABLE IF EXISTS `files_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_read` (
  `filelog_id` int NOT NULL AUTO_INCREMENT,
  `file_id` int NOT NULL,
  `date_read` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `client_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`filelog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_read`
--

/*!40000 ALTER TABLE `files_read` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `files_read` ENABLE KEYS */;
COMMIT;

-- Dumped table `files_read` with 0 row(s)
--

--
-- Table structure for table `fines`
--

DROP TABLE IF EXISTS `fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fines` (
  `fines_id` int NOT NULL AUTO_INCREMENT,
  `fines_date` date NOT NULL,
  `member_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `debet` int DEFAULT '0',
  `credit` int DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fines_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fines`
--

/*!40000 ALTER TABLE `fines` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `fines` ENABLE KEYS */;
COMMIT;

-- Dumped table `fines` with 0 row(s)
--

--
-- Table structure for table `group_access`
--

DROP TABLE IF EXISTS `group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_access` (
  `group_id` int NOT NULL,
  `module_id` int NOT NULL,
  `menus` json DEFAULT NULL,
  `r` int NOT NULL DEFAULT '0',
  `w` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_access`
--

/*!40000 ALTER TABLE `group_access` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `group_access` VALUES (1,1,NULL,1,1);
INSERT INTO `group_access` VALUES (1,2,NULL,1,1);
INSERT INTO `group_access` VALUES (1,3,NULL,1,1);
INSERT INTO `group_access` VALUES (1,4,NULL,1,1);
INSERT INTO `group_access` VALUES (1,5,NULL,1,1);
INSERT INTO `group_access` VALUES (1,6,NULL,1,1);
INSERT INTO `group_access` VALUES (1,7,NULL,1,1);
INSERT INTO `group_access` VALUES (1,8,NULL,1,1);
/*!40000 ALTER TABLE `group_access` ENABLE KEYS */;
COMMIT;

-- Dumped table `group_access` with 8 row(s)
--

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `holiday_id` int NOT NULL AUTO_INCREMENT,
  `holiday_dayname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `holiday_date` date DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`holiday_id`),
  UNIQUE KEY `holiday_dayname` (`holiday_dayname`,`holiday_date`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `holiday` VALUES (1,'Mon','2009-06-01','Tes Libur');
INSERT INTO `holiday` VALUES (2,'Tue','2009-06-02','Tes Libur');
INSERT INTO `holiday` VALUES (3,'Wed','2009-06-03','Tes Libur');
INSERT INTO `holiday` VALUES (4,'Thu','2009-06-04','Tes Libur');
INSERT INTO `holiday` VALUES (5,'Fri','2009-06-05','Tes Libur');
INSERT INTO `holiday` VALUES (6,'Sat','2009-06-06','Tes Libur');
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
COMMIT;

-- Dumped table `holiday` with 6 row(s)
--

--
-- Table structure for table `index_documents`
--

DROP TABLE IF EXISTS `index_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_documents` (
  `document_id` int NOT NULL,
  `word_id` bigint NOT NULL,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit_count` int NOT NULL,
  PRIMARY KEY (`document_id`,`word_id`,`location`),
  KEY `document_id` (`document_id`),
  KEY `word_id` (`word_id`),
  KEY `location` (`location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_documents`
--

/*!40000 ALTER TABLE `index_documents` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `index_documents` ENABLE KEYS */;
COMMIT;

-- Dumped table `index_documents` with 0 row(s)
--

--
-- Table structure for table `index_words`
--

DROP TABLE IF EXISTS `index_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_words` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `word` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_hits` int NOT NULL,
  `doc_hits` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_words`
--

/*!40000 ALTER TABLE `index_words` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `index_words` ENABLE KEYS */;
COMMIT;

-- Dumped table `index_words` with 0 row(s)
--

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `biblio_id` int DEFAULT NULL,
  `call_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `coll_type_id` int DEFAULT NULL,
  `item_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `inventory_code` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `supplier_id` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location_id` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `item_status_id` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `site` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `source` int NOT NULL DEFAULT '0',
  `invoice` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `price_currency` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_code` (`item_code`),
  KEY `uid` (`uid`),
  KEY `item_references_idx` (`coll_type_id`,`location_id`,`item_status_id`),
  KEY `biblio_id_idx` (`biblio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
COMMIT;

-- Dumped table `item` with 0 row(s)
--

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kardex` (
  `kardex_id` int NOT NULL AUTO_INCREMENT,
  `date_expected` date NOT NULL,
  `date_received` date DEFAULT NULL,
  `seq_number` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `serial_id` int DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`kardex_id`),
  KEY `fk_serial` (`serial_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
COMMIT;

-- Dumped table `kardex` with 0 row(s)
--

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `renewed` int NOT NULL DEFAULT '0',
  `loan_rules_id` int NOT NULL DEFAULT '0',
  `actual` date DEFAULT NULL,
  `is_lent` int NOT NULL DEFAULT '0',
  `is_return` int NOT NULL DEFAULT '0',
  `return_date` date DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `item_code` (`item_code`),
  KEY `member_id` (`member_id`),
  KEY `input_date` (`input_date`,`last_update`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
COMMIT;

-- Dumped table `loan` with 0 row(s)
--

--
-- Table structure for table `loan_history`
--

DROP TABLE IF EXISTS `loan_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_history` (
  `loan_id` int NOT NULL,
  `item_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `biblio_id` int NOT NULL,
  `title` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `call_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `classification` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gmd_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `language_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `collection_type_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_type_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `renewed` int NOT NULL DEFAULT '0',
  `is_lent` int NOT NULL DEFAULT '0',
  `is_return` int NOT NULL DEFAULT '0',
  `return_date` date DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `member_name` (`member_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_history`
--

/*!40000 ALTER TABLE `loan_history` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `loan_history` ENABLE KEYS */;
COMMIT;

-- Dumped table `loan_history` with 0 row(s)
--

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `member_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `gender` int NOT NULL,
  `birth_date` date DEFAULT NULL,
  `member_type_id` int DEFAULT NULL,
  `member_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_mail_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `inst_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_new` int DEFAULT NULL,
  `member_image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_fax` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_since_date` date DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `expire_date` date NOT NULL,
  `member_notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_pending` smallint NOT NULL DEFAULT '0',
  `mpasswd` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_login_ip` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`member_name`),
  KEY `member_type_id` (`member_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

/*!40000 ALTER TABLE `member` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
COMMIT;

-- Dumped table `member` with 0 row(s)
--

--
-- Table structure for table `member_custom`
--

DROP TABLE IF EXISTS `member_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_custom` (
  `member_id` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='one to one relation with real member table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_custom`
--

/*!40000 ALTER TABLE `member_custom` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `member_custom` ENABLE KEYS */;
COMMIT;

-- Dumped table `member_custom` with 0 row(s)
--

--
-- Table structure for table `mst_author`
--

DROP TABLE IF EXISTS `mst_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `author_year` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `authority_type` enum('p','o','c') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'p',
  `auth_list` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_name` (`author_name`,`authority_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_author`
--

/*!40000 ALTER TABLE `mst_author` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_author` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_author` with 0 row(s)
--

--
-- Table structure for table `mst_carrier_type`
--

DROP TABLE IF EXISTS `mst_carrier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_carrier_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carrier_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_type` (`carrier_type`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_carrier_type`
--

/*!40000 ALTER TABLE `mst_carrier_type` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_carrier_type` VALUES (1,'audio cartridge','sg','g','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (2,'audio cylinder','se','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (3,'audio disc','sd','d','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (4,'sound track reel','si','i','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (5,'audio roll','sq','q','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (6,'audiocassette','ss','s','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (7,'audiotape reel','st','t','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (8,'other (audio)','sz','z','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (9,'computer card','ck','k','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (10,'computer chip cartridge','cb','b','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (11,'computer disc','cd','d','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (12,'computer disc cartridge','ce','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (13,'computer tape cartridge','ca','a','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (14,'computer tape cassette','cf','f','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (15,'computer tape reel','ch','h','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (16,'online resource','cr','r','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (17,'other (computer)','cz','z','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (18,'aperture card','ha','a','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (19,'microfiche','he','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (20,'microfiche cassette','hf','f','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (21,'microfilm cartridge','hb','b','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (22,'microfilm cassette','hc','c','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (23,'microfilm reel','hd','d','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (24,'microfilm roll','hj','j','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (25,'microfilm slip','hh','h','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (26,'microopaque','hg','g','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (27,'other (microform)','hz','z','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (28,'microscope slide','pp','p','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (29,'other (microscope)','pz','z','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (30,'film cartridge','mc','c','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (31,'film cassette','mf','f','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (32,'film reel','mr','r','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (33,'film roll','mo','o','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (34,'filmslip','gd','d','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (35,'filmstrip','gf','f','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (36,'filmstrip cartridge','gc','c','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (37,'overhead transparency','gt','t','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (38,'slide','gs','s','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (39,'other (projected image)','mz','z','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (40,'stereograph card','eh','h','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (41,'stereograph disc','es','s','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (42,'other (stereographic)','ez','z','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (43,'card','no','o','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (44,'flipchart','nn','n','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (45,'roll','na','a','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (46,'sheet','nb','b','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (47,'volume','nc','c','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (48,'object','nr','r','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (49,'other (unmediated)','nz','','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (50,'video cartridge','vc','','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (51,'videocassette','vf','','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (52,'videodisc','vd','','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (53,'videotape reel','vr','','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (54,'other (video)','vz','','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_carrier_type` VALUES (55,'unspecified','zu','u','2024-08-02 13:45:11','2024-08-02 13:45:11');
/*!40000 ALTER TABLE `mst_carrier_type` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_carrier_type` with 55 row(s)
--

--
-- Table structure for table `mst_coll_type`
--

DROP TABLE IF EXISTS `mst_coll_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_coll_type` (
  `coll_type_id` int NOT NULL AUTO_INCREMENT,
  `coll_type_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`coll_type_id`),
  UNIQUE KEY `coll_type_name` (`coll_type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_coll_type`
--

/*!40000 ALTER TABLE `mst_coll_type` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_coll_type` VALUES (1,'Reference','2007-11-29','2007-11-29');
INSERT INTO `mst_coll_type` VALUES (2,'Textbook','2007-11-29','2007-11-29');
INSERT INTO `mst_coll_type` VALUES (3,'Fiction','2007-11-29','2007-11-29');
/*!40000 ALTER TABLE `mst_coll_type` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_coll_type` with 3 row(s)
--

--
-- Table structure for table `mst_content_type`
--

DROP TABLE IF EXISTS `mst_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type` (`content_type`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_content_type`
--

/*!40000 ALTER TABLE `mst_content_type` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_content_type` VALUES (1,'cartographic dataset','crd','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (2,'cartographic image','cri','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (3,'cartographic moving image','crm','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (4,'cartographic tactile image','crt','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (5,'cartographic tactile three-dimensional form','crn','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (6,'cartographic three-dimensional form','crf','e','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (7,'computer dataset','cod','m','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (8,'computer program','cop','m','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (9,'notated movement','ntv','a','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (10,'notated music','ntm','c','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (11,'performed music','prm','j','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (12,'sounds','snd','i','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (13,'spoken word','spw','i','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (14,'still image','sti','k','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (15,'tactile image','tci','k','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (16,'tactile notated music','tcm','c','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (17,'tactile notated movement','tcn','a','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (18,'tactile text','tct','a','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (19,'tactile three-dimensional form','tcf','r','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (20,'text','txt','a','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (21,'three-dimensional form','tdf','r','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (22,'three-dimensional moving image','tdm','g','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (23,'two-dimensional moving image','tdi','g','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (24,'other','xxx','o','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_content_type` VALUES (25,'unspecified','zzz','','2024-08-02 13:45:11','2024-08-02 13:45:11');
/*!40000 ALTER TABLE `mst_content_type` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_content_type` with 25 row(s)
--

--
-- Table structure for table `mst_custom_field`
--

DROP TABLE IF EXISTS `mst_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_custom_field` (
  `field_id` int NOT NULL AUTO_INCREMENT,
  `primary_table` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dbfield` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `label` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('text','checklist','numeric','dropdown','longtext','choice','date') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `default` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `max` int DEFAULT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `indexed` tinyint(1) DEFAULT NULL,
  `class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `width` int DEFAULT '100',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`dbfield`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_custom_field`
--

/*!40000 ALTER TABLE `mst_custom_field` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_custom_field` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_custom_field` with 0 row(s)
--

--
-- Table structure for table `mst_frequency`
--

DROP TABLE IF EXISTS `mst_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_frequency` (
  `frequency_id` int NOT NULL AUTO_INCREMENT,
  `frequency` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `language_prefix` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `time_increment` smallint DEFAULT NULL,
  `time_unit` enum('day','week','month','year') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'day',
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`frequency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_frequency`
--

/*!40000 ALTER TABLE `mst_frequency` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_frequency` VALUES (1,'Weekly','en',1,'week','2009-05-23','2009-05-23');
INSERT INTO `mst_frequency` VALUES (2,'Bi-weekly','en',2,'week','2009-05-23','2009-05-23');
INSERT INTO `mst_frequency` VALUES (3,'Fourth-Nightly','en',14,'day','2009-05-23','2009-05-23');
INSERT INTO `mst_frequency` VALUES (4,'Monthly','en',1,'month','2009-05-23','2009-05-23');
INSERT INTO `mst_frequency` VALUES (5,'Bi-Monthly','en',2,'month','2009-05-23','2009-05-23');
INSERT INTO `mst_frequency` VALUES (6,'Quarterly','en',3,'month','2009-05-23','2009-05-23');
INSERT INTO `mst_frequency` VALUES (7,'3 Times a Year','en',4,'month','2009-05-23','2009-05-23');
INSERT INTO `mst_frequency` VALUES (8,'Annualy','en',1,'year','2009-05-23','2009-05-23');
/*!40000 ALTER TABLE `mst_frequency` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_frequency` with 8 row(s)
--

--
-- Table structure for table `mst_gmd`
--

DROP TABLE IF EXISTS `mst_gmd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_gmd` (
  `gmd_id` int NOT NULL AUTO_INCREMENT,
  `gmd_code` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gmd_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon_image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`gmd_id`),
  UNIQUE KEY `gmd_name` (`gmd_name`),
  UNIQUE KEY `gmd_code` (`gmd_code`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_gmd`
--

/*!40000 ALTER TABLE `mst_gmd` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_gmd` VALUES (1,'TE','Text',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (2,'AR','Art Original',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (3,'CH','Chart',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (4,'CO','Computer Software',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (5,'DI','Diorama',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (6,'FI','Filmstrip',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (7,'FL','Flash Card',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (8,'GA','Game',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (9,'GL','Globe',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (10,'KI','Kit',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (11,'MA','Map',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (12,'MI','Microform',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (13,'MN','Manuscript',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (14,'MO','Model',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (15,'MP','Motion Picture',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (16,'MS','Microscope Slide',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (17,'MU','Music',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (18,'PI','Picture',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (19,'RE','Realia',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (20,'SL','Slide',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (21,'SO','Sound Recording',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (22,'TD','Technical Drawing',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (23,'TR','Transparency',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (24,'VI','Video Recording',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (25,'EQ','Equipment',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (26,'CF','Computer File',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (27,'CA','Cartographic Material',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (28,'CD','CD-ROM',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (29,'MV','Multimedia',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (30,'ER','Electronic Resource',NULL,'2024-08-02','2024-08-02');
INSERT INTO `mst_gmd` VALUES (31,'DVD','Digital Versatile Disc',NULL,'2024-08-02','2024-08-02');
/*!40000 ALTER TABLE `mst_gmd` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_gmd` with 31 row(s)
--

--
-- Table structure for table `mst_item_status`
--

DROP TABLE IF EXISTS `mst_item_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_item_status` (
  `item_status_id` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_status_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rules` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_loan` smallint NOT NULL DEFAULT '0',
  `skip_stock_take` smallint NOT NULL DEFAULT '0',
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`item_status_id`),
  UNIQUE KEY `item_status_name` (`item_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_item_status`
--

/*!40000 ALTER TABLE `mst_item_status` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_item_status` VALUES ('R','Repair','a:1:{i:0;s:1:\"1\";}',1,1,'2024-08-02','2024-08-02');
INSERT INTO `mst_item_status` VALUES ('NL','No Loan','a:1:{i:0;s:1:\"1\";}',1,1,'2024-08-02','2024-08-02');
INSERT INTO `mst_item_status` VALUES ('MIS','Missing',NULL,1,1,'2024-08-02','2024-08-02');
/*!40000 ALTER TABLE `mst_item_status` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_item_status` with 3 row(s)
--

--
-- Table structure for table `mst_label`
--

DROP TABLE IF EXISTS `mst_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_label` (
  `label_id` int NOT NULL AUTO_INCREMENT,
  `label_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `label_desc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `label_image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `label_name` (`label_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_label`
--

/*!40000 ALTER TABLE `mst_label` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_label` VALUES (1,'label-new','New Title','label-new.png','2024-08-02','2024-08-02');
INSERT INTO `mst_label` VALUES (2,'label-favorite','Favorite Title','label-favorite.png','2024-08-02','2024-08-02');
INSERT INTO `mst_label` VALUES (3,'label-multimedia','Multimedia','label-multimedia.png','2024-08-02','2024-08-02');
/*!40000 ALTER TABLE `mst_label` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_label` with 3 row(s)
--

--
-- Table structure for table `mst_language`
--

DROP TABLE IF EXISTS `mst_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_language` (
  `language_id` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `language_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_name` (`language_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_language`
--

/*!40000 ALTER TABLE `mst_language` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_language` VALUES ('id','Indonesia','2024-08-02','2024-08-02');
INSERT INTO `mst_language` VALUES ('en','English','2024-08-02','2024-08-02');
/*!40000 ALTER TABLE `mst_language` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_language` with 2 row(s)
--

--
-- Table structure for table `mst_loan_rules`
--

DROP TABLE IF EXISTS `mst_loan_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_loan_rules` (
  `loan_rules_id` int NOT NULL AUTO_INCREMENT,
  `member_type_id` int NOT NULL DEFAULT '0',
  `coll_type_id` int DEFAULT '0',
  `gmd_id` int DEFAULT '0',
  `loan_limit` int DEFAULT '0',
  `loan_periode` int DEFAULT '0',
  `reborrow_limit` int DEFAULT '0',
  `fine_each_day` int DEFAULT '0',
  `grace_periode` int DEFAULT '0',
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`loan_rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_loan_rules`
--

/*!40000 ALTER TABLE `mst_loan_rules` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_loan_rules` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_loan_rules` with 0 row(s)
--

--
-- Table structure for table `mst_location`
--

DROP TABLE IF EXISTS `mst_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_location` (
  `location_id` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `location_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_name` (`location_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_location`
--

/*!40000 ALTER TABLE `mst_location` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_location` VALUES ('SL','My Library','2024-08-02','2024-08-02');
/*!40000 ALTER TABLE `mst_location` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_location` with 1 row(s)
--

--
-- Table structure for table `mst_media_type`
--

DROP TABLE IF EXISTS `mst_media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_media_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `media_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_type` (`media_type`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_media_type`
--

/*!40000 ALTER TABLE `mst_media_type` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_media_type` VALUES (1,'audio','s','s','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (2,'computer','c','c','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (3,'microform','h','h','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (4,'microscopic','p','','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (5,'projected','g','g','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (6,'stereographic','e','','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (7,'unmediated','n','t','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (8,'video','v','v','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (9,'other','x','z','2024-08-02 13:45:11','2024-08-02 13:45:11');
INSERT INTO `mst_media_type` VALUES (10,'unspecified','z','z','2024-08-02 13:45:11','2024-08-02 13:45:11');
/*!40000 ALTER TABLE `mst_media_type` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_media_type` with 10 row(s)
--

--
-- Table structure for table `mst_member_type`
--

DROP TABLE IF EXISTS `mst_member_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_member_type` (
  `member_type_id` int NOT NULL AUTO_INCREMENT,
  `member_type_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `loan_limit` int NOT NULL,
  `loan_periode` int NOT NULL,
  `enable_reserve` int NOT NULL DEFAULT '0',
  `reserve_limit` int NOT NULL DEFAULT '0',
  `member_periode` int NOT NULL,
  `reborrow_limit` int NOT NULL,
  `fine_each_day` int NOT NULL,
  `grace_periode` int DEFAULT '0',
  `input_date` date NOT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`member_type_id`),
  UNIQUE KEY `member_type_name` (`member_type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_member_type`
--

/*!40000 ALTER TABLE `mst_member_type` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_member_type` VALUES (1,'Standard',2,7,1,2,365,1,0,0,'2024-08-02','2024-08-02');
/*!40000 ALTER TABLE `mst_member_type` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_member_type` with 1 row(s)
--

--
-- Table structure for table `mst_module`
--

DROP TABLE IF EXISTS `mst_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_module` (
  `module_id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `module_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`,`module_path`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_module`
--

/*!40000 ALTER TABLE `mst_module` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_module` VALUES (1,'bibliography','bibliography','Manage your bibliographic/catalog and items/copies database');
INSERT INTO `mst_module` VALUES (2,'circulation','circulation','Module for doing library items circulation such as loan and return');
INSERT INTO `mst_module` VALUES (3,'membership','membership','Manage your library membership and membership type');
INSERT INTO `mst_module` VALUES (4,'master_file','master_file','Manage your referential data that will be used by other modules');
INSERT INTO `mst_module` VALUES (5,'stock_take','stock_take','Ease your pain in doing library stock opname process');
INSERT INTO `mst_module` VALUES (6,'system','system','Configure system behaviour, user and backups');
INSERT INTO `mst_module` VALUES (7,'reporting','reporting','Real time and dynamic report about library collections and circulation');
INSERT INTO `mst_module` VALUES (8,'serial_control','serial_control','Serial publication management');
/*!40000 ALTER TABLE `mst_module` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_module` with 8 row(s)
--

--
-- Table structure for table `mst_place`
--

DROP TABLE IF EXISTS `mst_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_place` (
  `place_id` int NOT NULL AUTO_INCREMENT,
  `place_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`place_id`),
  UNIQUE KEY `place_name` (`place_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_place`
--

/*!40000 ALTER TABLE `mst_place` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_place` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_place` with 0 row(s)
--

--
-- Table structure for table `mst_publisher`
--

DROP TABLE IF EXISTS `mst_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `publisher_name` (`publisher_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_publisher`
--

/*!40000 ALTER TABLE `mst_publisher` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_publisher` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_publisher` with 0 row(s)
--

--
-- Table structure for table `mst_relation_term`
--

DROP TABLE IF EXISTS `mst_relation_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_relation_term` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `rt_id` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rt_desc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_relation_term`
--

/*!40000 ALTER TABLE `mst_relation_term` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_relation_term` VALUES (1,'U','Use');
INSERT INTO `mst_relation_term` VALUES (2,'UF','Use For');
INSERT INTO `mst_relation_term` VALUES (3,'BT','Broader Term');
INSERT INTO `mst_relation_term` VALUES (4,'NT','Narrower Term');
INSERT INTO `mst_relation_term` VALUES (5,'RT','Related Term');
INSERT INTO `mst_relation_term` VALUES (6,'SA','See Also');
/*!40000 ALTER TABLE `mst_relation_term` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_relation_term` with 6 row(s)
--

--
-- Table structure for table `mst_servers`
--

DROP TABLE IF EXISTS `mst_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_servers` (
  `server_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uri` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `server_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - p2p server; 2 - z3950; 3 - z3950  SRU',
  `input_date` datetime NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_servers`
--

/*!40000 ALTER TABLE `mst_servers` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_servers` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_servers` with 0 row(s)
--

--
-- Table structure for table `mst_supplier`
--

DROP TABLE IF EXISTS `mst_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `postal_code` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact` char(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fax` char(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `account` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `e_mail` char(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_name` (`supplier_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_supplier`
--

/*!40000 ALTER TABLE `mst_supplier` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_supplier` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_supplier` with 0 row(s)
--

--
-- Table structure for table `mst_topic`
--

DROP TABLE IF EXISTS `mst_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_topic` (
  `topic_id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `topic_type` enum('t','g','n','tm','gr','oc') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `auth_list` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `classification` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Classification Code',
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_type`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_topic`
--

/*!40000 ALTER TABLE `mst_topic` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `mst_topic` VALUES (1,'Programming','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (2,'Website','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (3,'Operating System','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (4,'Linux','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (5,'Computer','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (6,'Database','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (7,'RDBMS','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (8,'Open Source','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (9,'Project','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (10,'Design','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (11,'Information','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (12,'Organization','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (13,'Metadata','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (14,'Library','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (15,'Corruption','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (16,'Development','t',NULL,'','2007-11-29','2007-11-29');
INSERT INTO `mst_topic` VALUES (17,'Poverty','t',NULL,'','2007-11-29','2007-11-29');
/*!40000 ALTER TABLE `mst_topic` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_topic` with 17 row(s)
--

--
-- Table structure for table `mst_visitor_room`
--

DROP TABLE IF EXISTS `mst_visitor_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_visitor_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Code for identification each room',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_code_unq` (`unique_code`),
  KEY `unique_code_idx` (`unique_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_visitor_room`
--

/*!40000 ALTER TABLE `mst_visitor_room` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_visitor_room` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_visitor_room` with 0 row(s)
--

--
-- Table structure for table `mst_voc_ctrl`
--

DROP TABLE IF EXISTS `mst_voc_ctrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_voc_ctrl` (
  `vocabolary_id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `rt_id` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_topic_id` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `scope` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`vocabolary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_voc_ctrl`
--

/*!40000 ALTER TABLE `mst_voc_ctrl` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `mst_voc_ctrl` ENABLE KEYS */;
COMMIT;

-- Dumped table `mst_voc_ctrl` with 0 row(s)
--

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json DEFAULT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `uid` int NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
COMMIT;

-- Dumped table `plugins` with 0 row(s)
--

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve` (
  `reserve_id` int NOT NULL AUTO_INCREMENT,
  `member_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `biblio_id` int NOT NULL,
  `item_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reserve_date` datetime NOT NULL,
  PRIMARY KEY (`reserve_id`),
  KEY `references_idx` (`member_id`,`biblio_id`),
  KEY `item_code_idx` (`item_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve`
--

/*!40000 ALTER TABLE `reserve` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `reserve` ENABLE KEYS */;
COMMIT;

-- Dumped table `reserve` with 0 row(s)
--

--
-- Table structure for table `search_biblio`
--

DROP TABLE IF EXISTS `search_biblio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_biblio` (
  `biblio_id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `edition` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isbn_issn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `author` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `topic` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `gmd` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `publisher` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `publish_place` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `language` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `classification` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `spec_detail_info` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `carrier_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `media_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `location` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `publish_year` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `series_title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `items` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `collection_types` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `call_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `opac_hide` smallint NOT NULL DEFAULT '0',
  `promoted` smallint NOT NULL DEFAULT '0',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `collation` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  UNIQUE KEY `biblio_id` (`biblio_id`),
  KEY `add_indexes` (`gmd`,`publisher`,`publish_place`,`language`,`classification`,`publish_year`,`call_number`),
  KEY `add_indexes2` (`opac_hide`,`promoted`),
  KEY `rda_indexes` (`carrier_type`,`media_type`,`content_type`),
  FULLTEXT KEY `title` (`title`,`series_title`),
  FULLTEXT KEY `author` (`author`),
  FULLTEXT KEY `topic` (`topic`),
  FULLTEXT KEY `location` (`location`),
  FULLTEXT KEY `items` (`items`),
  FULLTEXT KEY `collection_types` (`collection_types`),
  FULLTEXT KEY `labels` (`labels`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='index table for advance searching technique for SLiMS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_biblio`
--

/*!40000 ALTER TABLE `search_biblio` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `search_biblio` ENABLE KEYS */;
COMMIT;

-- Dumped table `search_biblio` with 0 row(s)
--

--
-- Table structure for table `serial`
--

DROP TABLE IF EXISTS `serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serial` (
  `serial_id` int NOT NULL AUTO_INCREMENT,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `period` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `biblio_id` int DEFAULT NULL,
  `gmd_id` int DEFAULT NULL,
  `input_date` date NOT NULL,
  `last_update` date NOT NULL,
  PRIMARY KEY (`serial_id`),
  KEY `fk_serial_biblio` (`biblio_id`),
  KEY `fk_serial_gmd` (`gmd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serial`
--

/*!40000 ALTER TABLE `serial` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `serial` ENABLE KEYS */;
COMMIT;

-- Dumped table `serial` with 0 row(s)
--

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `setting_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `setting_name` (`setting_name`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `setting` VALUES (1,'library_name','s:136:\"ပတ်ဝန်းကျင်ထိန်းသိမ်းရေးဦးစီးဌာန စာကြည့်တိုက်\";');
INSERT INTO `setting` VALUES (2,'library_subname','s:37:\"Open Source Library Management System\";');
INSERT INTO `setting` VALUES (3,'template','a:23:{s:5:\"theme\";s:7:\"default\";s:3:\"css\";s:26:\"template/default/style.css\";s:10:\"responsive\";s:1:\"1\";s:23:\"classic_library_subname\";s:1:\"1\";s:28:\"classic_library_disableslide\";s:1:\"1\";s:24:\"classic_slide_transition\";s:4:\"fade\";s:23:\"classic_slide_animation\";s:4:\"none\";s:19:\"classic_slide_delay\";s:4:\"5000\";s:26:\"classic_popular_collection\";s:1:\"1\";s:31:\"classic_popular_collection_item\";s:1:\"6\";s:22:\"classic_new_collection\";s:1:\"1\";s:27:\"classic_new_collection_item\";s:1:\"6\";s:18:\"classic_top_reader\";s:1:\"1\";s:18:\"classic_suggestion\";s:1:\"1\";s:11:\"classic_map\";s:1:\"1\";s:16:\"classic_map_link\";s:264:\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.288723306273!2d106.80038831428296!3d-6.225610995493402!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f14efd9abf05%3A0x1659580cc6981749!2sPerpustakaan+Kemendikbud!5e0!3m2!1sid!2sid!4v1516601731218\";s:16:\"classic_map_desc\";s:240:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et nunc mi. Donec vehicula turpis a quam venenatis posuere. Aliquam nibh lectus, gravida et leo sit amet, dignissim dapibus mauris.Telp. (021) 9172638Fax. (021) 9172638 \";s:15:\"classic_fb_link\";s:45:\"https://www.facebook.com/groups/senayan.slims\";s:20:\"classic_twitter_link\";s:34:\"https://twitter.com/slims_official\";s:20:\"classic_youtube_link\";s:19:\"https://youtube.com\";s:22:\"classic_instagram_link\";s:31:\"https://instagram.com/slims.sdc\";s:23:\"classic_footer_about_us\";s:234:\"As a complete Library Management System, SLiMS (Senayan Library Management System) has many features that will help libraries and librarians to do their job easily and quickly. Follow this link to show some features provided by SLiMS.\";s:17:\"visitor_log_voice\";s:1:\"1\";}');
INSERT INTO `setting` VALUES (4,'admin_template','a:2:{s:5:\"theme\";s:7:\"default\";s:3:\"css\";s:32:\"admin_template/default/style.css\";}');
INSERT INTO `setting` VALUES (5,'default_lang','s:5:\"en_US\";');
INSERT INTO `setting` VALUES (6,'opac_result_num','s:2:\"10\";');
INSERT INTO `setting` VALUES (7,'enable_promote_titles','N;');
INSERT INTO `setting` VALUES (8,'quick_return','b:1;');
INSERT INTO `setting` VALUES (9,'allow_loan_date_change','b:0;');
INSERT INTO `setting` VALUES (10,'loan_limit_override','b:0;');
INSERT INTO `setting` VALUES (11,'enable_xml_detail','b:1;');
INSERT INTO `setting` VALUES (12,'enable_xml_result','b:1;');
INSERT INTO `setting` VALUES (13,'allow_file_download','b:1;');
INSERT INTO `setting` VALUES (14,'session_timeout','s:4:\"7200\";');
INSERT INTO `setting` VALUES (15,'circulation_receipt','b:0;');
INSERT INTO `setting` VALUES (16,'barcode_encoding','s:7:\"code128\";');
INSERT INTO `setting` VALUES (17,'ignore_holidays_fine_calc','b:0;');
INSERT INTO `setting` VALUES (18,'barcode_print_settings','a:12:{s:19:\"barcode_page_margin\";d:0.200000000000000011102230246251565404236316680908203125;s:21:\"barcode_items_per_row\";i:3;s:20:\"barcode_items_margin\";d:0.1000000000000000055511151231257827021181583404541015625;s:17:\"barcode_box_width\";i:7;s:18:\"barcode_box_height\";i:5;s:27:\"barcode_include_header_text\";i:1;s:17:\"barcode_cut_title\";i:50;s:19:\"barcode_header_text\";s:0:\"\";s:13:\"barcode_fonts\";s:41:\"Arial, Verdana, Helvetica, \'Trebuchet MS\'\";s:17:\"barcode_font_size\";i:11;s:13:\"barcode_scale\";i:70;s:19:\"barcode_border_size\";i:1;}');
INSERT INTO `setting` VALUES (19,'label_print_settings','a:10:{s:11:\"page_margin\";d:0.200000000000000011102230246251565404236316680908203125;s:13:\"items_per_row\";i:3;s:12:\"items_margin\";d:0.05000000000000000277555756156289135105907917022705078125;s:9:\"box_width\";i:8;s:10:\"box_height\";d:3.29999999999999982236431605997495353221893310546875;s:19:\"include_header_text\";i:1;s:11:\"header_text\";s:0:\"\";s:5:\"fonts\";s:41:\"Arial, Verdana, Helvetica, \'Trebuchet MS\'\";s:9:\"font_size\";i:11;s:11:\"border_size\";i:1;}');
INSERT INTO `setting` VALUES (20,'membercard_print_settings','a:1:{s:5:\"print\";a:1:{s:10:\"membercard\";a:61:{s:11:\"card_factor\";s:12:\"37.795275591\";s:21:\"card_include_id_label\";i:1;s:23:\"card_include_name_label\";i:1;s:22:\"card_include_pin_label\";i:1;s:23:\"card_include_inst_label\";i:0;s:24:\"card_include_email_label\";i:0;s:26:\"card_include_address_label\";i:1;s:26:\"card_include_barcode_label\";i:1;s:26:\"card_include_expired_label\";i:1;s:14:\"card_box_width\";d:8.5999999999999996447286321199499070644378662109375;s:15:\"card_box_height\";d:5.4000000000000003552713678800500929355621337890625;s:9:\"card_logo\";s:8:\"logo.png\";s:21:\"card_front_logo_width\";s:0:\"\";s:22:\"card_front_logo_height\";s:0:\"\";s:20:\"card_front_logo_left\";s:0:\"\";s:19:\"card_front_logo_top\";s:0:\"\";s:20:\"card_back_logo_width\";s:0:\"\";s:21:\"card_back_logo_height\";s:0:\"\";s:19:\"card_back_logo_left\";s:0:\"\";s:18:\"card_back_logo_top\";s:0:\"\";s:15:\"card_photo_left\";s:0:\"\";s:14:\"card_photo_top\";s:0:\"\";s:16:\"card_photo_width\";d:1.5;s:17:\"card_photo_height\";d:1.8000000000000000444089209850062616169452667236328125;s:23:\"card_front_header1_text\";s:19:\"Library Member Card\";s:28:\"card_front_header1_font_size\";s:2:\"12\";s:23:\"card_front_header2_text\";s:10:\"My Library\";s:28:\"card_front_header2_font_size\";s:2:\"12\";s:22:\"card_back_header1_text\";s:10:\"My Library\";s:27:\"card_back_header1_font_size\";s:2:\"12\";s:22:\"card_back_header2_text\";s:35:\"My Library Full Address and Website\";s:27:\"card_back_header2_font_size\";s:1:\"5\";s:17:\"card_header_color\";s:7:\"#0066FF\";s:18:\"card_bio_font_size\";s:2:\"11\";s:20:\"card_bio_font_weight\";s:4:\"bold\";s:20:\"card_bio_label_width\";s:3:\"100\";s:9:\"card_city\";s:9:\"City Name\";s:10:\"card_title\";s:15:\"Library Manager\";s:14:\"card_officials\";s:14:\"Librarian Name\";s:17:\"card_officials_id\";s:12:\"Librarian ID\";s:15:\"card_stamp_file\";s:9:\"stamp.png\";s:19:\"card_signature_file\";s:13:\"signature.png\";s:15:\"card_stamp_left\";s:0:\"\";s:14:\"card_stamp_top\";s:0:\"\";s:16:\"card_stamp_width\";s:0:\"\";s:17:\"card_stamp_height\";s:0:\"\";s:13:\"card_exp_left\";s:0:\"\";s:12:\"card_exp_top\";s:0:\"\";s:14:\"card_exp_width\";s:0:\"\";s:15:\"card_exp_height\";s:0:\"\";s:18:\"card_barcode_scale\";i:100;s:17:\"card_barcode_left\";s:0:\"\";s:16:\"card_barcode_top\";s:0:\"\";s:18:\"card_barcode_width\";s:0:\"\";s:19:\"card_barcode_height\";s:0:\"\";s:10:\"card_rules\";s:120:\"<ul><li>This card is published by Library.</li><li>Please return this card to its owner if you found it.</li></ul>\";s:20:\"card_rules_font_size\";s:1:\"8\";s:12:\"card_address\";s:76:\"My Library<br />website: http://slims.web.id, email : librarian@slims.web.id\";s:22:\"card_address_font_size\";s:1:\"7\";s:17:\"card_address_left\";s:0:\"\";s:16:\"card_address_top\";s:0:\"\";}}}');
INSERT INTO `setting` VALUES (21,'enable_visitor_limitation','s:1:\"0\";');
INSERT INTO `setting` VALUES (22,'time_visitor_limitation','s:2:\"60\";');
INSERT INTO `setting` VALUES (23,'logo_image','s:8:\"logo.png\";');
INSERT INTO `setting` VALUES (24,'timezone','s:11:\"Asia/Yangon\";');
INSERT INTO `setting` VALUES (25,'search_engine','s:34:\"SLiMS\\\\SearchEngine\\\\DefaultEngine\";');
INSERT INTO `setting` VALUES (26,'enable_counter_by_ip','s:1:\"1\";');
INSERT INTO `setting` VALUES (27,'allowed_counter_ip','a:1:{i:0;s:9:\"127.0.0.1\";}');
INSERT INTO `setting` VALUES (28,'reserve_direct_database','s:1:\"1\";');
INSERT INTO `setting` VALUES (29,'reserve_on_loan_only','s:1:\"0\";');
INSERT INTO `setting` VALUES (42,'spellchecker_enabled','b:1;');
INSERT INTO `setting` VALUES (31,'enable_chbox_confirm','i:1;');
INSERT INTO `setting` VALUES (32,'http','a:2:{s:6:\"client\";a:2:{s:6:\"verify\";b:1;s:7:\"timeout\";i:60;}s:5:\"cache\";a:1:{s:8:\"lifetime\";i:300;}}');
INSERT INTO `setting` VALUES (33,'static_file_version','i:1468374384;');
INSERT INTO `setting` VALUES (35,'webicon','s:11:\"webicon.png\";');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
COMMIT;

-- Dumped table `setting` with 34 row(s)
--

--
-- Table structure for table `stock_take`
--

DROP TABLE IF EXISTS `stock_take`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_take` (
  `stock_take_id` int NOT NULL AUTO_INCREMENT,
  `stock_take_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `init_user` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_item_stock_taked` int DEFAULT NULL,
  `total_item_lost` int DEFAULT NULL,
  `total_item_exists` int DEFAULT '0',
  `total_item_loan` int DEFAULT NULL,
  `stock_take_users` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active` int NOT NULL DEFAULT '0',
  `report_file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stock_take_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_take`
--

/*!40000 ALTER TABLE `stock_take` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `stock_take` ENABLE KEYS */;
COMMIT;

-- Dumped table `stock_take` with 0 row(s)
--

--
-- Table structure for table `stock_take_item`
--

DROP TABLE IF EXISTS `stock_take_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_take_item` (
  `stock_take_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `gmd_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `classification` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `coll_type_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `call_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('e','m','u','l') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'm',
  `checked_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_take_id`,`item_id`),
  UNIQUE KEY `item_code` (`item_code`),
  KEY `status` (`status`),
  KEY `item_properties_idx` (`gmd_name`,`classification`,`coll_type_name`,`location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_take_item`
--

/*!40000 ALTER TABLE `stock_take_item` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `stock_take_item` ENABLE KEYS */;
COMMIT;

-- Dumped table `stock_take_item` with 0 row(s)
--

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_type` enum('staff','member','system') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'staff',
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `log_location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sub_module` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `log_msg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `system_log` VALUES (1,'staff','Admin','Login','','','Login success for user Admin from address ::1','2024-08-02 14:17:31');
INSERT INTO `system_log` VALUES (2,'staff','1','system','','','Admin Log Out from application from address ::1','2024-08-02 14:17:45');
INSERT INTO `system_log` VALUES (3,'staff','Admin','Login','','','Login success for user Admin from address ::1','2024-08-02 14:17:47');
INSERT INTO `system_log` VALUES (4,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:38:46');
INSERT INTO `system_log` VALUES (5,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:39:03');
INSERT INTO `system_log` VALUES (6,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:39:20');
INSERT INTO `system_log` VALUES (7,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:39:53');
INSERT INTO `system_log` VALUES (8,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:42:04');
INSERT INTO `system_log` VALUES (9,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:43:33');
INSERT INTO `system_log` VALUES (10,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:43:49');
INSERT INTO `system_log` VALUES (11,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:44:02');
INSERT INTO `system_log` VALUES (12,'staff','1','system','Global Config','Update','Admin change application global configuration','2024-08-02 14:14:03');
INSERT INTO `system_log` VALUES (13,'staff','1','system','','','Admin Log Out from application from address ::1','2024-08-02 14:17:55');
INSERT INTO `system_log` VALUES (14,'staff','Admin','Login','','','Login success for user Admin from address ::1','2024-08-02 14:17:57');
INSERT INTO `system_log` VALUES (15,'staff','1','system','','','Admin Log Out from application from address ::1','2024-08-02 14:18:02');
INSERT INTO `system_log` VALUES (16,'staff','Admin','Login','','','Login success for user Admin from address ::1','2024-08-02 14:19:07');
INSERT INTO `system_log` VALUES (17,'member','Admin','Login','','','Login FAILED for member Admin from address ::1','2024-08-02 14:22:30');
INSERT INTO `system_log` VALUES (18,'member','Admin','Login','','','Login FAILED for member Admin from address ::1','2024-08-02 14:22:34');
INSERT INTO `system_log` VALUES (19,'member','Admin','Login','','','Login FAILED for member Admin from address ::1','2024-08-02 14:22:38');
INSERT INTO `system_log` VALUES (20,'member','admin','Login','','','Login FAILED for member admin from address ::1','2024-08-02 14:22:44');
INSERT INTO `system_log` VALUES (21,'member','admin','Login','','','Login FAILED for member admin from address ::1','2024-08-02 14:22:50');
INSERT INTO `system_log` VALUES (22,'staff','1','system','','','Admin Log Out from application from address ::1','2024-08-02 14:23:10');
INSERT INTO `system_log` VALUES (23,'staff','Admin','Login','','','Login success for user Admin from address ::1','2024-08-02 14:23:14');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
COMMIT;

-- Dumped table `system_log` with 23 row(s)
--

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `realname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `passwd` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `2fa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_type` smallint DEFAULT NULL,
  `user_image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `social_media` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_login` datetime DEFAULT NULL,
  `last_login_ip` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `groups` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin_template` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `forgot` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `realname` (`realname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `user` VALUES (1,'admin','Admin','$2y$10$5y9TOmu.OYNLyhgeYKNxBua91b9ZrOUnhaSwS8N/lWVAeLyCjDRbC',NULL,NULL,NULL,NULL,NULL,'2024-08-02 14:23:14','::1','a:1:{i:0;s:1:\"1\";}',NULL,NULL,'2024-08-02','2024-08-02');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
COMMIT;

-- Dumped table `user` with 1 row(s)
--

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `user_group` VALUES (1,'Administrator','2024-08-02','2024-08-02');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
COMMIT;

-- Dumped table `user_group` with 1 row(s)
--

--
-- Table structure for table `visitor_count`
--

DROP TABLE IF EXISTS `visitor_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_count` (
  `visitor_id` int NOT NULL AUTO_INCREMENT,
  `member_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `member_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `institution` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `room_code` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `checkin_date` datetime NOT NULL,
  PRIMARY KEY (`visitor_id`),
  KEY `member_id` (`member_id`),
  KEY `room_code` (`room_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_count`
--

/*!40000 ALTER TABLE `visitor_count` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `visitor_count` ENABLE KEYS */;
COMMIT;

-- Dumped table `visitor_count` with 0 row(s)
--

DROP TRIGGER IF EXISTS `insert_loan_history`;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `insert_loan_history` AFTER INSERT ON `loan` FOR EACH ROW INSERT INTO loan_history
     SET loan_id=NEW.loan_id,
     item_code=NEW.item_code,
     member_id=NEW.member_id,
     loan_date=NEW.loan_date,
     due_date=NEW.due_date,
     renewed=NEW.renewed,
     is_lent=NEW.is_lent,
     is_return=NEW.is_return,
     return_date=NEW.return_date,
     input_date=NEW.input_date,
     last_update=NEW.last_update,
     title=(SELECT b.title FROM biblio b LEFT JOIN item i ON i.biblio_id=b.biblio_id WHERE i.item_code=NEW.item_code),
     biblio_id=(SELECT b.biblio_id FROM biblio b LEFT JOIN item i ON i.biblio_id=b.biblio_id WHERE i.item_code=NEW.item_code),
     call_number=(SELECT IF(i.call_number IS NULL, b.call_number,i.call_number) FROM biblio b LEFT JOIN item i ON i.biblio_id=b.biblio_id WHERE i.item_code=NEW.item_code),
     classification=(SELECT b.classification FROM biblio b LEFT JOIN item i ON i.biblio_id=b.biblio_id WHERE i.item_code=NEW.item_code),
     gmd_name=(SELECT g.gmd_name FROM biblio b LEFT JOIN item i ON i.biblio_id=b.biblio_id LEFT JOIN mst_gmd g ON g.gmd_id=b.gmd_id WHERE i.item_code=NEW.item_code),
     language_name=(SELECT l.language_name FROM biblio b LEFT JOIN item i ON i.biblio_id=b.biblio_id LEFT JOIN mst_language l ON b.language_id=l.language_id WHERE i.item_code=NEW.item_code),
     location_name=(SELECT ml.location_name FROM item i LEFT JOIN mst_location ml ON i.location_id=ml.location_id WHERE i.item_code=NEW.item_code),
     collection_type_name=(SELECT mct.coll_type_name FROM mst_coll_type mct LEFT JOIN item i ON i.coll_type_id=mct.coll_type_id WHERE i.item_code=NEW.item_code),
     member_name=(SELECT m.member_name FROM member m WHERE m.member_id=NEW.member_id),
     member_type_name=(SELECT mmt.member_type_name FROM mst_member_type mmt LEFT JOIN member m ON m.member_type_id=mmt.member_type_id WHERE m.member_id=NEW.member_id) */;;
DELIMITER ;

DROP TRIGGER IF EXISTS `update_loan_history`;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `update_loan_history` AFTER UPDATE ON `loan` FOR EACH ROW UPDATE loan_history 
    SET is_lent=NEW.is_lent,
    is_return=NEW.is_return,
    renewed=NEW.renewed,
    return_date=NEW.return_date
    WHERE loan_id=NEW.loan_id */;;
DELIMITER ;

DROP TRIGGER IF EXISTS `delete_loan_history`;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `delete_loan_history` AFTER DELETE ON `loan` FOR EACH ROW DELETE FROM `loan_history` WHERE loan_id=OLD.loan_id */;;
DELIMITER ;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET AUTOCOMMIT=@OLD_AUTOCOMMIT */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Fri, 02 Aug 2024 14:23:20 +0630
