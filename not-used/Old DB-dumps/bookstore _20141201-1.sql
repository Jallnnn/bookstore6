-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 01 dec 2014 kl 13:50
-- Serverversion: 5.6.17
-- PHP-version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `bookstore`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `author`
--

CREATE TABLE IF NOT EXISTS `author` (
`authorId` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumpning av Data i tabell `author`
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
(22, 'gdgd', 'dgfdgd'),
(23, 'Past', 'Bedtime'),
(24, 'vbv', 'yfg'),
(25, ' n', 'k'),
(26, 'bn', 'nbm'),
(27, 'jkh', 'jklhjl'),
(28, 'heeeeee', 'hjhjkhkj'),
(29, 'J.K.', 'Rowling'),
(30, 'jk', 'rowling'),
(31, 'fhfh', 'fghfhg'),
(32, 'dgdg', 'dfd');

-- --------------------------------------------------------

--
-- Tabellstruktur `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `isbn` bigint(13) NOT NULL DEFAULT '0',
  `authorId` varchar(256) NOT NULL,
  `title` varchar(255) NOT NULL,
  `shelf_id` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `book`
--

INSERT INTO `book` (`isbn`, `authorId`, `title`, `shelf_id`) VALUES
(123, '23', 'why am I still awake', 'C1'),
(4342, '2', 'fsdfs', 'a1'),
(4343, '14', 'rghgtrg', NULL),
(12345, '31', 'ghgyu', 's3'),
(534534, '13', 'tteter', NULL),
(778798, '27', 'jkh', 'h7'),
(787665, '26', 'bbm', 'nj'),
(987654, '16', 'hjkhklj', NULL),
(23232323, '28', 'sososo', 'a1'),
(111111111, '17', 'as', NULL),
(123465789, '15', 'Hello World', NULL),
(9009090909, '21', 'hfhfghg', 'aa'),
(9789123456, '12', 'Sleep', 'S2'),
(121313333333, '24', 'momo', 'gf'),
(433333333333, '22', 'gfdgd', 'fd'),
(888888888888, '20', 'looop', '9l'),
(1111111222222, '23', 'why am i still awake', 'C1'),
(4535345354354, '25', 'bn', 'gf'),
(9780747532743, '29', 'Harry Potter and the Philsopher''s Stone', 'R1'),
(11111112222222, '23', 'why am i still awake', 'C1');

-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `books_deliverd_and_sold`
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
-- Ersättningsstruktur för vy `book_and_author`
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
-- Ersättningsstruktur för vy `current_price`
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
-- Ersättningsstruktur för vy `current_price_with_vat`
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
-- Tabellstruktur `delivery`
--

CREATE TABLE IF NOT EXISTS `delivery` (
`deliveryId` int(11) NOT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` int(11) NOT NULL,
  `isbn` bigint(13) NOT NULL,
  `fprice` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumpning av Data i tabell `delivery`
--

INSERT INTO `delivery` (`deliveryId`, `delivery_date`, `qty`, `isbn`, `fprice`) VALUES
(1, '2014-11-29 19:28:49', 1, 4343, 45),
(2, '2014-11-29 19:32:04', 1, 123465789, 100),
(3, '2014-11-29 19:33:24', 1, 987654, 4),
(4, '2014-11-29 19:36:10', 1, 111111111, 1),
(5, '2014-11-29 19:43:18', 3, 555555555, 33),
(6, '2014-11-29 19:44:51', 3, 888888888888, 54),
(7, '2014-11-29 19:46:44', 3, 9009090909, 777),
(8, '2014-11-29 19:48:33', 4, 433333333333, 55555),
(9, '2014-11-29 20:50:40', 1, 9789123456, 200),
(10, '2014-11-29 21:01:42', 20, 11111112222222, 80),
(11, '2014-11-29 21:05:49', 4, 121313333333, 60),
(12, '2014-11-29 21:07:02', 4, 4535345354354, 44),
(13, '2014-11-29 21:09:21', 4, 787665, 22),
(14, '2014-11-29 21:12:35', 8, 778798, 677),
(15, '2014-11-29 21:15:07', 1, 23232323, 66),
(16, '2014-11-30 08:32:20', 5, 1111111222222, 60),
(17, '2014-11-30 08:36:21', 10, 9780747532743, 45),
(18, '2014-11-30 08:53:37', 2, 9780747532743, 55),
(19, '2014-11-30 08:56:17', 5, 9780747532743, 55),
(20, '2014-12-01 10:16:07', 1, 12345, 45),
(21, '2014-12-01 10:21:25', 6, 123, 45),
(22, '2014-12-01 10:21:45', 6, 123, 45),
(23, '2014-12-01 10:33:07', 3, 123, 3);

-- --------------------------------------------------------

--
-- Tabellstruktur `history_price`
--

CREATE TABLE IF NOT EXISTS `history_price` (
`idPrice` int(11) NOT NULL,
  `salePrice` int(11) NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isbn` bigint(13) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumpning av Data i tabell `history_price`
--

INSERT INTO `history_price` (`idPrice`, `salePrice`, `change_date`, `isbn`) VALUES
(1, 200, '2014-11-29 15:28:14', 123),
(2, 4, '2014-11-29 21:12:35', 56),
(3, 119, '2014-11-29 21:15:07', 23232323),
(4, 108, '2014-11-30 08:32:20', 1111111222222),
(5, 81, '2014-11-30 08:36:21', 9780747532743),
(6, 99, '2014-11-30 08:53:37', 9780747532743),
(7, 99, '2014-11-30 08:56:17', 9780747532743),
(8, 81, '2014-12-01 10:16:07', 12345),
(9, 81, '2014-12-01 10:21:25', 123),
(10, 81, '2014-12-01 10:21:45', 123),
(11, 5, '2014-12-01 10:33:07', 123),
(12, 12, '2014-12-01 11:42:26', 123),
(13, 12, '2014-12-01 11:42:44', 123),
(14, 12, '2014-12-01 11:42:45', 123),
(15, 12, '2014-12-01 11:42:45', 123),
(16, 12, '2014-12-01 11:42:46', 123),
(17, 111, '2014-12-01 11:44:40', 123),
(18, 111, '2014-12-01 11:44:46', 123),
(19, 111, '2014-12-01 11:47:29', 123);

-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `in_stock`
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
-- Tabellstruktur `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
`saleId` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` int(11) NOT NULL,
  `isbn` bigint(13) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumpning av Data i tabell `sale`
--

INSERT INTO `sale` (`saleId`, `sale_date`, `qty`, `isbn`) VALUES
(1, '2014-11-30 07:55:09', 3, 123),
(2, '2014-12-01 10:13:37', 5, 123);

-- --------------------------------------------------------

--
-- Tabellstruktur `shelf`
--

CREATE TABLE IF NOT EXISTS `shelf` (
  `shelf_id` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `shelf`
--

INSERT INTO `shelf` (`shelf_id`) VALUES
('6m'),
('9l'),
('a1'),
('A2'),
('a3'),
('aa'),
('C1'),
('d1'),
('fd'),
('g3'),
('gf'),
('h1'),
('h7'),
('nj'),
('q1'),
('R1'),
('S1'),
('S2'),
('s3'),
('xs');

-- --------------------------------------------------------

--
-- Ersättningsstruktur för vy `x`
--
CREATE TABLE IF NOT EXISTS `x` (
`authorId` varchar(256)
,`isbn` bigint(13)
,`title` varchar(255)
,`shelf_id` varchar(2)
,`fname` varchar(255)
,`lname` varchar(255)
);
-- --------------------------------------------------------

--
-- Struktur för vy `books_deliverd_and_sold`
--
DROP TABLE IF EXISTS `books_deliverd_and_sold`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_deliverd_and_sold` AS select `book_and_author`.`authorId` AS `authorId`,`book_and_author`.`isbn` AS `isbn`,`book_and_author`.`title` AS `title`,`book_and_author`.`shelf_id` AS `shelf_id`,`book_and_author`.`fname` AS `fname`,`book_and_author`.`lname` AS `lname`,(select sum(`delivery`.`qty`) from `delivery` where (`delivery`.`isbn` = `book_and_author`.`isbn`)) AS `delivered_qty`,(select sum(`sale`.`qty`) from `sale` where (`sale`.`isbn` = `book_and_author`.`isbn`)) AS `sold_qty` from `book_and_author`;

-- --------------------------------------------------------

--
-- Struktur för vy `book_and_author`
--
DROP TABLE IF EXISTS `book_and_author`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_and_author` AS select `book`.`authorId` AS `authorId`,`book`.`isbn` AS `isbn`,`book`.`title` AS `title`,`book`.`shelf_id` AS `shelf_id`,`author`.`fname` AS `fname`,`author`.`lname` AS `lname` from (`book` join `author` on((`book`.`authorId` = `author`.`authorId`)));

-- --------------------------------------------------------

--
-- Struktur för vy `current_price`
--
DROP TABLE IF EXISTS `current_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_price` AS select `book_and_author`.`authorId` AS `authorId`,`book_and_author`.`isbn` AS `isbn`,`book_and_author`.`title` AS `title`,`book_and_author`.`shelf_id` AS `shelf_id`,`book_and_author`.`fname` AS `fname`,`book_and_author`.`lname` AS `lname`,(select `history_price`.`salePrice` from `history_price` where (`history_price`.`isbn` = `book_and_author`.`isbn`) order by `history_price`.`change_date` limit 1) AS `price` from `book_and_author`;

-- --------------------------------------------------------

--
-- Struktur för vy `current_price_with_vat`
--
DROP TABLE IF EXISTS `current_price_with_vat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_price_with_vat` AS select `current_price`.`authorId` AS `authorId`,`current_price`.`isbn` AS `isbn`,`current_price`.`title` AS `title`,`current_price`.`shelf_id` AS `shelf_id`,`current_price`.`fname` AS `fname`,`current_price`.`lname` AS `lname`,`current_price`.`price` AS `price`,(`current_price`.`price` * 1.06) AS `price_inc_vat` from `current_price`;

-- --------------------------------------------------------

--
-- Struktur för vy `in_stock`
--
DROP TABLE IF EXISTS `in_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `in_stock` AS select `books_deliverd_and_sold`.`authorId` AS `authorId`,`books_deliverd_and_sold`.`isbn` AS `isbn`,`books_deliverd_and_sold`.`title` AS `title`,`books_deliverd_and_sold`.`shelf_id` AS `shelf_id`,`books_deliverd_and_sold`.`fname` AS `fname`,`books_deliverd_and_sold`.`lname` AS `lname`,`books_deliverd_and_sold`.`delivered_qty` AS `delivered_qty`,`books_deliverd_and_sold`.`sold_qty` AS `sold_qty`,(`books_deliverd_and_sold`.`delivered_qty` - `books_deliverd_and_sold`.`sold_qty`) AS `in_stock` from `books_deliverd_and_sold`;

-- --------------------------------------------------------

--
-- Struktur för vy `x`
--
DROP TABLE IF EXISTS `x`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `x` AS (select `book`.`authorId` AS `authorId`,`book`.`isbn` AS `isbn`,`book`.`title` AS `title`,`book`.`shelf_id` AS `shelf_id`,`author`.`fname` AS `fname`,`author`.`lname` AS `lname` from (`book` join `author` on((`book`.`authorId` = `author`.`authorId`))));

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `author`
--
ALTER TABLE `author`
 ADD PRIMARY KEY (`authorId`), ADD UNIQUE KEY `authorId` (`authorId`);

--
-- Index för tabell `book`
--
ALTER TABLE `book`
 ADD PRIMARY KEY (`isbn`), ADD KEY `shelf_id` (`shelf_id`);

--
-- Index för tabell `delivery`
--
ALTER TABLE `delivery`
 ADD PRIMARY KEY (`deliveryId`);

--
-- Index för tabell `history_price`
--
ALTER TABLE `history_price`
 ADD PRIMARY KEY (`idPrice`);

--
-- Index för tabell `sale`
--
ALTER TABLE `sale`
 ADD PRIMARY KEY (`saleId`);

--
-- Index för tabell `shelf`
--
ALTER TABLE `shelf`
 ADD PRIMARY KEY (`shelf_id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `author`
--
ALTER TABLE `author`
MODIFY `authorId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT för tabell `delivery`
--
ALTER TABLE `delivery`
MODIFY `deliveryId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT för tabell `history_price`
--
ALTER TABLE `history_price`
MODIFY `idPrice` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT för tabell `sale`
--
ALTER TABLE `sale`
MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
