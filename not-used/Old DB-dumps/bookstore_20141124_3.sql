-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 24, 2014 at 11:50 AM
-- Server version: 5.6.17
-- PHP Version: 5.3.28

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
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`authorId`, `firstName`, `lastName`) VALUES
(4, 'blah', 'banana');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `ISBN` int(11) NOT NULL DEFAULT '0',
  `authorId` varchar(256) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE IF NOT EXISTS `delivery` (
`deliveryId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` int(11) NOT NULL,
  `isbn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `history_price`
--

CREATE TABLE IF NOT EXISTS `history_price` (
`idPrice` int(11) NOT NULL,
  `salePrice` decimal(10,0) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isbn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE IF NOT EXISTS `price` (
  `isbn` int(11) NOT NULL DEFAULT '0',
  `fPrice` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
`saleId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amout` int(11) NOT NULL,
  `isbn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shelf`
--

CREATE TABLE IF NOT EXISTS `shelf` (
  `isbn` int(11) NOT NULL DEFAULT '0',
  `shelfNr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
 ADD PRIMARY KEY (`ISBN`);

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
-- Indexes for table `price`
--
ALTER TABLE `price`
 ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
 ADD PRIMARY KEY (`saleId`);

--
-- Indexes for table `shelf`
--
ALTER TABLE `shelf`
 ADD PRIMARY KEY (`isbn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
MODIFY `authorId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
MODIFY `deliveryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `history_price`
--
ALTER TABLE `history_price`
MODIFY `idPrice` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
