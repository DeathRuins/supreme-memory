-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2018 at 12:26 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitservices`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressId` int(10) NOT NULL,
  `streetNum` varchar(10) NOT NULL,
  `streetName` varchar(255) NOT NULL,
  `suburb` varchar(50) NOT NULL,
  `postcode` int(4) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(4) NOT NULL,
  `companycompanyId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressId`, `streetNum`, `streetName`, `suburb`, `postcode`, `city`, `state`, `companycompanyId`) VALUES
(1, '30', 'Loftus Road', 'Pennant Hills', 2120, 'Sydney', 'NSW', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `clientId` int(10) NOT NULL,
  `personId` int(10) NOT NULL,
  `companyId` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyId` int(10) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `addressId` int(10) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyId`, `companyName`, `addressId`, `status`) VALUES
(1, 'BitTech', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contractor`
--

CREATE TABLE `contractor` (
  `contractorId` int(10) NOT NULL,
  `personId` int(10) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coordinator`
--

CREATE TABLE `coordinator` (
  `coordinatorId` int(10) NOT NULL,
  `personId` int(10) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personId` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phoneNum` int(10) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `addressId` int(10) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personId`, `firstName`, `lastName`, `phoneNum`, `dob`, `email`, `password`, `addressId`, `username`, `permission`) VALUES
(2, 'tim', 'amith', 21312, '2018-05-02', 'asdasd', 'asdasd', NULL, 'asdasd', '');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skillId` int(10) NOT NULL,
  `skill` varchar(50) NOT NULL,
  `skillDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skills_contractor`
--

CREATE TABLE `skills_contractor` (
  `skillId` int(10) NOT NULL,
  `contractorId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `taskId` int(10) NOT NULL,
  `taskstatus` varchar(255) NOT NULL,
  `dateCompleted` date DEFAULT NULL,
  `skillId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workassignment`
--

CREATE TABLE `workassignment` (
  `workAssignmentId` int(10) NOT NULL,
  `workStartDate` date DEFAULT NULL,
  `workEndDate` date DEFAULT NULL,
  `workDescription` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `taskId_ref` int(10) NOT NULL,
  `clientId` int(10) DEFAULT NULL,
  `coordinatorId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressId`),
  ADD KEY `FKADDRESS656949` (`companycompanyId`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientId`),
  ADD KEY `FKCLIENT525034` (`personId`),
  ADD KEY `FKCLIENT431851` (`companyId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyId`);

--
-- Indexes for table `contractor`
--
ALTER TABLE `contractor`
  ADD PRIMARY KEY (`contractorId`),
  ADD KEY `FKCONTRACTOR271459` (`personId`);

--
-- Indexes for table `coordinator`
--
ALTER TABLE `coordinator`
  ADD PRIMARY KEY (`coordinatorId`),
  ADD KEY `FKCOORDINATO553915` (`personId`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personId`),
  ADD KEY `FKPERSON230022` (`addressId`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skillId`);

--
-- Indexes for table `skills_contractor`
--
ALTER TABLE `skills_contractor`
  ADD PRIMARY KEY (`skillId`,`contractorId`),
  ADD KEY `FKSKILLS_CON641029` (`contractorId`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`taskId`),
  ADD KEY `FKTASK993749` (`skillId`);

--
-- Indexes for table `workassignment`
--
ALTER TABLE `workassignment`
  ADD PRIMARY KEY (`workAssignmentId`),
  ADD KEY `FKWORKASSIGN658381` (`clientId`),
  ADD KEY `FKWORKASSIGN288857` (`coordinatorId`),
  ADD KEY `FKWORKASSIGN989237` (`taskId_ref`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `clientId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `companyId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contractor`
--
ALTER TABLE `contractor`
  MODIFY `contractorId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coordinator`
--
ALTER TABLE `coordinator`
  MODIFY `coordinatorId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `personId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skillId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `taskId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workassignment`
--
ALTER TABLE `workassignment`
  MODIFY `workAssignmentId` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FKADDRESS656949` FOREIGN KEY (`companycompanyId`) REFERENCES `company` (`companyId`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FKCLIENT431851` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`),
  ADD CONSTRAINT `FKCLIENT525034` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`);

--
-- Constraints for table `contractor`
--
ALTER TABLE `contractor`
  ADD CONSTRAINT `FKCONTRACTOR271459` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`);

--
-- Constraints for table `coordinator`
--
ALTER TABLE `coordinator`
  ADD CONSTRAINT `FKCOORDINATO553915` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FKPERSON230022` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`);

--
-- Constraints for table `skills_contractor`
--
ALTER TABLE `skills_contractor`
  ADD CONSTRAINT `FKSKILLS_CON345206` FOREIGN KEY (`skillId`) REFERENCES `skills` (`skillId`),
  ADD CONSTRAINT `FKSKILLS_CON641029` FOREIGN KEY (`contractorId`) REFERENCES `contractor` (`contractorId`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FKTASK993749` FOREIGN KEY (`skillId`) REFERENCES `skills` (`skillId`);

--
-- Constraints for table `workassignment`
--
ALTER TABLE `workassignment`
  ADD CONSTRAINT `FKWORKASSIGN288857` FOREIGN KEY (`coordinatorId`) REFERENCES `coordinator` (`coordinatorId`),
  ADD CONSTRAINT `FKWORKASSIGN658381` FOREIGN KEY (`clientId`) REFERENCES `client` (`clientId`),
  ADD CONSTRAINT `FKWORKASSIGN989237` FOREIGN KEY (`taskId_ref`) REFERENCES `task` (`taskId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
