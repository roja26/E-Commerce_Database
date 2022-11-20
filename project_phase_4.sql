DROP DATABASE IF EXISTS TEAM_15;
CREATE DATABASE TEAM_15;
USE TEAM_15;

DROP TABLE IF EXISTS `Employees`;
CREATE TABLE `Employees` (
  `E_EID` varchar(30) NOT NULL,
  `E_AID` varchar(12) NOT NULL,
  `E_Pos` varchar(30) NOT NULL,
  `E_Fname` varchar(50) NOT NULL,
  `E_Lname` varchar(50) NOT NULL,
  `Mgr_EID` varchar(30),
  PRIMARY KEY(`E_EID`),
  FOREIGN KEY(`Mgr_EID`) REFERENCES `Employees`(`E_EID`)
);

DROP TABLE IF EXISTS `Employee_Phone`;
CREATE TABLE `Employee_Phone` (
  `E_EID` varchar(30) NOT NULL,
  `E_Ph` varchar(10) NOT NULL,
  FOREIGN KEY(`E_EID`) REFERENCES `Employees`(`E_EID`)
);

DROP TABLE IF EXISTS `Vendor`;
CREATE TABLE `Vendor` (
  `V_GSTIN` varchar(30) NOT NULL,
  `V_Phone_No` varchar(10) NOT NULL,
  `V_Email` varchar(30) NOT NULL,
  `V_Fname` varchar(30) NOT NULL,
  `V_Lname` varchar(30) NOT NULL,
  PRIMARY KEY(`V_GSTIN`)
);

DROP TABLE IF EXISTS `Items`;
CREATE TABLE `Items` (
  `I_Pid` varchar(30) NOT NULL,
  `I_Vendor` varchar(30) NOT NULL,
  `I_Price` real NOT NULL,
  `I_Quantity` int NOT NULL,
  PRIMARY KEY(`I_Pid`),
  FOREIGN KEY(`I_Vendor`) REFERENCES `Vendor`(`V_GSTIN`)
);

DROP TABLE IF EXISTS `Items_info`;
CREATE TABLE `Items_info` (
  `I_Pid` varchar(30) NOT NULL,
  `I_Rating` int(2),
  `I_Review` varchar(255),
  `I_Name` varchar(255) NOT NULL,
  `I_Specs` varchar(255),
  FOREIGN KEY(`I_Pid`) REFERENCES `Items`(`I_Pid`)
);

DROP TABLE IF EXISTS `Items_Tags`;
CREATE TABLE `Items_Tags` (
  `I_Pid` varchar(30) NOT NULL,
  `I_Tags` varchar(30) NOT NULL,
  FOREIGN KEY(`I_Pid`) REFERENCES `Items`(`I_Pid`)
);

DROP TABLE IF EXISTS `Warehouse_Address`;
CREATE TABLE `Warehouse_Address` (
  `W_Pin_Code` varchar(6) NOT NULL,
  `W_City` varchar(20) NOT NULL,
  `W_State` varchar(10) NOT NULL,
  PRIMARY KEY(`W_PIN_Code`)
);

DROP TABLE IF EXISTS `Warehouse`;
CREATE TABLE `Warehouse` (
  `W_ID` varchar(30) NOT NULL,
  `W_Street_No` varchar(50) NOT NULL,
  `W_Pin_Code` varchar(6) NOT NULL,
  `W_Capacity` int NOT NULL,
  PRIMARY KEY(`W_ID`),
  FOREIGN KEY(`W_Pin_Code`) REFERENCES `Warehouse_Address`(`W_Pin_Code`)
);

DROP TABLE IF EXISTS `Customers_Address`;
CREATE TABLE `Customers_Address` (
  `C_Pin_Code` int(6) NOT NULL,
  `C_City` varchar(20) NOT NULL,
  `C_State` varchar(10) NOT NULL,
  PRIMARY KEY(`C_PIN_Code`)
);

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `C_Email` varchar(30) NOT NULL,
  `C_Password` varchar(30) NOT NULL,
  `C_Fname` varchar(30) NOT NULL,
  `C_Lname` varchar(30) NOT NULL,
  `C_Street_No` varchar(50) NOT NULL,
  `C_Pin_Code` int(6) NOT NULL,
  PRIMARY KEY(`C_Email`),
  FOREIGN KEY(`C_Pin_Code`) REFERENCES `Customers_Address`(`C_Pin_Code`)
);

DROP TABLE IF EXISTS `Customers_Phone`;
CREATE TABLE `Customers_Phone` (
  `C_Email` varchar(30) NOT NULL,
  `C_Ph` varchar(10) NOT NULL,
  FOREIGN KEY(`C_Email`) REFERENCES `Customers`(`C_Email`)
);

DROP TABLE IF EXISTS `Orders_ETA`;
CREATE TABLE `Orders_ETA` (
  `O_ETA` date NOT NULL,
  `O_Status` varchar(30) NOT NULL,
  PRIMARY KEY(`O_ETA`)
);

DROP TABLE IF EXISTS `Orders_Address`;
CREATE TABLE `Orders_Address` (
  `O_Pin_Code` int(6) NOT NULL,
  `O_City` varchar(20) NOT NULL,
  `O_State` varchar(10) NOT NULL,
  PRIMARY KEY(`O_Pin_Code`)
);

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
  `O_Id` varchar(30) NOT NULL,
  `O_CEmail` varchar(30) NOT NULL,
  `O_Street_No` varchar(50) NOT NULL,
  `O_Pin_Code` int(6) NOT NULL,
  `O_Date` date NOT NULL,
  PRIMARY KEY(`O_Id`),
  FOREIGN KEY(`O_CEmail`) REFERENCES `Customers`(`C_Email`),
  FOREIGN KEY(`O_Pin_Code`) REFERENCES `Orders_Address`(`O_Pin_Code`)
);

DROP TABLE IF EXISTS `Orders_Id`;
CREATE TABLE `Orders_Id` (
  `O_Id` varchar(30) NOT NULL,
  `O_Price` real NOT NULL,
  `O_ETA` date NOT NULL,
  FOREIGN KEY(`O_Id`) REFERENCES `Orders`(`O_Id`),
  FOREIGN KEY(`O_ETA`) REFERENCES `Orders_ETA`(`O_ETA`)
);

DROP TABLE IF EXISTS `Ordered_In`;
CREATE TABLE `Ordered_In` (
  `I_Pid` varchar(30) NOT NULL,
  `O_Id` varchar(30) NOT NULL,
  `Units_sold` int NOT NULL,
  FOREIGN KEY(`I_Pid`) REFERENCES `Items`(`I_Pid`),
  FOREIGN KEY(`O_Id`) REFERENCES `Orders`(`O_Id`)
);

DROP TABLE IF EXISTS `Sent_To`;
CREATE TABLE `Sent_To` (
  `I_Pid` varchar(30) NOT NULL,
  `V_GSTIN` varchar(30) NOT NULL,
  `W_ID` varchar(30) NOT NULL,
  FOREIGN KEY(`I_Pid`) REFERENCES `Items`(`I_Pid`),
  FOREIGN KEY(`V_GSTIN`) REFERENCES `Vendor`(`V_GSTIN`),
  FOREIGN KEY(`W_ID`) REFERENCES `Warehouse`(`W_ID`)
);

DROP TABLE IF EXISTS `Handling`;
CREATE TABLE `Handling` (
  `E_EID` varchar(30) NOT NULL,
  `O_Id` varchar(30) NOT NULL,
  `W_ID` varchar(30) NOT NULL,
  FOREIGN KEY(`E_EID`) REFERENCES `Employees`(`E_EID`),
  FOREIGN KEY(`O_Id`) REFERENCES `Orders`(`O_Id`),
  FOREIGN KEY(`W_ID`) REFERENCES `Warehouse`(`W_ID`)
);

DROP TABLE IF EXISTS `Delivered_to`;
CREATE TABLE `Delivered_to` (
  `C_Email` varchar(30) NOT NULL,
  `O_Id` varchar(30) NOT NULL,
  `W_ID` varchar(30) NOT NULL,
  FOREIGN KEY(`C_Email`) REFERENCES `Customers`(`C_Email`),
  FOREIGN KEY(`O_Id`) REFERENCES `Orders`(`O_Id`),
  FOREIGN KEY(`W_ID`) REFERENCES `Warehouse`(`W_ID`)
);
