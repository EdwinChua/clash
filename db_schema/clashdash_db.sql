CREATE DATABASE IF NOT EXISTS clashdash;
use clashdash;

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: clashdash
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `player_tag` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `stars` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  `completionInfo` varchar(100) DEFAULT NULL,
  `village` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`player_tag`,`name`),
  KEY `asdasd_idx` (`player_tag`),
  CONSTRAINT `player_achievement_tag` FOREIGN KEY (`player_tag`) REFERENCES `players` (`tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan_non_static`
--

DROP TABLE IF EXISTS `clan_non_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clan_non_static` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(10) NOT NULL,
  `clanLevel` int(11) DEFAULT NULL,
  `clanPoints` int(11) DEFAULT NULL,
  `clanVersusPoints` int(11) DEFAULT NULL,
  `members` int(11) DEFAULT NULL,
  `warWinStreak` int(11) DEFAULT NULL,
  `warWins` int(11) DEFAULT NULL,
  `warTies` int(11) DEFAULT NULL,
  `warLosses` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan_non_static`
--

LOCK TABLES `clan_non_static` WRITE;
/*!40000 ALTER TABLE `clan_non_static` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan_non_static` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan_static`
--

DROP TABLE IF EXISTS `clan_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clan_static` (
  `tag` varchar(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `badgeUrls_small` varchar(150) DEFAULT NULL,
  `badgeUrls_large` varchar(150) DEFAULT NULL,
  `badgeUrls_medium` varchar(150) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `requiredTrophies` int(11) DEFAULT NULL,
  `warFrequency` varchar(45) DEFAULT NULL,
  `isWarLogPublic` tinyint(4) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tag`),
  UNIQUE KEY `tag_UNIQUE` (`tag`),
  KEY `location_id_idx` (`location`),
  CONSTRAINT `location` FOREIGN KEY (`location`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan_static`
--

LOCK TABLES `clan_static` WRITE;
/*!40000 ALTER TABLE `clan_static` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan_static` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heroes` (
  `player_tag` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `maxLevel` int(11) DEFAULT NULL,
  `village` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`player_tag`,`name`),
  CONSTRAINT `player_heroes_tag` FOREIGN KEY (`player_tag`) REFERENCES `players` (`tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `league` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `iconUrl_small` varchar(150) DEFAULT NULL,
  `iconUrl_medium` varchar(150) DEFAULT NULL,
  `iconUrl_tiny` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (29000000,'Unranked','https://api-assets.clashofclans.com/leagues/72/e--YMyIexEQQhE4imLoJcwhYn6Uy8KqlgyY3_kFV6t4.png','','https://api-assets.clashofclans.com/leagues/36/e--YMyIexEQQhE4imLoJcwhYn6Uy8KqlgyY3_kFV6t4.png'),(29000001,'Bronze League III','https://api-assets.clashofclans.com/leagues/72/uUJDLEdAh7Lwf6YOHmXfNM586ZlEvMju54bTlt2u6EE.png','https://api-assets.clashofclans.com/leagues/288/uUJDLEdAh7Lwf6YOHmXfNM586ZlEvMju54bTlt2u6EE.png','https://api-assets.clashofclans.com/leagues/36/uUJDLEdAh7Lwf6YOHmXfNM586ZlEvMju54bTlt2u6EE.png'),(29000002,'Bronze League II','https://api-assets.clashofclans.com/leagues/72/U2acNDRaR5rQDu4Z6pQKaGcjWm9dkSnHMAPZCXrHPB4.png','https://api-assets.clashofclans.com/leagues/288/U2acNDRaR5rQDu4Z6pQKaGcjWm9dkSnHMAPZCXrHPB4.png','https://api-assets.clashofclans.com/leagues/36/U2acNDRaR5rQDu4Z6pQKaGcjWm9dkSnHMAPZCXrHPB4.png'),(29000003,'Bronze League I','https://api-assets.clashofclans.com/leagues/72/SZIXZHZxfHTmgseKCH6T5hvMQ3JQM-Js2QfpC9A3ya0.png','https://api-assets.clashofclans.com/leagues/288/SZIXZHZxfHTmgseKCH6T5hvMQ3JQM-Js2QfpC9A3ya0.png','https://api-assets.clashofclans.com/leagues/36/SZIXZHZxfHTmgseKCH6T5hvMQ3JQM-Js2QfpC9A3ya0.png'),(29000004,'Silver League III','https://api-assets.clashofclans.com/leagues/72/QcFBfoArnafaXCnB5OfI7vESpQEBuvWtzOyLq8gJzVc.png','https://api-assets.clashofclans.com/leagues/288/QcFBfoArnafaXCnB5OfI7vESpQEBuvWtzOyLq8gJzVc.png','https://api-assets.clashofclans.com/leagues/36/QcFBfoArnafaXCnB5OfI7vESpQEBuvWtzOyLq8gJzVc.png'),(29000005,'Silver League II','https://api-assets.clashofclans.com/leagues/72/8OhXcwDJkenBH2kPH73eXftFOpHHRF-b32n0yrTqC44.png','https://api-assets.clashofclans.com/leagues/288/8OhXcwDJkenBH2kPH73eXftFOpHHRF-b32n0yrTqC44.png','https://api-assets.clashofclans.com/leagues/36/8OhXcwDJkenBH2kPH73eXftFOpHHRF-b32n0yrTqC44.png'),(29000006,'Silver League I','https://api-assets.clashofclans.com/leagues/72/nvrBLvCK10elRHmD1g9w5UU1flDRMhYAojMB2UbYfPs.png','https://api-assets.clashofclans.com/leagues/288/nvrBLvCK10elRHmD1g9w5UU1flDRMhYAojMB2UbYfPs.png','https://api-assets.clashofclans.com/leagues/36/nvrBLvCK10elRHmD1g9w5UU1flDRMhYAojMB2UbYfPs.png'),(29000007,'Gold League III','https://api-assets.clashofclans.com/leagues/72/vd4Lhz5b2I1P0cLH25B6q63JN3Wt1j2NTMhOYpMPQ4M.png','https://api-assets.clashofclans.com/leagues/288/vd4Lhz5b2I1P0cLH25B6q63JN3Wt1j2NTMhOYpMPQ4M.png','https://api-assets.clashofclans.com/leagues/36/vd4Lhz5b2I1P0cLH25B6q63JN3Wt1j2NTMhOYpMPQ4M.png'),(29000008,'Gold League II','https://api-assets.clashofclans.com/leagues/72/Y6CveuHmPM_oiOic2Yet0rYL9AFRYW0WA0u2e44-YbM.png','https://api-assets.clashofclans.com/leagues/288/Y6CveuHmPM_oiOic2Yet0rYL9AFRYW0WA0u2e44-YbM.png','https://api-assets.clashofclans.com/leagues/36/Y6CveuHmPM_oiOic2Yet0rYL9AFRYW0WA0u2e44-YbM.png'),(29000009,'Gold League I','https://api-assets.clashofclans.com/leagues/72/CorhMY9ZmQvqXTZ4VYVuUgPNGSHsO0cEXEL5WYRmB2Y.png','https://api-assets.clashofclans.com/leagues/288/CorhMY9ZmQvqXTZ4VYVuUgPNGSHsO0cEXEL5WYRmB2Y.png','https://api-assets.clashofclans.com/leagues/36/CorhMY9ZmQvqXTZ4VYVuUgPNGSHsO0cEXEL5WYRmB2Y.png'),(29000010,'Crystal League III','https://api-assets.clashofclans.com/leagues/72/Hyqco7bHh0Q81xB8mSF_ZhjKnKcTmJ9QEq9QGlsxiKE.png','https://api-assets.clashofclans.com/leagues/288/Hyqco7bHh0Q81xB8mSF_ZhjKnKcTmJ9QEq9QGlsxiKE.png','https://api-assets.clashofclans.com/leagues/36/Hyqco7bHh0Q81xB8mSF_ZhjKnKcTmJ9QEq9QGlsxiKE.png'),(29000011,'Crystal League II','https://api-assets.clashofclans.com/leagues/72/jhP36EhAA9n1ADafdQtCP-ztEAQjoRpY7cT8sU7SW8A.png','https://api-assets.clashofclans.com/leagues/288/jhP36EhAA9n1ADafdQtCP-ztEAQjoRpY7cT8sU7SW8A.png','https://api-assets.clashofclans.com/leagues/36/jhP36EhAA9n1ADafdQtCP-ztEAQjoRpY7cT8sU7SW8A.png'),(29000012,'Crystal League I','https://api-assets.clashofclans.com/leagues/72/kSfTyNNVSvogX3dMvpFUTt72VW74w6vEsEFuuOV4osQ.png','https://api-assets.clashofclans.com/leagues/288/kSfTyNNVSvogX3dMvpFUTt72VW74w6vEsEFuuOV4osQ.png','https://api-assets.clashofclans.com/leagues/36/kSfTyNNVSvogX3dMvpFUTt72VW74w6vEsEFuuOV4osQ.png'),(29000013,'Master League III','https://api-assets.clashofclans.com/leagues/72/pSXfKvBKSgtvfOY3xKkgFaRQi0WcE28s3X35ywbIluY.png','https://api-assets.clashofclans.com/leagues/288/pSXfKvBKSgtvfOY3xKkgFaRQi0WcE28s3X35ywbIluY.png','https://api-assets.clashofclans.com/leagues/36/pSXfKvBKSgtvfOY3xKkgFaRQi0WcE28s3X35ywbIluY.png'),(29000014,'Master League II','https://api-assets.clashofclans.com/leagues/72/4wtS1stWZQ-1VJ5HaCuDPfdhTWjeZs_jPar_YPzK6Lg.png','https://api-assets.clashofclans.com/leagues/288/4wtS1stWZQ-1VJ5HaCuDPfdhTWjeZs_jPar_YPzK6Lg.png','https://api-assets.clashofclans.com/leagues/36/4wtS1stWZQ-1VJ5HaCuDPfdhTWjeZs_jPar_YPzK6Lg.png'),(29000015,'Master League I','https://api-assets.clashofclans.com/leagues/72/olUfFb1wscIH8hqECAdWbdB6jPm9R8zzEyHIzyBgRXc.png','https://api-assets.clashofclans.com/leagues/288/olUfFb1wscIH8hqECAdWbdB6jPm9R8zzEyHIzyBgRXc.png','https://api-assets.clashofclans.com/leagues/36/olUfFb1wscIH8hqECAdWbdB6jPm9R8zzEyHIzyBgRXc.png'),(29000016,'Champion League III','https://api-assets.clashofclans.com/leagues/72/JmmTbspV86xBigM7OP5_SjsEDPuE7oXjZC9aOy8xO3s.png','https://api-assets.clashofclans.com/leagues/288/JmmTbspV86xBigM7OP5_SjsEDPuE7oXjZC9aOy8xO3s.png','https://api-assets.clashofclans.com/leagues/36/JmmTbspV86xBigM7OP5_SjsEDPuE7oXjZC9aOy8xO3s.png'),(29000017,'Champion League II','https://api-assets.clashofclans.com/leagues/72/kLWSSyq7vJiRiCantiKCoFuSJOxief6R1ky6AyfB8q0.png','https://api-assets.clashofclans.com/leagues/288/kLWSSyq7vJiRiCantiKCoFuSJOxief6R1ky6AyfB8q0.png','https://api-assets.clashofclans.com/leagues/36/kLWSSyq7vJiRiCantiKCoFuSJOxief6R1ky6AyfB8q0.png'),(29000018,'Champion League I','https://api-assets.clashofclans.com/leagues/72/9v_04LHmd1LWq7IoY45dAdGhrBkrc2ZFMZVhe23PdCE.png','https://api-assets.clashofclans.com/leagues/288/9v_04LHmd1LWq7IoY45dAdGhrBkrc2ZFMZVhe23PdCE.png','https://api-assets.clashofclans.com/leagues/36/9v_04LHmd1LWq7IoY45dAdGhrBkrc2ZFMZVhe23PdCE.png'),(29000019,'Titan League III','https://api-assets.clashofclans.com/leagues/72/L-HrwYpFbDwWjdmhJQiZiTRa_zXPPOgUTdmbsaq4meo.png','https://api-assets.clashofclans.com/leagues/288/L-HrwYpFbDwWjdmhJQiZiTRa_zXPPOgUTdmbsaq4meo.png','https://api-assets.clashofclans.com/leagues/36/L-HrwYpFbDwWjdmhJQiZiTRa_zXPPOgUTdmbsaq4meo.png'),(29000020,'Titan League II','https://api-assets.clashofclans.com/leagues/72/llpWocHlOoFliwyaEx5Z6dmoZG4u4NmxwpF-Jg7su7Q.png','https://api-assets.clashofclans.com/leagues/288/llpWocHlOoFliwyaEx5Z6dmoZG4u4NmxwpF-Jg7su7Q.png','https://api-assets.clashofclans.com/leagues/36/llpWocHlOoFliwyaEx5Z6dmoZG4u4NmxwpF-Jg7su7Q.png'),(29000021,'Titan League I','https://api-assets.clashofclans.com/leagues/72/qVCZmeYH0lS7Gaa6YoB7LrNly7bfw7fV_d4Vp2CU-gk.png','https://api-assets.clashofclans.com/leagues/288/qVCZmeYH0lS7Gaa6YoB7LrNly7bfw7fV_d4Vp2CU-gk.png','https://api-assets.clashofclans.com/leagues/36/qVCZmeYH0lS7Gaa6YoB7LrNly7bfw7fV_d4Vp2CU-gk.png'),(29000022,'Legend League','https://api-assets.clashofclans.com/leagues/72/R2zmhyqQ0_lKcDR5EyghXCxgyC9mm_mVMIjAbmGoZtw.png','https://api-assets.clashofclans.com/leagues/288/R2zmhyqQ0_lKcDR5EyghXCxgyC9mm_mVMIjAbmGoZtw.png','https://api-assets.clashofclans.com/leagues/36/R2zmhyqQ0_lKcDR5EyghXCxgyC9mm_mVMIjAbmGoZtw.png');
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `isCountry` tinyint(4) DEFAULT NULL,
  `countryCode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (32000000,'Europe',0,''),(32000001,'North America',0,''),(32000002,'South America',0,''),(32000003,'Asia',0,''),(32000004,'Australia',0,''),(32000005,'Africa',0,''),(32000006,'International',0,''),(32000007,'Afghanistan',1,'AF'),(32000008,'Åland Islands',1,'AX'),(32000009,'Albania',1,'AL'),(32000010,'Algeria',1,'DZ'),(32000011,'American Samoa',1,'AS'),(32000012,'Andorra',1,'AD'),(32000013,'Angola',1,'AO'),(32000014,'Anguilla',1,'AI'),(32000015,'Antarctica',1,'AQ'),(32000016,'Antigua and Barbuda',1,'AG'),(32000017,'Argentina',1,'AR'),(32000018,'Armenia',1,'AM'),(32000019,'Aruba',1,'AW'),(32000020,'Ascension Island',1,'AC'),(32000021,'Australia',1,'AU'),(32000022,'Austria',1,'AT'),(32000023,'Azerbaijan',1,'AZ'),(32000024,'Bahamas',1,'BS'),(32000025,'Bahrain',1,'BH'),(32000026,'Bangladesh',1,'BD'),(32000027,'Barbados',1,'BB'),(32000028,'Belarus',1,'BY'),(32000029,'Belgium',1,'BE'),(32000030,'Belize',1,'BZ'),(32000031,'Benin',1,'BJ'),(32000032,'Bermuda',1,'BM'),(32000033,'Bhutan',1,'BT'),(32000034,'Bolivia',1,'BO'),(32000035,'Bosnia and Herzegovina',1,'BA'),(32000036,'Botswana',1,'BW'),(32000037,'Bouvet Island',1,'BV'),(32000038,'Brazil',1,'BR'),(32000039,'British Indian Ocean Territory',1,'IO'),(32000040,'British Virgin Islands',1,'VG'),(32000041,'Brunei',1,'BN'),(32000042,'Bulgaria',1,'BG'),(32000043,'Burkina Faso',1,'BF'),(32000044,'Burundi',1,'BI'),(32000045,'Cambodia',1,'KH'),(32000046,'Cameroon',1,'CM'),(32000047,'Canada',1,'CA'),(32000048,'Canary Islands',1,'IC'),(32000049,'Cape Verde',1,'CV'),(32000050,'Caribbean Netherlands',1,'BQ'),(32000051,'Cayman Islands',1,'KY'),(32000052,'Central African Republic',1,'CF'),(32000053,'Ceuta and Melilla',1,'EA'),(32000054,'Chad',1,'TD'),(32000055,'Chile',1,'CL'),(32000056,'China',1,'CN'),(32000057,'Christmas Island',1,'CX'),(32000058,'Cocos (Keeling) Islands',1,'CC'),(32000059,'Colombia',1,'CO'),(32000060,'Comoros',1,'KM'),(32000061,'Congo (DRC)',1,'CG'),(32000062,'Congo (Republic)',1,'CD'),(32000063,'Cook Islands',1,'CK'),(32000064,'Costa Rica',1,'CR'),(32000065,'Côte d’Ivoire',1,'CI'),(32000066,'Croatia',1,'HR'),(32000067,'Cuba',1,'CU'),(32000068,'Curaçao',1,'CW'),(32000069,'Cyprus',1,'CY'),(32000070,'Czech Republic',1,'CZ'),(32000071,'Denmark',1,'DK'),(32000072,'Diego Garcia',1,'DG'),(32000073,'Djibouti',1,'DJ'),(32000074,'Dominica',1,'DM'),(32000075,'Dominican Republic',1,'DO'),(32000076,'Ecuador',1,'EC'),(32000077,'Egypt',1,'EG'),(32000078,'El Salvador',1,'SV'),(32000079,'Equatorial Guinea',1,'GQ'),(32000080,'Eritrea',1,'ER'),(32000081,'Estonia',1,'EE'),(32000082,'Ethiopia',1,'ET'),(32000083,'Falkland Islands',1,'FK'),(32000084,'Faroe Islands',1,'FO'),(32000085,'Fiji',1,'FJ'),(32000086,'Finland',1,'FI'),(32000087,'France',1,'FR'),(32000088,'French Guiana',1,'GF'),(32000089,'French Polynesia',1,'PF'),(32000090,'French Southern Territories',1,'TF'),(32000091,'Gabon',1,'GA'),(32000092,'Gambia',1,'GM'),(32000093,'Georgia',1,'GE'),(32000094,'Germany',1,'DE'),(32000095,'Ghana',1,'GH'),(32000096,'Gibraltar',1,'GI'),(32000097,'Greece',1,'GR'),(32000098,'Greenland',1,'GL'),(32000099,'Grenada',1,'GD'),(32000100,'Guadeloupe',1,'GP'),(32000101,'Guam',1,'GU'),(32000102,'Guatemala',1,'GT'),(32000103,'Guernsey',1,'GG'),(32000104,'Guinea',1,'GN'),(32000105,'Guinea-Bissau',1,'GW'),(32000106,'Guyana',1,'GY'),(32000107,'Haiti',1,'HT'),(32000108,'Heard & McDonald Islands',1,'HM'),(32000109,'Honduras',1,'HN'),(32000110,'Hong Kong',1,'HK'),(32000111,'Hungary',1,'HU'),(32000112,'Iceland',1,'IS'),(32000113,'India',1,'IN'),(32000114,'Indonesia',1,'ID'),(32000115,'Iran',1,'IR'),(32000116,'Iraq',1,'IQ'),(32000117,'Ireland',1,'IE'),(32000118,'Isle of Man',1,'IM'),(32000119,'Israel',1,'IL'),(32000120,'Italy',1,'IT'),(32000121,'Jamaica',1,'JM'),(32000122,'Japan',1,'JP'),(32000123,'Jersey',1,'JE'),(32000124,'Jordan',1,'JO'),(32000125,'Kazakhstan',1,'KZ'),(32000126,'Kenya',1,'KE'),(32000127,'Kiribati',1,'KI'),(32000128,'Kosovo',1,'XK'),(32000129,'Kuwait',1,'KW'),(32000130,'Kyrgyzstan',1,'KG'),(32000131,'Laos',1,'LA'),(32000132,'Latvia',1,'LV'),(32000133,'Lebanon',1,'LB'),(32000134,'Lesotho',1,'LS'),(32000135,'Liberia',1,'LR'),(32000136,'Libya',1,'LY'),(32000137,'Liechtenstein',1,'LI'),(32000138,'Lithuania',1,'LT'),(32000139,'Luxembourg',1,'LU'),(32000140,'Macau',1,'MO'),(32000141,'Macedonia (FYROM)',1,'MK'),(32000142,'Madagascar',1,'MG'),(32000143,'Malawi',1,'MW'),(32000144,'Malaysia',1,'MY'),(32000145,'Maldives',1,'MV'),(32000146,'Mali',1,'ML'),(32000147,'Malta',1,'MT'),(32000148,'Marshall Islands',1,'MH'),(32000149,'Martinique',1,'MQ'),(32000150,'Mauritania',1,'MR'),(32000151,'Mauritius',1,'MU'),(32000152,'Mayotte',1,'YT'),(32000153,'Mexico',1,'MX'),(32000154,'Micronesia',1,'FM'),(32000155,'Moldova',1,'MD'),(32000156,'Monaco',1,'MC'),(32000157,'Mongolia',1,'MN'),(32000158,'Montenegro',1,'ME'),(32000159,'Montserrat',1,'MS'),(32000160,'Morocco',1,'MA'),(32000161,'Mozambique',1,'MZ'),(32000162,'Myanmar (Burma)',1,'MM'),(32000163,'Namibia',1,'NA'),(32000164,'Nauru',1,'NR'),(32000165,'Nepal',1,'NP'),(32000166,'Netherlands',1,'NL'),(32000167,'New Caledonia',1,'NC'),(32000168,'New Zealand',1,'NZ'),(32000169,'Nicaragua',1,'NI'),(32000170,'Niger',1,'NE'),(32000171,'Nigeria',1,'NG'),(32000172,'Niue',1,'NU'),(32000173,'Norfolk Island',1,'NF'),(32000174,'North Korea',1,'KP'),(32000175,'Northern Mariana Islands',1,'MP'),(32000176,'Norway',1,'NO'),(32000177,'Oman',1,'OM'),(32000178,'Pakistan',1,'PK'),(32000179,'Palau',1,'PW'),(32000180,'Palestine',1,'PS'),(32000181,'Panama',1,'PA'),(32000182,'Papua New Guinea',1,'PG'),(32000183,'Paraguay',1,'PY'),(32000184,'Peru',1,'PE'),(32000185,'Philippines',1,'PH'),(32000186,'Pitcairn Islands',1,'PN'),(32000187,'Poland',1,'PL'),(32000188,'Portugal',1,'PT'),(32000189,'Puerto Rico',1,'PR'),(32000190,'Qatar',1,'QA'),(32000191,'Réunion',1,'RE'),(32000192,'Romania',1,'RO'),(32000193,'Russia',1,'RU'),(32000194,'Rwanda',1,'RW'),(32000195,'Saint Barthélemy',1,'BL'),(32000196,'Saint Helena',1,'SH'),(32000197,'Saint Kitts and Nevis',1,'KN'),(32000198,'Saint Lucia',1,'LC'),(32000199,'Saint Martin',1,'MF'),(32000200,'Saint Pierre and Miquelon',1,'PM'),(32000201,'Samoa',1,'WS'),(32000202,'San Marino',1,'SM'),(32000203,'São Tomé and Príncipe',1,'ST'),(32000204,'Saudi Arabia',1,'SA'),(32000205,'Senegal',1,'SN'),(32000206,'Serbia',1,'RS'),(32000207,'Seychelles',1,'SC'),(32000208,'Sierra Leone',1,'SL'),(32000209,'Singapore',1,'SG'),(32000210,'Sint Maarten',1,'SX'),(32000211,'Slovakia',1,'SK'),(32000212,'Slovenia',1,'SI'),(32000213,'Solomon Islands',1,'SB'),(32000214,'Somalia',1,'SO'),(32000215,'South Africa',1,'ZA'),(32000216,'South Korea',1,'KR'),(32000217,'South Sudan',1,'SS'),(32000218,'Spain',1,'ES'),(32000219,'Sri Lanka',1,'LK'),(32000220,'St. Vincent & Grenadines',1,'VC'),(32000221,'Sudan',1,'SD'),(32000222,'Suriname',1,'SR'),(32000223,'Svalbard and Jan Mayen',1,'SJ'),(32000224,'Swaziland',1,'SZ'),(32000225,'Sweden',1,'SE'),(32000226,'Switzerland',1,'CH'),(32000227,'Syria',1,'SY'),(32000228,'Taiwan',1,'TW'),(32000229,'Tajikistan',1,'TJ'),(32000230,'Tanzania',1,'TZ'),(32000231,'Thailand',1,'TH'),(32000232,'Timor-Leste',1,'TL'),(32000233,'Togo',1,'TG'),(32000234,'Tokelau',1,'TK'),(32000235,'Tonga',1,'TO'),(32000236,'Trinidad and Tobago',1,'TT'),(32000237,'Tristan da Cunha',1,'TA'),(32000238,'Tunisia',1,'TN'),(32000239,'Turkey',1,'TR'),(32000240,'Turkmenistan',1,'TM'),(32000241,'Turks and Caicos Islands',1,'TC'),(32000242,'Tuvalu',1,'TV'),(32000243,'U.S. Outlying Islands',1,'UM'),(32000244,'U.S. Virgin Islands',1,'VI'),(32000245,'Uganda',1,'UG'),(32000246,'Ukraine',1,'UA'),(32000247,'United Arab Emirates',1,'AE'),(32000248,'United Kingdom',1,'GB'),(32000249,'United States',1,'US'),(32000250,'Uruguay',1,'UY'),(32000251,'Uzbekistan',1,'UZ'),(32000252,'Vanuatu',1,'VU'),(32000253,'Vatican City',1,'VA'),(32000254,'Venezuela',1,'VE'),(32000255,'Vietnam',1,'VN'),(32000256,'Wallis and Futuna',1,'WF'),(32000257,'Western Sahara',1,'EH'),(32000258,'Yemen',1,'YE'),(32000259,'Zambia',1,'ZM'),(32000260,'Zimbabwe',1,'ZW'),(32000261,'',0,''),(32000262,'',0,''),(32000263,'',0,''),(32000264,'',0,''),(32000265,'',0,'');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `clan_nonStaticId` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `expLevel` int(11) DEFAULT NULL,
  `league` int(11) DEFAULT NULL,
  `trophies` int(11) DEFAULT NULL,
  `versusTrophies` int(11) DEFAULT NULL,
  `attackWins` int(11) DEFAULT NULL,
  `defenseWins` int(11) DEFAULT NULL,
  `bestTrophies` int(11) DEFAULT NULL,
  `donations` int(11) DEFAULT NULL,
  `donationsReceived` int(11) DEFAULT NULL,
  `warStars` int(11) DEFAULT NULL,
  `townHallLevel` int(11) DEFAULT NULL,
  `builderHallLevel` int(11) DEFAULT NULL,
  `bestVersusTrophies` int(11) DEFAULT NULL,
  `versusBattleWins` int(11) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `clanRank` int(11) DEFAULT NULL,
  `previousClanRank` int(11) DEFAULT NULL,
  PRIMARY KEY (`tag`,`clan_nonStaticId`),
  KEY `league_id_idx` (`league`),
  KEY `player_clan_nonStatic_idx` (`clan_nonStaticId`),
  CONSTRAINT `clan_league_id` FOREIGN KEY (`league`) REFERENCES `league` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `player_clan_nonStatic` FOREIGN KEY (`clan_nonStaticId`) REFERENCES `clan_non_static` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spells`
--

DROP TABLE IF EXISTS `spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spells` (
  `player_tag` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `maxLevel` int(11) DEFAULT NULL,
  `village` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`player_tag`,`name`),
  CONSTRAINT `spell_player_tag` FOREIGN KEY (`player_tag`) REFERENCES `players` (`tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spells`
--

LOCK TABLES `spells` WRITE;
/*!40000 ALTER TABLE `spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troops`
--

DROP TABLE IF EXISTS `troops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troops` (
  `player_tag` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `maxLevel` int(11) DEFAULT NULL,
  `village` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`player_tag`,`name`),
  CONSTRAINT `player_troop_tag` FOREIGN KEY (`player_tag`) REFERENCES `players` (`tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troops`
--

LOCK TABLES `troops` WRITE;
/*!40000 ALTER TABLE `troops` DISABLE KEYS */;
/*!40000 ALTER TABLE `troops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'clashdash'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-11 14:04:26
