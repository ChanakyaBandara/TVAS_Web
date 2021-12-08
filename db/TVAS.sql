-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2021 at 04:12 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tvas`
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
  `fan` int(11) NOT NULL,
  `tap` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datafiles`
--

INSERT INTO `datafiles` (`DID`, `trID`, `load_condition`, `date`, `fan`, `tap`, `filename`) VALUES
(1, 3, 2, '2021-07-14T20:00', 0, 0, '6067cbd1bbc371.98148805.xlsx'),
(2, 2, 3, '2021-07-07T20:07', 0, 0, '60697c1e8f83d8.06136615.xlsx'),
(3, 3, 2, '2021-07-17T20:36', 0, 0, '60edabe0a9c317.76541074.xlsx'),
(4, 3, 2, '2021-07-22T20:39', 0, 0, '60edacc0dbe407.79282490.xlsx'),
(5, 3, 2, '2021-07-16T20:39', 0, 0, '60edb067ee4064.84698220.xlsx'),
(6, 4, 3, '2021-07-12T21:07', 0, 0, '60edb34996ff60.13715486.xlsx'),
(7, 3, 2, '2021-07-25T07:25', 0, 0, '60fe161800cb92.14874381.xlsx'),
(8, 6, 2, '2021-11-16T20:14', 0, 0, '6193c3f571b3e9.73475228.xlsx'),
(9, 6, 2, '2021-11-18T20:14', 0, 0, '6193c439212699.63707439.xlsx'),
(10, 3, 2, '2021-10-16T20:40', 0, 0, '6193c9e8e75f31.71868216.xlsx'),
(11, 3, 2, '2021-11-16T20:40', 0, 0, '6193c9fc536f97.21629363.xlsx'),
(12, 2, 2, '2021-11-22T01:22', 0, 0, '619bf51f5b6377.18993658.xlsx'),
(13, 2, 2, '2021-11-23T01:22', 0, 0, '619bf5427b17b1.02572927.xlsx'),
(14, 2, 3, '2021-11-24T01:22', 0, 0, '619bf56db664f4.50730731.xlsx'),
(15, 2, 3, '2021-11-24T01:22', 0, 0, '619bf5874b7045.58058473.xlsx'),
(16, 1, 2, '2021-12-02T08:51', 0, 0, '61aaded8551551.72804441.xlsx'),
(17, 1, 2, '2021-12-03T08:51', 0, 0, '61aadeeb557287.63120203.xlsx'),
(18, 7, 2, '2021-12-02T09:05', 0, 0, '61aae1f98bb2f0.62773706.xlsx'),
(19, 7, 2, '2021-12-04T09:05', 0, 0, '61aae20abc3039.18642944.xlsx'),
(20, 7, 3, '2021-12-02T09:59', 0, 0, '61aaef4a5e0214.17562180.xlsx'),
(21, 7, 3, '2021-12-04T10:02', 0, 0, '61aaef6c6f1b40.21708028.xlsx'),
(22, 2, 1, '2021-12-05T13:08', 1, 5, '61ab1af3001491.71177133.xlsx'),
(23, 2, 3, '2021-12-07T11:08', 1, 3, '61aef3754f2393.19633738.xlsx'),
(24, 6, 2, '2021-12-06T20:33', 1, 5, '61af77c518c9a6.06501675.xlsx');

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
(6, 'POLPITIYA U1 B', 'Polpitiya', '17.9', '1', 'Thirathai', '2013'),
(7, 'S_WEWA_U1', 'Samanalawewa', '71', '3', 'ABB Thailand', '2017');

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
  MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `transformers`
--
ALTER TABLE `transformers`
  MODIFY `trID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
