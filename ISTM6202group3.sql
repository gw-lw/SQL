-- MySQL dump 10.13  Distrib 5.6.19, for Win32 (x86)
--
-- Host: istm6202.cdocnyekhdps.us-west-2.rds.amazonaws.com    Database: project
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Current Database: `project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `project`;

--
-- Table structure for table `ANALYST`
--

DROP TABLE IF EXISTS `ANALYST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANALYST` (
  `AnalystID` char(20) NOT NULL,
  `AnalystFirstName` char(20) NOT NULL,
  `AnalystLastName` char(20) NOT NULL,
  PRIMARY KEY (`AnalystID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANALYST`
--

LOCK TABLES `ANALYST` WRITE;
/*!40000 ALTER TABLE `ANALYST` DISABLE KEYS */;
INSERT INTO `ANALYST` VALUES ('001','Chris','Webber'),('002','Jalen','Rose'),('003','Jimmy','King'),('004','Juwan','Howard'),('005','Ray','Jackson'),('006','Piers','Jameson'),('007','Velda','Walters'),('008','Sophia','Simpson'),('009','Oswald','Virgo'),('010','Candida','Wilson'),('011','Reed','Jephson');
/*!40000 ALTER TABLE `ANALYST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ANALYST_PHONE`
--

DROP TABLE IF EXISTS `ANALYST_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANALYST_PHONE` (
  `AnalystPhone` char(20) NOT NULL,
  `AnalystID` char(20) NOT NULL,
  PRIMARY KEY (`AnalystPhone`,`AnalystID`),
  KEY `AnalystPhone_Analyst` (`AnalystID`),
  CONSTRAINT `AnalystPhone_Analyst` FOREIGN KEY (`AnalystID`) REFERENCES `ANALYST` (`AnalystID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANALYST_PHONE`
--

LOCK TABLES `ANALYST_PHONE` WRITE;
/*!40000 ALTER TABLE `ANALYST_PHONE` DISABLE KEYS */;
INSERT INTO `ANALYST_PHONE` VALUES ('4129863987','001'),('2027531298','002'),('4439813754','003'),('9863965234','004'),('9861523443','005'),('6843833925','006'),('7356391873','007'),('1058136963','008'),('1480992810','009'),('4832517076','010'),('8685866546','011');
/*!40000 ALTER TABLE `ANALYST_PHONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AWARD`
--

DROP TABLE IF EXISTS `AWARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AWARD` (
  `AwardID` char(20) NOT NULL,
  `AwardTitle` char(100) NOT NULL,
  `AwardAmount` int(11) NOT NULL DEFAULT '0',
  `AwardStartDate` date NOT NULL,
  `AwardEndDate` date DEFAULT NULL,
  `TaxID` char(20) NOT NULL,
  `DepID` char(20) NOT NULL,
  PRIMARY KEY (`AwardID`),
  KEY `AWARD_INSTITUTION` (`TaxID`),
  KEY `AWARD_Department` (`DepID`),
  CONSTRAINT `AWARD_Department` FOREIGN KEY (`DepID`) REFERENCES `DEPARTMENT` (`DepID`),
  CONSTRAINT `AWARD_INSTITUTION` FOREIGN KEY (`TaxID`) REFERENCES `INSTITUTION` (`TaxID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWARD`
--

LOCK TABLES `AWARD` WRITE;
/*!40000 ALTER TABLE `AWARD` DISABLE KEYS */;
INSERT INTO `AWARD` VALUES ('101','The Cellular Reproduction of DNA',50000,'2015-09-01','2016-09-01','001','001'),('102','Why Do Rodents Spread Disease and Virus So Quickly?',25000,'2014-03-15','2016-03-15','002','001'),('103','Anthrax as a Bio-Chemical Weapon',10000,'2017-03-01','2021-03-01','003','001'),('104','Effects of Drinking Moderate to High Levels of Coffee',30000,'2016-01-01','2018-01-01','001','001'),('105','Geotechnical Properties of Lateritic Soils in Osun State',25000,'2015-06-01','2019-06-01','004','002'),('108','Big Data: Anonymity, Privacy, and Ethics',1000000,'2016-05-15','2021-05-15','005','003'),('110','Oxide film growth for magnetic applications',10000,'2014-01-15','2018-01-15','006','005'),('111','Intranet Optimization',10000,'2015-06-01','2016-06-01','007','004'),('112','Radioactive elements research',20000,'2013-05-21','2015-06-13','008','002'),('113','Newtonian mechanics and magnetic field',15000,'2014-03-15','2015-03-15','009','005'),('114','Observations of recent solar eclipses',25000,'2015-11-25','2016-11-25','010','008'),('115','Application of saccharomycetes',18000,'2014-12-01','2015-12-01','011','001'),('116','Geology structure influence on Petroleum exploit',200000,'2015-01-01','2019-06-02','012','003');
/*!40000 ALTER TABLE `AWARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORPORATION`
--

DROP TABLE IF EXISTS `CORPORATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CORPORATION` (
  `CorporationID` char(100) NOT NULL,
  `CEO` char(20) NOT NULL,
  `NoofEmployee` int(11) DEFAULT NULL,
  `AnnualRevenue` int(11) NOT NULL,
  `TaxID` char(20) NOT NULL,
  PRIMARY KEY (`CorporationID`),
  KEY `corporation_INSTITUTION` (`TaxID`),
  CONSTRAINT `corporation_INSTITUTION` FOREIGN KEY (`TaxID`) REFERENCES `INSTITUTION` (`TaxID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORPORATION`
--

LOCK TABLES `CORPORATION` WRITE;
/*!40000 ALTER TABLE `CORPORATION` DISABLE KEYS */;
INSERT INTO `CORPORATION` VALUES ('001','Larry Bird',50000,2147483647,'005'),('002','Lew Alcindor',78000,2147483647,'006'),('003','Peter Mathers',386558,2147483647,'007'),('004','Pierce Gibb',20000,2147483647,'008');
/*!40000 ALTER TABLE `CORPORATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTMENT`
--

DROP TABLE IF EXISTS `DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENT` (
  `DepID` char(20) NOT NULL,
  `ScienceSection` char(100) NOT NULL,
  `ApprovingOfficial` char(100) NOT NULL,
  `BranchChief` char(20) NOT NULL,
  PRIMARY KEY (`DepID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `DEPARTMENT` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `DEPARTMENT` VALUES ('001','Biology','Alfred Neuman','Karl Malone'),('002','Chemistry','Lee Mayberry','Scottie Pippen'),('003','Geology','Todd Day','Shea Seals'),('004','Infoscience','LeBron James','Luke May'),('005','Physics','Isiah Thomas','Kevin Durant'),('006','MaterialScience','Dwayne Albertson','Peta Jernigan'),('007','ComputerScience','Madelyn Eliott','Louis Webb'),('008','Astronomy','Tamara Evelyn','Wilburn Read');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTMENT_PHONE`
--

DROP TABLE IF EXISTS `DEPARTMENT_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENT_PHONE` (
  `DepPhone` char(20) NOT NULL,
  `DepID` char(20) NOT NULL,
  PRIMARY KEY (`DepPhone`,`DepID`),
  KEY `Department_Phone_Department` (`DepID`),
  CONSTRAINT `Department_Phone_Department` FOREIGN KEY (`DepID`) REFERENCES `DEPARTMENT` (`DepID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT_PHONE`
--

LOCK TABLES `DEPARTMENT_PHONE` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT_PHONE` DISABLE KEYS */;
INSERT INTO `DEPARTMENT_PHONE` VALUES ('9987357565','001'),('2025102951','002'),('3592015202','003'),('2026590345','004'),('7565102953','005'),('3355905915','006'),('4012524977','007'),('1856549167','008');
/*!40000 ALTER TABLE `DEPARTMENT_PHONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDUCATIONINSTITUTION`
--

DROP TABLE IF EXISTS `EDUCATIONINSTITUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EDUCATIONINSTITUTION` (
  `EducationInstID` char(100) NOT NULL,
  `President` char(20) NOT NULL,
  `NoofStudent` int(11) NOT NULL,
  `Endowment` int(11) NOT NULL,
  `TaxID` char(20) NOT NULL,
  PRIMARY KEY (`EducationInstID`),
  KEY `EducationInst_INSTITUTION` (`TaxID`),
  CONSTRAINT `EducationInst_INSTITUTION` FOREIGN KEY (`TaxID`) REFERENCES `INSTITUTION` (`TaxID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDUCATIONINSTITUTION`
--

LOCK TABLES `EDUCATIONINSTITUTION` WRITE;
/*!40000 ALTER TABLE `EDUCATIONINSTITUTION` DISABLE KEYS */;
INSERT INTO `EDUCATIONINSTITUTION` VALUES ('001','Danny Ainge',15084,2500000,'001'),('002','Bill Walton',30876,1500000,'002'),('003','Bill Russel',41876,1240000,'003'),('004','Jerry West',21876,340000,'004'),('005','Whitney Rains',8976,3400000,'009'),('006','Andre London',12368,2600000,'010'),('007','Edna Aaron',24674,1900000,'011'),('008','Gary Kennard',34945,480000,'012');
/*!40000 ALTER TABLE `EDUCATIONINSTITUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FINANCIALREVIEW`
--

DROP TABLE IF EXISTS `FINANCIALREVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FINANCIALREVIEW` (
  `ReviewID` char(20) NOT NULL,
  `ReviewType` char(20) NOT NULL,
  `ReviewStartDate` date NOT NULL,
  `ReviewEndDate` date NOT NULL,
  `DepID` char(20) NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `FinancialReview_Department` (`DepID`),
  CONSTRAINT `FinancialReview_Department` FOREIGN KEY (`DepID`) REFERENCES `DEPARTMENT` (`DepID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FINANCIALREVIEW`
--

LOCK TABLES `FINANCIALREVIEW` WRITE;
/*!40000 ALTER TABLE `FINANCIALREVIEW` DISABLE KEYS */;
INSERT INTO `FINANCIALREVIEW` VALUES ('001','Audit','2015-09-01','2015-12-01','002'),('002','New Awardee Review','2012-01-01','2012-03-01','003'),('003','Over 10 M Review','2013-01-15','2013-07-15','005'),('004','Audit','2014-12-01','2015-02-01','001'),('005','Indirect Cost Rate','2015-06-01','2015-12-01','004'),('006','Indirect Cost Rate','2014-03-15','2014-11-15','006');
/*!40000 ALTER TABLE `FINANCIALREVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FINANCIAL_ANALYST`
--

DROP TABLE IF EXISTS `FINANCIAL_ANALYST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FINANCIAL_ANALYST` (
  `ReviewID` char(20) NOT NULL,
  `AnalystID` char(20) NOT NULL,
  PRIMARY KEY (`ReviewID`,`AnalystID`),
  KEY `Financial_Analyst_Analyst` (`AnalystID`),
  CONSTRAINT `Financial_Analyst_Analyst` FOREIGN KEY (`AnalystID`) REFERENCES `ANALYST` (`AnalystID`),
  CONSTRAINT `Financial_Analyst_FinancialReview` FOREIGN KEY (`ReviewID`) REFERENCES `FINANCIALREVIEW` (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FINANCIAL_ANALYST`
--

LOCK TABLES `FINANCIAL_ANALYST` WRITE;
/*!40000 ALTER TABLE `FINANCIAL_ANALYST` DISABLE KEYS */;
INSERT INTO `FINANCIAL_ANALYST` VALUES ('001','001'),('002','001'),('003','001'),('004','001'),('005','001'),('006','001'),('001','002'),('002','002'),('003','002'),('004','002'),('006','002'),('001','003'),('003','003'),('004','003'),('001','004'),('002','004'),('001','005'),('003','005'),('004','006'),('004','007'),('005','008'),('005','009'),('006','010'),('006','011');
/*!40000 ALTER TABLE `FINANCIAL_ANALYST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSTITUTION`
--

DROP TABLE IF EXISTS `INSTITUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSTITUTION` (
  `TaxID` char(20) NOT NULL,
  `InstitutionName` char(100) NOT NULL,
  `ContactPerson` char(100) NOT NULL,
  `ZipCode` int(10) NOT NULL,
  `StreetAddress` char(100) NOT NULL,
  `CongressionalDistrict` int(11) NOT NULL,
  PRIMARY KEY (`TaxID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSTITUTION`
--

LOCK TABLES `INSTITUTION` WRITE;
/*!40000 ALTER TABLE `INSTITUTION` DISABLE KEYS */;
INSERT INTO `INSTITUTION` VALUES ('001','Villanova','Kerry Kittles',19085,'800 E Lancaster',7),('002','Kansas','Jacques Vaughn',66405,'1450 Jayhawk Blvd',4),('003','Gonzaga','John Stockton',99202,'502 E Boone Ave',5),('004','N. Carolina','Roy Williams',27514,'250 E Franklin',1),('005','AppleTech','Bob Cousy',20611,'100 Legends Way',10),('006','GoogleCorp','Pete Maravich',90305,'3900 W Manchester Blvd',34),('007','IBM','Randell Beasley',32904,'123 6th St. Melbourne, FL',8),('008','PfizerInc','Carmel Kimberly',20815,'71 Pilgrim Avenue Chevy Chase, MD',6),('009','Hawaii','Ruby Whittle',27271,'70 Bowman St. South Windsor, CT',9),('010','Constellation','Viola Belanger',96815,'4 Goldfield Rd. Honolulu, HI',2),('011','Bactvir','Pauline Jeffries',60185,'44 Shirley Ave. West Chicago, IL',11),('012','Glob','Garret Hailey',32806,'514 S. Magnolia St. Orlando, FL',35);
/*!40000 ALTER TABLE `INSTITUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSTITUTION_PHONE`
--

DROP TABLE IF EXISTS `INSTITUTION_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSTITUTION_PHONE` (
  `ContactPhone` char(20) NOT NULL,
  `TaxID` char(20) NOT NULL,
  PRIMARY KEY (`TaxID`,`ContactPhone`),
  CONSTRAINT `InstitutionPhone_INSTITUTION` FOREIGN KEY (`TaxID`) REFERENCES `INSTITUTION` (`TaxID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSTITUTION_PHONE`
--

LOCK TABLES `INSTITUTION_PHONE` WRITE;
/*!40000 ALTER TABLE `INSTITUTION_PHONE` DISABLE KEYS */;
INSERT INTO `INSTITUTION_PHONE` VALUES ('3436751018','001'),('8349764534','002'),('9876541343','003'),('9184865261','004'),('4811577570','005'),('6798893234','006'),('8028388797','007'),('5241871179','008'),('9384559565','009'),('8929738987','010'),('7843169752','011'),('3799196275','012');
/*!40000 ALTER TABLE `INSTITUTION_PHONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRINCIPALINVESTIGATOR`
--

DROP TABLE IF EXISTS `PRINCIPALINVESTIGATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRINCIPALINVESTIGATOR` (
  `PPID` int(11) NOT NULL,
  `Institution` char(20) NOT NULL,
  `ScienceType` char(20) NOT NULL,
  `FirtsName` char(20) NOT NULL,
  `LastName` char(20) NOT NULL,
  `Education` char(20) NOT NULL,
  `TaxID` char(20) NOT NULL,
  PRIMARY KEY (`PPID`),
  KEY `PRINCIPALINVESTIGATOR_INSTITUTION` (`TaxID`),
  CONSTRAINT `PRINCIPALINVESTIGATOR_INSTITUTION` FOREIGN KEY (`TaxID`) REFERENCES `INSTITUTION` (`TaxID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRINCIPALINVESTIGATOR`
--

LOCK TABLES `PRINCIPALINVESTIGATOR` WRITE;
/*!40000 ALTER TABLE `PRINCIPALINVESTIGATOR` DISABLE KEYS */;
INSERT INTO `PRINCIPALINVESTIGATOR` VALUES (1,'Villanova','Biology','JJ','Redick','BA','001'),(2,'Kansas','Physics','Patrick','Ewing','PhD','002'),(3,'Gonzaga','Chemistry','Chris','Mullins','PhD','003'),(4,'N. Carolina','Infoscience','Tim','Hardaway','PhD','004'),(5,'AppleTech','Material Science','Michael','Jordan','PhD','005'),(6,'GoogleCorp','Computer Science','Christian','Laettner','MS','006'),(7,'IBM','Infoscience','Coleen','Jeanes','MS','007'),(8,'PfizerInc','Chemistry','Bishop','Norman','BA','008'),(9,'Hawaii','Physics','Milburn','Quick','PHD','009'),(10,'Constellation','Astronomy','Gaye','Small','PHD','010'),(11,'Bactvir','Biology','Ralph','Keen','PHD','011'),(12,'Glob','Geology','Elisabeth','Michaels','PHD','012');
/*!40000 ALTER TABLE `PRINCIPALINVESTIGATOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-30  0:41:40
