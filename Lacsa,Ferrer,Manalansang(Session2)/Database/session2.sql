-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2024 at 07:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `session2`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetgroups`
--

CREATE TABLE `assetgroups` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `assetgroups`
--

INSERT INTO `assetgroups` (`ID`, `Name`) VALUES
(1, 'Hydraulic'),
(2, 'Pneumatic'),
(3, 'Electrical'),
(4, 'Mechanical '),
(5, 'Fixed/Stationary'),
(6, 'Facility'),
(7, 'Buildings');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `ID` bigint(20) NOT NULL,
  `AssetSN` varchar(20) NOT NULL,
  `AssetName` varchar(150) NOT NULL,
  `DepartmentLocationID` bigint(20) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL,
  `AssetGroupID` bigint(20) NOT NULL,
  `Description` text NOT NULL,
  `WarrantyDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`ID`, `AssetSN`, `AssetName`, `DepartmentLocationID`, `EmployeeID`, `AssetGroupID`, `Description`, `WarrantyDate`) VALUES
(1, '05/04/0001', 'Toyota Hilux FAF321', 3, 8, 4, '', NULL),
(2, '04/03/0001', 'Suction Line 852', 7, 8, 3, '', '2020-03-02'),
(3, '01/01/0001', 'ZENY 3,5CFM Single-Stage 5 Pa Rotary Vane', 11, 1, 1, '', '2018-01-17'),
(4, '05/04/0002', 'Volvo FH16', 4, 8, 4, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `changedparts`
--

CREATE TABLE `changedparts` (
  `ID` bigint(20) NOT NULL,
  `EmergencyMaintenanceID` bigint(20) NOT NULL,
  `PartID` bigint(20) NOT NULL,
  `Amount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `changedparts`
--

INSERT INTO `changedparts` (`ID`, `EmergencyMaintenanceID`, `PartID`, `Amount`) VALUES
(1, 3, 5, 1.00),
(2, 1, 1, 1.00),
(3, 2, 1, 22.00),
(4, 4, 2, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `departmentlocations`
--

CREATE TABLE `departmentlocations` (
  `ID` bigint(20) NOT NULL,
  `DepartmentID` bigint(20) NOT NULL,
  `LocationID` bigint(20) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `departmentlocations`
--

INSERT INTO `departmentlocations` (`ID`, `DepartmentID`, `LocationID`, `StartDate`, `EndDate`) VALUES
(1, 6, 3, '2010-12-28', '2011-01-20'),
(2, 6, 2, '2015-12-27', '2019-08-20'),
(3, 5, 2, '1996-04-29', NULL),
(4, 5, 1, '2002-03-04', NULL),
(5, 5, 1, '1991-03-25', '2001-10-30'),
(6, 4, 3, '2012-05-28', NULL),
(7, 4, 2, '2005-05-04', NULL),
(8, 3, 2, '1992-10-17', NULL),
(9, 3, 3, '2000-01-08', NULL),
(10, 2, 1, '1993-12-25', NULL),
(11, 1, 2, '2005-11-11', NULL),
(12, 1, 2, '1991-01-17', '2000-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`ID`, `Name`) VALUES
(1, 'Exploration'),
(2, 'Production'),
(3, 'Transportation'),
(4, 'R&D'),
(5, 'Distribution'),
(6, 'QHSE');

-- --------------------------------------------------------

--
-- Table structure for table `emergencymaintenances`
--

CREATE TABLE `emergencymaintenances` (
  `ID` bigint(20) NOT NULL,
  `AssetID` bigint(20) NOT NULL,
  `PriorityID` bigint(20) NOT NULL,
  `DescriptionEmergency` varchar(200) NOT NULL,
  `OtherConsiderations` varchar(200) NOT NULL,
  `EMReportDate` date NOT NULL,
  `EMStartDate` date DEFAULT NULL,
  `EMEndDate` date DEFAULT NULL,
  `EMTechnicianNote` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `emergencymaintenances`
--

INSERT INTO `emergencymaintenances` (`ID`, `AssetID`, `PriorityID`, `DescriptionEmergency`, `OtherConsiderations`, `EMReportDate`, `EMStartDate`, `EMEndDate`, `EMTechnicianNote`) VALUES
(1, 1, 2, 'Car does not start', 'none', '2019-08-27', '2019-08-27', NULL, NULL),
(2, 4, 1, 'Perforated tire', 'none', '2019-08-27', '2019-08-27', '1970-01-01', 'dasdas'),
(3, 4, 1, 'Preforated tire', 'none', '2017-09-29', '2017-09-29', '2017-09-29', 'The tire changed'),
(4, 1, 3, 'flat tires', '', '2024-04-13', '2024-04-13', '2024-04-16', 'fix tires.'),
(5, 2, 3, 'flat tires', '', '2024-04-14', '2024-04-14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `ID` bigint(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`ID`, `FirstName`, `LastName`, `Phone`, `isAdmin`, `Username`, `Password`) VALUES
(1, 'Martina', 'Winegarden', '69232044381', NULL, NULL, NULL),
(2, 'Rashida', 'Brammer', '70687629632', NULL, NULL, NULL),
(3, 'Mohamed', 'Krall', '52688435003', NULL, 'mohamed', '1234'),
(4, 'Shante', 'Karr', '73706803851', NULL, NULL, NULL),
(5, 'Rosaura', 'Rames', '70477806324', NULL, NULL, NULL),
(6, 'Toi', 'Courchesne', '37756763508', NULL, NULL, NULL),
(7, 'Precious', 'Wismer', '15287468908', NULL, NULL, NULL),
(8, 'Josefa', 'Otte', '68886927765', NULL, 'josefa', '1324'),
(9, 'Afton', 'Harrington', '41731972558', NULL, NULL, NULL),
(10, 'Daphne', 'Morrow', '49099375842', NULL, NULL, NULL),
(11, 'Dottie', 'Polson', '91205317719', NULL, NULL, NULL),
(12, 'Alleen', 'Nally', '26312971918', NULL, NULL, NULL),
(13, 'Hilton', 'Odom', '66197770749', NULL, NULL, NULL),
(14, 'Shawn', 'Hillebrand', '64091780262', NULL, NULL, NULL),
(15, 'Lorelei', 'Kettler', '73606665126', NULL, NULL, NULL),
(16, 'Jalisa', 'Gossage', '10484197749', NULL, NULL, NULL),
(17, 'Germaine', 'Sim', '62454794026', NULL, NULL, NULL),
(18, 'Suzanna', 'Wollman', '97932678482', NULL, NULL, NULL),
(19, 'Jennette', 'Besse', '26229712670', NULL, NULL, NULL),
(20, 'Margherita', 'Anstine', '87423893204', NULL, NULL, NULL),
(21, 'Earleen', 'Lambright', '64658700776', NULL, NULL, NULL),
(22, 'Lyn', 'Valdivia', '32010885662', 1, 'lyn', '1234'),
(23, 'Alycia', 'Couey', '41716866650', NULL, NULL, NULL),
(24, 'Lewis', 'Rousey', '16716397946', NULL, NULL, NULL),
(25, 'Tanja', 'Profitt', '77230010211', NULL, NULL, NULL),
(26, 'Cherie', 'Whyte', '33510813739', NULL, NULL, NULL),
(27, 'Efren', 'Leaf', '72090665294', NULL, NULL, NULL),
(28, 'Delta', 'Darcangelo', '73136120450', NULL, NULL, NULL),
(29, 'Jess', 'Bodnar', '12207277240', NULL, NULL, NULL),
(30, 'Sudie', 'Parkhurst', '26842289705', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`ID`, `Name`) VALUES
(1, 'Kazan'),
(2, 'Volka'),
(3, 'Moscow');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `EffectiveLife` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`ID`, `Name`, `EffectiveLife`) VALUES
(1, 'BLUE STORM Battery 12V 45Ah 54459', 650),
(2, 'BLUE STORM Battery 12V 70Ah 80D26L', 700),
(3, 'CT20 Turbo Turbocharger', NULL),
(5, 'michelin tyres   525/60 ZR 20.5', 1000),
(6, 'MOCA Engine Timing Chain Kit ', NULL),
(7, 'CT16V Turbo Cartridge Core', NULL),
(8, 'iFJF 21100-35520 New Carburetor', NULL),
(9, 'ALAVENTE 21100-35463 Carburetor ', NULL),
(11, 'Carter P4594 In-Line Electric Fuel Pump', NULL),
(12, 'Electric Fuel Pump Universal Fuel Pump 12V ', NULL),
(13, 'Gast AT05 Rotary Vane ', NULL),
(14, 'FAN 24\" M480', 200);

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`ID`, `Name`) VALUES
(1, 'General'),
(2, 'High'),
(3, 'Very High');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetgroups`
--
ALTER TABLE `assetgroups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Assets_Employees` (`EmployeeID`),
  ADD KEY `FK_Assets_AssetGroups` (`AssetGroupID`),
  ADD KEY `FK_Assets_DepartmentLocations` (`DepartmentLocationID`);

--
-- Indexes for table `changedparts`
--
ALTER TABLE `changedparts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ChangedParts_Parts` (`PartID`),
  ADD KEY `FK_ChangedParts_EmergencyMaintenances` (`EmergencyMaintenanceID`);

--
-- Indexes for table `departmentlocations`
--
ALTER TABLE `departmentlocations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DepartmentLocations_Departments` (`DepartmentID`),
  ADD KEY `FK_DepartmentLocations_Locations` (`LocationID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `emergencymaintenances`
--
ALTER TABLE `emergencymaintenances`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_EmergencyMaintenances_Priorities` (`PriorityID`),
  ADD KEY `FK_EmergencyMaintenances_Assets` (`AssetID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetgroups`
--
ALTER TABLE `assetgroups`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `changedparts`
--
ALTER TABLE `changedparts`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departmentlocations`
--
ALTER TABLE `departmentlocations`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `emergencymaintenances`
--
ALTER TABLE `emergencymaintenances`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `FK_Assets_AssetGroups` FOREIGN KEY (`AssetGroupID`) REFERENCES `assetgroups` (`ID`),
  ADD CONSTRAINT `FK_Assets_DepartmentLocations` FOREIGN KEY (`DepartmentLocationID`) REFERENCES `departmentlocations` (`ID`),
  ADD CONSTRAINT `FK_Assets_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`ID`);

--
-- Constraints for table `changedparts`
--
ALTER TABLE `changedparts`
  ADD CONSTRAINT `FK_ChangedParts_EmergencyMaintenances` FOREIGN KEY (`EmergencyMaintenanceID`) REFERENCES `emergencymaintenances` (`ID`),
  ADD CONSTRAINT `FK_ChangedParts_Parts` FOREIGN KEY (`PartID`) REFERENCES `parts` (`ID`);

--
-- Constraints for table `departmentlocations`
--
ALTER TABLE `departmentlocations`
  ADD CONSTRAINT `FK_DepartmentLocations_Departments` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`ID`),
  ADD CONSTRAINT `FK_DepartmentLocations_Locations` FOREIGN KEY (`LocationID`) REFERENCES `locations` (`ID`);

--
-- Constraints for table `emergencymaintenances`
--
ALTER TABLE `emergencymaintenances`
  ADD CONSTRAINT `FK_EmergencyMaintenances_Assets` FOREIGN KEY (`AssetID`) REFERENCES `assets` (`ID`),
  ADD CONSTRAINT `FK_EmergencyMaintenances_Priorities` FOREIGN KEY (`PriorityID`) REFERENCES `priorities` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
