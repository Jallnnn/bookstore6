-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 04, 2014 at 12:38 PM
-- Server version: 5.6.17
-- PHP Version: 5.4.32

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`authorId`, `fname`, `lname`) VALUES
(5, 'John', 'Doe'),
(10, 'Max', 'Brooks'),
(23, 'Test', 'Testing'),
(30, 'JK', 'rowling'),
(33, 'Jane', 'Doe'),
(35, 'David', 'Nicholls'),
(36, 'Cormac', 'McCarthy'),
(37, 'Jane', 'Austen'),
(38, 'Mary', 'Shelley'),
(39, 'Bram', 'Stoker'),
(40, 'JRR', 'Tolkien'),
(41, 'Douglas', 'Adams');

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
(123, '23', 'Testing Title\r\n', 'C1'),
(9780007487301, '40', 'The Hobbit', 'T6'),
(9780141040349, '37', 'Pride and Prejudice', 'A5'),
(9780141196886, '39', 'Dracula', 'S7'),
(9780141393391, '38', 'Frankenstein', 's3'),
(9780330447546, '36', 'The Road', 'M1'),
(9780340994689, '35', 'One Day', 'N1'),
(9780434003488, '41', 'The Hitch Hiker''s Guide to the Galaxy', 'A2'),
(9780715637036, '10', 'World War Z', 'B5'),
(9780747532743, '29', 'Harry Potter and the Philsopher''s Stone', 'R1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_deliverd_and_sold`
--
CREATE TABLE IF NOT EXISTS `books_deliverd_and_sold` (
`authorId` varchar(256)
,`isbn` bigint(13)
,`title` varchar(255)
,`shelf_id` varchar(2)
,`fname` varchar(255)
,`lname` varchar(255)
,`delivered_qty` decimal(32,0)
,`sold_qty` decimal(32,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `book_and_author`
--
CREATE TABLE IF NOT EXISTS `book_and_author` (
`authorId` varchar(256)
,`isbn` bigint(13)
,`title` varchar(255)
,`shelf_id` varchar(2)
,`fname` varchar(255)
,`lname` varchar(255)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `current_price`
--
CREATE TABLE IF NOT EXISTS `current_price` (
`authorId` varchar(256)
,`isbn` bigint(13)
,`title` varchar(255)
,`shelf_id` varchar(2)
,`fname` varchar(255)
,`lname` varchar(255)
,`price` bigint(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `current_price_with_vat`
--
CREATE TABLE IF NOT EXISTS `current_price_with_vat` (
`authorId` varchar(256)
,`isbn` bigint(13)
,`title` varchar(255)
,`shelf_id` varchar(2)
,`fname` varchar(255)
,`lname` varchar(255)
,`price` bigint(11)
,`price_inc_vat` decimal(22,2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_info`
--
CREATE TABLE IF NOT EXISTS `customer_info` (
`isbn` bigint(13)
,`title` varchar(255)
,`fname` varchar(255)
,`lname` varchar(255)
,`shelf_id` varchar(2)
,`in_stock` decimal(33,0)
,`price_with_vat` decimal(22,2)
);
-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE IF NOT EXISTS `delivery` (
`deliveryId` int(11) NOT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` int(11) NOT NULL,
  `isbn` bigint(13) NOT NULL,
  `fprice` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryId`, `delivery_date`, `qty`, `isbn`, `fprice`) VALUES
(20, '2014-12-01 10:16:07', 100, 122, 45),
(22, '2014-12-01 10:21:45', 60, 122, 45),
(23, '2014-12-01 10:33:07', 300, 123, 3),
(24, '2014-12-04 11:07:19', 5, 9780141040349, 100),
(25, '2014-12-04 12:12:26', 3, 9780141393391, 120),
(26, '2014-12-04 12:25:12', 3, 9780141196886, 110),
(27, '2014-12-04 12:27:53', 10, 9780007487301, 130),
(28, '2014-12-04 12:31:50', 3, 9780434003488, 90);

-- --------------------------------------------------------

--
-- Table structure for table `history_price`
--

CREATE TABLE IF NOT EXISTS `history_price` (
`idPrice` int(11) NOT NULL,
  `salePrice` int(11) NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isbn` bigint(13) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_price`
--

INSERT INTO `history_price` (`idPrice`, `salePrice`, `change_date`, `isbn`) VALUES
(1, 200, '2014-11-29 15:28:14', 123),
(5, 81, '2014-11-30 08:36:21', 9780747532743),
(6, 99, '2014-11-30 08:53:37', 9780747532743),
(7, 99, '2014-11-30 08:56:17', 9780747532743),
(9, 81, '2014-12-01 10:21:25', 123),
(24, 22, '2014-12-03 10:18:46', 123),
(25, 81, '2014-12-03 19:54:26', 123),
(26, 90, '2014-12-03 19:56:48', 9780715637036),
(27, 90, '2014-12-03 20:01:30', 9780715637036),
(28, 90, '2014-12-03 20:13:37', 9780715637036),
(29, 54, '2014-12-03 20:16:36', 9780340994689),
(30, 54, '2014-12-03 20:20:22', 9780340994689),
(31, 108, '2014-12-03 20:25:50', 9780330447546),
(32, 126, '2014-12-03 20:31:18', 9780330447546),
(33, 180, '2014-12-04 11:07:19', 9780141040349),
(34, 216, '2014-12-04 12:12:26', 9780141393391),
(35, 198, '2014-12-04 12:25:12', 9780141196886),
(36, 234, '2014-12-04 12:27:53', 9780007487301),
(37, 162, '2014-12-04 12:31:50', 9780434003488);

-- --------------------------------------------------------

--
-- Stand-in structure for view `in_stock`
--
CREATE TABLE IF NOT EXISTS `in_stock` (
`authorId` varchar(256)
,`isbn` bigint(13)
,`title` varchar(255)
,`shelf_id` varchar(2)
,`fname` varchar(255)
,`lname` varchar(255)
,`delivered_qty` decimal(32,0)
,`sold_qty` decimal(32,0)
,`in_stock` decimal(33,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `registery_book`
--
CREATE TABLE IF NOT EXISTS `registery_book` (
`authorId` varchar(256)
,`isbn` bigint(13)
,`title` varchar(255)
,`shelf_id` varchar(2)
,`fname` varchar(255)
,`lname` varchar(255)
,`publisher_price` bigint(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
`saleId` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` int(11) NOT NULL,
  `isbn` bigint(13) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shelf`
--

CREATE TABLE IF NOT EXISTS `shelf` (
  `shelf_id` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shelf`
--

INSERT INTO `shelf` (`shelf_id`) VALUES
('A2'),
('A5'),
('B5'),
('C1'),
('M1'),
('N1'),
('R1'),
('S1'),
('S2'),
('S7'),
('T6');

-- --------------------------------------------------------

--
-- Structure for view `books_deliverd_and_sold`
--
DROP TABLE IF EXISTS `books_deliverd_and_sold`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_deliverd_and_sold` AS select `book_and_author`.`authorId` AS `authorId`,`book_and_author`.`isbn` AS `isbn`,`book_and_author`.`title` AS `title`,`book_and_author`.`shelf_id` AS `shelf_id`,`book_and_author`.`fname` AS `fname`,`book_and_author`.`lname` AS `lname`,(select sum(`delivery`.`qty`) from `delivery` where (`delivery`.`isbn` = `book_and_author`.`isbn`)) AS `delivered_qty`,(select sum(`sale`.`qty`) from `sale` where (`sale`.`isbn` = `book_and_author`.`isbn`)) AS `sold_qty` from `book_and_author`;

-- --------------------------------------------------------

--
-- Structure for view `book_and_author`
--
DROP TABLE IF EXISTS `book_and_author`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_and_author` AS select `book`.`authorId` AS `authorId`,`book`.`isbn` AS `isbn`,`book`.`title` AS `title`,`book`.`shelf_id` AS `shelf_id`,`author`.`fname` AS `fname`,`author`.`lname` AS `lname` from (`book` join `author` on((`book`.`authorId` = `author`.`authorId`)));

-- --------------------------------------------------------

--
-- Structure for view `current_price`
--
DROP TABLE IF EXISTS `current_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_price` AS select `book_and_author`.`authorId` AS `authorId`,`book_and_author`.`isbn` AS `isbn`,`book_and_author`.`title` AS `title`,`book_and_author`.`shelf_id` AS `shelf_id`,`book_and_author`.`fname` AS `fname`,`book_and_author`.`lname` AS `lname`,(select `history_price`.`salePrice` from `history_price` where (`history_price`.`isbn` = `book_and_author`.`isbn`) order by `history_price`.`change_date` limit 1) AS `price` from `book_and_author`;

-- --------------------------------------------------------

--
-- Structure for view `current_price_with_vat`
--
DROP TABLE IF EXISTS `current_price_with_vat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_price_with_vat` AS select `current_price`.`authorId` AS `authorId`,`current_price`.`isbn` AS `isbn`,`current_price`.`title` AS `title`,`current_price`.`shelf_id` AS `shelf_id`,`current_price`.`fname` AS `fname`,`current_price`.`lname` AS `lname`,`current_price`.`price` AS `price`,(`current_price`.`price` * 1.06) AS `price_inc_vat` from `current_price`;

-- --------------------------------------------------------

--
-- Structure for view `customer_info`
--
DROP TABLE IF EXISTS `customer_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_info` AS select `in_stock`.`isbn` AS `isbn`,`in_stock`.`title` AS `title`,`in_stock`.`fname` AS `fname`,`in_stock`.`lname` AS `lname`,`in_stock`.`shelf_id` AS `shelf_id`,`in_stock`.`in_stock` AS `in_stock`,(select `current_price_with_vat`.`price_inc_vat` from `current_price_with_vat` where (`current_price_with_vat`.`isbn` = `in_stock`.`isbn`)) AS `price_with_vat` from `in_stock`;

-- --------------------------------------------------------

--
-- Structure for view `in_stock`
--
DROP TABLE IF EXISTS `in_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `in_stock` AS select `books_deliverd_and_sold`.`authorId` AS `authorId`,`books_deliverd_and_sold`.`isbn` AS `isbn`,`books_deliverd_and_sold`.`title` AS `title`,`books_deliverd_and_sold`.`shelf_id` AS `shelf_id`,`books_deliverd_and_sold`.`fname` AS `fname`,`books_deliverd_and_sold`.`lname` AS `lname`,`books_deliverd_and_sold`.`delivered_qty` AS `delivered_qty`,`books_deliverd_and_sold`.`sold_qty` AS `sold_qty`,(`books_deliverd_and_sold`.`delivered_qty` - `books_deliverd_and_sold`.`sold_qty`) AS `in_stock` from `books_deliverd_and_sold`;

-- --------------------------------------------------------

--
-- Structure for view `registery_book`
--
DROP TABLE IF EXISTS `registery_book`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `registery_book` AS (select `book_and_author`.`authorId` AS `authorId`,`book_and_author`.`isbn` AS `isbn`,`book_and_author`.`title` AS `title`,`book_and_author`.`shelf_id` AS `shelf_id`,`book_and_author`.`fname` AS `fname`,`book_and_author`.`lname` AS `lname`,(select `delivery`.`fprice` from `delivery` where (`delivery`.`isbn` = `book_and_author`.`isbn`) order by `delivery`.`delivery_date` limit 1) AS `publisher_price` from `book_and_author`);

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
 ADD PRIMARY KEY (`shelf_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
MODIFY `authorId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
MODIFY `deliveryId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `history_price`
--
ALTER TABLE `history_price`
MODIFY `idPrice` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
