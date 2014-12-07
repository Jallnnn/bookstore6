-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 29, 2014 at 08:02 PM
-- Server version: 5.6.17
-- PHP Version: 5.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
`authorId` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`authorId`, `fname`, `lname`) VALUES
(4, 'blah', 'banana'),
(5, 'John', 'Doe'),
(9, '', ''),
(10, 'Max', 'Brooks'),
(11, 'aaaa', 'vvvvvv'),
(12, 'Iam', 'Tired'),
(13, 'gdgd', 'jhjhg'),
(14, 'ds', 'adads'),
(15, 'He', 'Wo'),
(16, 'df', 'dfd'),
(17, 'as', 'as'),
(18, 'sd', 'sd'),
(19, 'aaa', 'ccccc'),
(20, 'poool', 'asssal'),
(21, 'fdsfds', 'fsdfd'),
(22, 'gdgd', 'dgfdgd');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `isbn` bigint(13) NOT NULL DEFAULT '0',
  `authorId` varchar(256) NOT NULL,
  `title` varchar(255) NOT NULL,
  `shelf_id` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`isbn`, `authorId`, `title`, `shelf_id`) VALUES
(4342, '2', 'fsdfs', 'a1'),
(4343, '14', 'rghgtrg', NULL),
(534534, '13', 'tteter', NULL),
(987654, '16', 'hjkhklj', NULL),
(111111111, '17', 'as', NULL),
(123465789, '15', 'Hello World', NULL),
(9009090909, '21', 'hfhfghg', 'aa'),
(433333333333, '22', 'gfdgd', 'fd'),
(888888888888, '20', 'looop', '9l');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE IF NOT EXISTS `delivery` (
`deliveryId` int(11) NOT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` int(11) NOT NULL,
  `isbn` bigint(13) NOT NULL,
  `fprice` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryId`, `delivery_date`, `quantity`, `isbn`, `fprice`) VALUES
(1, '2014-11-29 19:28:49', 1, 4343, 45),
(2, '2014-11-29 19:32:04', 1, 123465789, 100),
(3, '2014-11-29 19:33:24', 1, 987654, 4),
(4, '2014-11-29 19:36:10', 1, 111111111, 1),
(5, '2014-11-29 19:43:18', 3, 555555555, 33),
(6, '2014-11-29 19:44:51', 3, 888888888888, 54),
(7, '2014-11-29 19:46:44', 3, 9009090909, 777),
(8, '2014-11-29 19:48:33', 4, 433333333333, 55555);

-- --------------------------------------------------------

--
-- Table structure for table `history_price`
--

CREATE TABLE IF NOT EXISTS `history_price` (
`idPrice` int(11) NOT NULL,
  `salePrice` int(11) NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isbn` bigint(13) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_price`
--

INSERT INTO `history_price` (`idPrice`, `salePrice`, `change_date`, `isbn`) VALUES
(1, 200, '2014-11-29 15:28:14', 123);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
`saleId` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` int(11) NOT NULL,
  `isbn` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shelf`
--

CREATE TABLE IF NOT EXISTS `shelf` (
  `shelfNr` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shelf`
--

INSERT INTO `shelf` (`shelfNr`) VALUES
('6m'),
('9l'),
('a1'),
('A2'),
('a3'),
('aa'),
('d1'),
('fd'),
('g3'),
('h1'),
('q1'),
('S1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
 ADD PRIMARY KEY (`authorId`), ADD UNIQUE KEY `authorId` (`authorId`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
 ADD PRIMARY KEY (`isbn`), ADD KEY `shelf_id` (`shelf_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
 ADD PRIMARY KEY (`deliveryId`);

--
-- Indexes for table `history_price`
--
ALTER TABLE `history_price`
 ADD PRIMARY KEY (`idPrice`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
 ADD PRIMARY KEY (`saleId`);

--
-- Indexes for table `shelf`
--
ALTER TABLE `shelf`
 ADD PRIMARY KEY (`shelfNr`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
MODIFY `authorId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
MODIFY `deliveryId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `history_price`
--
ALTER TABLE `history_price`
MODIFY `idPrice` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`shelf_id`) REFERENCES `shelf` (`shelfNr`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
