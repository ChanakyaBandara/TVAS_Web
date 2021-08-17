-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 28, 2021 at 07:48 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TVAS`
--

-- --------------------------------------------------------

--
-- Table structure for table `datafiles`
--

CREATE TABLE `datafiles` (
  `DID` int(11) NOT NULL,
  `trID` int(11) NOT NULL,
  `load_condition` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datafiles`
--

INSERT INTO `datafiles` (`DID`, `trID`, `load_condition`, `date`, `filename`) VALUES
(1, 3, 2, '2021-07-14T20:00', '6067cbd1bbc371.98148805.xlsx'),
(2, 2, 3, '2021-07-07T20:07', '60697c1e8f83d8.06136615.xlsx'),
(3, 3, 2, '2021-07-17T20:36', '60edabe0a9c317.76541074.xlsx'),
(4, 3, 2, '2021-07-22T20:39', '60edacc0dbe407.79282490.xlsx'),
(5, 3, 2, '2021-07-16T20:39', '60edb067ee4064.84698220.xlsx'),
(6, 4, 3, '2021-07-12T21:07', '60edb34996ff60.13715486.xlsx'),
(7, 3, 2, '2021-07-25T07:25', '60fe161800cb92.14874381.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `transformers`
--

CREATE TABLE `transformers` (
  `trID` int(11) NOT NULL,
  `trName` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `capascity` varchar(100) NOT NULL,
  `phase` varchar(100) NOT NULL,
  `manufacture` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transformers`
--

INSERT INTO `transformers` (`trID`, `trName`, `location`, `capascity`, `phase`, `manufacture`, `year`) VALUES
(1, 'KOTMALE SPARE', 'Kotmale', '30', '1', 'ASEA', '1982'),
(2, 'NEW LX SPARE', 'New Laxapana', '24', '1', 'Thirathai', '2012'),
(3, 'NEW LX U2 B', 'New Laxapana', '24', '1', 'Alsthom Savo', '1972'),
(4, 'OLD LX ST1 U1 B', 'Old Laxapana', '11', '1', 'EMCO India', '2012'),
(5, 'POLPITIYA U1 B', 'Polpitiya', '17.9', '1', 'Thirathai', '2013'),
(6, 'POLPITIYA U1 B', 'Polpitiya', '17.9', '1', 'Thirathai', '2013');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datafiles`
--
ALTER TABLE `datafiles`
  ADD PRIMARY KEY (`DID`),
  ADD KEY `trID` (`trID`);

--
-- Indexes for table `transformers`
--
ALTER TABLE `transformers`
  ADD PRIMARY KEY (`trID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datafiles`
--
ALTER TABLE `datafiles`
  MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transformers`
--
ALTER TABLE `transformers`
  MODIFY `trID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datafiles`
--
ALTER TABLE `datafiles`
  ADD CONSTRAINT `datafiles_ibfk_1` FOREIGN KEY (`trID`) REFERENCES `transformers` (`trID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
