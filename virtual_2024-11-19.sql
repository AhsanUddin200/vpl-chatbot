# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 162.243.25.123 (MySQL 5.1.73)
# Database: virtual
# Generation Time: 2024-11-19 03:55:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AccessNumbers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AccessNumbers`;

CREATE TABLE `AccessNumbers` (
  `ID` int(5) DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `DID` varchar(50) DEFAULT NULL,
  `AxsNo` int(2) DEFAULT '0',
  `DialString` varchar(100) DEFAULT NULL,
  `CallType` int(2) DEFAULT '0',
  `Carrier` int(2) DEFAULT '0',
  `IVRID` int(3) DEFAULT '0',
  `MappedAddress` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table accountrates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accountrates`;

CREATE TABLE `accountrates` (
  `setup` bigint(5) DEFAULT NULL,
  `monthly` bigint(5) DEFAULT NULL,
  `hardware` bigint(5) DEFAULT NULL,
  `shipping` bigint(5) DEFAULT NULL,
  `Other` bigint(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `clid` varchar(50) DEFAULT NULL,
  `Cents` bigint(10) DEFAULT NULL,
  `IsActive` int(2) DEFAULT '1',
  `MappedNo` varchar(30) DEFAULT NULL,
  `OrderID` varchar(15) DEFAULT NULL,
  `IsRestricted` int(2) DEFAULT '1',
  `SetBy` varchar(20) DEFAULT 'CLIENT',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table accountshead
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accountshead`;

CREATE TABLE `accountshead` (
  `AccountCode` varchar(8) NOT NULL DEFAULT 'NONE',
  `AccountDescription` blob,
  `IsCredit` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`AccountCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table activitylog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activitylog`;

CREATE TABLE `activitylog` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `uid` varchar(25) DEFAULT NULL,
  `OrderID` varchar(10) DEFAULT NULL,
  `Activity` blob,
  `TimeStamp` datetime DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `Proxy` varchar(50) DEFAULT NULL,
  `IsCustomer` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table AddInfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AddInfo`;

CREATE TABLE `AddInfo` (
  `Annoucement` blob,
  `Advertise` blob,
  `Current` tinyint(1) NOT NULL DEFAULT '0',
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(50) DEFAULT 'VPL',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table AddRequests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AddRequests`;

CREATE TABLE `AddRequests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(30) NOT NULL DEFAULT '',
  `SIPPhoneNumber` varchar(30) NOT NULL DEFAULT '',
  `SIPProxy` varchar(50) NOT NULL DEFAULT '',
  `EMail` varchar(50) NOT NULL DEFAULT '',
  `PIN` varchar(4) NOT NULL DEFAULT '',
  `IsAdded` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `Street1` varchar(80) DEFAULT NULL,
  `Street2` varchar(80) DEFAULT NULL,
  `City` varchar(20) NOT NULL DEFAULT '',
  `State` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(20) NOT NULL DEFAULT '',
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `AddressID` (`AddressID`),
  KEY `Country` (`Country`),
  KEY `City` (`City`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table addressedithistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addressedithistory`;

CREATE TABLE `addressedithistory` (
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `Street1` varchar(80) DEFAULT NULL,
  `Street2` varchar(80) DEFAULT NULL,
  `City` varchar(20) NOT NULL DEFAULT '',
  `State` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(20) NOT NULL DEFAULT '',
  `Country` varchar(20) NOT NULL DEFAULT '',
  `AUser` varchar(50) DEFAULT NULL,
  `EDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table AdminActivities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AdminActivities`;

CREATE TABLE `AdminActivities` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ActivityID` int(2) DEFAULT '0',
  `ActivityName` varchar(100) DEFAULT NULL,
  `CatID` int(2) DEFAULT NULL,
  `CatDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ActivityID` (`ActivityID`),
  KEY `ActivityName` (`ActivityName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table AdminCounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AdminCounts`;

CREATE TABLE `AdminCounts` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Count` int(10) DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table AdminMasterLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AdminMasterLog`;

CREATE TABLE `AdminMasterLog` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `UID` varchar(25) DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `URL` text,
  `Location` varchar(100) DEFAULT NULL,
  `IP` varchar(40) DEFAULT NULL,
  `BrowserName` text,
  `Amount` double DEFAULT '0',
  `DID` varchar(25) DEFAULT NULL,
  `Activity` int(1) DEFAULT '0',
  `TransID` text,
  `ThreadMsg` text,
  `LogType` int(1) DEFAULT '0',
  `TodaysDate` date DEFAULT NULL,
  `SiteID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Date` (`Date`),
  KEY `UID` (`UID`),
  KEY `Activity` (`Activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table adminreseller
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adminreseller`;

CREATE TABLE `adminreseller` (
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `ResellerID` varchar(10) NOT NULL DEFAULT '',
  `IsReseller` tinyint(1) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AUID`),
  UNIQUE KEY `AUID` (`AUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table adminrights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adminrights`;

CREATE TABLE `adminrights` (
  `ARID` varchar(10) NOT NULL DEFAULT '',
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `RightType` varchar(7) NOT NULL DEFAULT '',
  `ARValue` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ARID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table adminuser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `UID` varchar(50) NOT NULL DEFAULT '',
  `AddressID` varchar(10) DEFAULT NULL,
  `AUFName` varchar(20) NOT NULL DEFAULT '',
  `AULName` varchar(20) DEFAULT '',
  `AUEmail` varchar(60) NOT NULL DEFAULT '',
  `AUType` varchar(4) NOT NULL DEFAULT '',
  `AUDesig` varchar(10) DEFAULT '',
  `AUTel1` varchar(15) DEFAULT '',
  `AUTel2` varchar(15) DEFAULT '',
  `AUSalary` int(11) DEFAULT '0',
  `AUDoJ` date DEFAULT '0000-00-00',
  `ACDate` datetime DEFAULT NULL,
  `Tier1` tinyint(2) DEFAULT '0',
  `Tier2` tinyint(2) DEFAULT '0',
  `Tier3` tinyint(2) DEFAULT '0',
  `SiteID` varchar(50) DEFAULT 'VPL',
  `CreditLimit` double DEFAULT '0',
  `MyPic` longblob,
  `MyPicType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AUID`),
  UNIQUE KEY `AUID` (`AUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table affilate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affilate`;

CREATE TABLE `affilate` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UID` varchar(10) DEFAULT NULL,
  `UID2` varchar(10) DEFAULT NULL,
  `AffilateID` varchar(20) DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table agentbalance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agentbalance`;

CREATE TABLE `agentbalance` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUID` varchar(10) DEFAULT NULL,
  `AgentID` varchar(10) DEFAULT NULL,
  `Balance` bigint(5) DEFAULT '0',
  `Comments` text,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table allbilled
# ------------------------------------------------------------

DROP TABLE IF EXISTS `allbilled`;

CREATE TABLE `allbilled` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `Description` text NOT NULL,
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ALLDIDS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ALLDIDS`;

CREATE TABLE `ALLDIDS` (
  `ID` int(5) DEFAULT NULL,
  `DID` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `VPLMonthly` double DEFAULT '0',
  `DIDxMonthly` double DEFAULT '0',
  `VPLACTV` double DEFAULT '0',
  `DIDxACTV` double DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table AllowedOne
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AllowedOne`;

CREATE TABLE `AllowedOne` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `Prefix` bigint(10) DEFAULT NULL,
  `Vendor` varchar(20) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `ImportID` int(4) DEFAULT '0',
  `ImportCode` varchar(25) DEFAULT NULL,
  `Descr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table allstatescallrates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `allstatescallrates`;

CREATE TABLE `allstatescallrates` (
  `CountryCode` char(10) NOT NULL DEFAULT '',
  `Description` char(80) NOT NULL DEFAULT '',
  `Rates` char(12) NOT NULL DEFAULT '',
  `VRates` char(12) DEFAULT NULL,
  `DsgRates` char(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table announcement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `ComplainID` varchar(10) NOT NULL DEFAULT '',
  `OID` varchar(50) DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `Assign` varchar(10) DEFAULT NULL,
  `Type` varchar(4) NOT NULL DEFAULT '',
  `Complain` text,
  `IsResolved` tinyint(1) NOT NULL DEFAULT '0',
  `Notify` tinyint(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DID` varchar(20) DEFAULT NULL,
  `VOID` varchar(10) DEFAULT NULL,
  `AreaID` varchar(20) DEFAULT NULL,
  `ResolveDate` datetime DEFAULT NULL,
  `PostDate` datetime DEFAULT NULL,
  `ResolvedBy` varchar(25) DEFAULT NULL,
  `IsRead` int(1) DEFAULT '1',
  `IsUpdate` int(1) DEFAULT '0',
  `IsAnn` int(1) DEFAULT '0',
  `IsArchive` int(1) DEFAULT '0',
  `IP` varchar(50) DEFAULT NULL,
  `ReadTime` datetime DEFAULT NULL,
  `tags` text,
  `MySiteID` varchar(100) DEFAULT NULL,
  `IsSMS` int(1) DEFAULT '0',
  `Category` int(5) DEFAULT NULL,
  `SubCat` int(5) DEFAULT NULL,
  PRIMARY KEY (`ComplainID`),
  KEY `NewIndex1` (`OID`),
  KEY `UID` (`UID`),
  KEY `Date` (`DateTime`),
  FULLTEXT KEY `Complain` (`Complain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 MAX_ROWS=4294967295 AVG_ROW_LENGTH=50;



# Dump of table arf
# ------------------------------------------------------------

DROP TABLE IF EXISTS `arf`;

CREATE TABLE `arf` (
  `arfeen` longblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table AuthCallBackNo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AuthCallBackNo`;

CREATE TABLE `AuthCallBackNo` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `callbackno` varchar(25) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OID` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table availableareacode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `availableareacode`;

CREATE TABLE `availableareacode` (
  `State` char(2) NOT NULL DEFAULT '',
  `AreaCode` char(3) NOT NULL DEFAULT '',
  `Location` varchar(80) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table AVSSettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AVSSettings`;

CREATE TABLE `AVSSettings` (
  `ID` bigint(5) DEFAULT NULL,
  `AVS` varchar(10) DEFAULT NULL,
  `Rating` int(2) DEFAULT NULL,
  `SetBy` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table BackOrder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BackOrder`;

CREATE TABLE `BackOrder` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `CountryCode` varchar(10) DEFAULT NULL,
  `AreaCode` varchar(10) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Quantity` int(2) DEFAULT NULL,
  `Status` int(2) DEFAULT '1',
  `Monthly` double DEFAULT '0',
  `Vendor` varchar(15) DEFAULT NULL,
  `Days` varchar(4) DEFAULT NULL,
  `Payment` double DEFAULT '0',
  `NXX` varchar(25) DEFAULT NULL,
  `BackAdminID` int(2) DEFAULT '0',
  `TrID` varchar(50) DEFAULT NULL,
  `Setup` double DEFAULT '0',
  `Place` varchar(10) DEFAULT 'WEBUI',
  `CountryName` varchar(50) DEFAULT NULL,
  `AreaName` varchar(50) DEFAULT NULL,
  `RateCenter` varchar(20) DEFAULT NULL,
  `KeyValue` varchar(100) DEFAULT NULL,
  `CompDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table BackOrderAdmin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BackOrderAdmin`;

CREATE TABLE `BackOrderAdmin` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `VendorID` varchar(25) DEFAULT NULL,
  `CountryCode` varchar(10) DEFAULT NULL,
  `DIDArea` varchar(10) DEFAULT NULL,
  `Prefix` varchar(20) DEFAULT NULL,
  `Monthly` double DEFAULT '0',
  `Setup` double DEFAULT '0',
  `Quantity` int(2) DEFAULT '0',
  `Days` int(11) DEFAULT '0',
  `NXX` varchar(10) DEFAULT NULL,
  `RateCenter` varchar(25) DEFAULT NULL,
  `CountryName` varchar(200) DEFAULT NULL,
  `AreaName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table BackOrderTemp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BackOrderTemp`;

CREATE TABLE `BackOrderTemp` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `OID` varchar(10) DEFAULT NULL,
  `BackOrderID` int(5) DEFAULT NULL,
  `CountryCode` varchar(5) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `AreaCode` varchar(10) DEFAULT NULL,
  `AreaName` varchar(50) DEFAULT NULL,
  `NXX` varchar(4) DEFAULT NULL,
  `RateCenter` varchar(20) DEFAULT NULL,
  `Setup` double DEFAULT '0',
  `Monthly` double DEFAULT '0',
  `OrderDays` int(2) DEFAULT '0',
  `Vendor` varchar(10) DEFAULT NULL,
  `KeyVal` varchar(50) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table bandwidthsaver
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bandwidthsaver`;

CREATE TABLE `bandwidthsaver` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `Quality` varchar(10) NOT NULL DEFAULT '0',
  `IsAllowed` int(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table billing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `billing`;

CREATE TABLE `billing` (
  `BID` varchar(20) NOT NULL DEFAULT '',
  `AccountNo` varchar(40) NOT NULL DEFAULT '',
  `Balance` double NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table billinghistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `billinghistory`;

CREATE TABLE `billinghistory` (
  `TID` varchar(100) DEFAULT NULL,
  `BID` varchar(20) NOT NULL DEFAULT '',
  `AccountNo` varchar(40) NOT NULL DEFAULT '',
  `Balance` double NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `SCHG` varchar(50) DEFAULT '0',
  `Comments` blob,
  `BYW` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table blacklist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blacklist`;

CREATE TABLE `blacklist` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OID` varchar(15) DEFAULT NULL,
  `DID` varchar(50) DEFAULT NULL,
  `RingTo` varchar(50) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `Admin` varchar(50) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `isfree` int(2) DEFAULT '0',
  `iscomm` int(2) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table blockeddomain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blockeddomain`;

CREATE TABLE `blockeddomain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(50) DEFAULT NULL,
  `ipaddress` varchar(16) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table botnet_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `botnet_list`;

CREATE TABLE `botnet_list` (
  `bot_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `botnet` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-- default --',
  `bot_version` int(10) unsigned NOT NULL DEFAULT '0',
  `net_latency` int(10) unsigned NOT NULL DEFAULT '0',
  `tcpport_s1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_localbias` int(11) NOT NULL DEFAULT '0',
  `os_version` tinyblob NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ipv4_list` blob NOT NULL,
  `ipv6_list` blob NOT NULL,
  `ipv4` varbinary(4) NOT NULL DEFAULT '\0\0\0\0',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '--',
  `rtime_first` int(10) unsigned NOT NULL DEFAULT '0',
  `rtime_last` int(10) unsigned NOT NULL DEFAULT '0',
  `rtime_online` int(10) unsigned NOT NULL DEFAULT '0',
  `flag_new` tinyint(1) NOT NULL DEFAULT '1',
  `flag_used` tinyint(1) NOT NULL DEFAULT '0',
  `comment` tinytext COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `bot_id` (`bot_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table botnet_reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `botnet_reports`;

CREATE TABLE `botnet_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `botnet` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-- default --',
  `bot_version` int(10) unsigned NOT NULL DEFAULT '0',
  `path_source` text COLLATE utf8_unicode_ci NOT NULL,
  `path_dest` text COLLATE utf8_unicode_ci NOT NULL,
  `time_system` int(10) unsigned NOT NULL DEFAULT '0',
  `time_tick` int(10) unsigned NOT NULL DEFAULT '0',
  `time_localbias` int(11) NOT NULL DEFAULT '0',
  `os_version` tinyblob NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `process_name` text COLLATE utf8_unicode_ci NOT NULL,
  `process_user` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `context` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ipv4` varbinary(15) NOT NULL DEFAULT '0.0.0.0',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '--',
  `rtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table botnet_scripts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `botnet_scripts`;

CREATE TABLE `botnet_scripts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extern_id` varbinary(16) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flag_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `time_created` int(10) unsigned NOT NULL DEFAULT '0',
  `send_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `bots_wl` text COLLATE utf8_unicode_ci NOT NULL,
  `bots_bl` text COLLATE utf8_unicode_ci NOT NULL,
  `botnets_wl` text COLLATE utf8_unicode_ci NOT NULL,
  `botnets_bl` text COLLATE utf8_unicode_ci NOT NULL,
  `countries_wl` text COLLATE utf8_unicode_ci NOT NULL,
  `countries_bl` text COLLATE utf8_unicode_ci NOT NULL,
  `script_text` text COLLATE utf8_unicode_ci NOT NULL,
  `script_bin` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table botnet_scripts_stat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `botnet_scripts_stat`;

CREATE TABLE `botnet_scripts_stat` (
  `extern_id` varbinary(16) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bot_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bot_version` int(10) unsigned NOT NULL DEFAULT '0',
  `rtime` int(10) unsigned NOT NULL DEFAULT '0',
  `report` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `extern_id` (`extern_id`,`bot_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table btc_change_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `btc_change_log`;

CREATE TABLE `btc_change_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `oid` int(10) DEFAULT '0',
  `ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0.0.0.0',
  `old_btc_address` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'Null',
  `old_btc_secret_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'Null',
  `old_web_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'Null',
  `old_blockchain_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'Null',
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table bu_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bu_customer`;

CREATE TABLE `bu_customer` (
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `UID` varchar(50) NOT NULL DEFAULT '',
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `CSalutation` varchar(5) DEFAULT NULL,
  `CFName` varchar(20) NOT NULL DEFAULT '',
  `CMName` varchar(20) DEFAULT NULL,
  `CLName` varchar(20) NOT NULL DEFAULT '',
  `CEmail` varchar(60) NOT NULL DEFAULT '',
  `CSSN` varchar(20) DEFAULT NULL,
  `CCompany` varchar(30) DEFAULT NULL,
  `CTelOff` varchar(20) DEFAULT NULL,
  `CTelHome` varchar(20) DEFAULT NULL,
  `CCell` varchar(20) DEFAULT NULL,
  `CFax` varchar(20) DEFAULT NULL,
  `MSN` varchar(100) DEFAULT '-',
  `Gtalk` varchar(100) DEFAULT '-',
  `DOB` date DEFAULT NULL,
  `NIC` varchar(255) DEFAULT '0000',
  `SMSEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`UID`),
  KEY `CFName` (`CFName`),
  KEY `CMName` (`CLName`),
  KEY `CCompany` (`CCompany`),
  KEY `CEmail` (`CEmail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table buddies_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `buddies_relation`;

CREATE TABLE `buddies_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `extension_busy` varchar(20) DEFAULT NULL,
  `extension_answered` varchar(20) DEFAULT NULL,
  `extension_logged` varchar(20) DEFAULT NULL,
  `caller_id` char(1) DEFAULT NULL,
  `summary_call` char(1) DEFAULT NULL,
  `user_edit_extbusy` char(1) DEFAULT NULL,
  `user_edit_extans` char(1) DEFAULT NULL,
  `user_edit_extlog` char(1) DEFAULT NULL,
  `user_edit_callerid` char(1) DEFAULT NULL,
  `user_edit_sumcall` char(1) DEFAULT NULL,
  `call_waiting` char(1) DEFAULT NULL,
  `seconds` varchar(10) DEFAULT NULL,
  `webpassword` varchar(30) DEFAULT NULL,
  `username` varchar(50) DEFAULT 'Available',
  `evoice` char(1) DEFAULT 'N',
  `call_recording` char(1) DEFAULT 'N',
  `voice_mail` char(1) DEFAULT 'N',
  `international_calling` char(1) DEFAULT 'N',
  `international_calling_ww35` char(1) DEFAULT 'N',
  `international_calling_all` char(1) DEFAULT 'N',
  `local_calling` char(1) DEFAULT 'N',
  `call_forwarding` char(1) DEFAULT 'N',
  `talktime` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table BuyHistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BuyHistory`;

CREATE TABLE `BuyHistory` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(15) NOT NULL DEFAULT '',
  `mappedAddress` varchar(255) DEFAULT NULL,
  `vendorid` varchar(12) DEFAULT '16',
  `typeid` bigint(12) DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `info` varchar(40) DEFAULT NULL,
  `OrderID` varchar(6) DEFAULT NULL,
  `SetupCost` varchar(6) DEFAULT '99',
  `MonthlyCost` varchar(6) DEFAULT '5',
  `IsMonthlyTerminated` tinyint(1) DEFAULT '0',
  `PerMinuteOrignation` varchar(6) DEFAULT '0.0',
  `MappedToSIP` tinyint(1) DEFAULT '0',
  `MapedToIAX` tinyint(1) DEFAULT '0',
  `country` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `carrier` int(11) DEFAULT '0',
  `mappedRate` float(6,4) DEFAULT NULL,
  `minutes` float(6,4) DEFAULT NULL,
  `dialString` varchar(255) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT '0',
  `MappedToIVR` tinyint(1) DEFAULT '0',
  `callType` int(11) DEFAULT '1',
  `talkTimeBalance` int(11) DEFAULT '0',
  `AnnualCost` double(6,4) DEFAULT NULL,
  `isFree` tinyint(4) DEFAULT '0',
  `freeExpiry` datetime DEFAULT NULL,
  `FreeMinutes` int(11) DEFAULT '0',
  `PerMinuteAfterFreeMinutes` double(6,4) DEFAULT '0.0000',
  `Channels` int(11) DEFAULT '1',
  `AutoRemove` int(2) DEFAULT '0',
  `SignupFree` int(2) DEFAULT '0',
  `AutoRemoveDate` date DEFAULT NULL,
  `IVR` int(2) DEFAULT '0',
  `DIDStatus` int(2) DEFAULT '0',
  `Payment` double DEFAULT '0',
  `IsIVR` int(2) DEFAULT '0',
  `SuspenDate` date DEFAULT NULL,
  `Termdate` date DEFAULT NULL,
  `IsRecording` int(1) DEFAULT '0',
  `Vmail` int(2) DEFAULT '0',
  `DIDType` int(2) DEFAULT '1',
  `GroupID` varchar(50) DEFAULT NULL,
  `BillingDate` date DEFAULT NULL,
  `FreeConf` int(1) DEFAULT '0',
  `DIDxSetup` double DEFAULT '0',
  `DIDxMonthly` double DEFAULT '0',
  `DIDxPerM` double DEFAULT '0',
  `ActionDate` datetime DEFAULT NULL,
  `ActionBy` varchar(50) DEFAULT NULL,
  `Action` varchar(20) DEFAULT 'NoAction',
  `MyAdmin` varchar(25) DEFAULT NULL,
  `RateCenter` varchar(50) DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `ConvertedBilling` datetime DEFAULT NULL,
  `SMS` int(1) DEFAULT NULL,
  `Voice` int(1) DEFAULT NULL,
  `PurchaseorRelese` int(1) DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `date` (`date`),
  KEY `Country` (`country`),
  KEY `OrderiD` (`OrderID`),
  KEY `did` (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CallBackList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CallBackList`;

CREATE TABLE `CallBackList` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Source` varchar(25) DEFAULT NULL,
  `Dst` varchar(25) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CallBackPINNumbers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CallBackPINNumbers`;

CREATE TABLE `CallBackPINNumbers` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(100) DEFAULT NULL,
  `PIN` varchar(50) DEFAULT NULL,
  `KeyVal` varchar(25) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Expiry` date DEFAULT NULL,
  `Status` int(1) DEFAULT '0',
  `TrID` varchar(25) DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `DateUsed` datetime DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CallBackRequest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CallBackRequest`;

CREATE TABLE `CallBackRequest` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Src` text,
  `Dest` text,
  `OID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CallBlocking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CallBlocking`;

CREATE TABLE `CallBlocking` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `CallFrom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callforwarding
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callforwarding`;

CREATE TABLE `callforwarding` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `WaitFor` int(3) DEFAULT '0',
  `ForwardTo` varchar(20) DEFAULT NULL,
  `IsActive` int(1) NOT NULL DEFAULT '0',
  `IsAllowed` int(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CallForwarding
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CallForwarding`;

CREATE TABLE `CallForwarding` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Status` int(1) DEFAULT '1',
  `AllCallForwardTo` int(1) DEFAULT '0',
  `AllCallPhoneNumber` varchar(50) DEFAULT NULL,
  `AllCall` int(1) DEFAULT '0',
  `NoAnswer` int(1) DEFAULT '1',
  `NoAnswerForwardTo` int(1) DEFAULT '0',
  `NoAnswerPhoneNumber` varchar(50) DEFAULT NULL,
  `Bzy` int(1) DEFAULT '1',
  `BzyForwardTo` int(1) DEFAULT '0',
  `BzyPhoneNumber` varchar(50) DEFAULT NULL,
  `Offline` int(1) DEFAULT '1',
  `OfflineForwardTo` int(1) DEFAULT '0',
  `OfflinePhoneNumber` varchar(50) DEFAULT NULL,
  `DID` varchar(50) DEFAULT NULL,
  `CallWaiting` int(1) DEFAULT '0',
  `VmailSecs` int(2) DEFAULT '30',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CallIntro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CallIntro`;

CREATE TABLE `CallIntro` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `CountryCode` varchar(25) DEFAULT NULL,
  `MsgText` text,
  `MsgFile` longblob,
  `Status` int(1) DEFAULT '1',
  `SiteID` varchar(100) DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table calllog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `calllog`;

CREATE TABLE `calllog` (
  `CLID` varchar(15) NOT NULL DEFAULT '',
  `OID` varchar(10) NOT NULL DEFAULT '',
  `CLTo` varchar(20) NOT NULL DEFAULT '',
  `CLFrom` varchar(20) NOT NULL DEFAULT '',
  `CLDuration` varchar(4) NOT NULL DEFAULT '',
  `CLDate` varchar(15) NOT NULL DEFAULT '',
  `CLTime` varchar(15) NOT NULL DEFAULT '',
  `CLEntryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CLID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callratefororder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callratefororder`;

CREATE TABLE `callratefororder` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `callratetale` varchar(20) DEFAULT '1',
  `By` varchar(20) DEFAULT 'Arif',
  `Date` datetime DEFAULT '2004-04-14 14:10:42',
  PRIMARY KEY (`OID`),
  UNIQUE KEY `OrderID` (`OID`),
  UNIQUE KEY `OrderID_2` (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callrates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callrates`;

CREATE TABLE `callrates` (
  `CountryCode` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Rates` double NOT NULL DEFAULT '0',
  `VRates` double DEFAULT NULL,
  `DsgRates` varchar(12) DEFAULT NULL,
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `BroadVoice` double DEFAULT NULL,
  `Inphonex` double DEFAULT NULL,
  `ww35` tinyint(1) DEFAULT '0',
  `ww20` tinyint(1) DEFAULT '0',
  `Zone` int(2) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT 'VPL',
  `ChZone` char(3) DEFAULT '0',
  `SMSRates` double DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callrates_cx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callrates_cx`;

CREATE TABLE `callrates_cx` (
  `CountryCode` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(80) NOT NULL DEFAULT '',
  `Rates` double NOT NULL DEFAULT '0',
  `VRates` double DEFAULT NULL,
  `DsgRates` varchar(12) DEFAULT NULL,
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `BroadVoice` double DEFAULT NULL,
  `Inphonex` double DEFAULT NULL,
  `ww35` tinyint(1) DEFAULT '0',
  `ww20` tinyint(1) DEFAULT '0',
  `Zone` int(2) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT 'VPL',
  `ChZone` char(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callrates_indiaspecial
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callrates_indiaspecial`;

CREATE TABLE `callrates_indiaspecial` (
  `CountryCode` char(10) NOT NULL DEFAULT '',
  `Description` char(80) NOT NULL DEFAULT '',
  `Rates` char(12) NOT NULL DEFAULT '',
  `VRates` char(12) DEFAULT NULL,
  `DsgRates` char(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callrates_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callrates_old`;

CREATE TABLE `callrates_old` (
  `CountryCode` char(10) NOT NULL DEFAULT '',
  `Description` char(80) NOT NULL DEFAULT '',
  `Rates` char(12) NOT NULL DEFAULT '',
  `VRates` char(12) DEFAULT NULL,
  `DsgRates` char(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callrates_specialcustomer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callrates_specialcustomer`;

CREATE TABLE `callrates_specialcustomer` (
  `CountryCode` char(10) NOT NULL DEFAULT '',
  `Description` char(80) NOT NULL DEFAULT '',
  `Rates` char(12) NOT NULL DEFAULT '',
  `VRates` char(12) DEFAULT NULL,
  `DsgRates` char(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callrates_standard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callrates_standard`;

CREATE TABLE `callrates_standard` (
  `CountryCode` char(10) NOT NULL DEFAULT '',
  `Description` char(80) NOT NULL DEFAULT '',
  `Rates` char(12) NOT NULL DEFAULT '',
  `VRates` char(12) DEFAULT NULL,
  `DsgRates` char(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callrates_temp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callrates_temp`;

CREATE TABLE `callrates_temp` (
  `CountryCode` char(10) NOT NULL DEFAULT '',
  `Description` char(80) NOT NULL DEFAULT '',
  `Rates` double NOT NULL DEFAULT '0',
  `VRates` double DEFAULT NULL,
  `DsgRates` char(12) DEFAULT NULL,
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `BroadVoice` double DEFAULT NULL,
  `Inphonex` double DEFAULT NULL,
  `ww35` tinyint(1) DEFAULT '0',
  `ww20` tinyint(1) DEFAULT '0',
  `Zone` int(2) DEFAULT NULL,
  `SiteID` char(255) DEFAULT 'VPL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callrates2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callrates2`;

CREATE TABLE `callrates2` (
  `CountryCode` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(80) NOT NULL DEFAULT '',
  `Rates` varchar(12) NOT NULL DEFAULT '',
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `ww35` tinyint(1) DEFAULT '0',
  `ww20` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callratesparsing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callratesparsing`;

CREATE TABLE `callratesparsing` (
  `CountryCode` char(10) NOT NULL DEFAULT '',
  `Description` char(80) NOT NULL DEFAULT '',
  `Rates` char(12) NOT NULL DEFAULT '',
  `VRates` char(12) DEFAULT NULL,
  `DsgRates` char(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callTypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callTypes`;

CREATE TABLE `callTypes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table callwaiting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `callwaiting`;

CREATE TABLE `callwaiting` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `IsActive` int(1) NOT NULL DEFAULT '0',
  `IsAllowed` int(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cards`;

CREATE TABLE `cards` (
  `card_id` int(10) NOT NULL AUTO_INCREMENT,
  `card_pin_number` bigint(10) DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `free_minutes` int(10) DEFAULT '0',
  `value` int(10) DEFAULT NULL,
  `date_of_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_id` varchar(100) DEFAULT NULL,
  `used_by_did` int(10) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cards_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cards_copy`;

CREATE TABLE `cards_copy` (
  `card_id` int(10) NOT NULL AUTO_INCREMENT,
  `card_pin_number` bigint(10) DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `free_minutes` int(10) DEFAULT '0',
  `value` int(10) DEFAULT NULL,
  `date_of_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_id` varchar(100) DEFAULT NULL,
  `used_by_did` int(10) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table career_bound
# ------------------------------------------------------------

DROP TABLE IF EXISTS `career_bound`;

CREATE TABLE `career_bound` (
  `OID` int(11) NOT NULL DEFAULT '0',
  `ringto` varchar(50) NOT NULL DEFAULT '',
  `career` int(11) DEFAULT NULL,
  `dialstr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OID`,`ringto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table carriers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carriers`;

CREATE TABLE `carriers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `codec` varchar(50) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `other` varchar(5) DEFAULT NULL,
  `dialstr` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `intprefix` varchar(10) DEFAULT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `Billing Min` varchar(5) DEFAULT '1/1',
  `International Billing min` varchar(5) DEFAULT '1/1',
  `SiteID` varchar(50) DEFAULT NULL,
  `isnew` char(2) DEFAULT '1',
  `ImageID` varchar(5) DEFAULT NULL,
  `RingToDesc` text,
  `MyCallType` int(1) DEFAULT '1',
  `domainadd` int(1) DEFAULT '0',
  `domainshow` varchar(255) DEFAULT NULL,
  `MyDesc` varchar(255) DEFAULT NULL,
  `textboxshow` int(1) DEFAULT '1',
  `domainDialStr` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table carrierxac
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carrierxac`;

CREATE TABLE `carrierxac` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `otherinfo` varchar(50) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `SIPIAX` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cc_decline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cc_decline`;

CREATE TABLE `cc_decline` (
  `OID` varchar(15) NOT NULL DEFAULT '',
  `Decline` int(2) DEFAULT NULL,
  `SusDate` date DEFAULT NULL,
  `TermDays` int(2) DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cceditlogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cceditlogs`;

CREATE TABLE `cceditlogs` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `OID` int(4) DEFAULT NULL,
  `customerid` varchar(20) DEFAULT NULL,
  `ccid` varchar(20) DEFAULT NULL,
  `number` varchar(30) DEFAULT NULL,
  `exyear` varchar(4) DEFAULT NULL,
  `exmonth` varchar(2) DEFAULT NULL,
  `varcode` varchar(4) DEFAULT NULL,
  `oldnumber` varchar(20) DEFAULT NULL,
  `oldyear` varchar(4) DEFAULT NULL,
  `oldmonth` varchar(2) DEFAULT NULL,
  `oldcvs` varchar(4) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ActionBy` varchar(20) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Action` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cchistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cchistory`;

CREATE TABLE `cchistory` (
  `LinkPointID` varchar(70) DEFAULT NULL,
  `UID` varchar(20) NOT NULL DEFAULT '',
  `UserID` varchar(20) DEFAULT NULL,
  `CName` varchar(40) NOT NULL DEFAULT '',
  `CAddress` varchar(60) NOT NULL DEFAULT '',
  `CTel` varchar(30) DEFAULT NULL,
  `CEmail` varchar(80) DEFAULT NULL,
  `CCNumber` varchar(16) NOT NULL DEFAULT '',
  `CCType` varchar(4) NOT NULL DEFAULT '',
  `CCVNumber` char(4) NOT NULL,
  `CCExpiryMonth` char(2) NOT NULL DEFAULT '',
  `CCExpiryYear` varchar(4) NOT NULL DEFAULT '',
  `StatusCode` varchar(60) DEFAULT NULL,
  `StatusMessage` varchar(60) DEFAULT NULL,
  `StatusApproval` varchar(60) DEFAULT NULL,
  `AVSCode` text,
  `TrackingID` varchar(70) DEFAULT NULL,
  `Amount` decimal(6,2) DEFAULT NULL,
  `Type` varchar(4) NOT NULL DEFAULT '',
  `Comments` text,
  `IsCharged` tinyint(1) NOT NULL DEFAULT '0',
  `DateTime` datetime DEFAULT NULL,
  FULLTEXT KEY `StatusApproval` (`StatusApproval`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cchistorycfms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cchistorycfms`;

CREATE TABLE `cchistorycfms` (
  `LinkPointID` varchar(70) DEFAULT NULL,
  `UID` varchar(20) NOT NULL DEFAULT '',
  `UserID` varchar(20) DEFAULT NULL,
  `CName` varchar(40) NOT NULL DEFAULT '',
  `CAddress` varchar(60) NOT NULL DEFAULT '',
  `CTel` varchar(30) DEFAULT NULL,
  `CEmail` varchar(80) DEFAULT NULL,
  `CCNumber` varchar(16) NOT NULL DEFAULT '',
  `CCType` varchar(4) NOT NULL DEFAULT '',
  `CCVNumber` char(2) DEFAULT NULL,
  `CCExpiryMonth` char(2) NOT NULL DEFAULT '',
  `CCExpiryYear` varchar(4) NOT NULL DEFAULT '',
  `StatusCode` varchar(60) DEFAULT NULL,
  `StatusMessage` varchar(60) DEFAULT NULL,
  `StatusApproval` varchar(60) DEFAULT NULL,
  `AVSCode` text,
  `TrackingID` varchar(70) DEFAULT NULL,
  `Amount` decimal(6,2) DEFAULT NULL,
  `Type` varchar(4) NOT NULL DEFAULT '',
  `Comments` text,
  `IsCharged` tinyint(1) NOT NULL DEFAULT '0',
  `DateTime` datetime DEFAULT NULL,
  FULLTEXT KEY `StatusApproval` (`StatusApproval`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ccrating
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ccrating`;

CREATE TABLE `ccrating` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Rating` int(2) DEFAULT '0',
  `YYY` int(2) DEFAULT '0',
  `NNN` int(2) DEFAULT '0',
  `XXX` int(2) DEFAULT '0',
  `YN` int(2) DEFAULT '0',
  `ANY` int(2) DEFAULT '0',
  `SiteID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cdr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cdr`;

CREATE TABLE `cdr` (
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `src` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dst` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dcontext` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `channel` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dstchannel` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastapp` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastdata` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `amaflags` int(11) NOT NULL DEFAULT '0',
  `accountcode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uniqueid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userfield` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table cdrs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cdrs`;

CREATE TABLE `cdrs` (
  `ringto` varchar(40) DEFAULT NULL,
  `callerid` text,
  `callednum` varchar(80) DEFAULT NULL,
  `trunk` varchar(40) DEFAULT NULL,
  `disposition` varchar(20) DEFAULT NULL,
  `billseconds` int(11) DEFAULT '0',
  `billcost` float DEFAULT '0',
  `callstart` datetime DEFAULT NULL,
  `resellerrate` float DEFAULT NULL,
  `id` bigint(30) unsigned NOT NULL AUTO_INCREMENT,
  `OID` bigint(10) DEFAULT '0',
  `OriginationCost` double DEFAULT '0',
  `RingToCost` float DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `faxfilename` varchar(255) DEFAULT NULL,
  `OutC` int(1) DEFAULT '0',
  `FreeMinRemain` int(5) DEFAULT '0',
  `Reason` varchar(255) DEFAULT NULL,
  `DialString` varchar(255) DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MTalkTime` double DEFAULT '0',
  `ITalkTime` double DEFAULT '0',
  `TotalCallCost` double DEFAULT '0',
  `TalkTimeType` int(1) DEFAULT '0',
  `MySiteID` varchar(100) DEFAULT NULL,
  `myUpdatedRow` int(1) DEFAULT '0',
  `UNI_CALLID` varchar(255) DEFAULT NULL,
  `Carrier` varchar(50) DEFAULT NULL,
  `C1` varchar(50) DEFAULT NULL,
  `C2` varchar(50) DEFAULT NULL,
  `C3` varchar(50) DEFAULT NULL,
  `C4` varchar(50) DEFAULT NULL,
  `smsmsg` text,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`callednum`),
  KEY `OID` (`OID`),
  KEY `Date` (`callstart`),
  KEY `MySiteID` (`MySiteID`),
  KEY `OutC` (`OutC`),
  KEY `RingTo` (`ringto`),
  KEY `NewIndex2` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cdrs_newvplsip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cdrs_newvplsip`;

CREATE TABLE `cdrs_newvplsip` (
  `ringto` varchar(40) DEFAULT NULL,
  `callerid` text,
  `callednum` varchar(80) DEFAULT NULL,
  `trunk` varchar(40) DEFAULT NULL,
  `disposition` varchar(20) DEFAULT NULL,
  `billseconds` int(11) DEFAULT '0',
  `billcost` float DEFAULT '0',
  `callstart` datetime DEFAULT NULL,
  `resellerrate` float DEFAULT NULL,
  `id` bigint(30) unsigned NOT NULL AUTO_INCREMENT,
  `OID` bigint(10) DEFAULT '0',
  `OriginationCost` double DEFAULT '0',
  `RingToCost` float DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `faxfilename` varchar(255) DEFAULT NULL,
  `OutC` int(1) DEFAULT '0',
  `FreeMinRemain` int(5) DEFAULT '0',
  `Reason` varchar(255) DEFAULT NULL,
  `DialString` varchar(255) DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MTalkTime` double DEFAULT '0',
  `ITalkTime` double DEFAULT '0',
  `TotalCallCost` double DEFAULT '0',
  `TalkTimeType` int(1) DEFAULT '0',
  `MySiteID` varchar(100) DEFAULT NULL,
  `myUpdatedRow` int(1) DEFAULT '0',
  `UNI_CALLID` varchar(255) DEFAULT NULL,
  `Carrier` varchar(50) DEFAULT NULL,
  `C1` varchar(50) DEFAULT NULL,
  `C2` varchar(50) DEFAULT NULL,
  `C3` varchar(50) DEFAULT NULL,
  `C4` varchar(50) DEFAULT NULL,
  `smsmsg` text,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`callednum`),
  KEY `OID` (`OID`),
  KEY `Date` (`callstart`),
  KEY `MySiteID` (`MySiteID`),
  KEY `OutC` (`OutC`),
  KEY `RingTo` (`ringto`),
  KEY `NewIndex2` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cdrstest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cdrstest`;

CREATE TABLE `cdrstest` (
  `ringto` varchar(40) DEFAULT NULL,
  `callerid` text,
  `callednum` varchar(80) DEFAULT NULL,
  `trunk` varchar(40) DEFAULT NULL,
  `disposition` varchar(20) DEFAULT NULL,
  `billseconds` int(11) DEFAULT '0',
  `billcost` float DEFAULT '0',
  `callstart` datetime DEFAULT NULL,
  `resellerrate` float DEFAULT NULL,
  `id` bigint(30) unsigned NOT NULL AUTO_INCREMENT,
  `OID` bigint(10) DEFAULT '0',
  `OriginationCost` double DEFAULT '0',
  `RingToCost` float DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `faxfilename` varchar(255) DEFAULT NULL,
  `OutC` int(1) DEFAULT '0',
  `FreeMinRemain` int(5) DEFAULT '0',
  `Reason` varchar(255) DEFAULT NULL,
  `DialString` varchar(255) DEFAULT NULL,
  `endtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MTalkTime` double DEFAULT '0',
  `ITalkTime` double DEFAULT '0',
  `TotalCallCost` double DEFAULT '0',
  `TalkTimeType` int(1) DEFAULT '0',
  `MySiteID` varchar(100) DEFAULT NULL,
  `myUpdatedRow` int(1) DEFAULT '0',
  `UNI_CALLID` varchar(100) DEFAULT NULL,
  `Carrier` varchar(50) DEFAULT NULL,
  `C1` varchar(50) DEFAULT NULL,
  `C2` varchar(50) DEFAULT NULL,
  `C3` varchar(50) DEFAULT NULL,
  `C4` varchar(50) DEFAULT NULL,
  `smsmsg` text,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`callednum`),
  KEY `OID` (`OID`),
  KEY `Date` (`callstart`),
  KEY `MySiteID` (`MySiteID`),
  KEY `OutC` (`OutC`),
  KEY `RingTo` (`ringto`),
  KEY `NewIndex2` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CentralCRM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CentralCRM`;

CREATE TABLE `CentralCRM` (
  `ID` bigint(10) DEFAULT NULL,
  `Domain` varchar(100) DEFAULT NULL,
  `CRMID` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CFMSBilling
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CFMSBilling`;

CREATE TABLE `CFMSBilling` (
  `TransactionID` bigint(20) NOT NULL DEFAULT '0',
  `SiteID` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Type` varchar(10) NOT NULL DEFAULT '',
  `ReferenceID` varchar(100) DEFAULT NULL,
  `Amount` double(6,2) NOT NULL DEFAULT '0.00',
  `IsCredit` tinyint(4) NOT NULL DEFAULT '0',
  `IsCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DID` double DEFAULT '0',
  `Rate` double DEFAULT '0',
  UNIQUE KEY `TransactionID` (`TransactionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CFMSBilling2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CFMSBilling2`;

CREATE TABLE `CFMSBilling2` (
  `TransactionID` bigint(20) NOT NULL DEFAULT '0',
  `SiteID` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Type` varchar(10) NOT NULL DEFAULT '',
  `ReferenceID` varchar(100) DEFAULT NULL,
  `Amount` double(6,2) NOT NULL DEFAULT '0.00',
  `IsCredit` tinyint(4) NOT NULL DEFAULT '0',
  `IsCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DID` double DEFAULT '0',
  `Rate` double DEFAULT '0',
  UNIQUE KEY `TransactionID` (`TransactionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CFMSEverSoldDIDS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CFMSEverSoldDIDS`;

CREATE TABLE `CFMSEverSoldDIDS` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `DID` varchar(20) DEFAULT NULL,
  `DIDxSetup` double DEFAULT '0',
  `DIDxMonthly` double DEFAULT '0',
  `VPLMonthly` double DEFAULT '0',
  `VPLSetup` double DEFAULT '0',
  `Date` datetime DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `Type` varchar(8) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `OrigMonthly` double DEFAULT '0',
  `OrigSetup` double DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CFMSRate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CFMSRate`;

CREATE TABLE `CFMSRate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Max` int(2) DEFAULT '0',
  `Rate` double DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CFMSRateList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CFMSRateList`;

CREATE TABLE `CFMSRateList` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(100) DEFAULT NULL,
  `Setup` double DEFAULT '500',
  `MinDID` int(3) DEFAULT '100',
  `DIDCharge` double DEFAULT '1',
  `PerMinCharge` double DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table Channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Channels`;

CREATE TABLE `Channels` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `DID` varchar(255) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `OID` varchar(25) DEFAULT NULL,
  `Code` varchar(25) DEFAULT NULL,
  `Qty` int(2) DEFAULT '0',
  `Status` int(1) DEFAULT '1',
  `IsAnnual` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ChannelsCountry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ChannelsCountry`;

CREATE TABLE `ChannelsCountry` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Country` varchar(255) DEFAULT NULL,
  `Quantity` int(2) DEFAULT '0',
  `Status` int(1) DEFAULT '1',
  `Price` double DEFAULT '0',
  `Vendor` varchar(20) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `IsFlatRate` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ChannelsPrice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ChannelsPrice`;

CREATE TABLE `ChannelsPrice` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `CodeID` varchar(25) DEFAULT NULL,
  `QtyFrom` int(2) DEFAULT '0',
  `QtyTo` int(2) DEFAULT '0',
  `Price` double DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ChannelZone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ChannelZone`;

CREATE TABLE `ChannelZone` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `Zone` char(2) DEFAULT NULL,
  `Qty` int(2) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ChargeBacks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ChargeBacks`;

CREATE TABLE `ChargeBacks` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` varchar(15) DEFAULT NULL,
  `TrAmount` double DEFAULT '0',
  `Amount` double DEFAULT '0',
  `CC` varchar(50) DEFAULT NULL,
  `Num` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table clientheader
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clientheader`;

CREATE TABLE `clientheader` (
  `UID` varchar(255) DEFAULT NULL,
  `clientheader` int(2) DEFAULT '1',
  `SiteID` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ClientInterface
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ClientInterface`;

CREATE TABLE `ClientInterface` (
  `ID` bigint(10) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `HeaderMSG` text,
  `FooterMSG` text,
  `MainLogoFile` varchar(255) DEFAULT NULL,
  `Banner` varchar(255) DEFAULT NULL,
  `FullName` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cloner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cloner`;

CREATE TABLE `cloner` (
  `ID` int(2) DEFAULT NULL,
  `Cloner` varchar(255) DEFAULT NULL,
  KEY `NewIndex1` (`Cloner`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table clonerupdate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clonerupdate`;

CREATE TABLE `clonerupdate` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(255) DEFAULT NULL,
  `FileName` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Dir` varchar(50) DEFAULT NULL,
  `isupdated` varchar(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table complain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `complain`;

CREATE TABLE `complain` (
  `ComplainID` varchar(10) NOT NULL DEFAULT '',
  `OID` varchar(50) DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `Assign` varchar(10) DEFAULT NULL,
  `Type` varchar(4) NOT NULL DEFAULT '',
  `Complain` text,
  `IsResolved` tinyint(1) NOT NULL DEFAULT '0',
  `Notify` tinyint(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DID` varchar(20) DEFAULT NULL,
  `VOID` varchar(10) DEFAULT NULL,
  `AreaID` varchar(20) DEFAULT NULL,
  `ResolveDate` datetime DEFAULT NULL,
  `PostDate` datetime DEFAULT NULL,
  `ResolvedBy` varchar(25) DEFAULT NULL,
  `IsRead` int(1) DEFAULT '1',
  `IsUpdate` int(1) DEFAULT '0',
  `IsAnn` int(1) DEFAULT '0',
  `IsArchive` int(1) DEFAULT '0',
  `IP` varchar(50) DEFAULT NULL,
  `ReadTime` datetime DEFAULT NULL,
  `tags` text,
  `MySiteID` varchar(100) DEFAULT NULL,
  `IsSMS` int(1) DEFAULT '0',
  `Category` int(5) DEFAULT NULL,
  `SubCat` int(5) DEFAULT NULL,
  PRIMARY KEY (`ComplainID`),
  KEY `NewIndex1` (`OID`),
  KEY `UID` (`UID`),
  KEY `Date` (`DateTime`),
  FULLTEXT KEY `Complain` (`Complain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table complain_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `complain_copy`;

CREATE TABLE `complain_copy` (
  `ComplainID` varchar(10) NOT NULL DEFAULT '',
  `OID` varchar(50) DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `Assign` varchar(10) DEFAULT NULL,
  `Type` varchar(4) NOT NULL DEFAULT '',
  `Complain` text,
  `IsResolved` tinyint(1) NOT NULL DEFAULT '0',
  `Notify` tinyint(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DID` varchar(20) DEFAULT NULL,
  `VOID` varchar(10) DEFAULT NULL,
  `AreaID` varchar(20) DEFAULT NULL,
  `ResolveDate` datetime DEFAULT NULL,
  `PostDate` datetime DEFAULT NULL,
  `ResolvedBy` varchar(25) DEFAULT NULL,
  `IsRead` int(1) DEFAULT '1',
  `IsUpdate` int(1) DEFAULT '0',
  `IsAnn` int(1) DEFAULT '0',
  `IsArchive` int(1) DEFAULT '0',
  `IP` varchar(50) DEFAULT NULL,
  `ReadTime` datetime DEFAULT NULL,
  `tags` text,
  `MySiteID` varchar(100) DEFAULT NULL,
  `IsSMS` int(1) DEFAULT '0',
  `Category` int(5) DEFAULT NULL,
  `SubCat` int(5) DEFAULT NULL,
  KEY `NewIndex1` (`OID`),
  KEY `UID` (`UID`),
  KEY `Date` (`DateTime`),
  FULLTEXT KEY `Complain` (`Complain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ComplainThread
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ComplainThread`;

CREATE TABLE `ComplainThread` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ComplainID` varchar(25) DEFAULT NULL,
  `Remarks` text,
  `WrittenBy` varchar(255) DEFAULT NULL,
  `AssignTo` varchar(255) DEFAULT NULL,
  `SentToClient` int(2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Notify` int(2) DEFAULT '0',
  `IsReplied` int(1) DEFAULT '0',
  `OID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `OID` (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ConfDates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ConfDates`;

CREATE TABLE `ConfDates` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `OID` int(5) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table counter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `OID` varchar(20) NOT NULL DEFAULT '',
  `SiteID` varchar(20) DEFAULT 'VPL'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cp_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cp_users`;

CREATE TABLE `cp_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pass` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language` varbinary(2) NOT NULL DEFAULT 'en',
  `flag_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `comment` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `ss_format` varbinary(10) NOT NULL DEFAULT 'jpeg',
  `ss_quality` tinyint(3) unsigned NOT NULL DEFAULT '30',
  `r_edit_bots` tinyint(1) NOT NULL DEFAULT '1',
  `r_stats_main` tinyint(1) NOT NULL DEFAULT '1',
  `r_stats_main_reset` tinyint(1) NOT NULL DEFAULT '1',
  `r_stats_os` tinyint(1) NOT NULL DEFAULT '1',
  `r_botnet_bots` tinyint(1) NOT NULL DEFAULT '1',
  `r_botnet_scripts` tinyint(1) NOT NULL DEFAULT '1',
  `r_botnet_scripts_edit` tinyint(1) NOT NULL DEFAULT '1',
  `r_reports_db` tinyint(1) NOT NULL DEFAULT '1',
  `r_reports_db_edit` tinyint(1) NOT NULL DEFAULT '1',
  `r_reports_files` tinyint(1) NOT NULL DEFAULT '1',
  `r_reports_files_edit` tinyint(1) NOT NULL DEFAULT '1',
  `r_reports_jn` tinyint(1) NOT NULL DEFAULT '1',
  `r_system_info` tinyint(1) NOT NULL DEFAULT '1',
  `r_system_options` tinyint(1) NOT NULL DEFAULT '1',
  `r_system_user` tinyint(1) NOT NULL DEFAULT '1',
  `r_system_users` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table CRCounter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CRCounter`;

CREATE TABLE `CRCounter` (
  `OID` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table creditcard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `creditcard`;

CREATE TABLE `creditcard` (
  `CCID` varchar(16) NOT NULL DEFAULT '',
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `Name` varchar(40) NOT NULL DEFAULT '',
  `Number` varchar(600) NOT NULL DEFAULT '',
  `EncNumber` varchar(600) NOT NULL DEFAULT '',
  `Type` varchar(5) NOT NULL DEFAULT '',
  `VNumber` varchar(600) DEFAULT NULL,
  `EncVNumber` varchar(600) NOT NULL DEFAULT '',
  `ExpiryMonth` char(2) NOT NULL DEFAULT '',
  `ExpiryYear` varchar(4) NOT NULL DEFAULT '',
  `Rating` int(4) DEFAULT '2',
  `isValid` tinyint(4) DEFAULT NULL,
  `PriCard` int(2) DEFAULT '1',
  `MyCCKey` double DEFAULT '0',
  `MyCCData` longblob,
  UNIQUE KEY `Number` (`Number`),
  KEY `Name` (`Number`(16))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table creditcardedithistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `creditcardedithistory`;

CREATE TABLE `creditcardedithistory` (
  `CCID` varchar(16) NOT NULL DEFAULT '',
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `Name` varchar(40) NOT NULL DEFAULT '',
  `Number` varchar(20) NOT NULL DEFAULT '',
  `EncNumber` varchar(500) NOT NULL DEFAULT '',
  `Type` varchar(5) NOT NULL DEFAULT '',
  `VNumber` varchar(500) DEFAULT NULL,
  `ExpiryMonth` char(2) NOT NULL DEFAULT '',
  `ExpiryYear` varchar(4) NOT NULL DEFAULT '',
  `AUser` varchar(50) DEFAULT NULL,
  `EDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CRMLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CRMLog`;

CREATE TABLE `CRMLog` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `UID` varchar(255) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `Datetime` datetime DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `Manager` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table cron_email_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cron_email_job`;

CREATE TABLE `cron_email_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Country` varchar(50) DEFAULT NULL,
  `cstatus` varchar(1) DEFAULT '0',
  `Revnue_min` int(11) DEFAULT '0',
  `Revnue_max` int(11) DEFAULT '0',
  `lastlogin_days` int(11) DEFAULT '0',
  `lastlogin_months` int(11) DEFAULT '0',
  `lpurchase_days` int(11) DEFAULT '0',
  `lpurchase_months` int(11) DEFAULT '0',
  `After_of_signup_d` int(11) DEFAULT '0',
  `After_of_signup_m` int(11) DEFAULT '0',
  `eRepeat` int(11) DEFAULT '0',
  `eSubject` varchar(50) DEFAULT NULL,
  `Message` text,
  `EverPaid` int(1) DEFAULT '0',
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `EmailStatus` int(1) DEFAULT '0',
  `CompletedOn` datetime DEFAULT NULL,
  `CusType` int(1) DEFAULT '-1',
  `fromemail` varchar(255) DEFAULT NULL,
  `ccemail` varchar(255) DEFAULT NULL,
  `replyto` varchar(255) DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table currencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `sub_name` varchar(50) DEFAULT NULL,
  `sub_symbol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CusDocs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CusDocs`;

CREATE TABLE `CusDocs` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Prefix` varchar(20) DEFAULT NULL,
  `Doc` longblob,
  `VOID` varbinary(20) DEFAULT NULL,
  `AreaID` varchar(20) DEFAULT NULL,
  `Status` int(2) DEFAULT '0',
  `DID` varchar(50) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Type` varchar(20) DEFAULT NULL,
  `KeyID` varchar(100) DEFAULT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `Address` text,
  `Contact` varchar(40) DEFAULT NULL,
  `DocNumber` varchar(255) DEFAULT NULL,
  `DocName` char(1) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Textname` varchar(100) DEFAULT NULL,
  `TextDetail` text,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `NotifyURL` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CusDocsHistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CusDocsHistory`;

CREATE TABLE `CusDocsHistory` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Prefix` varchar(20) DEFAULT NULL,
  `Doc` longblob,
  `VOID` varbinary(20) DEFAULT NULL,
  `AreaID` varchar(20) DEFAULT NULL,
  `Status` int(2) DEFAULT '0',
  `DID` varchar(50) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `KeyID` varbinary(100) DEFAULT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `Address` text,
  `Contact` varchar(40) DEFAULT NULL,
  `DocNumber` varchar(255) DEFAULT NULL,
  `DocName` char(1) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `TextDetail` text,
  `NotifyURL` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `UID` varchar(50) NOT NULL DEFAULT '',
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `CSalutation` varchar(5) DEFAULT NULL,
  `CFName` varchar(20) NOT NULL DEFAULT '',
  `CMName` varchar(20) DEFAULT NULL,
  `CLName` varchar(20) NOT NULL DEFAULT '',
  `CEmail` varchar(60) NOT NULL DEFAULT '',
  `CSSN` varchar(20) DEFAULT NULL,
  `CCompany` varchar(30) DEFAULT NULL,
  `CTelOff` varchar(20) DEFAULT NULL,
  `CTelHome` varchar(20) DEFAULT NULL,
  `CCell` varchar(20) DEFAULT NULL,
  `CFax` varchar(20) DEFAULT NULL,
  `MSN` varchar(100) DEFAULT '-',
  `Gtalk` varchar(100) DEFAULT '-',
  `DOB` date DEFAULT NULL,
  `NIC` varchar(255) DEFAULT '0000',
  `SMSEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`UID`),
  KEY `CFName` (`CFName`),
  KEY `CMName` (`CLName`),
  KEY `CCompany` (`CCompany`),
  KEY `CEmail` (`CEmail`),
  KEY `AddressID` (`AddressID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table customer_back
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_back`;

CREATE TABLE `customer_back` (
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `UID` varchar(50) NOT NULL DEFAULT '',
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `CSalutation` varchar(5) DEFAULT NULL,
  `CFName` varchar(20) NOT NULL DEFAULT '',
  `CMName` varchar(20) DEFAULT NULL,
  `CLName` varchar(20) NOT NULL DEFAULT '',
  `CEmail` varchar(60) NOT NULL DEFAULT '',
  `CSSN` varchar(20) DEFAULT NULL,
  `CCompany` varchar(30) DEFAULT NULL,
  `CTelOff` varchar(20) DEFAULT NULL,
  `CTelHome` varchar(20) DEFAULT NULL,
  `CCell` varchar(20) DEFAULT NULL,
  `CFax` varchar(20) DEFAULT NULL,
  `MSN` varchar(100) DEFAULT '-',
  `Gtalk` varchar(100) DEFAULT '-',
  `DOB` date DEFAULT NULL,
  `NIC` varchar(255) DEFAULT '0000',
  `SMSEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`UID`),
  KEY `CFName` (`CFName`),
  KEY `CMName` (`CLName`),
  KEY `CCompany` (`CCompany`),
  KEY `CEmail` (`CEmail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table customeredithistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customeredithistory`;

CREATE TABLE `customeredithistory` (
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `UID` varchar(10) NOT NULL DEFAULT '',
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `CSalutation` varchar(5) DEFAULT NULL,
  `CFName` varchar(20) NOT NULL DEFAULT '',
  `CMName` varchar(20) DEFAULT NULL,
  `CLName` varchar(20) NOT NULL DEFAULT '',
  `CEmail` varchar(60) DEFAULT NULL,
  `CSSN` varchar(20) DEFAULT NULL,
  `CCompany` varchar(30) DEFAULT NULL,
  `CTelOff` varchar(20) DEFAULT NULL,
  `CTelHome` varchar(20) DEFAULT NULL,
  `CCell` varchar(20) DEFAULT NULL,
  `CFax` varchar(20) DEFAULT NULL,
  `AUser` varchar(50) DEFAULT NULL,
  `EDate` datetime DEFAULT NULL,
  UNIQUE KEY `CustomerID` (`CustomerID`),
  UNIQUE KEY `CustomerID_2` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table customerrating_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customerrating_history`;

CREATE TABLE `customerrating_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `customerRating` int(11) DEFAULT NULL,
  `uid` varchar(30) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CustomerRatings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CustomerRatings`;

CREATE TABLE `CustomerRatings` (
  `id` int(2) DEFAULT NULL,
  `RatingDescription` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table customerreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customerreferences`;

CREATE TABLE `customerreferences` (
  `RefID` varchar(10) NOT NULL DEFAULT '',
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `RefName` varchar(40) DEFAULT NULL,
  `RefAddress` varchar(60) DEFAULT NULL,
  `RefTel` varchar(20) DEFAULT NULL,
  `RefFax` varchar(20) DEFAULT NULL,
  `RefEmail` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`RefID`),
  UNIQUE KEY `RefID` (`RefID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table CustomRoutingInfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CustomRoutingInfo`;

CREATE TABLE `CustomRoutingInfo` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `OID` varchar(6) DEFAULT NULL,
  `DIDid` bigint(10) DEFAULT NULL,
  `CallFrom` varchar(10) DEFAULT NULL,
  `IsState` tinyint(1) DEFAULT '0',
  `number` varchar(100) DEFAULT NULL,
  `IsSIP` tinyint(1) DEFAULT '0',
  `IsIAX` tinyint(1) DEFAULT '0',
  `StartTime` varchar(5) DEFAULT '00:00',
  `EndTime` varchar(5) DEFAULT '23:00',
  `Days` varchar(7) DEFAULT '1000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DailyTaqaza
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DailyTaqaza`;

CREATE TABLE `DailyTaqaza` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` varchar(30) DEFAULT NULL,
  `AVSCode` varchar(10) DEFAULT NULL,
  `Amount` double DEFAULT '0',
  `DueAmount` double DEFAULT '0',
  `OrderStatus` int(1) DEFAULT NULL,
  `Error` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DailyTaqazaCFMS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DailyTaqazaCFMS`;

CREATE TABLE `DailyTaqazaCFMS` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(100) DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` varchar(30) DEFAULT NULL,
  `AVSCode` varchar(10) DEFAULT NULL,
  `Amount` double DEFAULT '0',
  `DueAmount` double DEFAULT '0',
  `OrderStatus` int(1) DEFAULT NULL,
  `Error` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DawnUsers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DawnUsers`;

CREATE TABLE `DawnUsers` (
  `IP` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `duration` int(5) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Prefix` varchar(20) DEFAULT NULL,
  `UserSoft` text,
  `dd` int(2) DEFAULT NULL,
  `mm` int(2) DEFAULT NULL,
  `yy` int(2) DEFAULT NULL,
  KEY `IP` (`IP`),
  KEY `Country` (`Country`),
  KEY `time` (`date`),
  KEY `Prefix` (`Prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DefaultCMFS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DefaultCMFS`;

CREATE TABLE `DefaultCMFS` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(100) DEFAULT NULL,
  `SettingName` varchar(100) DEFAULT NULL,
  `Value` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DelAccounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DelAccounts`;

CREATE TABLE `DelAccounts` (
  `OID` text,
  `Status` int(1) DEFAULT NULL,
  `Admin` varchar(25) DEFAULT NULL,
  `enabled` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table deletehistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deletehistory`;

CREATE TABLE `deletehistory` (
  `OID` varchar(10) DEFAULT NULL,
  `AUID` varchar(10) DEFAULT NULL,
  `DelDescription` varchar(20) DEFAULT NULL,
  `DelDate` varchar(40) DEFAULT NULL,
  `DelComments` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DeleteOrderLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DeleteOrderLog`;

CREATE TABLE `DeleteOrderLog` (
  `OID` varchar(30) DEFAULT NULL,
  `AdminUID` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `LastStatus` int(5) DEFAULT NULL,
  `ChangedStatus` int(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DeleteRecFax
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DeleteRecFax`;

CREATE TABLE `DeleteRecFax` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FileName` varchar(100) DEFAULT NULL,
  `SiteID` varchar(40) DEFAULT NULL,
  `CallID` int(3) DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table deviceallow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deviceallow`;

CREATE TABLE `deviceallow` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DeviceInventory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DeviceInventory`;

CREATE TABLE `DeviceInventory` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `DeviceMAC` varchar(40) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Location` text,
  `Date` datetime DEFAULT NULL,
  `AddedBy` varchar(25) DEFAULT NULL,
  `DIDP1` varchar(25) DEFAULT NULL,
  `DIDP2` varchar(25) DEFAULT NULL,
  `UniOID` varchar(25) DEFAULT NULL,
  `Comments` text,
  `MovedOID` varchar(20) DEFAULT '0',
  `Status` int(1) DEFAULT '0',
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did`;

CREATE TABLE `did` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(15) NOT NULL DEFAULT '',
  `mappedAddress` varchar(255) DEFAULT NULL,
  `vendorid` varchar(12) DEFAULT '16',
  `typeid` bigint(12) DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `info` varchar(40) DEFAULT NULL,
  `OrderID` varchar(10) DEFAULT NULL,
  `SetupCost` double DEFAULT '0',
  `MonthlyCost` double DEFAULT '0',
  `IsMonthlyTerminated` tinyint(1) DEFAULT '0',
  `PerMinuteOrignation` varchar(6) DEFAULT '0.0',
  `MappedToSIP` tinyint(1) DEFAULT '0',
  `MapedToIAX` tinyint(1) DEFAULT '0',
  `country` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `carrier` int(11) DEFAULT '0',
  `mappedRate` float(6,4) DEFAULT NULL,
  `minutes` float(6,4) DEFAULT NULL,
  `dialString` varchar(255) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT '0',
  `MappedToIVR` tinyint(1) DEFAULT '0',
  `callType` int(11) DEFAULT '1',
  `talkTimeBalance` int(11) DEFAULT '0',
  `AnnualCost` double DEFAULT '0',
  `isFree` tinyint(4) DEFAULT '0',
  `freeExpiry` datetime DEFAULT NULL,
  `FreeMinutes` int(11) DEFAULT '0',
  `PerMinuteAfterFreeMinutes` double(6,4) DEFAULT '0.0000',
  `Channels` int(11) DEFAULT '1',
  `AutoRemove` int(2) DEFAULT '0',
  `SignupFree` int(2) DEFAULT '0',
  `AutoRemoveDate` date DEFAULT NULL,
  `IVR` int(2) DEFAULT '0',
  `DIDStatus` int(2) DEFAULT '0',
  `Payment` double DEFAULT '0',
  `IsIVR` int(2) DEFAULT '0',
  `SuspenDate` date DEFAULT NULL,
  `Termdate` date DEFAULT NULL,
  `IsRecording` int(1) DEFAULT '0',
  `Vmail` int(2) DEFAULT '0',
  `DIDType` int(2) DEFAULT '1',
  `GroupID` varchar(50) DEFAULT NULL,
  `BillingDate` date DEFAULT NULL,
  `FreeConf` int(1) DEFAULT '1',
  `DIDxSetup` double DEFAULT '0',
  `DIDxMonthly` double DEFAULT '0',
  `DIDxPerM` double DEFAULT '0',
  `DIDinv` int(1) DEFAULT '0',
  `RateCenter` varchar(50) DEFAULT NULL,
  `ThisCountryCode` varchar(15) DEFAULT NULL,
  `ThisAreaCode` varchar(20) DEFAULT NULL,
  `TestStatus` int(1) DEFAULT '1',
  `StateName` varchar(50) DEFAULT NULL,
  `AutoRemOn` datetime DEFAULT NULL,
  `AutoRemIP` varchar(30) DEFAULT NULL,
  `SendSMS` int(1) DEFAULT '0',
  `OrigAnnual` double DEFAULT '0',
  `OrigMonthly` double DEFAULT '0',
  `ConvertedBilling` datetime DEFAULT NULL,
  `SMS` int(1) DEFAULT '0',
  `Voice` int(1) DEFAULT '1',
  `URL` text,
  `IsPrimary` int(1) DEFAULT '1',
  `SIPDIDS` int(1) DEFAULT NULL,
  `DateSuspended` datetime DEFAULT NULL,
  `FreeSMS` int(10) DEFAULT NULL,
  `PerSMSAfterFreeSMS` double DEFAULT NULL,
  `dialstringAlter` varchar(255) DEFAULT NULL,
  `carrierAlter` int(11) DEFAULT NULL,
  `mappedAddressAlter` varchar(255) DEFAULT NULL,
  `callTypeAlter` int(11) DEFAULT NULL,
  `mappedRateAlter` float(6,4) DEFAULT NULL,
  `minutesAlter` float(6,4) DEFAULT NULL,
  PRIMARY KEY (`id`,`did`),
  UNIQUE KEY `did` (`did`),
  UNIQUE KEY `id` (`id`),
  KEY `OID` (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did_availdummy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did_availdummy`;

CREATE TABLE `did_availdummy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` double DEFAULT NULL,
  `item_id` double DEFAULT NULL,
  `maximum` double DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `mode` double DEFAULT NULL,
  `annual_factor` double DEFAULT NULL,
  `annual_mode` double DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `SiteID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did_copy`;

CREATE TABLE `did_copy` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(15) NOT NULL DEFAULT '',
  `vendorid` varchar(12) DEFAULT NULL,
  `typeid` bigint(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `info` varchar(40) DEFAULT NULL,
  `OrderID` varchar(6) DEFAULT '0',
  `SetupCost` varchar(6) DEFAULT '99',
  `MonthlyCost` varchar(6) DEFAULT '5',
  `IsMonthlyTerminated` tinyint(1) DEFAULT '0',
  `PerMinuteOrignation` varchar(6) DEFAULT '0.0',
  `country` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `carrier` int(11) DEFAULT NULL,
  `mappedAddress` varchar(100) DEFAULT NULL,
  `mappedRate` float DEFAULT NULL,
  `dialstring` varchar(100) DEFAULT NULL,
  `talktime` int(11) DEFAULT NULL,
  `minutes` int(11) DEFAULT NULL,
  `callType` int(11) DEFAULT '1',
  PRIMARY KEY (`id`,`did`),
  UNIQUE KEY `did` (`did`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did_copy1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did_copy1`;

CREATE TABLE `did_copy1` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `did` char(15) NOT NULL DEFAULT '',
  `mappedAddress` char(255) DEFAULT NULL,
  `vendorid` char(12) DEFAULT NULL,
  `typeid` bigint(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `info` char(40) DEFAULT NULL,
  `OrderID` char(6) DEFAULT '0',
  `SetupCost` char(6) DEFAULT '99',
  `MonthlyCost` char(6) DEFAULT '5',
  `IsMonthlyTerminated` tinyint(1) DEFAULT '0',
  `PerMinuteOrignation` char(6) DEFAULT '0.0',
  `MappedToSIP` tinyint(1) DEFAULT '0',
  `MapedToIAX` tinyint(1) DEFAULT '0',
  `country` char(80) DEFAULT NULL,
  `city` char(80) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `carrier` int(11) DEFAULT NULL,
  `mappedRate` float DEFAULT NULL,
  `minutes` float DEFAULT NULL,
  `dialString` char(255) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT '0',
  `MappedToIVR` tinyint(1) DEFAULT '0',
  `callType` int(11) DEFAULT '1',
  `talkTimeBalance` int(11) DEFAULT NULL,
  `AnnualCost` float DEFAULT NULL,
  `isFree` tinyint(4) DEFAULT NULL,
  `freeExpiry` date DEFAULT NULL,
  PRIMARY KEY (`id`,`did`),
  UNIQUE KEY `did` (`did`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did_plan`;

CREATE TABLE `did_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` char(20) NOT NULL DEFAULT '',
  `plan_id` int(11) DEFAULT NULL,
  `minutes_baqi` int(11) DEFAULT '0',
  `expires_on` date DEFAULT NULL,
  `DID` char(25) DEFAULT NULL,
  `minutes_used` int(11) DEFAULT '0',
  `type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did_prefix
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did_prefix`;

CREATE TABLE `did_prefix` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `Prefix` bigint(10) DEFAULT NULL,
  `Vendor` varchar(20) DEFAULT NULL,
  `Quantity` int(2) DEFAULT NULL,
  `Status` int(2) DEFAULT '1',
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did_rate_scheme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did_rate_scheme`;

CREATE TABLE `did_rate_scheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) DEFAULT NULL,
  `item_id` smallint(6) DEFAULT NULL,
  `maximum` float(5,2) DEFAULT NULL,
  `factor` float(5,2) DEFAULT NULL,
  `mode` smallint(6) DEFAULT NULL,
  `annual_factor` float(5,2) DEFAULT NULL,
  `annual_mode` tinyint(3) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `SiteID` varchar(20) DEFAULT 'VPL',
  `Country` varchar(20) DEFAULT NULL,
  `VendorID` varchar(20) DEFAULT '0',
  `Status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did_rate_to_supply
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did_rate_to_supply`;

CREATE TABLE `did_rate_to_supply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) DEFAULT NULL,
  `item_id` smallint(6) DEFAULT NULL,
  `maximum` float(5,2) DEFAULT NULL,
  `factor` float(5,2) DEFAULT NULL,
  `mode` smallint(6) DEFAULT NULL,
  `annual_factor` float(5,2) DEFAULT NULL,
  `annual_mode` tinyint(3) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `SiteID` varchar(20) DEFAULT 'VPL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did_u_know
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did_u_know`;

CREATE TABLE `did_u_know` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contents` text,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table did1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `did1`;

CREATE TABLE `did1` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(15) NOT NULL DEFAULT '',
  `mappedAddress` varchar(255) DEFAULT NULL,
  `vendorid` varchar(12) DEFAULT NULL,
  `typeid` bigint(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `info` varchar(40) DEFAULT NULL,
  `OrderID` varchar(6) DEFAULT '0',
  `SetupCost` varchar(6) DEFAULT '99',
  `MonthlyCost` varchar(6) DEFAULT '5',
  `IsMonthlyTerminated` tinyint(1) DEFAULT '0',
  `PerMinuteOrignation` varchar(6) DEFAULT '0.0',
  `MappedToSIP` tinyint(1) DEFAULT '0',
  `MapedToIAX` tinyint(1) DEFAULT '0',
  `country` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `carrier` int(11) DEFAULT NULL,
  `mappedRate` float DEFAULT NULL,
  `minutes` float DEFAULT NULL,
  `dialString` varchar(255) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT '0',
  `MappedToIVR` tinyint(1) DEFAULT '0',
  `callType` int(11) DEFAULT '1',
  `talkTimeBalance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`did`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `did` (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDArea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDArea`;

CREATE TABLE `DIDArea` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` blob,
  `StateCode` varchar(15) DEFAULT NULL,
  `CountryID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table didcopy29
# ------------------------------------------------------------

DROP TABLE IF EXISTS `didcopy29`;

CREATE TABLE `didcopy29` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(15) NOT NULL DEFAULT '',
  `vendorid` varchar(12) DEFAULT NULL,
  `typeid` bigint(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `info` varchar(40) DEFAULT NULL,
  `OrderID` varchar(6) DEFAULT '0',
  `SetupCost` double(6,2) DEFAULT '0.00',
  `MonthlyCost` double(6,2) DEFAULT '0.00',
  `IsMonthlyTerminated` tinyint(1) DEFAULT '0',
  `PerMinuteOrignation` double(6,2) DEFAULT '0.00',
  `MappedToSIP` tinyint(1) DEFAULT '0',
  `MapedToIAX` tinyint(1) DEFAULT '0',
  `country` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT '0',
  `MappedToIVR` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`did`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDCountries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDCountries`;

CREATE TABLE `DIDCountries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `countrycode` bigint(7) DEFAULT NULL,
  `IsUSA` int(1) DEFAULT '0',
  `GotOne` char(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `countrycode` (`countrycode`),
  FULLTEXT KEY `countryname` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDCountries_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDCountries_copy`;

CREATE TABLE `DIDCountries_copy` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `countrycode` bigint(7) DEFAULT NULL,
  `IsUSA` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `countrycode` (`countrycode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDCountries_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDCountries_old`;

CREATE TABLE `DIDCountries_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` blob,
  `countrycode` bigint(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDIdentity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDIdentity`;

CREATE TABLE `DIDIdentity` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `DIDNumber` varchar(25) DEFAULT NULL,
  `PurchasedDate` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `NIC` varchar(255) DEFAULT NULL,
  `Address` text,
  `Contact` varchar(255) DEFAULT NULL,
  `OtherNumber` varchar(255) DEFAULT '000',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDIVR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDIVR`;

CREATE TABLE `DIDIVR` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `IVRID` int(5) DEFAULT NULL,
  `DID` varchar(25) DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `PriV` int(1) DEFAULT '0',
  `MenuID` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table dids_available
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dids_available`;

CREATE TABLE `dids_available` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` varchar(255) DEFAULT NULL,
  `DID` varchar(30) DEFAULT NULL,
  `sDID` varchar(30) DEFAULT NULL,
  `setup` float DEFAULT NULL,
  `monthly` float DEFAULT NULL,
  `annual` float DEFAULT NULL,
  `freeminutes` int(11) DEFAULT NULL,
  `perminuteafterfreeminutes` float DEFAULT NULL,
  `channels` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `countrycode` varchar(15) DEFAULT NULL,
  `areacode` varchar(15) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `did_count` bigint(10) DEFAULT NULL,
  `areas` varchar(50) DEFAULT NULL,
  `countrys` varchar(50) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `VOID` varchar(20) DEFAULT NULL,
  `AreaID` varchar(10) DEFAULT NULL,
  `NeedDoc` int(1) DEFAULT '0',
  `DocMsg` text,
  `DocType` int(1) DEFAULT '0',
  `GroupID` varchar(50) DEFAULT NULL,
  `DIDxSetup` double DEFAULT '0',
  `DIDxMonthly` double DEFAULT '0',
  `DIDxPerM` double DEFAULT '0',
  `RateCenter` varchar(30) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `SPID` varchar(25) DEFAULT NULL,
  `SPOFFER` int(1) DEFAULT '0',
  `SMS` int(1) DEFAULT '0',
  `Voice` int(1) DEFAULT '1',
  `Vanity` int(1) DEFAULT '0',
  `DIDPattern` varchar(30) DEFAULT NULL,
  `FreeSMS` int(10) DEFAULT NULL,
  `PerSMSAfterFreeSMS` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OID` (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table dids_available_arfeen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dids_available_arfeen`;

CREATE TABLE `dids_available_arfeen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` char(20) DEFAULT NULL,
  `DID` char(30) DEFAULT NULL,
  `sDID` char(30) DEFAULT NULL,
  `setup` float DEFAULT NULL,
  `monthly` float DEFAULT NULL,
  `annual` float DEFAULT NULL,
  `freeminutes` int(11) DEFAULT NULL,
  `perminuteafterfreeminutes` float DEFAULT NULL,
  `channels` int(11) DEFAULT NULL,
  `country` char(50) DEFAULT NULL,
  `area` char(50) DEFAULT NULL,
  `countrycode` int(11) DEFAULT NULL,
  `areacode` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `did_count` bigint(10) DEFAULT NULL,
  `areas` char(50) DEFAULT NULL,
  `countrys` char(50) DEFAULT NULL,
  `link` char(50) DEFAULT NULL,
  `VOID` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table dids_available_offer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dids_available_offer`;

CREATE TABLE `dids_available_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` varchar(255) DEFAULT NULL,
  `DID` varchar(30) DEFAULT NULL,
  `sDID` varchar(30) DEFAULT NULL,
  `setup` float DEFAULT NULL,
  `monthly` float DEFAULT NULL,
  `annual` float DEFAULT NULL,
  `freeminutes` int(11) DEFAULT NULL,
  `perminuteafterfreeminutes` float DEFAULT NULL,
  `channels` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `countrycode` varchar(15) DEFAULT NULL,
  `areacode` varchar(15) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `did_count` bigint(10) DEFAULT NULL,
  `areas` varchar(50) DEFAULT NULL,
  `countrys` varchar(50) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `VOID` varchar(20) DEFAULT NULL,
  `AreaID` varchar(10) DEFAULT NULL,
  `NeedDoc` int(1) DEFAULT '0',
  `DocMsg` text,
  `DocType` int(1) DEFAULT '0',
  `GroupID` varchar(50) DEFAULT NULL,
  `DIDxSetup` double DEFAULT '0',
  `DIDxMonthly` double DEFAULT '0',
  `DIDxPerM` double DEFAULT '0',
  `RateCenter` varchar(30) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `SPID` varchar(25) DEFAULT NULL,
  `SPOFFER` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table dids_available_old_110113
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dids_available_old_110113`;

CREATE TABLE `dids_available_old_110113` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` varchar(255) DEFAULT NULL,
  `DID` varchar(30) DEFAULT NULL,
  `sDID` varchar(30) DEFAULT NULL,
  `setup` float DEFAULT NULL,
  `monthly` float DEFAULT NULL,
  `annual` float DEFAULT NULL,
  `freeminutes` int(11) DEFAULT NULL,
  `perminuteafterfreeminutes` float DEFAULT NULL,
  `channels` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `countrycode` varchar(15) DEFAULT NULL,
  `areacode` varchar(15) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `did_count` bigint(10) DEFAULT NULL,
  `areas` varchar(50) DEFAULT NULL,
  `countrys` varchar(50) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `VOID` varchar(20) DEFAULT NULL,
  `AreaID` varchar(10) DEFAULT NULL,
  `NeedDoc` int(1) DEFAULT '0',
  `DocMsg` text,
  `DocType` int(1) DEFAULT '0',
  `GroupID` varchar(50) DEFAULT NULL,
  `DIDxSetup` double DEFAULT '0',
  `DIDxMonthly` double DEFAULT '0',
  `DIDxPerM` double DEFAULT '0',
  `RateCenter` varchar(30) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `SPID` varchar(25) DEFAULT NULL,
  `SPOFFER` int(1) DEFAULT '0',
  `SMS` int(1) DEFAULT '0',
  `Voice` int(1) DEFAULT '1',
  `Vanity` int(1) DEFAULT '0',
  `DIDPattern` varchar(30) DEFAULT NULL,
  `FreeSMS` int(10) DEFAULT NULL,
  `PerSMSAfterFreeSMS` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OID` (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table dids_reserved
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dids_reserved`;

CREATE TABLE `dids_reserved` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` int(11) DEFAULT NULL,
  `DID` varchar(30) DEFAULT NULL,
  `sDID` varchar(30) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `CountryCode` varchar(10) DEFAULT NULL,
  `AreaCode` varchar(10) DEFAULT NULL,
  `setup` float DEFAULT NULL,
  `monthly` float DEFAULT NULL,
  `annual` float DEFAULT NULL,
  `freeminutes` int(11) DEFAULT NULL,
  `perminuteafterfreeminutes` float DEFAULT NULL,
  `channels` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `billingtype` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `NIC` varchar(255) DEFAULT '00',
  `DocApplied` int(2) DEFAULT '0',
  `groupid` varchar(50) DEFAULT NULL,
  `DIDxMonthly` double DEFAULT '0',
  `DIDxSetup` double DEFAULT '0',
  `DIDxPerM` double DEFAULT '0',
  `RCenter` varchar(50) DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `Remarks` text,
  `SPID` varchar(25) DEFAULT NULL,
  `SMS` int(1) DEFAULT '0',
  `Voice` int(1) DEFAULT '1',
  `Vanity` int(1) DEFAULT '0',
  `FreeSMS` int(10) DEFAULT NULL,
  `PerSMSAfterFreeSMS` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDStatusHistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDStatusHistory`;

CREATE TABLE `DIDStatusHistory` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `DID` varchar(50) DEFAULT NULL,
  `Admin` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table didtemp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `didtemp`;

CREATE TABLE `didtemp` (
  `countrycode` bigint(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `areasavailable` bigint(15) DEFAULT NULL,
  `totalnumbersinstock` bigint(15) DEFAULT NULL,
  `totalnumbersavailable` bigint(15) DEFAULT NULL,
  `monthlyprice` int(11) DEFAULT NULL,
  `annualprice` int(11) DEFAULT NULL,
  `countryid` bigint(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDTestLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDTestLog`;

CREATE TABLE `DIDTestLog` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `DID` bigint(15) DEFAULT NULL,
  `TestDate` datetime DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `TestPerson` varchar(30) DEFAULT NULL,
  `datestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FailedOn` datetime DEFAULT NULL,
  `PassedOn` datetime DEFAULT NULL,
  `Location` varchar(10) DEFAULT 'WebUI',
  `Hours` varchar(25) DEFAULT NULL,
  `CX` varchar(30) DEFAULT NULL,
  `c1` varchar(30) DEFAULT NULL,
  `c2` varchar(30) DEFAULT NULL,
  `c3` varchar(30) DEFAULT NULL,
  `c4` varchar(30) DEFAULT NULL,
  `TesterAnswer` varchar(10) DEFAULT NULL,
  `Box` varchar(35) DEFAULT NULL,
  `MyOID` varchar(15) DEFAULT NULL,
  `CLITx` varchar(20) DEFAULT NULL,
  `CLIRx` varchar(20) DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DID` (`DID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDxCost
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDxCost`;

CREATE TABLE `DIDxCost` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `DID` varchar(20) DEFAULT NULL,
  `didxmonthly` double DEFAULT '0',
  `didxsetup` double DEFAULT '0',
  `didxperm` double DEFAULT '0',
  `SiteID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDxDIDS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDxDIDS`;

CREATE TABLE `DIDxDIDS` (
  `DIDNumber` varchar(30) NOT NULL DEFAULT '',
  `sDIDNumber` varchar(30) DEFAULT NULL,
  `SetupCost` double DEFAULT NULL,
  `MonthlyCharges` double DEFAULT NULL,
  `AnnualCharges` double DEFAULT NULL,
  `PerMinuteCharges` double DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `CountryCode` int(10) DEFAULT NULL,
  `AreaCode` int(10) DEFAULT NULL,
  `DateTime` varchar(20) DEFAULT NULL,
  `OID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DIDNumber`,`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DIDxDIDS_NEW
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DIDxDIDS_NEW`;

CREATE TABLE `DIDxDIDS_NEW` (
  `DIDNumber` varchar(30) DEFAULT NULL,
  `SetupCost` double DEFAULT NULL,
  `MonthlyCharges` double DEFAULT NULL,
  `AnnualCharges` double DEFAULT NULL,
  `PerMinuteCharges` double DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `CountryCode` int(10) DEFAULT NULL,
  `AreaCode` int(10) DEFAULT NULL,
  `DateTime` varchar(20) DEFAULT NULL,
  `OID` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DisApprovedOrder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DisApprovedOrder`;

CREATE TABLE `DisApprovedOrder` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(15) DEFAULT NULL,
  `Admin` varchar(50) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `Reason` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table DocsDesc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DocsDesc`;

CREATE TABLE `DocsDesc` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `Type` int(1) DEFAULT '0',
  `Doc` text,
  `ImgType` varchar(20) DEFAULT NULL,
  `ShortDesc` text,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table dsgcallrates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dsgcallrates`;

CREATE TABLE `dsgcallrates` (
  `CountryCode` varchar(10) DEFAULT NULL,
  `Description` varchar(80) DEFAULT NULL,
  `DRates` varchar(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table due_orderid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `due_orderid`;

CREATE TABLE `due_orderid` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table editorderhistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `editorderhistory`;

CREATE TABLE `editorderhistory` (
  `UID` char(50) DEFAULT NULL,
  `EOID` char(50) DEFAULT NULL,
  `EDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table email_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_settings`;

CREATE TABLE `email_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `from_field` varchar(255) DEFAULT NULL,
  `reply_to_field` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `cc_field` varchar(255) DEFAULT NULL,
  `subject_field` text,
  `contents_field` text,
  `status` varchar(10) DEFAULT '1',
  `date_added` date DEFAULT NULL,
  `SID` varchar(15) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT 'VPL',
  `functionused` varchar(255) DEFAULT NULL,
  `copytoWL` int(2) DEFAULT '1',
  `bcc_field` varchar(255) DEFAULT 'care@supertec.com',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table email_settings_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_settings_copy`;

CREATE TABLE `email_settings_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `from_field` varchar(255) DEFAULT NULL,
  `reply_to_field` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `cc_field` varchar(255) DEFAULT NULL,
  `subject_field` text,
  `contents_field` text,
  `status` varchar(10) DEFAULT '1',
  `date_added` date DEFAULT NULL,
  `SID` varchar(15) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT 'VPL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table email_settingshistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_settingshistory`;

CREATE TABLE `email_settingshistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `from_field` varchar(255) DEFAULT NULL,
  `reply_to_field` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `cc_field` varchar(255) DEFAULT NULL,
  `subject_field` text,
  `contents_field` text,
  `status` varchar(10) DEFAULT '1',
  `date_added` date DEFAULT NULL,
  `SID` varchar(15) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT 'VPL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table email_to_supply
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_to_supply`;

CREATE TABLE `email_to_supply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `from_field` varchar(255) DEFAULT NULL,
  `reply_to_field` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `cc_field` varchar(255) DEFAULT NULL,
  `subject_field` text,
  `contents_field` text,
  `status` varchar(10) DEFAULT '1',
  `date_added` date DEFAULT NULL,
  `SID` varchar(15) DEFAULT NULL,
  `SiteID` varchar(20) DEFAULT 'VPL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table emailbuffer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailbuffer`;

CREATE TABLE `emailbuffer` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Subject` blob,
  `Message` blob,
  `DateRequested` datetime DEFAULT NULL,
  `DateShooted` datetime DEFAULT NULL,
  `Status` int(2) DEFAULT '0',
  `UID` varchar(20) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `RingTo` varchar(30) DEFAULT NULL,
  `DID` varchar(20) DEFAULT NULL,
  `Country` varchar(25) DEFAULT NULL,
  `EverRingTo` int(1) DEFAULT '0',
  `SMS` int(1) DEFAULT '0',
  `Receiver` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table emailbuffercomm4us
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emailbuffercomm4us`;

CREATE TABLE `emailbuffercomm4us` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Subject` blob,
  `Message` blob,
  `DateRequested` datetime DEFAULT NULL,
  `DateShooted` datetime DEFAULT NULL,
  `Status` int(2) DEFAULT '0',
  `UID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table emaildummy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emaildummy`;

CREATE TABLE `emaildummy` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table EmailReportID
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EmailReportID`;

CREATE TABLE `EmailReportID` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ReportName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table EmailSent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EmailSent`;

CREATE TABLE `EmailSent` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `OID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ExchangeRate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ExchangeRate`;

CREATE TABLE `ExchangeRate` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `PriCur` int(2) DEFAULT NULL,
  `Rate1` double DEFAULT '1',
  `SecCur` int(2) DEFAULT NULL,
  `Rate2` double DEFAULT '1',
  `PriSymbol` varchar(5) DEFAULT NULL,
  `SecSymbol` varchar(5) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table expirydays
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expirydays`;

CREATE TABLE `expirydays` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `DID` varchar(30) DEFAULT NULL,
  `Days` int(3) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `IsFree` int(2) DEFAULT NULL,
  `isTalkTime` int(2) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table extensions_table
# ------------------------------------------------------------

DROP TABLE IF EXISTS `extensions_table`;

CREATE TABLE `extensions_table` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(20) NOT NULL DEFAULT '',
  `exten` varchar(20) NOT NULL DEFAULT '',
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `app` varchar(20) NOT NULL DEFAULT '',
  `appdata` varchar(90) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table facebookusers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `facebookusers`;

CREATE TABLE `facebookusers` (
  `fuid` varchar(35) NOT NULL,
  `uid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`fuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FAQ
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FAQ`;

CREATE TABLE `FAQ` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(255) DEFAULT NULL,
  `Question` text,
  `Answer` text,
  `Status` int(1) DEFAULT '1',
  `Priority` int(1) DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FaxFiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FaxFiles`;

CREATE TABLE `FaxFiles` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `KeyID` varchar(25) DEFAULT NULL,
  `FaxFile` longblob,
  `OID` varchar(25) DEFAULT NULL,
  `DID` varchar(50) DEFAULT NULL,
  `CallFrom` varchar(50) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MailSent` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table fb_application
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fb_application`;

CREATE TABLE `fb_application` (
  `fuid` varchar(35) NOT NULL,
  `SiteID` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`fuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table fbinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fbinfo`;

CREATE TABLE `fbinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fbuid` bigint(20) DEFAULT NULL,
  `oid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FeatureManager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FeatureManager`;

CREATE TABLE `FeatureManager` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(25) DEFAULT NULL,
  `BalAnn` int(1) DEFAULT '0',
  `BlockAllCLI` int(1) DEFAULT '0',
  `AcceptAllCLI` int(1) DEFAULT '1',
  `CLI` varchar(50) DEFAULT NULL,
  `BlockCertain` int(1) DEFAULT '0',
  `CLIOnOff` int(1) DEFAULT '0',
  `VmailSec` int(1) DEFAULT '30',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FollowMe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FollowMe`;

CREATE TABLE `FollowMe` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(100) DEFAULT NULL,
  `IsIAX` tinyint(1) DEFAULT '0',
  `IsSIP` tinyint(1) DEFAULT '0',
  `Priority` int(2) DEFAULT '0',
  `did` bigint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ForwardingLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ForwardingLog`;

CREATE TABLE `ForwardingLog` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `DID` varchar(50) DEFAULT NULL,
  `FType` varchar(10) DEFAULT NULL,
  `CallFrom` varchar(50) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `ForwardedTo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table free_did_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `free_did_settings`;

CREATE TABLE `free_did_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `didprefix` int(11) DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `setup` float DEFAULT NULL,
  `monthly` float DEFAULT NULL,
  `annual` float DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `SiteID` varchar(50) DEFAULT NULL,
  `expire` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FreeCount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FreeCount`;

CREATE TABLE `FreeCount` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(15) NOT NULL DEFAULT '',
  `GotFree_Already` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`,`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FreeDIDs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FreeDIDs`;

CREATE TABLE `FreeDIDs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(15) NOT NULL DEFAULT '',
  `date` date DEFAULT NULL,
  `oid` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FreeDIDsStatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FreeDIDsStatus`;

CREATE TABLE `FreeDIDsStatus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Prefix` varchar(10) NOT NULL DEFAULT '',
  `active` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table FriendsFBID
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FriendsFBID`;

CREATE TABLE `FriendsFBID` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `MyFBID` varchar(50) DEFAULT NULL,
  `FriendID` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `ProfilePath` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table gocdma
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gocdma`;

CREATE TABLE `gocdma` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `Codes` varchar(20) DEFAULT NULL,
  `AreaName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table GoldenRates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GoldenRates`;

CREATE TABLE `GoldenRates` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `RMID` int(5) DEFAULT '0',
  `VanityFrom` int(1) DEFAULT '0',
  `VanityTo` int(1) DEFAULT '0',
  `MFactor` int(1) DEFAULT '0',
  `MValue` double DEFAULT NULL,
  `SFactor` int(1) DEFAULT '0',
  `SValue` double DEFAULT '0',
  `SiteID` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table GoogleCheckout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GoogleCheckout`;

CREATE TABLE `GoogleCheckout` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `googlenumber` text,
  `amount` double DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gfname` varchar(50) DEFAULT NULL,
  `glname` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `IsCharged` int(1) DEFAULT '0',
  `ChargeBack` int(1) DEFAULT '0',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table googlecontacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `googlecontacts`;

CREATE TABLE `googlecontacts` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table header
# ------------------------------------------------------------

DROP TABLE IF EXISTS `header`;

CREATE TABLE `header` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `Header` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table header_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `header_menu`;

CREATE TABLE `header_menu` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `Menu` varchar(255) DEFAULT NULL,
  `Label` varchar(255) DEFAULT NULL,
  `LanguageID` int(2) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `Enable` int(2) DEFAULT '1',
  `SubMenu` varchar(25) DEFAULT NULL,
  `PageLink` varchar(255) DEFAULT NULL,
  `NewPage` int(1) DEFAULT '0',
  `Prio` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table helpvideos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `helpvideos`;

CREATE TABLE `helpvideos` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  `HelpID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table History
# ------------------------------------------------------------

DROP TABLE IF EXISTS `History`;

CREATE TABLE `History` (
  `id` int(2) DEFAULT '0',
  `activity` varchar(30) DEFAULT '0',
  `adminname` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `HistoryID` int(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`HistoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table HistoryActivity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `HistoryActivity`;

CREATE TABLE `HistoryActivity` (
  `id` int(2) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table historyCallRecording
# ------------------------------------------------------------

DROP TABLE IF EXISTS `historyCallRecording`;

CREATE TABLE `historyCallRecording` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(255) DEFAULT NULL,
  `Recording` char(2) DEFAULT '0',
  `RSetup` int(2) DEFAULT '0',
  `RMonthly` int(2) DEFAULT '0',
  `RMinutes` int(2) DEFAULT '0',
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ImagesDB
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ImagesDB`;

CREATE TABLE `ImagesDB` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `Pic` longblob,
  `Type` varchar(20) DEFAULT NULL,
  `Size` int(20) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  `Width` int(2) DEFAULT NULL,
  `Height` int(2) DEFAULT NULL,
  `LastUpdate` date DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `Thumbnail` longblob,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IndexBackup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IndexBackup`;

CREATE TABLE `IndexBackup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Indexfile` longblob,
  `folder` varchar(50) DEFAULT NULL,
  `bdate` datetime DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `SiteID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table internationalcall
# ------------------------------------------------------------

DROP TABLE IF EXISTS `internationalcall`;

CREATE TABLE `internationalcall` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `IsActive` int(1) NOT NULL DEFAULT '0',
  `IsAllowed` int(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table invoice_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice_payments`;

CREATE TABLE `invoice_payments` (
  `transaction_hash` char(64) NOT NULL DEFAULT '',
  `value` double DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_hash`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `price_in_usd` double DEFAULT NULL,
  `price_in_btc` double DEFAULT NULL,
  `product_url` text,
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table invoicetemp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoicetemp`;

CREATE TABLE `invoicetemp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` text,
  `OID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IP2Country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IP2Country`;

CREATE TABLE `IP2Country` (
  `IP_FROM` double NOT NULL DEFAULT '0',
  `IP_TO` double NOT NULL DEFAULT '0',
  `COUNTRY_CODE2` char(2) NOT NULL,
  `COUNTRY_CODE3` char(3) NOT NULL,
  `COUNTRY_NAME` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table iPayAutoPay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iPayAutoPay`;

CREATE TABLE `iPayAutoPay` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `OID` int(10) DEFAULT NULL,
  `TrackingNo` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `Status` int(10) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table iPayPayments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iPayPayments`;

CREATE TABLE `iPayPayments` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  `RefNo` varchar(50) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `iPayTransID` varchar(30) DEFAULT NULL,
  `AuthCode` varchar(20) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Err` text,
  `Sign` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OurTransID` varchar(30) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ipCheck
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ipCheck`;

CREATE TABLE `ipCheck` (
  `ip` varchar(25) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  `oid` decimal(10,0) DEFAULT NULL,
  `ConfCode` varchar(10) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IPKallAccounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IPKallAccounts`;

CREATE TABLE `IPKallAccounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(30) NOT NULL DEFAULT '',
  `SIPPhoneNumber` varchar(30) NOT NULL DEFAULT '',
  `SIPProxy` varchar(50) NOT NULL DEFAULT '',
  `EMail` varchar(50) NOT NULL DEFAULT '',
  `PIN` varchar(4) NOT NULL DEFAULT '',
  `IsActive` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IPSecureCode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IPSecureCode`;

CREATE TABLE `IPSecureCode` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `securecode` varchar(100) DEFAULT NULL,
  `IP` text,
  `status` int(11) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IPSignup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IPSignup`;

CREATE TABLE `IPSignup` (
  `ID` int(5) DEFAULT NULL,
  `SiteiD` varchar(100) DEFAULT NULL,
  `IP` varchar(30) DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ipstar_user_31March
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ipstar_user_31March`;

CREATE TABLE `ipstar_user_31March` (
  `id` bigint(5) NOT NULL AUTO_INCREMENT,
  `bdid` varchar(80) NOT NULL DEFAULT '',
  `emailadd` varchar(80) NOT NULL DEFAULT '',
  `routing` varchar(80) NOT NULL DEFAULT '',
  `fname` varchar(80) NOT NULL DEFAULT '',
  `lname` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table iptoc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iptoc`;

CREATE TABLE `iptoc` (
  `ip_from` int(10) unsigned zerofill NOT NULL,
  `ip_to` int(10) unsigned zerofill NOT NULL,
  `country_code2` char(2) NOT NULL,
  `country_code3` char(3) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`ip_from`,`ip_to`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ipv4toc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ipv4toc`;

CREATE TABLE `ipv4toc` (
  `l` int(10) unsigned NOT NULL DEFAULT '0',
  `h` int(10) unsigned NOT NULL DEFAULT '0',
  `c` varbinary(2) NOT NULL DEFAULT '--'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table ivr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ivr`;

CREATE TABLE `ivr` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) DEFAULT NULL,
  `serial` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lastupdate` date DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `0title` varchar(20) DEFAULT NULL,
  `0ringto` varchar(20) DEFAULT NULL,
  `0type` varchar(20) DEFAULT NULL,
  `1title` varchar(20) DEFAULT NULL,
  `1ringto` varchar(20) DEFAULT NULL,
  `1type` varchar(20) DEFAULT 'PSTN',
  `2title` varchar(20) DEFAULT NULL,
  `2ringto` varchar(20) DEFAULT NULL,
  `2type` varchar(20) DEFAULT 'PSTN',
  `3title` varchar(20) DEFAULT NULL,
  `3ringto` varchar(20) DEFAULT NULL,
  `3type` varchar(20) DEFAULT 'PSTN',
  `4title` varchar(20) DEFAULT NULL,
  `4ringto` varchar(20) DEFAULT NULL,
  `4type` varchar(20) DEFAULT 'PSTN',
  `5title` varchar(20) DEFAULT NULL,
  `5ringto` varchar(20) DEFAULT NULL,
  `5type` varchar(20) DEFAULT 'PSTN',
  `6title` varchar(20) DEFAULT NULL,
  `6ringto` varchar(20) DEFAULT NULL,
  `6type` varchar(20) DEFAULT 'PSTN',
  `7title` varchar(20) DEFAULT NULL,
  `7ringto` varchar(20) DEFAULT NULL,
  `7type` varchar(20) DEFAULT 'PSTN',
  `8title` varchar(20) DEFAULT NULL,
  `8ringto` varchar(20) DEFAULT NULL,
  `8type` varchar(20) DEFAULT 'PSTN',
  `9title` varchar(20) DEFAULT NULL,
  `9ringto` varchar(20) DEFAULT NULL,
  `9type` varchar(20) DEFAULT 'PSTN',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IVRAdds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IVRAdds`;

CREATE TABLE `IVRAdds` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `AddID` int(3) DEFAULT NULL,
  `DID` varchar(20) DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `Prio` int(3) DEFAULT '0',
  `RndRun` int(1) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IVRAddSettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IVRAddSettings`;

CREATE TABLE `IVRAddSettings` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `SettingName` varchar(255) DEFAULT NULL,
  `SettingValue` varchar(255) DEFAULT NULL,
  `Activate` int(2) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IVRMapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IVRMapping`;

CREATE TABLE `IVRMapping` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `IVRID` int(5) DEFAULT NULL,
  `DID` varchar(25) DEFAULT NULL,
  `DialDigit` int(1) DEFAULT '0',
  `PriIVR` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IVROrders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IVROrders`;

CREATE TABLE `IVROrders` (
  `Id` bigint(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Enable` int(2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IVRTable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IVRTable`;

CREATE TABLE `IVRTable` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT '0',
  `MainIVR` varchar(255) DEFAULT NULL,
  `Dial0` varchar(255) DEFAULT '0',
  `Dial1` varchar(255) DEFAULT '0',
  `Dial2` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '0',
  `Dial3` varchar(255) DEFAULT '0',
  `Dial4` varchar(255) DEFAULT '0',
  `Dial5` varchar(255) DEFAULT '0',
  `Dial6` varchar(255) DEFAULT '0',
  `Dial7` varchar(255) DEFAULT '0',
  `Dial8` varchar(255) DEFAULT '0',
  `Dial9` varchar(255) DEFAULT '0',
  `PriIVR` int(2) DEFAULT '0',
  `IsInput` int(2) DEFAULT '0',
  `IsAdd` int(2) DEFAULT '0',
  `DID` varchar(50) DEFAULT '0',
  `IVRName` varchar(255) DEFAULT NULL,
  `FileData` longblob,
  `Dated` datetime DEFAULT NULL,
  `Prio` int(1) DEFAULT '1',
  `DIDBase` int(1) DEFAULT '0',
  `IsGSM` int(1) DEFAULT '0',
  `FilePath` text,
  `LoopTimes` int(2) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `mainIVR` (`MainIVR`),
  KEY `OID` (`OID`),
  KEY `DID` (`DID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table IVRTableAdmin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IVRTableAdmin`;

CREATE TABLE `IVRTableAdmin` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(100) DEFAULT '0',
  `MainIVR` varchar(255) DEFAULT NULL,
  `Dial0` varchar(255) DEFAULT '0',
  `Dial1` varchar(255) DEFAULT '0',
  `Dial2` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '0',
  `Dial3` varchar(255) DEFAULT '0',
  `Dial4` varchar(255) DEFAULT '0',
  `Dial5` varchar(255) DEFAULT '0',
  `Dial6` varchar(255) DEFAULT '0',
  `Dial7` varchar(255) DEFAULT '0',
  `Dial8` varchar(255) DEFAULT '0',
  `Dial9` varchar(255) DEFAULT '0',
  `PriIVR` int(2) DEFAULT '0',
  `IsInput` int(2) DEFAULT '0',
  `IsAdd` int(2) DEFAULT '0',
  `DID` varchar(50) DEFAULT '0',
  `IVRName` varchar(255) DEFAULT NULL,
  `FileData` longblob,
  `Dated` datetime DEFAULT NULL,
  `Prio` int(1) DEFAULT '1',
  `DIDBase` int(1) DEFAULT '0',
  `IsGSM` int(1) DEFAULT '0',
  `FilePath` text,
  `SPDirectType` int(1) DEFAULT '0',
  `SPDIVRID` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL DEFAULT '0',
  `Language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table LCR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LCR`;

CREATE TABLE `LCR` (
  `areacode` varchar(20) NOT NULL DEFAULT '0',
  `carrierid` varchar(20) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `area` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table Ldids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Ldids`;

CREATE TABLE `Ldids` (
  `one` varchar(50) DEFAULT NULL,
  `two` varchar(50) DEFAULT NULL,
  `three` varchar(50) DEFAULT NULL,
  `four` varchar(50) DEFAULT NULL,
  `five` varchar(50) DEFAULT NULL,
  `six` varchar(50) DEFAULT NULL,
  `seven` varchar(50) DEFAULT NULL,
  `eight` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table linkpointlog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `linkpointlog`;

CREATE TABLE `linkpointlog` (
  `LinkPointID` varchar(100) NOT NULL DEFAULT '',
  `Date` datetime DEFAULT NULL,
  `UserID` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `CardRouteNumber` varchar(100) DEFAULT NULL,
  `ExpDate` date DEFAULT NULL,
  `Approval` text,
  `Amount` varchar(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table LogCrDr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LogCrDr`;

CREATE TABLE `LogCrDr` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) DEFAULT NULL,
  `IsCredit` int(1) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `Admin` varchar(25) DEFAULT NULL,
  `TrID` varchar(25) DEFAULT NULL,
  `Auth` varchar(255) DEFAULT NULL,
  `MyDesc` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table logviewhistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `logviewhistory`;

CREATE TABLE `logviewhistory` (
  `UID` varchar(50) DEFAULT NULL,
  `VOID` varchar(50) DEFAULT NULL,
  `VDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table machistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `machistory`;

CREATE TABLE `machistory` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `MAC` varchar(50) DEFAULT NULL,
  `ADMIN` varchar(20) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `DID` varchar(50) DEFAULT NULL,
  `DID2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table mactable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mactable`;

CREATE TABLE `mactable` (
  `ID` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderID` varchar(20) DEFAULT NULL,
  `DID` varchar(40) DEFAULT NULL,
  `MAC` varchar(40) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Codec` varchar(40) DEFAULT NULL,
  `DID2` varchar(40) DEFAULT NULL,
  `Port` varchar(20) DEFAULT NULL,
  `Device` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table mail_manager_counter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mail_manager_counter`;

CREATE TABLE `mail_manager_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` int(11) DEFAULT NULL,
  `sID` varchar(50) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table MasterCSV2506
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MasterCSV2506`;

CREATE TABLE `MasterCSV2506` (
  `accountcode` varchar(30) DEFAULT NULL,
  `src` varchar(64) DEFAULT NULL,
  `dst` varchar(64) DEFAULT NULL,
  `dcontext` varchar(32) DEFAULT NULL,
  `clid` varchar(32) NOT NULL DEFAULT '',
  `channel` varchar(32) NOT NULL DEFAULT '',
  `dstchannel` varchar(32) DEFAULT NULL,
  `lastapp` varchar(32) DEFAULT NULL,
  `lastdata` varchar(64) DEFAULT NULL,
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `callpickup` datetime DEFAULT NULL,
  `callhangup` datetime DEFAULT NULL,
  `duration` int(8) unsigned DEFAULT NULL,
  `billsec` int(8) unsigned DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `userfield` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`clid`,`channel`,`calldate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table MessageReceivedDiDx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MessageReceivedDiDx`;

CREATE TABLE `MessageReceivedDiDx` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) DEFAULT NULL,
  `to` varchar(20) DEFAULT NULL,
  `text` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table Messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Messages`;

CREATE TABLE `Messages` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `Message` blob,
  `Description` varchar(60) DEFAULT NULL,
  `SiteID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table MinutesInfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MinutesInfo`;

CREATE TABLE `MinutesInfo` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(15) DEFAULT NULL,
  `DID` varchar(50) DEFAULT NULL,
  `MinSpent` bigint(5) DEFAULT '0',
  `expiry` date DEFAULT NULL,
  `MinRemain` bigint(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table missed_calls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `missed_calls`;

CREATE TABLE `missed_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` varchar(6) DEFAULT NULL,
  `callerID` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `DID` varchar(15) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `FWDNumber` varchar(50) DEFAULT NULL,
  `KeyID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table MoneyBookerData
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MoneyBookerData`;

CREATE TABLE `MoneyBookerData` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `MBID` text,
  `amount` double DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gfname` varchar(50) DEFAULT NULL,
  `glname` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `IsCharged` int(1) DEFAULT '0',
  `TransactionID` varchar(30) DEFAULT NULL,
  `PType` int(11) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`),
  KEY `OID` (`OID`),
  KEY `Date` (`Date`),
  KEY `IsCharged` (`IsCharged`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table MonitorList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MonitorList`;

CREATE TABLE `MonitorList` (
  `ID` int(10) DEFAULT NULL,
  `CountryCode` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table MsgManager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MsgManager`;

CREATE TABLE `MsgManager` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(100) DEFAULT NULL,
  `MSG` text,
  `DescMsg` text,
  `Condition` varchar(255) DEFAULT NULL,
  `ButtonType` int(1) DEFAULT '0',
  `ButtonLink` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table NadraCNIC
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NadraCNIC`;

CREATE TABLE `NadraCNIC` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `CNIC` varchar(20) DEFAULT NULL,
  `FrontImage` longblob,
  `BackImage` longblob,
  `FullName` varchar(255) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Father_Husband` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `Address` text,
  `PAddress` text,
  `FamilyNumber` varchar(255) DEFAULT NULL,
  `CNICNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table networkavailability
# ------------------------------------------------------------

DROP TABLE IF EXISTS `networkavailability`;

CREATE TABLE `networkavailability` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `ForwardTo` varchar(20) NOT NULL DEFAULT '',
  `IsAllowed` int(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table newemail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newemail`;

CREATE TABLE `newemail` (
  `NewEmail` varchar(150) NOT NULL DEFAULT '',
  `Code` varchar(100) NOT NULL DEFAULT '',
  `Uid` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table newrawcalllogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newrawcalllogs`;

CREATE TABLE `newrawcalllogs` (
  `TransactionID` char(32) NOT NULL DEFAULT '',
  `AccountNo` char(10) NOT NULL DEFAULT '',
  `FromNumber` char(64) DEFAULT NULL,
  `ToNumber` char(64) DEFAULT NULL,
  `StartTime` char(19) NOT NULL DEFAULT '',
  `EndTime` char(19) NOT NULL DEFAULT '',
  `CallType` char(1) NOT NULL DEFAULT '',
  `TransferByNumber` char(64) DEFAULT NULL,
  `ForwardToNumber` char(64) DEFAULT NULL,
  `ChargeType` char(1) NOT NULL DEFAULT '',
  `ChargeAmount` double NOT NULL DEFAULT '0',
  `Duration` char(3) NOT NULL DEFAULT '',
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VCost` double NOT NULL DEFAULT '0',
  `Rate` char(12) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Profit` double DEFAULT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table NewsStreamUser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NewsStreamUser`;

CREATE TABLE `NewsStreamUser` (
  `IP` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `duration` int(5) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Prefix` varchar(20) DEFAULT NULL,
  `SiteID` varchar(20) DEFAULT NULL,
  `dd` int(2) DEFAULT NULL,
  `mm` int(2) DEFAULT NULL,
  `yy` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table NICINFO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NICINFO`;

CREATE TABLE `NICINFO` (
  `NICNumber` varchar(255) DEFAULT NULL,
  `FrontImage` varchar(255) DEFAULT NULL,
  `Sign` varchar(255) DEFAULT NULL,
  `BackImage` varchar(255) DEFAULT NULL,
  `Thumb` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `F_H_Name` varchar(255) DEFAULT NULL,
  `IDMark` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `BGFront` varchar(255) DEFAULT NULL,
  `FamilyNumber` varchar(50) DEFAULT NULL,
  `CurrentAdd` varchar(255) DEFAULT NULL,
  `ConfirmAdd` varchar(255) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `BGBack` varchar(255) DEFAULT NULL,
  `Image` longblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table NumberRinging
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NumberRinging`;

CREATE TABLE `NumberRinging` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(25) DEFAULT NULL,
  `VDID` varchar(50) DEFAULT NULL,
  `PDID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table oauth_authorization_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_authorization_codes`;

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `grant_types` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table oauth_jwt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_jwt`;

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_key` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table oauth_scopes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_scopes`;

CREATE TABLE `oauth_scopes` (
  `scope` text COLLATE utf8_unicode_ci,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table oauth_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_users`;

CREATE TABLE `oauth_users` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table OldBalance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OldBalance`;

CREATE TABLE `OldBalance` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `Status` int(2) DEFAULT '0',
  `Date` datetime DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table OpenIDLogin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OpenIDLogin`;

CREATE TABLE `OpenIDLogin` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `OPENID` varchar(50) NOT NULL,
  `OPENIDTYPE` int(1) DEFAULT '0',
  `SiteID` varchar(50) DEFAULT NULL,
  `CompleteURI` text,
  `FBFreeDID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `OpenID` (`OPENID`),
  KEY `OpenIDType` (`OPENIDTYPE`),
  KEY `SiteID` (`SiteID`),
  KEY `OID` (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table OpenIDURI
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OpenIDURI`;

CREATE TABLE `OpenIDURI` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `GoogleEmail` varchar(100) DEFAULT NULL,
  `GURI` text,
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table order_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_plan`;

CREATE TABLE `order_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) NOT NULL DEFAULT '',
  `plan_id` int(11) DEFAULT NULL,
  `minutes_used` int(11) DEFAULT '0',
  `expires_on` date DEFAULT NULL,
  `DID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table orderadmin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderadmin`;

CREATE TABLE `orderadmin` (
  `OAID` varchar(10) NOT NULL DEFAULT '',
  `OrderID` varchar(10) NOT NULL DEFAULT '',
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `Comments` varchar(60) DEFAULT NULL,
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mailboxuser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OAID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table OrderAlerts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderAlerts`;

CREATE TABLE `OrderAlerts` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(25) DEFAULT NULL,
  `MissCall` int(1) DEFAULT '1',
  `Talktime` int(1) DEFAULT '1',
  `LowTalkTime` int(1) DEFAULT '1',
  `Amount` double DEFAULT '0',
  `SMSEMAIL` varchar(100) DEFAULT NULL,
  `Billing` int(1) DEFAULT '0',
  `CallRecording` int(1) DEFAULT '0',
  `SMSEnable` int(1) DEFAULT '1',
  `SMSAlert` int(1) DEFAULT '0',
  `FakeTone` int(1) DEFAULT '1',
  `SecureURL` int(1) DEFAULT '2',
  `ProfileUser` varchar(10) DEFAULT 'Sample',
  `DefRingTo` varchar(255) DEFAULT '18005558355@tf.voipmich.com',
  `DefRingType` int(5) DEFAULT '1',
  `RecFormat` int(1) DEFAULT '0',
  `AutoTalkTime` int(1) DEFAULT '1',
  `AutoFunds` int(1) DEFAULT '1',
  `NewsLetter` int(1) DEFAULT '1',
  `DIDSuspend` int(20) DEFAULT '0' COMMENT 'In how many days user DID suspend',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table orderdocs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderdocs`;

CREATE TABLE `orderdocs` (
  `ODID` varchar(40) NOT NULL DEFAULT '',
  `OrderID` varchar(10) NOT NULL DEFAULT '',
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `Type` varchar(5) NOT NULL DEFAULT '',
  `Path` text,
  `Comments` text,
  `Date` datetime DEFAULT NULL,
  `myfilename` tinytext,
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ODID`),
  UNIQUE KEY `ODID` (`ODID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table OrderDue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderDue`;

CREATE TABLE `OrderDue` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `Days` int(2) DEFAULT NULL,
  `DateSince` date DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `SuspendSince` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table orderinstaller
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderinstaller`;

CREATE TABLE `orderinstaller` (
  `OInstID` varchar(10) NOT NULL DEFAULT '',
  `OrderID` varchar(10) NOT NULL DEFAULT '',
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `ISPNo` varchar(20) DEFAULT NULL,
  `ISPUID` varchar(20) DEFAULT NULL,
  `ISPPass` varchar(20) DEFAULT NULL,
  `IsInstalled` tinyint(1) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`OInstID`),
  UNIQUE KEY `OInstID` (`OInstID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table orderreseller
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderreseller`;

CREATE TABLE `orderreseller` (
  `OID` varchar(20) NOT NULL DEFAULT '',
  `AUID` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`OID`),
  UNIQUE KEY `OID` (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `UID` varchar(10) NOT NULL DEFAULT '',
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `ShipmentID` varchar(10) NOT NULL DEFAULT '',
  `ProductType` varchar(4) NOT NULL DEFAULT '',
  `PlanType` varchar(50) NOT NULL DEFAULT '',
  `PaymentType` varchar(4) NOT NULL DEFAULT '',
  `Price` int(5) NOT NULL DEFAULT '0',
  `ShipmentCharges` int(3) DEFAULT NULL,
  `SecurityDeposit` int(3) DEFAULT NULL,
  `SetupCost` int(3) DEFAULT NULL,
  `OtherCost` int(3) DEFAULT NULL,
  `OrderStatus` varchar(4) DEFAULT NULL,
  `Referral` varchar(20) DEFAULT NULL,
  `PromoCode` varchar(20) DEFAULT NULL,
  `Choice1` varchar(30) NOT NULL DEFAULT '',
  `Choice2` varchar(30) DEFAULT '0-1-2-3-4-6-7-8',
  `OrderDate` date NOT NULL DEFAULT '0000-00-00',
  `IsReseller` tinyint(1) NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `IsReturned` tinyint(1) NOT NULL DEFAULT '0',
  `DateReturned` datetime DEFAULT NULL,
  `CustomerRating` int(2) DEFAULT '1',
  `WaitingToBeDeleted` int(2) DEFAULT '0',
  `WaitDateStart` date DEFAULT '0000-00-00',
  `isVerified` tinyint(4) DEFAULT '0',
  `isCCAllowed` tinyint(4) DEFAULT '1',
  `isRingToIPAllowed` tinyint(1) DEFAULT '0',
  `GotFreeVPL` int(2) DEFAULT '0',
  `refercreditreceived` char(2) DEFAULT '0',
  `Is2co` tinyint(4) DEFAULT '0',
  `TalktimeBal` int(4) DEFAULT '0',
  `UnConfirmedAddress` int(4) DEFAULT '0',
  `ispaypal` char(2) DEFAULT '1',
  `paypalemailcheck` int(2) DEFAULT '0',
  `paypalfname` int(2) DEFAULT '0',
  `paypalzipcode` int(2) DEFAULT '0',
  `paypallname` int(2) DEFAULT '0',
  `paypalphone` int(2) DEFAULT '0',
  `SPDirect` int(1) DEFAULT '0',
  `Recording` int(1) DEFAULT '1',
  `TRecordMin` int(3) DEFAULT '0',
  `Vmail` int(1) DEFAULT '0',
  `OnlineStatus` int(2) DEFAULT '0',
  `SPDFree` int(1) DEFAULT '0',
  `isMasterTalkTime` int(2) DEFAULT '0',
  `GCheckOut` int(1) DEFAULT '0',
  `MoneyB` int(1) DEFAULT '0',
  `BackOrder` int(2) DEFAULT '1',
  `BillMethod` varchar(2) DEFAULT '0',
  `MyPic` longblob,
  `MyPicType` varchar(20) DEFAULT NULL,
  `httpurl` int(1) DEFAULT '0',
  `ccoption` int(1) DEFAULT '1',
  `ZoneCall` varchar(25) DEFAULT '1-2-3-4-5',
  `Fax` int(1) DEFAULT '1',
  `Widget` int(1) DEFAULT '1',
  `OpenID` varchar(50) DEFAULT NULL,
  `InternalComp` int(1) DEFAULT '0',
  `AllowedRec` int(4) DEFAULT '0',
  `SMSAllow` int(1) DEFAULT '1',
  `SMSConf` varchar(50) DEFAULT NULL,
  `URL` text,
  `MList` int(1) DEFAULT '1',
  `DefRingTo` varchar(50) DEFAULT NULL,
  `SipUser` varchar(40) DEFAULT NULL,
  `ExpCard` varchar(40) DEFAULT NULL,
  `PCardID` varchar(40) DEFAULT NULL,
  `DialingPIN` varchar(40) DEFAULT NULL,
  `NewTmpl` int(1) DEFAULT '0',
  `FBID` double DEFAULT NULL,
  `sendSMS` int(1) DEFAULT '1',
  `AffCode` varchar(30) DEFAULT NULL,
  `RouteviaDIDX` int(1) DEFAULT '0',
  `ResellerID` varchar(100) DEFAULT NULL,
  `InSMSOn` int(10) DEFAULT '1',
  `ForceDocument` int(1) DEFAULT NULL,
  `taqaza` int(3) DEFAULT '1',
  PRIMARY KEY (`OID`),
  UNIQUE KEY `OrderID` (`OID`),
  UNIQUE KEY `OrderID_2` (`OID`),
  KEY `CustomerID` (`CustomerID`),
  FULLTEXT KEY `SMSConf` (`SMSConf`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ordersedithistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ordersedithistory`;

CREATE TABLE `ordersedithistory` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `UID` varchar(10) NOT NULL DEFAULT '',
  `CustomerID` varchar(10) NOT NULL DEFAULT '',
  `ShipmentID` varchar(10) NOT NULL DEFAULT '',
  `ProductType` varchar(4) NOT NULL DEFAULT '',
  `PlanType` varchar(4) NOT NULL DEFAULT '',
  `PaymentType` varchar(4) NOT NULL DEFAULT '',
  `Price` int(5) NOT NULL DEFAULT '0',
  `ShipmentCharges` int(3) DEFAULT NULL,
  `SecurityDeposit` int(3) DEFAULT NULL,
  `SetupCost` int(3) DEFAULT NULL,
  `OtherCost` int(3) DEFAULT NULL,
  `OrderStatus` varchar(4) DEFAULT NULL,
  `Referral` varchar(20) DEFAULT NULL,
  `PromoCode` varchar(20) DEFAULT NULL,
  `Choice1` varchar(30) NOT NULL DEFAULT '',
  `Choice2` varchar(30) DEFAULT NULL,
  `OrderDate` date NOT NULL DEFAULT '0000-00-00',
  `IsReseller` tinyint(1) NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `IsReturned` tinyint(1) NOT NULL DEFAULT '0',
  `DateReturned` datetime DEFAULT NULL,
  `AUser` varchar(50) DEFAULT NULL,
  `EDate` datetime DEFAULT NULL,
  UNIQUE KEY `OrderID` (`OID`),
  UNIQUE KEY `OrderID_2` (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table orderstatusdescription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderstatusdescription`;

CREATE TABLE `orderstatusdescription` (
  `IsDeleted` int(11) NOT NULL DEFAULT '0',
  `Description` blob,
  PRIMARY KEY (`IsDeleted`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ordertracking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ordertracking`;

CREATE TABLE `ordertracking` (
  `OTID` varchar(10) NOT NULL DEFAULT '',
  `OID` varchar(10) NOT NULL DEFAULT '',
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `OrderStatus` varchar(4) NOT NULL DEFAULT '',
  `DateTime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table PageNavigation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageNavigation`;

CREATE TABLE `PageNavigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` int(11) NOT NULL DEFAULT '0',
  `last_page` varchar(50) DEFAULT NULL,
  `next_page` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table paypal_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_settings`;

CREATE TABLE `paypal_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_url` text,
  `paypal_id` varchar(255) DEFAULT NULL,
  `return_url` text,
  `cancel_return_url` text,
  `verify_url` text,
  `is_debug` tinyint(4) DEFAULT '0',
  `SiteID` varchar(50) DEFAULT NULL,
  `Allow` int(2) DEFAULT '1',
  `UnConfirmedAddress` int(2) DEFAULT '0',
  `api_user` varchar(255) DEFAULT NULL,
  `api_pass` varchar(255) DEFAULT NULL,
  `paypalemailcheck` int(2) DEFAULT '0',
  `paypalfname` int(2) DEFAULT '0',
  `paypalzipcode` int(2) DEFAULT '0',
  `paypallname` int(2) DEFAULT '0',
  `paypalphone` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table paypal_settings_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_settings_logs`;

CREATE TABLE `paypal_settings_logs` (
  `UID` varchar(255) DEFAULT NULL,
  `OID` varchar(255) DEFAULT NULL,
  `Modifydate` datetime DEFAULT NULL,
  `ispaypal` varchar(25) DEFAULT NULL,
  `UnConfirmedAddress` varchar(25) DEFAULT NULL,
  `paypalemailcheck` varchar(25) DEFAULT NULL,
  `paypalfname` varchar(25) DEFAULT NULL,
  `paypalzipcode` varchar(25) DEFAULT NULL,
  `paypallname` varchar(25) DEFAULT NULL,
  `paypalphone` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table paypal_txn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_txn`;

CREATE TABLE `paypal_txn` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `UID` varchar(50) DEFAULT NULL,
  `txn_type` varchar(30) DEFAULT NULL,
  `payment_date` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `payment_gross` varchar(15) DEFAULT NULL,
  `mc_currency` varchar(10) DEFAULT NULL,
  `business` varchar(60) DEFAULT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `verify_sign` text,
  `payer_status` varchar(30) DEFAULT NULL,
  `tax` varchar(15) DEFAULT NULL,
  `payer_email` varchar(50) DEFAULT NULL,
  `txn_id` varchar(30) DEFAULT NULL,
  `receiver_email` varchar(50) DEFAULT NULL,
  `payer_id` varchar(30) DEFAULT NULL,
  `receiver_id` varchar(30) DEFAULT NULL,
  `memo` text,
  `item_number` varchar(15) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_fee` varchar(10) DEFAULT NULL,
  `mc_fee` varchar(10) DEFAULT NULL,
  `mc_gross` varchar(10) DEFAULT NULL,
  `custom` text,
  `notify_version` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table paypal_user_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypal_user_messages`;

CREATE TABLE `paypal_user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_message` text,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table paypalapi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paypalapi`;

CREATE TABLE `paypalapi` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `TransID` varchar(25) DEFAULT NULL,
  `Datetime` datetime DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table PayPhoneLogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PayPhoneLogs`;

CREATE TABLE `PayPhoneLogs` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `callerid` varchar(20) DEFAULT NULL,
  `did` varchar(25) DEFAULT NULL,
  `company` varchar(20) DEFAULT NULL,
  `callerid2` varchar(20) DEFAULT NULL,
  `channelid` varchar(20) DEFAULT NULL,
  `sipcallid` varchar(50) DEFAULT NULL,
  `cmd` varchar(10) DEFAULT NULL,
  `channelid2` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `date2` datetime DEFAULT NULL,
  `duration` int(3) DEFAULT NULL,
  `duration2` int(3) DEFAULT NULL,
  `disposition` varchar(15) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table pbmonthlyhistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pbmonthlyhistory`;

CREATE TABLE `pbmonthlyhistory` (
  `LPID` varchar(20) NOT NULL DEFAULT '',
  `OID` varchar(10) NOT NULL DEFAULT '',
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `Type` varchar(4) NOT NULL DEFAULT '',
  `TransType` varchar(4) NOT NULL DEFAULT '',
  `StatusCode` varchar(4) NOT NULL DEFAULT '',
  `StatusMessage` text NOT NULL,
  `StatusApproval` text NOT NULL,
  `AVSCode` text NOT NULL,
  PRIMARY KEY (`LPID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table pending_invoice_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pending_invoice_payments`;

CREATE TABLE `pending_invoice_payments` (
  `transaction_hash` char(64) NOT NULL DEFAULT '',
  `value` double DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_hash`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table percent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `percent`;

CREATE TABLE `percent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `per_num` int(11) NOT NULL,
  `signup` tinyint(1) NOT NULL,
  `verify_email` tinyint(1) NOT NULL,
  `credit_card` tinyint(1) NOT NULL,
  `buy_did` tinyint(1) NOT NULL,
  `call_forword` tinyint(1) NOT NULL,
  PRIMARY KEY (`UID`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table periodicbilling
# ------------------------------------------------------------

DROP TABLE IF EXISTS `periodicbilling`;

CREATE TABLE `periodicbilling` (
  `OID` varchar(6) NOT NULL DEFAULT '',
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `PType` varchar(7) NOT NULL DEFAULT '',
  `Amount` double(11,2) NOT NULL DEFAULT '0.00',
  `StartFrom` date NOT NULL DEFAULT '0000-00-00',
  `EndAfter` int(11) NOT NULL DEFAULT '0',
  `CycleDate` int(11) NOT NULL DEFAULT '0',
  `FailureCount` int(11) NOT NULL DEFAULT '1',
  `did` bigint(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table periodicbilling_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `periodicbilling_copy`;

CREATE TABLE `periodicbilling_copy` (
  `OID` char(6) NOT NULL DEFAULT '',
  `AUID` char(10) NOT NULL DEFAULT '',
  `PType` char(7) NOT NULL DEFAULT '',
  `Amount` double(11,2) NOT NULL DEFAULT '0.00',
  `StartFrom` date NOT NULL DEFAULT '0000-00-00',
  `EndAfter` int(11) NOT NULL DEFAULT '0',
  `CycleDate` int(11) NOT NULL DEFAULT '0',
  `FailureCount` int(11) NOT NULL DEFAULT '1',
  `did` bigint(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table periodiclog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `periodiclog`;

CREATE TABLE `periodiclog` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `Description` text NOT NULL,
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table PhoneIVR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PhoneIVR`;

CREATE TABLE `PhoneIVR` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `KeyID` varchar(30) DEFAULT NULL,
  `DID` varchar(25) DEFAULT NULL,
  `IVRID` int(3) DEFAULT '0',
  `OID` varchar(20) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table PINNumbers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PINNumbers`;

CREATE TABLE `PINNumbers` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(100) DEFAULT NULL,
  `PIN` varchar(50) DEFAULT NULL,
  `KeyVal` varchar(25) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Expiry` date DEFAULT NULL,
  `Status` int(1) DEFAULT '0',
  `TrID` varchar(25) DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `DateUsed` datetime DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plans`;

CREATE TABLE `plans` (
  `PlanID` bigint(2) unsigned NOT NULL AUTO_INCREMENT,
  `PlanName` varchar(60) NOT NULL DEFAULT '',
  `planDescription` blob NOT NULL,
  `IsPhoneopia` tinyint(1) DEFAULT NULL,
  `MonthlyRates` double(10,2) DEFAULT NULL,
  `Minutes` bigint(10) DEFAULT '0',
  `Country` bigint(10) DEFAULT '0',
  `ShowUser` int(2) DEFAULT '0',
  `Setup` double(10,2) DEFAULT '0.00',
  `SiteID` varchar(255) DEFAULT NULL,
  `DefaultP` int(2) DEFAULT '0',
  `PriceTrans` int(2) DEFAULT '0',
  `DIDxVendor` varchar(20) DEFAULT '0',
  `DIDxPrefix` varchar(20) DEFAULT '0',
  `AndOr` int(1) DEFAULT '0',
  `SPDirect` int(1) DEFAULT '0',
  `isfree` int(2) DEFAULT '0',
  `DIDInvoice` int(2) DEFAULT '1',
  `planoutside` int(1) DEFAULT '0',
  `plankey` varchar(255) DEFAULT NULL,
  `AlongDID` varchar(10) DEFAULT NULL,
  `AlongVendor` varchar(10) DEFAULT NULL,
  `AllDIDInvoice` int(1) DEFAULT '0',
  `HVOIP` int(1) DEFAULT '0',
  `AnnualRates` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`PlanID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table plans_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plans_detail`;

CREATE TABLE `plans_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan` int(11) DEFAULT '3',
  `countrycode` int(11) DEFAULT NULL,
  `minutes` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table pp_invoice_id
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pp_invoice_id`;

CREATE TABLE `pp_invoice_id` (
  `invoice_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table preference
# ------------------------------------------------------------

DROP TABLE IF EXISTS `preference`;

CREATE TABLE `preference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) DEFAULT NULL,
  `salut` varchar(10) DEFAULT NULL,
  `street1` varchar(200) DEFAULT NULL,
  `street2` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table priority
# ------------------------------------------------------------

DROP TABLE IF EXISTS `priority`;

CREATE TABLE `priority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` varchar(255) DEFAULT NULL,
  `areacode` int(10) NOT NULL DEFAULT '0',
  `priority` int(2) NOT NULL DEFAULT '0',
  `carrierid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table Promotions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Promotions`;

CREATE TABLE `Promotions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `PromoCode` varchar(20) DEFAULT NULL,
  `Amount` double DEFAULT '0',
  `Date` datetime DEFAULT NULL,
  `Validity` datetime DEFAULT NULL,
  `Desc` text,
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table PublicProfile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PublicProfile`;

CREATE TABLE `PublicProfile` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `enable` int(1) DEFAULT '1',
  `myloc` int(1) DEFAULT '1',
  `mynum` int(1) DEFAULT '1',
  `dialler` int(1) DEFAULT '1',
  `pic` int(1) DEFAULT '1',
  `Views` int(5) DEFAULT '0',
  `voicemail` int(1) DEFAULT '0',
  `ProfileUser` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table PublicProfile_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PublicProfile_copy`;

CREATE TABLE `PublicProfile_copy` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `enable` int(1) DEFAULT '1',
  `myloc` int(1) DEFAULT '1',
  `mynum` int(1) DEFAULT '1',
  `dialler` int(1) DEFAULT '1',
  `pic` int(1) DEFAULT '1',
  `Views` int(5) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table RateManager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RateManager`;

CREATE TABLE `RateManager` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Prefix` varchar(20) DEFAULT NULL,
  `VendorID` varchar(20) DEFAULT NULL,
  `RateFrom` double DEFAULT NULL,
  `RateTo` double DEFAULT NULL,
  `Factor` int(2) DEFAULT NULL,
  `annual` double DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  `CValue` double DEFAULT NULL,
  `Item` int(2) DEFAULT NULL,
  `AnnCValue` double DEFAULT '12',
  `AnnFactor` double DEFAULT '2',
  `OnlyUSA` int(3) DEFAULT '0',
  `CountDesc` text,
  `Enable` int(1) DEFAULT '1',
  `AreaID` int(5) DEFAULT NULL,
  `AreaName` varchar(50) DEFAULT NULL,
  `CCode` varchar(10) DEFAULT NULL,
  `ACode` varchar(10) DEFAULT NULL,
  `RSetupFrom` double DEFAULT '0',
  `RSetupTo` double DEFAULT '0',
  `RPerMinFrom` double DEFAULT '0',
  `RPerMinTo` double DEFAULT '0',
  `SFactor` int(1) DEFAULT NULL,
  `SCValue` double DEFAULT '0',
  `PFactor` int(1) DEFAULT NULL,
  `PCValue` double DEFAULT '0',
  `Vanity` int(1) DEFAULT '0',
  `VFactor` double DEFAULT '0',
  `VFactoryValue` double DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `Prefix` (`Prefix`),
  KEY `SiteID` (`SiteID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table RateManager2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RateManager2`;

CREATE TABLE `RateManager2` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Prefix` varchar(20) DEFAULT NULL,
  `VendorID` varchar(20) DEFAULT NULL,
  `RateFrom` double DEFAULT NULL,
  `RateTo` double DEFAULT NULL,
  `Factor` int(2) DEFAULT NULL,
  `annual` double DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  `CValue` double DEFAULT NULL,
  `Item` int(2) DEFAULT NULL,
  `AnnCValue` double DEFAULT '12',
  `AnnFactor` double DEFAULT '2',
  `OnlyUSA` int(3) DEFAULT '0',
  `CountDesc` text,
  `Enable` int(1) DEFAULT '1',
  `AreaID` int(5) DEFAULT NULL,
  `AreaName` varchar(50) DEFAULT NULL,
  `CCode` varchar(10) DEFAULT NULL,
  `ACode` varchar(10) DEFAULT NULL,
  `RSetupFrom` double DEFAULT '0',
  `RSetupTo` double DEFAULT '0',
  `RPerMinFrom` double DEFAULT '0',
  `RPerMinTo` double DEFAULT '0',
  `SFactor` int(1) DEFAULT NULL,
  `SCValue` double DEFAULT '0',
  `PFactor` int(1) DEFAULT NULL,
  `PCValue` double DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rates`;

CREATE TABLE `rates` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `carrierid` bigint(20) NOT NULL DEFAULT '0',
  `area` varchar(255) NOT NULL DEFAULT '',
  `areacode` int(10) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table raw_garbage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raw_garbage`;

CREATE TABLE `raw_garbage` (
  `text` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table rawcalllogsforoldmissiog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rawcalllogsforoldmissiog`;

CREATE TABLE `rawcalllogsforoldmissiog` (
  `TransactionID` char(32) NOT NULL DEFAULT '',
  `AccountNo` char(10) NOT NULL DEFAULT '',
  `FromNumber` char(64) DEFAULT NULL,
  `ToNumber` char(64) DEFAULT NULL,
  `StartTime` char(19) NOT NULL DEFAULT '',
  `EndTime` char(19) NOT NULL DEFAULT '',
  `CallType` char(1) NOT NULL DEFAULT '',
  `TransferByNumber` char(64) DEFAULT NULL,
  `ForwardToNumber` char(64) DEFAULT NULL,
  `ChargeType` char(1) NOT NULL DEFAULT '',
  `ChargeAmount` double NOT NULL DEFAULT '0',
  `Duration` char(3) NOT NULL DEFAULT '',
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VCost` double NOT NULL DEFAULT '0',
  `Rate` char(12) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Profit` double DEFAULT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table rcopy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rcopy`;

CREATE TABLE `rcopy` (
  `sno` bigint(25) NOT NULL AUTO_INCREMENT,
  `UID` bigint(4) NOT NULL DEFAULT '0',
  `OID` bigint(10) DEFAULT NULL,
  `calleridnum` varchar(50) DEFAULT NULL,
  `tempCalledNumber` varchar(25) DEFAULT NULL,
  `tempFinalDate` datetime DEFAULT NULL,
  `d_path` varchar(100) DEFAULT NULL,
  `wav_file` varchar(100) DEFAULT NULL,
  `tempFinalDate1` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `callfrom` varchar(25) DEFAULT NULL,
  `callto` varchar(25) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `duration` int(5) DEFAULT '0',
  `file` longblob,
  `blog` int(1) DEFAULT '0',
  `dontcount` int(1) DEFAULT '0',
  `country` varchar(100) DEFAULT NULL,
  `charge` double DEFAULT '0',
  `isfree` int(1) DEFAULT '0',
  `filesize` double DEFAULT '0',
  PRIMARY KEY (`sno`),
  KEY `tempFinalDat` (`tempFinalDate`),
  KEY `wav_file` (`tempCalledNumber`,`wav_file`),
  KEY `UID` (`UID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table RecentCLID
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RecentCLID`;

CREATE TABLE `RecentCLID` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `CallerID` varchar(100) DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table recordedcalls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recordedcalls`;

CREATE TABLE `recordedcalls` (
  `sno` bigint(25) NOT NULL AUTO_INCREMENT,
  `UID` bigint(4) NOT NULL DEFAULT '0',
  `OID` bigint(10) DEFAULT NULL,
  `calleridnum` varchar(50) DEFAULT NULL,
  `tempCalledNumber` varchar(25) DEFAULT NULL,
  `tempFinalDate` datetime DEFAULT NULL,
  `d_path` varchar(100) DEFAULT NULL,
  `wav_file` varchar(100) DEFAULT NULL,
  `tempFinalDate1` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `callfrom` varchar(25) DEFAULT NULL,
  `callto` varchar(25) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `duration` int(5) DEFAULT '0',
  `file` longblob,
  `blog` int(1) DEFAULT '0',
  `dontcount` int(1) DEFAULT '0',
  `country` varchar(50) DEFAULT NULL,
  `charge` double DEFAULT '0',
  `isfree` int(1) DEFAULT '0',
  `filesize` double DEFAULT '0',
  PRIMARY KEY (`sno`),
  KEY `tempFinalDat` (`tempFinalDate`),
  KEY `wav_file` (`tempCalledNumber`,`wav_file`),
  KEY `UID` (`UID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table RecordTime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RecordTime`;

CREATE TABLE `RecordTime` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `MinUse` int(2) DEFAULT '0',
  `expired` date DEFAULT NULL,
  `Minremain` int(2) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ReferFriend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ReferFriend`;

CREATE TABLE `ReferFriend` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `RefCode` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `EmailDate` date DEFAULT NULL,
  `EmailSent` int(2) DEFAULT NULL,
  `CreditRecieved` int(2) DEFAULT NULL,
  `FriendFName` varchar(20) DEFAULT NULL,
  `FriendLName` varchar(20) DEFAULT NULL,
  `isreceived` char(2) DEFAULT '0',
  `SiteID` varchar(100) DEFAULT NULL,
  `Message` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table referfriend_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `referfriend_old`;

CREATE TABLE `referfriend_old` (
  `OID` varchar(10) DEFAULT NULL,
  `VPLNo` varchar(30) DEFAULT NULL,
  `RfEmail` varchar(60) DEFAULT NULL,
  `PlanType` varchar(4) DEFAULT NULL,
  `Rfdate` datetime DEFAULT NULL,
  `RfDecline` tinyint(1) DEFAULT NULL,
  `RfRcvCredit` tinyint(1) DEFAULT NULL,
  `RfSndLstEm` datetime DEFAULT NULL,
  `RfMrkDel` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table Reminder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Reminder`;

CREATE TABLE `Reminder` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `Times` int(5) DEFAULT NULL,
  `Suspend` int(2) DEFAULT NULL,
  PRIMARY KEY (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table RemovedNumbers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RemovedNumbers`;

CREATE TABLE `RemovedNumbers` (
  `ID` bigint(5) NOT NULL AUTO_INCREMENT,
  `DID` varchar(30) DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Auto` int(2) DEFAULT '0',
  `Reason` text,
  `Admin` varchar(20) DEFAULT NULL,
  `TalkTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ReportEmailer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ReportEmailer`;

CREATE TABLE `ReportEmailer` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ReportName` varchar(20) DEFAULT NULL,
  `ToEmail` varchar(50) DEFAULT NULL,
  `FromEmail` varchar(50) DEFAULT NULL,
  `CCEmail` varchar(50) DEFAULT NULL,
  `SiteID` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ReportTypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ReportTypes`;

CREATE TABLE `ReportTypes` (
  `ID` varchar(25) DEFAULT NULL,
  `ZoomIn` text,
  `RepName` varchar(255) DEFAULT NULL,
  `Prio` int(11) DEFAULT NULL,
  `ZoomInYear` text,
  `Enable` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table reselleraccount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reselleraccount`;

CREATE TABLE `reselleraccount` (
  `ID` bigint(15) NOT NULL AUTO_INCREMENT,
  `ResellerID` varchar(10) NOT NULL DEFAULT '',
  `OID` varchar(20) DEFAULT NULL,
  `ReferenceID` varchar(20) DEFAULT NULL,
  `PaymentMode` varchar(4) NOT NULL DEFAULT '',
  `Type` varchar(4) NOT NULL DEFAULT '',
  `Amount` double NOT NULL DEFAULT '0',
  `Comments` text,
  `IsCredit` tinyint(1) NOT NULL DEFAULT '0',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TrID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Accounts Information for Reseller';



# Dump of table ResellerBalance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ResellerBalance`;

CREATE TABLE `ResellerBalance` (
  `ResellerID` varchar(20) NOT NULL DEFAULT '0',
  `Balance` bigint(10) DEFAULT '0',
  `Date` datetime DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ResellerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table resellerbillinginfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resellerbillinginfo`;

CREATE TABLE `resellerbillinginfo` (
  `AUID` varchar(10) NOT NULL DEFAULT '',
  `UnlimitedPlanRate` varchar(10) DEFAULT '69',
  `500MinPlan` varchar(10) DEFAULT '39',
  `HardwareCost` varchar(10) DEFAULT '150',
  `SetupFee` varchar(10) DEFAULT '99',
  `Balance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`AUID`),
  UNIQUE KEY `AUID` (`AUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ResellerSMSAPI
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ResellerSMSAPI`;

CREATE TABLE `ResellerSMSAPI` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UID` varchar(30) DEFAULT NULL,
  `SMSCode` varchar(20) DEFAULT NULL,
  `SiteID` varchar(30) DEFAULT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `Verified` int(10) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ResellerTransaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ResellerTransaction`;

CREATE TABLE `ResellerTransaction` (
  `ResellerID` varchar(30) NOT NULL,
  `Date` varchar(30) DEFAULT NULL,
  `AdminName` varbinary(40) DEFAULT NULL,
  `Amount` int(10) DEFAULT NULL,
  `TransactionID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`TransactionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ReturnUser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ReturnUser`;

CREATE TABLE `ReturnUser` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(15) DEFAULT NULL,
  `LastVisit` text,
  `Date` datetime DEFAULT NULL,
  `KeyVal` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table rights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rights`;

CREATE TABLE `rights` (
  `RID` varchar(10) NOT NULL DEFAULT '',
  `RTitle` varchar(20) NOT NULL DEFAULT '',
  `RDesc` varchar(40) NOT NULL DEFAULT '',
  `RType` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`RID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table RingTo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RingTo`;

CREATE TABLE `RingTo` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `CountryCode` varchar(10) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ringto_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ringto_history`;

CREATE TABLE `ringto_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `did` varchar(15) DEFAULT NULL,
  `RingTo` varchar(100) DEFAULT NULL,
  `carrier` int(11) DEFAULT NULL,
  `talktimebalance` int(11) DEFAULT NULL,
  `uid` varchar(20) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Admin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OID` (`oid`),
  KEY `carrier` (`carrier`),
  KEY `RingTo` (`RingTo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ringto4tryfree
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ringto4tryfree`;

CREATE TABLE `ringto4tryfree` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(15) NOT NULL DEFAULT '',
  `mappedAddress` varchar(255) DEFAULT NULL,
  `vendorid` varchar(12) DEFAULT '16',
  `typeid` bigint(12) DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `info` varchar(40) DEFAULT NULL,
  `OrderID` varchar(6) DEFAULT NULL,
  `SetupCost` varchar(6) DEFAULT '99',
  `MonthlyCost` varchar(6) DEFAULT '5',
  `IsMonthlyTerminated` tinyint(1) DEFAULT '0',
  `PerMinuteOrignation` varchar(6) DEFAULT '0.0',
  `MappedToSIP` tinyint(1) DEFAULT '0',
  `MapedToIAX` tinyint(1) DEFAULT '0',
  `country` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `carrier` int(11) DEFAULT '0',
  `mappedRate` float(6,4) DEFAULT NULL,
  `minutes` float(6,4) DEFAULT NULL,
  `dialString` varchar(255) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT '0',
  `MappedToIVR` tinyint(1) DEFAULT '0',
  `callType` int(11) DEFAULT '1',
  `talkTimeBalance` int(11) DEFAULT '0',
  `AnnualCost` double(6,4) DEFAULT NULL,
  `isFree` tinyint(4) DEFAULT '0',
  `freeExpiry` datetime DEFAULT NULL,
  `FreeMinutes` int(11) DEFAULT '0',
  `PerMinuteAfterFreeMinutes` double(6,4) DEFAULT '0.0000',
  `Channels` int(11) DEFAULT '1',
  `AutoRemove` int(2) DEFAULT '0',
  `SignupFree` int(2) DEFAULT '0',
  `AutoRemoveDate` date DEFAULT NULL,
  `IVR` int(2) DEFAULT '0',
  `DIDStatus` int(2) DEFAULT '0',
  `Payment` double DEFAULT '0',
  `IsIVR` int(2) DEFAULT '0',
  `SuspenDate` date DEFAULT NULL,
  `Termdate` date DEFAULT NULL,
  `IsRecording` int(1) DEFAULT '0',
  `Vmail` int(2) DEFAULT '0',
  `DIDType` int(2) DEFAULT '1',
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`did`),
  UNIQUE KEY `did` (`did`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table RingToCountries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RingToCountries`;

CREATE TABLE `RingToCountries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` blob,
  `countrycode` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countrycode` (`countrycode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SAMPLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SAMPLE`;

CREATE TABLE `SAMPLE` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `IMAGEFILE` longblob,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table seller
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seller`;

CREATE TABLE `seller` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;



# Dump of table servervariable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `servervariable`;

CREATE TABLE `servervariable` (
  `ICBWeb` date DEFAULT NULL,
  `ICBFTP` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table shipment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shipment`;

CREATE TABLE `shipment` (
  `ShipmentID` varchar(10) NOT NULL DEFAULT '',
  `AddressID` varchar(10) NOT NULL DEFAULT '',
  `FedExID` varchar(20) DEFAULT NULL,
  `ShipmentName` varchar(40) DEFAULT NULL,
  `ShipmentEmail` varchar(60) DEFAULT NULL,
  `ShipmentTel` varchar(20) DEFAULT NULL,
  `ShipmentCell` varchar(22) DEFAULT NULL,
  `IsShipped` tinyint(1) NOT NULL DEFAULT '0',
  `ShippedDate` date DEFAULT NULL,
  PRIMARY KEY (`ShipmentID`),
  UNIQUE KEY `ShipmentID` (`ShipmentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ShoppingCart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ShoppingCart`;

CREATE TABLE `ShoppingCart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` bigint(20) DEFAULT NULL,
  `ringto` varchar(100) DEFAULT NULL,
  `ringtotype` int(11) DEFAULT NULL,
  `setupcharges` float DEFAULT NULL,
  `monthlycharges` float DEFAULT NULL,
  `annualcharges` float DEFAULT NULL,
  `perMinuteCharges` float DEFAULT NULL,
  `billingtype` int(11) DEFAULT NULL,
  `talktime` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `dated` datetime DEFAULT NULL,
  `Remarks` varchar(50) DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table signup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `signup`;

CREATE TABLE `signup` (
  `salutation` int(2) DEFAULT '1',
  `fname` int(2) DEFAULT '1',
  `mname` int(2) DEFAULT '1',
  `lname` int(2) DEFAULT '1',
  `email` int(2) DEFAULT '1',
  `password` int(2) DEFAULT '1',
  `cpassword` int(2) DEFAULT '1',
  `company` int(2) DEFAULT '1',
  `referredby` int(2) DEFAULT '1',
  `dateofbirth` int(2) DEFAULT '1',
  `msn` int(2) DEFAULT '1',
  `google` int(2) DEFAULT '1',
  `street1` int(2) DEFAULT '1',
  `street2` int(2) DEFAULT '1',
  `city` int(2) DEFAULT '1',
  `state` int(2) DEFAULT '1',
  `zip` int(2) DEFAULT '1',
  `country` int(2) DEFAULT '1',
  `phone` int(2) DEFAULT '1',
  `cell` int(2) DEFAULT '1',
  `fax` int(2) DEFAULT '1',
  `SiteID` varchar(255) DEFAULT NULL,
  `theme` varchar(50) DEFAULT 'Default',
  `IsTryFreeAllowed` int(2) DEFAULT '0',
  `IsRingto` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table Signup_Short
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Signup_Short`;

CREATE TABLE `Signup_Short` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `SiteId` varchar(5) COLLATE utf8_unicode_ci DEFAULT 'VPL',
  `CCode` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cust_Num` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table signuplabels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `signuplabels`;

CREATE TABLE `signuplabels` (
  `salutation` text,
  `fname` text,
  `mname` text,
  `lname` text,
  `email` text,
  `password` text,
  `cpassword` text,
  `company` text,
  `referredby` text,
  `dateofbirth` text,
  `msn` text,
  `google` text,
  `street1` text,
  `street2` text,
  `city` text,
  `state` text,
  `zip` text,
  `country` text,
  `phone` text,
  `cell` text,
  `fax` text,
  `SiteID` varchar(255) DEFAULT NULL,
  `theme` varchar(50) DEFAULT 'Default',
  `languageid` varchar(5) DEFAULT '1',
  `LangIsActive` varchar(5) DEFAULT '1',
  `Ringto` varchar(255) DEFAULT 'Ring To'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SimulRings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SimulRings`;

CREATE TABLE `SimulRings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` char(100) DEFAULT NULL,
  `RingToType` int(11) DEFAULT '1',
  `Priority` int(2) DEFAULT '0',
  `did` bigint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sip_buddies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sip_buddies`;

CREATE TABLE `sip_buddies` (
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `accountcode` varchar(30) DEFAULT NULL,
  `amaflags` char(1) DEFAULT NULL,
  `callgroup` varchar(30) DEFAULT NULL,
  `callerid` varchar(50) DEFAULT NULL,
  `canreinvite` char(1) DEFAULT NULL,
  `context` varchar(50) DEFAULT NULL,
  `defaultip` varchar(15) DEFAULT NULL,
  `dtmfmode` varchar(7) DEFAULT NULL,
  `fromuser` varchar(50) DEFAULT NULL,
  `fromdomain` varchar(31) DEFAULT NULL,
  `host` varchar(31) NOT NULL DEFAULT '',
  `incominglimit` char(2) DEFAULT '1',
  `outgoinglimit` char(2) DEFAULT '0',
  `insecure` varchar(4) DEFAULT 'yes',
  `language` char(2) DEFAULT 'en',
  `mailbox` varchar(50) DEFAULT NULL,
  `md5secret` varchar(32) DEFAULT NULL,
  `nat` varchar(5) DEFAULT '1',
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `pickupgroup` varchar(10) DEFAULT NULL,
  `port` varchar(5) NOT NULL DEFAULT '',
  `qualify` varchar(4) DEFAULT NULL,
  `restrictcid` char(1) DEFAULT NULL,
  `rtptimeout` char(3) DEFAULT NULL,
  `rtpholdtimeout` char(3) DEFAULT NULL,
  `secret` varchar(30) DEFAULT NULL,
  `type` varchar(6) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `allow` varchar(100) DEFAULT NULL,
  `disallow` varchar(100) DEFAULT NULL,
  `regseconds` int(11) NOT NULL DEFAULT '0',
  `fullcontact` varchar(100) DEFAULT NULL,
  `ipaddr` varchar(15) NOT NULL DEFAULT '',
  `call-limit` char(3) DEFAULT '1',
  PRIMARY KEY (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SipUserSeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SipUserSeries`;

CREATE TABLE `SipUserSeries` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(50) DEFAULT NULL,
  `type` int(1) DEFAULT '0',
  `series` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sitemanager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitemanager`;

CREATE TABLE `sitemanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SiteName` varchar(50) NOT NULL DEFAULT '',
  `SiteDomain` varchar(50) NOT NULL DEFAULT '',
  `SiteCurrency` int(11) NOT NULL DEFAULT '0',
  `SiteCountry` varchar(50) NOT NULL DEFAULT '',
  `SiteLanguage` varchar(100) DEFAULT NULL,
  `SiteText` text,
  `DIDPrefix` varchar(10) DEFAULT NULL,
  `DIDVendor` varchar(10) DEFAULT NULL,
  `DIDMonthlyCost` float DEFAULT NULL,
  `DIDAnnualCost` float DEFAULT NULL,
  `DIDXUID` varchar(11) DEFAULT '1',
  `DIDXPASS` varchar(11) DEFAULT NULL,
  `FTPUID` varchar(255) DEFAULT NULL,
  `FTPPASS` varchar(255) DEFAULT NULL,
  `DIDxVR1` int(2) DEFAULT NULL,
  `DIDxVR2` int(2) DEFAULT NULL,
  `DIDView` int(2) DEFAULT '1',
  `CountryAreaShow` int(2) DEFAULT '1',
  `VRatingFrom` int(2) DEFAULT '5',
  `VRatingTo` int(2) DEFAULT '9',
  `PageTitle` varchar(255) DEFAULT NULL,
  `FlatRate` int(3) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `Version` varchar(20) DEFAULT NULL,
  `isccallowed` varchar(5) DEFAULT NULL,
  `is2checkout` varchar(5) DEFAULT NULL,
  `ccNotAllowedtxt` varchar(255) DEFAULT NULL,
  `isccallowedDefault` char(2) DEFAULT '0',
  `isdidMonthly` char(2) DEFAULT '1',
  `isdidSetup` char(2) DEFAULT '1',
  `isdidAnnual` char(2) DEFAULT '1',
  `isplan` char(2) DEFAULT '1',
  `is2coallowedDefault` char(2) DEFAULT '0',
  `isccallowedtext` text,
  `ChannelBased` int(2) DEFAULT '0',
  `SiteEmail` varchar(50) DEFAULT '',
  `RouteDIDX` int(2) DEFAULT '0',
  `ispaypalallowedDefault` char(2) DEFAULT '0',
  `isRingtoAll` char(2) DEFAULT '1',
  `isgocdma` char(2) DEFAULT '0',
  `clientheader` int(2) DEFAULT '2',
  `TicketTo` int(2) DEFAULT '1',
  `SPDirect` int(1) DEFAULT '0',
  `Recording` int(1) DEFAULT '0',
  `RSetup` double DEFAULT '0',
  `RMonthly` double DEFAULT '0',
  `RMinutes` int(3) DEFAULT '0',
  `Vmail` int(2) DEFAULT '1',
  `SPDFreeDollar` double DEFAULT '1',
  `SPDFreeTimes` int(1) DEFAULT '1',
  `SPDFreePM` int(1) DEFAULT '2',
  `ipBlockCount` varchar(5) DEFAULT NULL,
  `IVR` int(1) DEFAULT '0',
  `MultiLevel` int(1) DEFAULT '1',
  `videobox` int(2) DEFAULT '1',
  `UnConfRel` int(1) DEFAULT '0',
  `ShowCCDocs` int(1) DEFAULT '1',
  `ShowVideos` int(1) DEFAULT '0',
  `GoogleMerchantID` varchar(255) DEFAULT NULL,
  `GoogleMerchantKey` varchar(255) DEFAULT NULL,
  `GoogleReturnURL` varchar(255) DEFAULT NULL,
  `GoogleDesc` text,
  `MBMerchantID` varchar(50) DEFAULT NULL,
  `MBStatusURL` text,
  `MBDesc` text,
  `AllowPIN` int(1) DEFAULT '0',
  `ReferFriend` int(1) DEFAULT '0',
  `AmountFrom` double DEFAULT '0',
  `AmountTo` double DEFAULT '0',
  `ReferMode` int(1) DEFAULT '0',
  `BillingMethod` varchar(2) DEFAULT '0',
  `LPStoreNo` varchar(10) DEFAULT NULL,
  `LPPemFile` longblob,
  `CountryOrder` int(1) DEFAULT '1',
  `MainTempl` text,
  `SessionHeader` text,
  `UnSessionHeader` text,
  `SessionFooter` text,
  `UnSessionFooter` text,
  `BGColor` varchar(7) DEFAULT '#6A8ADD',
  `ForeColor` varchar(7) DEFAULT '#FFFFFF',
  `BorderColor` varchar(7) DEFAULT '#264699',
  `OverColor` varchar(7) DEFAULT '#A1B5EA',
  `BoxBarBgcolor` varchar(7) DEFAULT '#6B8ADA',
  `BoxBarBGImage` longblob,
  `BoxBorderColor` varchar(7) DEFAULT '#6B8ADA',
  `BoxGrayLine` varchar(7) DEFAULT '#F0F0F0',
  `HeadFontColor` varchar(7) DEFAULT '#FFFFFF',
  `MenuWidth` int(1) DEFAULT '81',
  `httpcert` int(1) DEFAULT '0',
  `GCDefault` int(1) DEFAULT '0',
  `didxrouting` varchar(255) DEFAULT 'sip1.virtualphoneline.com',
  `gconoff` int(1) DEFAULT '0',
  `AuthNetLogin` varchar(30) DEFAULT NULL,
  `AuthNetTransKey` varchar(30) DEFAULT NULL,
  `AuthNet` int(1) DEFAULT '0',
  `ccoption` int(1) DEFAULT '1',
  `zonecalling` varchar(30) DEFAULT '1-2-3-4-5',
  `TryFreeDollar` double DEFAULT '1',
  `CallLimit` int(1) DEFAULT '1',
  `MBMerchantEmail` varchar(50) DEFAULT NULL,
  `MBooker` int(1) DEFAULT '0',
  `FBAppID` varchar(50) DEFAULT NULL,
  `FBSecret` varchar(50) DEFAULT NULL,
  `FBSignupID` varchar(50) DEFAULT NULL,
  `FBSignupSecret` varchar(50) DEFAULT NULL,
  `VoidSignup` int(1) DEFAULT '0',
  `FreeNumbers` int(1) DEFAULT '1',
  `LoginLogo` text,
  `LoginSlogan` varchar(100) DEFAULT NULL,
  `LoginHead` varchar(100) DEFAULT NULL,
  `SpDirectType` int(1) DEFAULT '0',
  `EarthSMSLogin` varchar(25) DEFAULT NULL,
  `EarthSMSPass` varchar(25) DEFAULT NULL,
  `SMSPanel` int(1) DEFAULT '0',
  `approval_df` int(1) DEFAULT '0',
  `crating_df` int(1) DEFAULT '1',
  `mbookers_df` int(1) DEFAULT '0',
  `linkpoint_df` int(1) DEFAULT '0',
  `CallBack` int(1) DEFAULT '0',
  `SIPIAX` int(1) DEFAULT '0',
  `UseTempl` int(1) DEFAULT '0',
  `NewTempl` int(1) DEFAULT '1',
  `HVOIP` int(1) DEFAULT '0',
  `GoogleID` int(1) DEFAULT '1',
  `VarifyAccount` int(1) DEFAULT '1',
  `InterC` int(1) DEFAULT '0',
  `callbackurl` varchar(200) DEFAULT '',
  `facebookappurl` varchar(200) DEFAULT '',
  `cfmsstatus` int(1) DEFAULT '0',
  `nottivr` int(1) DEFAULT '0',
  `isMasterTT` int(1) DEFAULT '1',
  `SpecialCFMS` int(1) DEFAULT '0',
  `FBSignupMessage` varchar(300) DEFAULT 'has signed up on $SiteName',
  `FBChangeRingTo` varchar(255) DEFAULT 'has just changed the forwarding settings of their number from $SiteName',
  `FBLinkTo` varchar(255) DEFAULT 'has just FB Connected on $SiteName',
  `FBFreeNumber` varchar(255) DEFAULT 'has signed received a free number from $SiteName',
  `FBSMSRingTo` varchar(255) DEFAULT 'has just changed the forwarding settings via SMS of their number from $SiteName',
  `iPayMerID` varchar(100) DEFAULT NULL,
  `iPayPayID` varchar(3) DEFAULT NULL,
  `iPayMerKey` varchar(100) DEFAULT NULL,
  `iPayStatus` int(1) DEFAULT '0',
  `DeleteSuspended` int(10) DEFAULT '3',
  `AlternetRingTo` int(1) DEFAULT '0',
  `BittcoinAddress` varchar(300) DEFAULT NULL,
  `BitcoinSecret` varchar(400) DEFAULT NULL,
  `WebsiteRoot` varchar(200) DEFAULT NULL,
  `BlockchainRoot` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SiteName` (`SiteName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SiteManagerAdmin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SiteManagerAdmin`;

CREATE TABLE `SiteManagerAdmin` (
  `footer` longblob,
  `SiteID` varchar(50) DEFAULT NULL,
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `current` int(2) DEFAULT '1',
  `footerImage` varchar(25) DEFAULT NULL,
  `headerImage` varchar(25) DEFAULT NULL,
  `signupRingtoLabel` varchar(255) DEFAULT NULL,
  `signupRingtotext` varchar(255) DEFAULT NULL,
  `carrier` varchar(10) DEFAULT '3',
  `signupVersion` varchar(2) DEFAULT '1',
  `footerUnSession` longblob,
  `indexPage` longblob,
  `FeaturePage` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SkypeSignupPakage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SkypeSignupPakage`;

CREATE TABLE `SkypeSignupPakage` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PackageID` varchar(50) DEFAULT NULL,
  `UID` varchar(10) DEFAULT NULL,
  `SkypeID` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  `IsValid` int(2) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SMS_Settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SMS_Settings`;

CREATE TABLE `SMS_Settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `from_field` varchar(255) DEFAULT NULL,
  `cc_field` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT '1',
  `date_added` date DEFAULT NULL,
  `SID` varchar(15) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT 'VPL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SMSInbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SMSInbox`;

CREATE TABLE `SMSInbox` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `DID` varchar(25) DEFAULT NULL,
  `FromNumber` varchar(25) DEFAULT NULL,
  `msg` text,
  `date` datetime DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `ident` varchar(50) DEFAULT NULL,
  `Rate` double DEFAULT '0',
  `alert` int(1) DEFAULT '0',
  `SMSLink` int(1) DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SMSRates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SMSRates`;

CREATE TABLE `SMSRates` (
  `CountryCode` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(80) NOT NULL DEFAULT '',
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `Zone` int(2) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT 'VPL',
  `SMSRates` double DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SMSSignupPakage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SMSSignupPakage`;

CREATE TABLE `SMSSignupPakage` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PackageID` varchar(50) DEFAULT NULL,
  `UID` varchar(10) DEFAULT NULL,
  `Number` varchar(30) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  `IsValid` int(2) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SMSSignupPakageCRM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SMSSignupPakageCRM`;

CREATE TABLE `SMSSignupPakageCRM` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PackageName` varchar(255) DEFAULT NULL,
  `didPrefix` int(10) DEFAULT NULL,
  `freeTTime` float DEFAULT NULL,
  `DIDTrailDays` int(10) DEFAULT NULL,
  `AccountsLimit` varchar(100) DEFAULT NULL,
  `SiteID` blob,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SocialRates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SocialRates`;

CREATE TABLE `SocialRates` (
  `ID` int(5) NOT NULL DEFAULT '0',
  `RMID` int(5) DEFAULT '0',
  `VanityFrom` int(1) DEFAULT '0',
  `VanityTo` int(1) DEFAULT '0',
  `MFactor` int(1) DEFAULT '0',
  `MValue` double DEFAULT NULL,
  `SFactor` int(1) DEFAULT '0',
  `SValue` double DEFAULT '0',
  `SiteID` varchar(60) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table SoftwareSettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SoftwareSettings`;

CREATE TABLE `SoftwareSettings` (
  `ID` int(5) DEFAULT NULL,
  `Categ` varchar(50) DEFAULT NULL,
  `values` varchar(255) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SoldDIDSEver
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SoldDIDSEver`;

CREATE TABLE `SoldDIDSEver` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `DID` varchar(20) DEFAULT NULL,
  `DIDxSetup` double DEFAULT '0',
  `DIDxMonthly` double DEFAULT '0',
  `VPLMonthly` double DEFAULT '0',
  `VPLSetup` double DEFAULT '0',
  `Date` datetime DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `Type` varchar(8) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DID` (`DID`),
  KEY `DIDxMonthly` (`DIDxMonthly`),
  KEY `VPLMonthly` (`VPLMonthly`),
  KEY `Date` (`Date`),
  KEY `OID` (`OID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SPDDiallers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SPDDiallers`;

CREATE TABLE `SPDDiallers` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  `DID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SpecialOffer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SpecialOffer`;

CREATE TABLE `SpecialOffer` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `KeyID` varchar(30) DEFAULT NULL,
  `Vendor` varchar(20) DEFAULT NULL,
  `CountryCode` varchar(3) DEFAULT NULL,
  `AreaCode` varchar(10) DEFAULT NULL,
  `NXX` varchar(3) DEFAULT NULL,
  `Prefix` varchar(30) DEFAULT NULL,
  `Monthly` double DEFAULT '0',
  `setup` double DEFAULT '0',
  `Qty` int(2) DEFAULT '0',
  `Details` text,
  `Slogan` text,
  `url` varchar(50) DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  `AnnualOption` int(1) DEFAULT '0',
  `Annual` double DEFAULT '0',
  `TalkTime` double DEFAULT '0',
  `CountryName` varchar(100) DEFAULT NULL,
  `AreaName` varchar(100) DEFAULT NULL,
  `PlanID` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table statistic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `statistic`;

CREATE TABLE `statistic` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL,
  `os` varchar(30) DEFAULT NULL,
  `br` varchar(30) DEFAULT NULL,
  `country` varchar(2) DEFAULT '--',
  `good` int(1) NOT NULL DEFAULT '0',
  `mv` int(1) NOT NULL DEFAULT '0',
  `refer` varchar(300) NOT NULL,
  `date` datetime DEFAULT '2009-01-01 00:00:00',
  `spl` varchar(30) DEFAULT NULL,
  `seller` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;



# Dump of table StatusManager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `StatusManager`;

CREATE TABLE `StatusManager` (
  `ID` bigint(5) NOT NULL AUTO_INCREMENT,
  `SusDays` int(2) DEFAULT '0',
  `TermDays` int(2) DEFAULT '0',
  `Issue` int(2) DEFAULT '1',
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table suspunsuspstatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suspunsuspstatus`;

CREATE TABLE `suspunsuspstatus` (
  `ReqId` int(3) NOT NULL AUTO_INCREMENT,
  `SOID` varchar(20) NOT NULL DEFAULT '',
  `AUID` varchar(50) DEFAULT NULL,
  `DAT` datetime DEFAULT NULL,
  `SusStatus` int(1) DEFAULT NULL,
  `Discription` text,
  `IsDone` int(1) DEFAULT NULL,
  `IsEmailed` int(1) DEFAULT '0',
  `EmailDate` date DEFAULT NULL,
  `Counter` int(3) DEFAULT '0',
  `CounterOver` int(1) DEFAULT '0',
  PRIMARY KEY (`ReqId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table SusTermDates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SusTermDates`;

CREATE TABLE `SusTermDates` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `DID` varchar(30) DEFAULT NULL,
  `SuspendDate` date DEFAULT NULL,
  `TermDate` date DEFAULT NULL,
  `PaidTill` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TableUpdateDate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TableUpdateDate`;

CREATE TABLE `TableUpdateDate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(50) DEFAULT NULL,
  `dated` datetime DEFAULT NULL,
  `AUID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TempAreaMonthly
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TempAreaMonthly`;

CREATE TABLE `TempAreaMonthly` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `CountryCode` varchar(10) DEFAULT NULL,
  `AreaCode` varchar(10) DEFAULT NULL,
  `CountryName` varchar(50) DEFAULT NULL,
  `AreaName` text,
  `Monthly` double DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TempDueTill
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TempDueTill`;

CREATE TABLE `TempDueTill` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `UpdateDT` datetime DEFAULT NULL,
  `tilldate` date DEFAULT NULL,
  `DateMonth` varchar(20) DEFAULT NULL,
  `AmountMonth` double DEFAULT NULL,
  `AmountYear` double DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `InterC` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `OID` (`OID`),
  KEY `date` (`Date`),
  KEY `UpdateDT` (`UpdateDT`),
  KEY `Amount` (`Amount`),
  KEY `SiteID` (`SiteID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TempDueTill_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TempDueTill_copy`;

CREATE TABLE `TempDueTill_copy` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `UpdateDT` datetime DEFAULT NULL,
  `tilldate` date DEFAULT NULL,
  `DateMonth` varchar(20) DEFAULT NULL,
  `AmountMonth` double DEFAULT NULL,
  `AmountYear` double DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  `InterC` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TestingMasters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TestingMasters`;

CREATE TABLE `TestingMasters` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `DIDNumber` varchar(40) DEFAULT NULL,
  `CallDate` datetime DEFAULT NULL,
  `CallPickup` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TicketCat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TicketCat`;

CREATE TABLE `TicketCat` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `TicketCat` varchar(255) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TicketSubCat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TicketSubCat`;

CREATE TABLE `TicketSubCat` (
  `CatID` int(4) NOT NULL,
  `SubCat` varchar(255) DEFAULT NULL,
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TicketSugg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TicketSugg`;

CREATE TABLE `TicketSugg` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `Question` text,
  `Answer` text,
  `Links` text,
  `SubCatID` int(4) DEFAULT NULL,
  `VideoLinks` text,
  `SiteID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FULLTEXT KEY `QINDEX` (`Question`),
  FULLTEXT KEY `AINDEX` (`Answer`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TimeRouting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TimeRouting`;

CREATE TABLE `TimeRouting` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `DID` varchar(25) DEFAULT NULL,
  `Carrier` int(2) DEFAULT NULL,
  `CallType` int(2) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `DialString` varchar(255) DEFAULT NULL,
  `FromTime` varchar(10) DEFAULT NULL,
  `ToTime` varchar(20) DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ToCheckOut
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ToCheckOut`;

CREATE TABLE `ToCheckOut` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `TransactionID` int(8) DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `CheckOutID` varchar(25) DEFAULT NULL,
  `CardHolderName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Zip` varchar(20) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Processed` char(2) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `ShipName` varchar(255) DEFAULT NULL,
  `SAddress` varchar(255) DEFAULT NULL,
  `SCity` varchar(255) DEFAULT NULL,
  `SState` varchar(255) DEFAULT NULL,
  `SZip` varchar(20) DEFAULT NULL,
  `SCountry` varchar(100) DEFAULT NULL,
  `ProductID` varchar(255) DEFAULT NULL,
  `MerchantProdID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ToCheckOutSettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ToCheckOutSettings`;

CREATE TABLE `ToCheckOutSettings` (
  `SID` varchar(50) DEFAULT NULL,
  `SellerName` varchar(50) DEFAULT NULL,
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table TollFreePrefix
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TollFreePrefix`;

CREATE TABLE `TollFreePrefix` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `TollFree` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `TransactionID` bigint(35) NOT NULL DEFAULT '0',
  `OID` varchar(10) NOT NULL DEFAULT '',
  `Description` text NOT NULL,
  `Type` varchar(10) NOT NULL DEFAULT '',
  `ReferenceID` varchar(100) DEFAULT NULL,
  `Amount` double(6,2) NOT NULL DEFAULT '0.00',
  `IsCredit` tinyint(4) NOT NULL DEFAULT '0',
  `IsCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DID` bigint(15) DEFAULT NULL,
  `SLOC` varchar(20) DEFAULT NULL,
  `WHODEL` varchar(20) DEFAULT NULL,
  `WHODELDATE` datetime DEFAULT NULL,
  `AmountBTC` double(6,2) DEFAULT '0.00',
  `customerBitcoinAddress` varbinary(250) DEFAULT NULL,
  UNIQUE KEY `TransactionID` (`TransactionID`),
  KEY `OID` (`OID`),
  KEY `Date` (`Date`),
  KEY `DID` (`DID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table tthistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tthistory`;

CREATE TABLE `tthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OID` int(11) DEFAULT NULL,
  `did` varchar(15) DEFAULT NULL,
  `previous` float DEFAULT NULL,
  `amount` float(5,2) DEFAULT NULL,
  `referenceid` varchar(20) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table unverified_signup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unverified_signup`;

CREATE TABLE `unverified_signup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CEmail` varchar(100) DEFAULT NULL,
  `CFName` varchar(20) NOT NULL DEFAULT '',
  `CLName` varchar(20) NOT NULL DEFAULT '',
  `custype` varchar(1) DEFAULT NULL,
  `CCompany` varchar(50) DEFAULT NULL,
  `CCountry` varchar(50) DEFAULT NULL,
  `HTel1` varchar(20) DEFAULT NULL,
  `mobileno` varchar(20) DEFAULT NULL,
  `agree1` varchar(1) DEFAULT NULL,
  `agree2` varchar(1) DEFAULT NULL,
  `AffiliationCode` varchar(20) DEFAULT NULL,
  `SMSCode` varchar(20) DEFAULT NULL,
  `tries` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobileno` (`mobileno`),
  KEY `Email` (`CEmail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table UpdateOldBalance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UpdateOldBalance`;

CREATE TABLE `UpdateOldBalance` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `UpdateFor` date DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table UpdateRequests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UpdateRequests`;

CREATE TABLE `UpdateRequests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(30) NOT NULL DEFAULT '',
  `SIPPhoneNumber` varchar(30) NOT NULL DEFAULT '',
  `SIPProxy` varchar(50) NOT NULL DEFAULT '',
  `EMail` varchar(50) NOT NULL DEFAULT '',
  `PIN` varchar(4) NOT NULL DEFAULT '',
  `IsUpdated` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table USAreaCodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USAreaCodes`;

CREATE TABLE `USAreaCodes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `AreCode` varchar(10) DEFAULT NULL,
  `Abbreviation` char(3) DEFAULT NULL,
  `Description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `UID` varchar(50) NOT NULL DEFAULT '',
  `Pass` varchar(20) NOT NULL DEFAULT '',
  `Type` varchar(4) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `IsRemoved` tinyint(1) NOT NULL DEFAULT '0',
  `ConfCode` varchar(10) NOT NULL DEFAULT '',
  `DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IsNew` varchar(10) DEFAULT '0',
  `SiteID` varchar(50) DEFAULT 'VPL',
  KEY `UID` (`UID`),
  KEY `SiteID` (`SiteID`),
  KEY `Pass` (`Pass`),
  KEY `Type` (`Type`),
  KEY `IsActive` (`IsActive`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table UserDocs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserDocs`;

CREATE TABLE `UserDocs` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `Type` int(1) DEFAULT '0',
  `Date` date DEFAULT NULL,
  `KeyID` varchar(30) DEFAULT NULL,
  `File` longblob,
  `ImgType` varchar(20) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table UserGoldenNumber
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserGoldenNumber`;

CREATE TABLE `UserGoldenNumber` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ActualNumber` varchar(25) DEFAULT NULL,
  `GoldenNumber` varchar(25) DEFAULT NULL,
  `Alphabets` varchar(255) DEFAULT NULL,
  `Number` varchar(25) DEFAULT NULL,
  `Available` varchar(25) DEFAULT NULL,
  `Status` int(1) DEFAULT '0',
  `OID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table UserLang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserLang`;

CREATE TABLE `UserLang` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `OID` varchar(20) DEFAULT NULL,
  `LanguageID` int(2) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table vendors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `vendorid` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `vendorname` varchar(12) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`vendorid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table VirtualSites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VirtualSites`;

CREATE TABLE `VirtualSites` (
  `SiteID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SiteID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table VisaID
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VisaID`;

CREATE TABLE `VisaID` (
  `ID` int(5) DEFAULT NULL,
  `OID` varchar(20) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table voicemail_messagesnew
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voicemail_messagesnew`;

CREATE TABLE `voicemail_messagesnew` (
  `dir` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msgnum` int(4) NOT NULL DEFAULT '0',
  `context` char(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `macrocontext` char(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callerid` char(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origtime` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `recording` blob,
  `flag` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailboxuser` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailboxcontext` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg_id` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dir`,`msgnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table voicemail_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voicemail_users`;

CREATE TABLE `voicemail_users` (
  `uniqueid` double NOT NULL AUTO_INCREMENT,
  `customer_id` decimal(11,0) NOT NULL DEFAULT '0',
  `context` varchar(50) NOT NULL DEFAULT 'super-phone',
  `mailbox` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '0',
  `fullname` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `pager` varchar(50) NOT NULL DEFAULT '',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msg_id` varchar(40) DEFAULT NULL,
  `mailboxuser` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `mailbox_context` (`mailbox`,`context`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table voicemessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voicemessages`;

CREATE TABLE `voicemessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgnum` int(11) NOT NULL DEFAULT '0',
  `dir` varchar(80) DEFAULT '',
  `context` varchar(80) DEFAULT '',
  `macrocontext` varchar(80) DEFAULT '',
  `callerid` varchar(40) DEFAULT '',
  `origtime` varchar(40) DEFAULT '',
  `duration` varchar(20) DEFAULT '',
  `mailboxuser` varchar(80) DEFAULT '',
  `mailboxcontext` varchar(80) DEFAULT '',
  `recording` longblob,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` int(1) DEFAULT '0',
  `flag` varchar(8) DEFAULT NULL,
  `msg_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dir` (`dir`),
  KEY `mailboxuser` (`mailboxuser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table voicemessages_new
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voicemessages_new`;

CREATE TABLE `voicemessages_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgnum` int(11) NOT NULL DEFAULT '0',
  `dir` varchar(80) DEFAULT '',
  `context` varchar(80) DEFAULT '',
  `macrocontext` varchar(80) DEFAULT '',
  `callerid` varchar(40) DEFAULT '',
  `origtime` varchar(40) DEFAULT '',
  `duration` varchar(20) DEFAULT '',
  `mailboxuser` varchar(80) DEFAULT '',
  `mailboxcontext` varchar(80) DEFAULT '',
  `recording` longblob,
  PRIMARY KEY (`id`),
  KEY `dir` (`dir`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table voicemessages_newold
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voicemessages_newold`;

CREATE TABLE `voicemessages_newold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgnum` int(11) NOT NULL DEFAULT '0',
  `dir` varchar(80) DEFAULT '',
  `context` varchar(80) DEFAULT '',
  `macrocontext` varchar(80) DEFAULT '',
  `callerid` varchar(40) DEFAULT '',
  `origtime` varchar(40) DEFAULT '',
  `duration` varchar(20) DEFAULT '',
  `mailboxuser` varchar(80) DEFAULT '',
  `mailboxcontext` varchar(80) DEFAULT '',
  `recording` longblob,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dir` (`dir`),
  KEY `mailboxuser` (`mailboxuser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table VPBX
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VPBX`;

CREATE TABLE `VPBX` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `Dial` int(1) DEFAULT '0',
  `Exten` varchar(50) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `SiteID` varchar(100) DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `DID` varchar(20) DEFAULT NULL,
  `IVRID` int(3) DEFAULT '0',
  `RingTo` text,
  `CallRate` double DEFAULT '0',
  UNIQUE KEY `ID` (`ID`),
  KEY `OID` (`OID`),
  KEY `DID` (`DID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table vpldetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vpldetail`;

CREATE TABLE `vpldetail` (
  `OID` varchar(10) NOT NULL DEFAULT '',
  `VPLNo` varchar(30) DEFAULT NULL,
  `MAC` varchar(20) DEFAULT NULL,
  `SNo` varchar(20) DEFAULT NULL,
  `VID` varchar(20) DEFAULT NULL,
  `VPass` varchar(20) DEFAULT NULL,
  `CycleDate` date DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `AccountNo` varchar(20) DEFAULT NULL,
  `VMPin` varchar(20) DEFAULT NULL,
  `Plan` varchar(100) DEFAULT NULL,
  `Status` varchar(4) DEFAULT NULL,
  `NewSite` tinyint(1) NOT NULL DEFAULT '0',
  `VEmail` varchar(60) DEFAULT NULL,
  `DeviceName` varchar(20) DEFAULT 'CISCO ATA186',
  `IsSecondPort` varchar(6) DEFAULT '0',
  `PlanID` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table VPLFollowMe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VPLFollowMe`;

CREATE TABLE `VPLFollowMe` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `DID` char(25) DEFAULT NULL,
  `OID` varchar(15) DEFAULT NULL,
  `Follow` varchar(255) DEFAULT NULL,
  `Prio` int(2) DEFAULT '0',
  `Date` datetime DEFAULT NULL,
  `DialStatus` varchar(20) DEFAULT NULL,
  `FollowDialString` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table VPLServices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VPLServices`;

CREATE TABLE `VPLServices` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `ServiceID` int(2) DEFAULT NULL,
  `OID` varchar(10) DEFAULT '0',
  `SiteID` varchar(50) DEFAULT NULL,
  `IsService` int(2) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `referQTY` int(2) DEFAULT '0',
  `PaymentBefore` varchar(10) DEFAULT '0',
  `Description` varchar(255) DEFAULT NULL,
  `isServiceWL` char(2) DEFAULT '1',
  `fdefault` char(2) DEFAULT '1',
  `isNew` char(2) DEFAULT '0',
  `logoname` varchar(15) DEFAULT NULL,
  `carrier` varchar(5) DEFAULT NULL,
  `Prio` int(1) DEFAULT '6',
  PRIMARY KEY (`ID`),
  KEY `IsService` (`IsService`),
  KEY `IsServiceWL` (`isServiceWL`),
  KEY `SiteID` (`SiteID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table WLServices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `WLServices`;

CREATE TABLE `WLServices` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ServiceCode` int(2) DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `SiteID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table WLUser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `WLUser`;

CREATE TABLE `WLUser` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `UID` varchar(50) DEFAULT NULL,
  `SiteName` varchar(50) DEFAULT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Balance` bigint(10) DEFAULT '0',
  `suspenddays` int(2) DEFAULT '0',
  `terminatedays` int(2) DEFAULT '0',
  `LoginWOC` int(2) DEFAULT '1',
  `BuyWOC` int(2) DEFAULT '0',
  `CCDeclineFee` int(2) DEFAULT '1',
  `TryFreeWOC` int(2) DEFAULT '1',
  `referfriendtext` varchar(255) DEFAULT 'Help your friends get on Site.',
  `SusAmount` double DEFAULT '0',
  `InvoiceDays` int(2) DEFAULT '1',
  `GraceAfterSus` int(2) DEFAULT '0',
  `SusAfterDue` int(2) DEFAULT '0',
  `ChargeBeforeDue` int(2) DEFAULT '0',
  `Daysb4Cycle` int(2) DEFAULT '1',
  `isAllVendor` varchar(50) DEFAULT '-1',
  `vendor` varchar(50) DEFAULT '-1',
  `searchopt` varchar(5) DEFAULT '1',
  `searchbox` varchar(5) DEFAULT '1',
  `isplan` char(2) DEFAULT '1',
  `multipleEmail` char(2) DEFAULT '0',
  `ShowFreeMin` int(2) DEFAULT '1' COMMENT 'Show Free Min on Client Side PurchaseDID.php',
  `UnConfRel` int(1) DEFAULT '0',
  `Country` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Contact` varchar(100) DEFAULT NULL,
  `WAddress` varchar(255) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table YearlyByOID
# ------------------------------------------------------------

DROP TABLE IF EXISTS `YearlyByOID`;

CREATE TABLE `YearlyByOID` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `OID` varchar(15) DEFAULT NULL,
  `Amount` double DEFAULT '0',
  `Type` int(2) DEFAULT '0',
  `Date` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table YearlyStat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `YearlyStat`;

CREATE TABLE `YearlyStat` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Year` int(2) DEFAULT '0',
  `Month` char(2) DEFAULT NULL,
  `Date` varchar(7) DEFAULT NULL,
  `Amount` double DEFAULT '0',
  `PAmount` int(11) DEFAULT '0',
  `Report` varchar(25) DEFAULT NULL,
  `Amount2` double DEFAULT '0',
  `Prio` int(1) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ZoneMatch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ZoneMatch`;

CREATE TABLE `ZoneMatch` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Zone` int(2) DEFAULT NULL,
  `Rating` int(2) DEFAULT NULL,
  `SiteID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




--
-- Dumping routines (PROCEDURE) for database 'virtual'
--
DELIMITER ;;

# Dump of PROCEDURE GetTodayCallLogs
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetTodayCallLogs` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
# Dump of PROCEDURE GetYesterdayCallLogs
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetYesterdayCallLogs` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
