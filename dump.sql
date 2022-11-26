-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: TEAM_15
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customers`
--

DROP DATABASE IF EXISTS TEAM_15;
CREATE DATABASE TEAM_15;
USE TEAM_15;

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `C_Email` varchar(50) NOT NULL,
  `C_Password` varchar(50) NOT NULL,
  `C_Fname` varchar(50) NOT NULL,
  `C_Lname` varchar(50) NOT NULL,
  `C_Street_No` varchar(50) NOT NULL,
  `C_Pin_Code` int NOT NULL,
  PRIMARY KEY (`C_Email`),
  KEY `C_Pin_Code` (`C_Pin_Code`),
  CONSTRAINT `Customers_ibfk_1` FOREIGN KEY (`C_Pin_Code`) REFERENCES `Customers_Address` (`C_Pin_Code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES ('adyansh.kakran@gmail.com','password','Adyansh','Kakran','35',500032),('hello.ta@gmail.com','evaltimes','Good','Morning','69',696969),('jaikar.sai@gmail.com','passywordy','Jaikar','Muppidi','7',540045),('lakshmi.sahoo@gmail.com','lakshmilakshmi','Roja','Sahoo','4',560030),('pavan.pachava@gmail.com','pavanchutiya','Pavan','Pachava','45',590021),('thegreataayush01@gmail.com','P4ssword123','Aayush','Acharya','12',560035);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers_Address`
--

DROP TABLE IF EXISTS `Customers_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers_Address` (
  `C_Pin_Code` int NOT NULL,
  `C_City` varchar(50) NOT NULL,
  `C_State` varchar(50) NOT NULL,
  PRIMARY KEY (`C_Pin_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers_Address`
--

LOCK TABLES `Customers_Address` WRITE;
/*!40000 ALTER TABLE `Customers_Address` DISABLE KEYS */;
INSERT INTO `Customers_Address` VALUES (500032,'Dehradun','Uttarakhand'),(540045,'Hyderabad','Andhra'),(560030,'Bangalore','Karnataka'),(560035,'Bangalore','Karnataka'),(590021,'Chennai','Tamil Nadu'),(696969,'Workspace','Vindhya');
/*!40000 ALTER TABLE `Customers_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers_Phone`
--

DROP TABLE IF EXISTS `Customers_Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers_Phone` (
  `C_Email` varchar(50) NOT NULL,
  `C_Ph` varchar(10) NOT NULL,
  KEY `C_Email` (`C_Email`),
  CONSTRAINT `Customers_Phone_ibfk_1` FOREIGN KEY (`C_Email`) REFERENCES `Customers` (`C_Email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers_Phone`
--

LOCK TABLES `Customers_Phone` WRITE;
/*!40000 ALTER TABLE `Customers_Phone` DISABLE KEYS */;
INSERT INTO `Customers_Phone` VALUES ('thegreataayush01@gmail.com','7020085098'),('adyansh.kakran@gmail.com','123456789'),('adyansh.kakran@gmail.com','8218515487'),('lakshmi.sahoo@gmail.com','7259237077'),('lakshmi.sahoo@gmail.com','9611195228'),('lakshmi.sahoo@gmail.com','9487852239'),('jaikar.sai@gmail.com','9618370176'),('pavan.pachava@gmail.com','9434557689'),('pavan.pachava@gmail.com','9232453337'),('hello.ta@gmail.com','1234987655');
/*!40000 ALTER TABLE `Customers_Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivered_to`
--

DROP TABLE IF EXISTS `Delivered_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivered_to` (
  `C_Email` varchar(50) NOT NULL,
  `O_Id` varchar(50) NOT NULL,
  `W_ID` varchar(50) NOT NULL,
  KEY `C_Email` (`C_Email`),
  KEY `O_Id` (`O_Id`),
  KEY `W_ID` (`W_ID`),
  CONSTRAINT `Delivered_to_ibfk_1` FOREIGN KEY (`C_Email`) REFERENCES `Customers` (`C_Email`) ON DELETE CASCADE,
  CONSTRAINT `Delivered_to_ibfk_2` FOREIGN KEY (`O_Id`) REFERENCES `Orders` (`O_Id`) ON DELETE CASCADE,
  CONSTRAINT `Delivered_to_ibfk_3` FOREIGN KEY (`W_ID`) REFERENCES `Warehouse` (`W_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivered_to`
--

LOCK TABLES `Delivered_to` WRITE;
/*!40000 ALTER TABLE `Delivered_to` DISABLE KEYS */;
INSERT INTO `Delivered_to` VALUES ('pavan.pachava@gmail.com','o1','w1'),('thegreataayush01@gmail.com','o2','w2'),('lakshmi.sahoo@gmail.com','o3','w3'),('hello.ta@gmail.com','o4','w4'),('adyansh.kakran@gmail.com','o5','w5');
/*!40000 ALTER TABLE `Delivered_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Phone`
--

DROP TABLE IF EXISTS `Employee_Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_Phone` (
  `E_EID` varchar(50) NOT NULL,
  `E_Ph` varchar(10) NOT NULL,
  KEY `E_EID` (`E_EID`),
  CONSTRAINT `Employee_Phone_ibfk_1` FOREIGN KEY (`E_EID`) REFERENCES `Employees` (`E_EID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Phone`
--

LOCK TABLES `Employee_Phone` WRITE;
/*!40000 ALTER TABLE `Employee_Phone` DISABLE KEYS */;
INSERT INTO `Employee_Phone` VALUES ('e1','9565656565'),('e2','9121212121'),('e3','9474747474'),('e4','9078664753'),('e5','9099999999');
/*!40000 ALTER TABLE `Employee_Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `E_EID` varchar(50) NOT NULL,
  `E_AID` varchar(12) NOT NULL,
  `E_Pos` varchar(50) NOT NULL,
  `E_Fname` varchar(50) NOT NULL,
  `E_Lname` varchar(50) NOT NULL,
  `Mgr_EID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`E_EID`),
  KEY `Mgr_EID` (`Mgr_EID`),
  CONSTRAINT `Employees_ibfk_1` FOREIGN KEY (`Mgr_EID`) REFERENCES `Employees` (`E_EID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES ('e1','123456789876','Manager','Mister','Incredible',NULL),('e2','234567891234','Manager','Mrs','Incredible','e1'),('e3','345678912345','Employee','Dash','Parr','e2'),('e4','456789123456','Employee','Violet','Parr','e2'),('e5','867485945362','Employee','Jack-Jack','Parr','e2');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Handling`
--

DROP TABLE IF EXISTS `Handling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Handling` (
  `E_EID` varchar(50) NOT NULL,
  `O_Id` varchar(50) NOT NULL,
  `W_ID` varchar(50) NOT NULL,
  KEY `E_EID` (`E_EID`),
  KEY `O_Id` (`O_Id`),
  KEY `W_ID` (`W_ID`),
  CONSTRAINT `Handling_ibfk_1` FOREIGN KEY (`E_EID`) REFERENCES `Employees` (`E_EID`) ON DELETE CASCADE,
  CONSTRAINT `Handling_ibfk_2` FOREIGN KEY (`O_Id`) REFERENCES `Orders` (`O_Id`) ON DELETE CASCADE,
  CONSTRAINT `Handling_ibfk_3` FOREIGN KEY (`W_ID`) REFERENCES `Warehouse` (`W_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Handling`
--

LOCK TABLES `Handling` WRITE;
/*!40000 ALTER TABLE `Handling` DISABLE KEYS */;
INSERT INTO `Handling` VALUES ('e1','o1','w1'),('e2','o2','w2'),('e3','o3','w3'),('e4','o4','w4'),('e5','o5','w5');
/*!40000 ALTER TABLE `Handling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items` (
  `I_Pid` varchar(50) NOT NULL,
  `I_Vendor` varchar(50) NOT NULL,
  `I_Price` double NOT NULL,
  `I_Quantity` int NOT NULL,
  PRIMARY KEY (`I_Pid`),
  KEY `I_Vendor` (`I_Vendor`),
  CONSTRAINT `Items_ibfk_1` FOREIGN KEY (`I_Vendor`) REFERENCES `Vendor` (`V_GSTIN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
INSERT INTO `Items` VALUES ('i1','a2',26000,70),('i2','a1',8999,200),('i3','a3',157.85,40),('i4','a5',1067.69,60),('i5','a4',35000,47);
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items_Tags`
--

DROP TABLE IF EXISTS `Items_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items_Tags` (
  `I_Pid` varchar(50) NOT NULL,
  `I_Tags` varchar(50) NOT NULL,
  KEY `I_Pid` (`I_Pid`),
  CONSTRAINT `Items_Tags_ibfk_1` FOREIGN KEY (`I_Pid`) REFERENCES `Items` (`I_Pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items_Tags`
--

LOCK TABLES `Items_Tags` WRITE;
/*!40000 ALTER TABLE `Items_Tags` DISABLE KEYS */;
INSERT INTO `Items_Tags` VALUES ('i1','Gaming'),('i1','144 Hz'),('i1','HDMI Connected'),('i1','LG Ultra gear'),('i2','Bluetooth'),('i2','JBL'),('i2','Headphone'),('i3','Cipla'),('i3','Inhaler'),('i4','Milton'),('i4','Thermos'),('i5','Electric Guitar'),('i5','Fender Stratocaster');
/*!40000 ALTER TABLE `Items_Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items_info`
--

DROP TABLE IF EXISTS `Items_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items_info` (
  `I_Pid` varchar(50) NOT NULL,
  `I_Rating` int DEFAULT NULL,
  `I_Review` varchar(255) DEFAULT NULL,
  `I_Name` varchar(255) NOT NULL,
  `I_Specs` varchar(255) DEFAULT NULL,
  KEY `I_Pid` (`I_Pid`),
  CONSTRAINT `Items_info_ibfk_1` FOREIGN KEY (`I_Pid`) REFERENCES `Items` (`I_Pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items_info`
--

LOCK TABLES `Items_info` WRITE;
/*!40000 ALTER TABLE `Items_info` DISABLE KEYS */;
INSERT INTO `Items_info` VALUES ('i1',9,'very good','Monitor','144 Hz, 24in, Gaming Monitor'),('i2',7,'very nice ','JBL Headphones','Wireless, Bluetooth 5.0, Over ear'),('i3',10,'i can breathe','Asthalin Inhaler','140 uses, Salbutamol Inhalation IP'),('i4',9,'water cold and warm','Milton Thermos','1L capacity, thermal conduction'),('i5',10,'good sound','Fender Stratocaster','Electric guitar, Fender Stratocaster, Tuner included');
/*!40000 ALTER TABLE `Items_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ordered_In`
--

DROP TABLE IF EXISTS `Ordered_In`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ordered_In` (
  `I_Pid` varchar(50) NOT NULL,
  `O_Id` varchar(50) NOT NULL,
  `Units_sold` int NOT NULL,
  KEY `I_Pid` (`I_Pid`),
  KEY `O_Id` (`O_Id`),
  CONSTRAINT `Ordered_In_ibfk_1` FOREIGN KEY (`I_Pid`) REFERENCES `Items` (`I_Pid`) ON DELETE CASCADE,
  CONSTRAINT `Ordered_In_ibfk_2` FOREIGN KEY (`O_Id`) REFERENCES `Orders` (`O_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordered_In`
--

LOCK TABLES `Ordered_In` WRITE;
/*!40000 ALTER TABLE `Ordered_In` DISABLE KEYS */;
INSERT INTO `Ordered_In` VALUES ('i1','o1',20),('i2','o2',123),('i3','o3',4),('i4','o4',2),('i5','o5',1);
/*!40000 ALTER TABLE `Ordered_In` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `O_Id` varchar(50) NOT NULL,
  `O_CEmail` varchar(50) NOT NULL,
  `O_Street_No` varchar(50) NOT NULL,
  `O_Pin_Code` int NOT NULL,
  `O_Date` date NOT NULL,
  PRIMARY KEY (`O_Id`),
  KEY `O_CEmail` (`O_CEmail`),
  KEY `O_Pin_Code` (`O_Pin_Code`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`O_CEmail`) REFERENCES `Customers` (`C_Email`) ON DELETE CASCADE,
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`O_Pin_Code`) REFERENCES `Orders_Address` (`O_Pin_Code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES ('o1','pavan.pachava@gmail.com','45',590021,'2022-10-12'),('o2','thegreataayush01@gmail.com','12',560035,'2021-08-01'),('o3','lakshmi.sahoo@gmail.com','4',560030,'2022-11-26'),('o4','hello.ta@gmail.com','69',696969,'2022-09-30'),('o5','adyansh.kakran@gmail.com','35',500032,'2021-11-26');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders_Address`
--

DROP TABLE IF EXISTS `Orders_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders_Address` (
  `O_Pin_Code` int NOT NULL,
  `O_City` varchar(50) NOT NULL,
  `O_State` varchar(50) NOT NULL,
  PRIMARY KEY (`O_Pin_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders_Address`
--

LOCK TABLES `Orders_Address` WRITE;
/*!40000 ALTER TABLE `Orders_Address` DISABLE KEYS */;
INSERT INTO `Orders_Address` VALUES (500032,'Dehradun','Uttarakhand'),(560030,'Bangalore','Karnataka'),(560035,'Bangalore','Karnataka'),(590021,'Chennai','Tamil Nadu'),(696969,'Workspace','Vindhya');
/*!40000 ALTER TABLE `Orders_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders_ETA`
--

DROP TABLE IF EXISTS `Orders_ETA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders_ETA` (
  `O_ETA` date NOT NULL,
  `O_Status` varchar(50) NOT NULL,
  PRIMARY KEY (`O_ETA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders_ETA`
--

LOCK TABLES `Orders_ETA` WRITE;
/*!40000 ALTER TABLE `Orders_ETA` DISABLE KEYS */;
INSERT INTO `Orders_ETA` VALUES ('2021-08-04','Cancelled'),('2021-11-29','Cancelled'),('2022-10-03','Delivered'),('2022-10-15','Delivered'),('2022-11-29','Arriving');
/*!40000 ALTER TABLE `Orders_ETA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders_Id`
--

DROP TABLE IF EXISTS `Orders_Id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders_Id` (
  `O_Id` varchar(50) NOT NULL,
  `O_Price` double NOT NULL,
  `O_ETA` date NOT NULL,
  KEY `O_Id` (`O_Id`),
  KEY `O_ETA` (`O_ETA`),
  CONSTRAINT `Orders_Id_ibfk_1` FOREIGN KEY (`O_Id`) REFERENCES `Orders` (`O_Id`) ON DELETE CASCADE,
  CONSTRAINT `Orders_Id_ibfk_2` FOREIGN KEY (`O_ETA`) REFERENCES `Orders_ETA` (`O_ETA`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders_Id`
--

LOCK TABLES `Orders_Id` WRITE;
/*!40000 ALTER TABLE `Orders_Id` DISABLE KEYS */;
INSERT INTO `Orders_Id` VALUES ('o1',26000,'2022-10-15'),('o2',8999,'2021-08-04'),('o3',157.85,'2022-11-29'),('o4',2000,'2022-10-03'),('o5',35000,'2021-11-29');
/*!40000 ALTER TABLE `Orders_Id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sent_To`
--

DROP TABLE IF EXISTS `Sent_To`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sent_To` (
  `I_Pid` varchar(50) NOT NULL,
  `V_GSTIN` varchar(50) NOT NULL,
  `W_ID` varchar(50) NOT NULL,
  KEY `I_Pid` (`I_Pid`),
  KEY `V_GSTIN` (`V_GSTIN`),
  KEY `W_ID` (`W_ID`),
  CONSTRAINT `Sent_To_ibfk_1` FOREIGN KEY (`I_Pid`) REFERENCES `Items` (`I_Pid`) ON DELETE CASCADE,
  CONSTRAINT `Sent_To_ibfk_2` FOREIGN KEY (`V_GSTIN`) REFERENCES `Vendor` (`V_GSTIN`) ON DELETE CASCADE,
  CONSTRAINT `Sent_To_ibfk_3` FOREIGN KEY (`W_ID`) REFERENCES `Warehouse` (`W_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sent_To`
--

LOCK TABLES `Sent_To` WRITE;
/*!40000 ALTER TABLE `Sent_To` DISABLE KEYS */;
INSERT INTO `Sent_To` VALUES ('i1','a2','w1'),('i2','a1','w2'),('i3','a3','w3'),('i4','a5','w4'),('i5','a4','w5');
/*!40000 ALTER TABLE `Sent_To` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendor` (
  `V_GSTIN` varchar(50) NOT NULL,
  `V_Phone_No` varchar(10) NOT NULL,
  `V_Email` varchar(50) NOT NULL,
  `V_Fname` varchar(50) NOT NULL,
  `V_Lname` varchar(50) NOT NULL,
  PRIMARY KEY (`V_GSTIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor`
--

LOCK TABLES `Vendor` WRITE;
/*!40000 ALTER TABLE `Vendor` DISABLE KEYS */;
INSERT INTO `Vendor` VALUES ('a1','9876543211','vendor.one@gmail.com','Ananth','Muppidi'),('a2','9785674328','vendor.two@gmail.com','Clue','Less'),('a3','9454545453','vendor.three@gmail.com','Siddharth','Mangipudi'),('a4','9087767564','vendor.four@gmail.com','I\'m','Bored'),('a5','9999999999','vendor.five@gmail.com','JJ','Olatunji');
/*!40000 ALTER TABLE `Vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse`
--

DROP TABLE IF EXISTS `Warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Warehouse` (
  `W_ID` varchar(50) NOT NULL,
  `W_Street_No` varchar(50) NOT NULL,
  `W_Pin_Code` varchar(6) NOT NULL,
  `W_Capacity` int NOT NULL,
  PRIMARY KEY (`W_ID`),
  KEY `W_Pin_Code` (`W_Pin_Code`),
  CONSTRAINT `Warehouse_ibfk_1` FOREIGN KEY (`W_Pin_Code`) REFERENCES `Warehouse_Address` (`W_Pin_Code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse`
--

LOCK TABLES `Warehouse` WRITE;
/*!40000 ALTER TABLE `Warehouse` DISABLE KEYS */;
INSERT INTO `Warehouse` VALUES ('w1','3','560035',40000),('w2','69','696969',5000000),('w3','69','123456',696969),('w4','34','540034',50000),('w5','21','500032',3000),('w6','69','696969',400000);
/*!40000 ALTER TABLE `Warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse_Address`
--

DROP TABLE IF EXISTS `Warehouse_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Warehouse_Address` (
  `W_Pin_Code` varchar(6) NOT NULL,
  `W_City` varchar(50) NOT NULL,
  `W_State` varchar(50) NOT NULL,
  PRIMARY KEY (`W_Pin_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse_Address`
--

LOCK TABLES `Warehouse_Address` WRITE;
/*!40000 ALTER TABLE `Warehouse_Address` DISABLE KEYS */;
INSERT INTO `Warehouse_Address` VALUES ('123456','New York','New York'),('500032','Hyderabad','Telangana'),('540034','Chennai','Tamil Nadu'),('560035','Bangalore','Karnataka'),('696969','Hyderabad','Telangana');
/*!40000 ALTER TABLE `Warehouse_Address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27  0:39:12
