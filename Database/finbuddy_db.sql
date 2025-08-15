-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2025 at 04:05 PM
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
-- Database: `finbuddy_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `BANK_ID` bigint(20) NOT NULL,
  `BANK_NAME` varchar(200) NOT NULL,
  `BANK_BALANCE` double NOT NULL,
  `USER_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`BANK_ID`, `BANK_NAME`, `BANK_BALANCE`, `USER_ID`) VALUES
(1, 'Maybank', 17079, 1),
(2, 'CIMB', 2000, 2),
(3, 'Public Bank', 1800, 3),
(8, 'Agrobank', 30000, 36),
(9, 'Standard Chartered', 10000, 36),
(10, 'Bank Islam', 4290, 37),
(11, 'Citibank', 6000, 37),
(12, 'Alliance Bank', 50000, 38),
(13, 'AmBank', 30000, 38);

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE `budget` (
  `BUDGET_ID` bigint(20) NOT NULL,
  `BUDGET_AMOUNT` double NOT NULL,
  `BUDGET_MONTH` date NOT NULL,
  `USER_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`BUDGET_ID`, `BUDGET_AMOUNT`, `BUDGET_MONTH`, `USER_ID`) VALUES
(1, 700, '2025-07-01', 1),
(2, 500, '2025-07-01', 37);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `EXP_ID` bigint(20) NOT NULL,
  `EXP_AMOUNT` double NOT NULL,
  `EXP_TYPE` varchar(200) NOT NULL,
  `EXP_DATE` datetime NOT NULL,
  `BANK_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`EXP_ID`, `EXP_AMOUNT`, `EXP_TYPE`, `EXP_DATE`, `BANK_ID`, `USER_ID`) VALUES
(1, 20, 'Food & Beverages', '2025-07-01 10:10:00', 1, 1),
(2, 35, 'Groceries', '2025-07-01 15:30:00', 1, 1),
(3, 15, 'Transport', '2025-07-02 09:00:00', 1, 1),
(4, 25, 'Utilities', '2025-07-02 19:00:00', 1, 1),
(5, 12, 'Shopping', '2025-07-03 13:00:00', 1, 1),
(6, 8, 'Entertainment', '2025-07-03 20:00:00', 1, 1),
(7, 45, 'Mobile & Internet', '2025-07-04 08:30:00', 1, 1),
(8, 60, 'Education', '2025-07-04 20:15:00', 1, 1),
(13, 30, 'Food & Beverages', '2025-07-01 11:00:00', 2, 2),
(14, 25, 'Transport', '2025-07-01 20:00:00', 2, 2),
(15, 10, 'Utilities', '2025-07-02 09:15:00', 2, 2),
(16, 55, 'Entertainment', '2025-07-02 21:45:00', 2, 2),
(17, 22, 'Groceries', '2025-07-03 10:30:00', 2, 2),
(18, 60, 'Rent & Loan', '2025-07-03 16:40:00', 2, 2),
(19, 18, 'Health & Medical', '2025-07-04 08:10:00', 2, 2),
(20, 13, 'Insurance', '2025-07-04 22:00:00', 2, 2),
(25, 25, 'Groceries', '2025-07-01 09:20:00', 3, 3),
(26, 40, 'Health & Medical', '2025-07-01 18:00:00', 3, 3),
(27, 50, 'Food & Beverages', '2025-07-02 10:00:00', 3, 3),
(28, 14, 'Shopping', '2025-07-02 17:00:00', 3, 3),
(29, 17, 'Mobile & Internet', '2025-07-03 11:30:00', 3, 3),
(30, 12, 'Entertainment', '2025-07-03 20:30:00', 3, 3),
(31, 28, 'Utilities', '2025-07-04 07:50:00', 3, 3),
(32, 10, 'Education', '2025-07-04 22:10:00', 3, 3),
(33, 2500, 'Saving', '2025-07-03 10:00:00', 3, 3),
(34, 2500, 'Saving', '2025-07-05 12:00:00', 3, 3),
(35, 600, 'Saving', '2025-07-05 18:00:00', 3, 3),
(36, 600, 'Saving', '2025-07-05 20:00:00', 3, 3),
(47, 120, 'Food & Beverages', '2025-01-08 00:00:00', 1, 1),
(48, 45, 'Transport', '2025-01-10 00:00:00', 1, 1),
(49, 80, 'Groceries', '2025-01-13 00:00:00', 1, 1),
(50, 55, 'Mobile & Internet', '2025-01-16 00:00:00', 1, 1),
(51, 30, 'Entertainment', '2025-01-20 00:00:00', 1, 1),
(52, 90, 'Education', '2025-01-25 00:00:00', 1, 1),
(53, 130, 'Food & Beverages', '2025-02-06 00:00:00', 1, 1),
(54, 50, 'Transport', '2025-02-09 00:00:00', 1, 1),
(55, 95, 'Groceries', '2025-02-13 00:00:00', 1, 1),
(56, 55, 'Mobile & Internet', '2025-02-16 00:00:00', 1, 1),
(57, 32, 'Entertainment', '2025-02-21 00:00:00', 1, 1),
(58, 100, 'Education', '2025-02-23 00:00:00', 1, 1),
(59, 140, 'Food & Beverages', '2025-03-05 00:00:00', 1, 1),
(60, 50, 'Transport', '2025-03-09 00:00:00', 1, 1),
(61, 105, 'Groceries', '2025-03-13 00:00:00', 1, 1),
(62, 55, 'Mobile & Internet', '2025-03-16 00:00:00', 1, 1),
(63, 50, 'Utilities', '2025-03-18 00:00:00', 1, 1),
(64, 30, 'Entertainment', '2025-03-22 00:00:00', 1, 1),
(65, 80, 'Health & Medical', '2025-03-28 00:00:00', 1, 1),
(66, 130, 'Food & Beverages', '2025-04-08 00:00:00', 1, 1),
(67, 60, 'Transport', '2025-04-10 00:00:00', 1, 1),
(68, 100, 'Groceries', '2025-04-13 00:00:00', 1, 1),
(69, 55, 'Mobile & Internet', '2025-04-15 00:00:00', 1, 1),
(70, 60, 'Utilities', '2025-04-18 00:00:00', 1, 1),
(71, 35, 'Entertainment', '2025-04-20 00:00:00', 1, 1),
(72, 100, 'Education', '2025-04-26 00:00:00', 1, 1),
(73, 140, 'Food & Beverages', '2025-05-07 00:00:00', 1, 1),
(74, 55, 'Transport', '2025-05-09 00:00:00', 1, 1),
(75, 110, 'Groceries', '2025-05-12 00:00:00', 1, 1),
(76, 55, 'Mobile & Internet', '2025-05-15 00:00:00', 1, 1),
(77, 60, 'Utilities', '2025-05-18 00:00:00', 1, 1),
(78, 90, 'Rent & Loan', '2025-05-19 00:00:00', 1, 1),
(79, 30, 'Entertainment', '2025-05-22 00:00:00', 1, 1),
(80, 75, 'Donations & Zakat', '2025-05-29 00:00:00', 1, 1),
(81, 150, 'Food & Beverages', '2025-06-07 00:00:00', 1, 1),
(82, 60, 'Transport', '2025-06-09 00:00:00', 1, 1),
(83, 100, 'Groceries', '2025-06-12 00:00:00', 1, 1),
(84, 55, 'Mobile & Internet', '2025-06-15 00:00:00', 1, 1),
(85, 60, 'Utilities', '2025-06-18 00:00:00', 1, 1),
(86, 90, 'Rent & Loan', '2025-06-19 00:00:00', 1, 1),
(87, 30, 'Entertainment', '2025-06-21 00:00:00', 1, 1),
(88, 50, 'Health & Medical', '2025-06-23 00:00:00', 1, 1),
(89, 60, 'Insurance', '2025-06-28 00:00:00', 1, 1),
(90, 110.5, 'Groceries', '2025-01-06 00:00:00', 2, 2),
(91, 135, 'Food & Beverages', '2025-01-15 00:00:00', 2, 2),
(92, 58.2, 'Transport', '2025-01-17 00:00:00', 2, 2),
(93, 49.99, 'Entertainment', '2025-01-23 00:00:00', 2, 2),
(94, 60, 'Mobile & Internet', '2025-01-25 00:00:00', 2, 2),
(95, 125.4, 'Food & Beverages', '2025-02-03 00:00:00', 2, 2),
(96, 46, 'Transport', '2025-02-06 00:00:00', 2, 2),
(97, 98, 'Utilities', '2025-02-11 00:00:00', 2, 2),
(98, 33.9, 'Entertainment', '2025-02-18 00:00:00', 2, 2),
(99, 95.5, 'Education', '2025-02-24 00:00:00', 2, 2),
(100, 142, 'Food & Beverages', '2025-03-04 00:00:00', 2, 2),
(101, 60, 'Transport', '2025-03-10 00:00:00', 2, 2),
(102, 99.5, 'Groceries', '2025-03-12 00:00:00', 2, 2),
(103, 61, 'Mobile & Internet', '2025-03-16 00:00:00', 2, 2),
(104, 23, 'Donations & Zakat', '2025-03-21 00:00:00', 2, 2),
(105, 40, 'Health & Medical', '2025-03-29 00:00:00', 2, 2),
(106, 120, 'Food & Beverages', '2025-04-05 00:00:00', 2, 2),
(107, 44.5, 'Transport', '2025-04-09 00:00:00', 2, 2),
(108, 110, 'Groceries', '2025-04-12 00:00:00', 2, 2),
(109, 59.9, 'Mobile & Internet', '2025-04-14 00:00:00', 2, 2),
(110, 37, 'Entertainment', '2025-04-17 00:00:00', 2, 2),
(111, 90, 'Education', '2025-04-22 00:00:00', 2, 2),
(112, 137, 'Food & Beverages', '2025-05-01 00:00:00', 2, 2),
(113, 57.5, 'Transport', '2025-05-08 00:00:00', 2, 2),
(114, 117.6, 'Groceries', '2025-05-10 00:00:00', 2, 2),
(115, 58, 'Mobile & Internet', '2025-05-18 00:00:00', 2, 2),
(116, 33, 'Entertainment', '2025-05-22 00:00:00', 2, 2),
(117, 70, 'Health & Medical', '2025-05-29 00:00:00', 2, 2),
(118, 140.5, 'Food & Beverages', '2025-06-03 00:00:00', 2, 2),
(119, 65, 'Transport', '2025-06-08 00:00:00', 2, 2),
(120, 109.9, 'Groceries', '2025-06-11 00:00:00', 2, 2),
(121, 57.8, 'Mobile & Internet', '2025-06-15 00:00:00', 2, 2),
(122, 60, 'Utilities', '2025-06-21 00:00:00', 2, 2),
(123, 36, 'Entertainment', '2025-06-27 00:00:00', 2, 2),
(124, 60, 'Insurance', '2025-06-28 00:00:00', 2, 2),
(125, 125.2, 'Food & Beverages', '2025-01-09 00:00:00', 3, 3),
(126, 47, 'Transport', '2025-01-14 00:00:00', 3, 3),
(127, 112.5, 'Groceries', '2025-01-19 00:00:00', 3, 3),
(128, 55, 'Mobile & Internet', '2025-01-23 00:00:00', 3, 3),
(129, 29, 'Entertainment', '2025-01-26 00:00:00', 3, 3),
(130, 130, 'Food & Beverages', '2025-02-04 00:00:00', 3, 3),
(131, 54, 'Transport', '2025-02-06 00:00:00', 3, 3),
(132, 92, 'Groceries', '2025-02-12 00:00:00', 3, 3),
(133, 53.9, 'Mobile & Internet', '2025-02-17 00:00:00', 3, 3),
(134, 100, 'Education', '2025-02-21 00:00:00', 3, 3),
(135, 137.8, 'Food & Beverages', '2025-03-03 00:00:00', 3, 3),
(136, 48, 'Transport', '2025-03-08 00:00:00', 3, 3),
(137, 110.5, 'Groceries', '2025-03-11 00:00:00', 3, 3),
(138, 54, 'Mobile & Internet', '2025-03-18 00:00:00', 3, 3),
(139, 30, 'Entertainment', '2025-03-21 00:00:00', 3, 3),
(140, 75, 'Donations & Zakat', '2025-03-25 00:00:00', 3, 3),
(141, 121, 'Food & Beverages', '2025-04-05 00:00:00', 3, 3),
(142, 55, 'Transport', '2025-04-09 00:00:00', 3, 3),
(143, 98, 'Groceries', '2025-04-13 00:00:00', 3, 3),
(144, 60, 'Utilities', '2025-04-16 00:00:00', 3, 3),
(145, 38.9, 'Entertainment', '2025-04-20 00:00:00', 3, 3),
(146, 141.5, 'Food & Beverages', '2025-05-02 00:00:00', 3, 3),
(147, 50, 'Transport', '2025-05-09 00:00:00', 3, 3),
(148, 104, 'Groceries', '2025-05-13 00:00:00', 3, 3),
(149, 55, 'Mobile & Internet', '2025-05-16 00:00:00', 3, 3),
(150, 60, 'Utilities', '2025-05-18 00:00:00', 3, 3),
(151, 32, 'Entertainment', '2025-05-22 00:00:00', 3, 3),
(152, 149, 'Food & Beverages', '2025-06-04 00:00:00', 3, 3),
(153, 62, 'Transport', '2025-06-08 00:00:00', 3, 3),
(154, 111.9, 'Groceries', '2025-06-13 00:00:00', 3, 3),
(155, 54, 'Mobile & Internet', '2025-06-16 00:00:00', 3, 3),
(156, 35, 'Entertainment', '2025-06-22 00:00:00', 3, 3),
(157, 90, 'Health & Medical', '2025-06-25 00:00:00', 3, 3),
(158, 30, 'Food & Beverages', '2025-07-09 05:12:16', 10, 37),
(159, 80, 'Watch', '2025-07-09 05:14:28', 10, 37),
(160, 600, 'Shopping', '2025-07-09 05:15:14', 10, 37),
(162, 30, 'Food & Beverages', '2025-07-10 09:21:09', 1, 1),
(164, 500, 'Transport', '2025-07-10 09:25:47', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saving_goal`
--

CREATE TABLE `saving_goal` (
  `GOAL_ID` bigint(20) NOT NULL,
  `GOAL_NAME` varchar(200) NOT NULL,
  `GOAL_FREQUENCY` varchar(20) NOT NULL,
  `GOAL_TARGET_AMOUNT` double NOT NULL,
  `GOAL_SAVE_AMOUNT` double NOT NULL,
  `GOAL_CURRENT_AMOUNT` double NOT NULL,
  `GOAL_DEADLINE` date NOT NULL,
  `GOAL_STATUS` varchar(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saving_goal`
--

INSERT INTO `saving_goal` (`GOAL_ID`, `GOAL_NAME`, `GOAL_FREQUENCY`, `GOAL_TARGET_AMOUNT`, `GOAL_SAVE_AMOUNT`, `GOAL_CURRENT_AMOUNT`, `GOAL_DEADLINE`, `GOAL_STATUS`, `USER_ID`) VALUES
(3, 'Car Deposit', 'Monthly', 8000, 545.45, 2000, '2026-06-01', 'Ongoing', 2),
(4, 'Wedding Savings', 'Weekly', 10000, 81.25, 3500, '2027-01-15', 'Ongoing', 2),
(5, 'Master’s Degree', 'Monthly', 25000, 740.74, 5000, '2027-09-01', 'Ongoing', 3),
(6, 'Home Renovation', 'Weekly', 6000, 85.71, 1200, '2026-08-01', 'Ongoing', 3),
(11, 'New Car', 'Monthly', 50000, 925.93, 0, '2029-11-30', 'Ongoing', 1),
(12, 'New Motor', 'Monthly', 30000, 810.81, 0, '2028-07-08', 'Ongoing', 1),
(13, 'Watch', 'Weekly', 350, 70, 350, '2025-08-09', 'Complete', 1),
(14, 'Diploma', 'Monthly', 3000, 3000, 0, '2025-06-30', 'Past Due', 1),
(15, 'Watch', 'Weekly', 350, 54, 80, '2025-08-09', 'Ongoing', 37),
(16, 'Glass', 'Monthly', 200, 50, 0, '2025-10-10', 'Ongoing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USER_ID` bigint(20) NOT NULL,
  `USER_FULLNAME` varchar(200) NOT NULL,
  `USER_EMAIL` varchar(30) NOT NULL,
  `USER_PHONE_NO` varchar(12) NOT NULL,
  `USERNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(30) NOT NULL,
  `USER_TYPE` varchar(10) NOT NULL,
  `USER_STATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_ID`, `USER_FULLNAME`, `USER_EMAIL`, `USER_PHONE_NO`, `USERNAME`, `PASSWORD`, `USER_TYPE`, `USER_STATUS`) VALUES
(1, 'Aina Binti Ahmad', 'aina.ahmad@email.com', '0123456789', 'aina.ahmad', 'aina123', 'customer', 'Active'),
(2, 'Firdaus Bin Mohd', 'firdaus.mohd@email.com', '0176543210', 'firdaus.mohd', 'firdaus222', 'customer', 'Inactive'),
(3, 'Siti Noraini Binti Hassan', 'noraini.hassan@email.com', '0198765432', 'siti.noraini', 'noraini333', 'customer', 'Active'),
(4, 'Ahmad Azim bin Hassan', 'azim.hassan@gmail.com', '0123456789', 'azimazim', 'azim444', 'admin', 'Active'),
(5, 'Nur Aina binti Zulkifli', 'aina.zulkifli@gmail.com', '0197654321', 'ainaaina', 'aina555', 'admin', 'Active'),
(6, 'Muhammad Hafiz bin Rahman', 'hafiz.rahman@gmail.com', '0131234567', 'hafizhafiz', 'hafiz222', 'customer', 'Active'),
(7, 'Siti Aisyah binti Ahmad', 'aisyah.ahmad@gmail.com', '0178910111', 'aisyahaisyah', 'aisyah333', 'customer', 'Active'),
(8, 'Mohd Faizal bin Osman', 'faizal.osman@gmail.com', '0136677889', 'faizalfaizal', 'faizal888', 'customer', 'Active'),
(9, 'Nor Alia binti Azman', 'alia.azman@gmail.com', '0182345678', 'aliaalia', 'alia999', 'customer', 'Active'),
(10, 'Haziq Ramli bin Mahmud', 'haziq.ramli@gmail.com', '0167778886', 'haziqhaziq', 'haziq777', 'customer', 'Active'),
(11, 'Fatin Nabila binti Sulaiman', 'fatin.sulaiman@gmail.com', '0121234567', 'fatinfatin', 'fatin222', 'customer', 'Active'),
(12, 'Muhammad Irfan bin Yusoff', 'irfan.yusoff@gmail.com', '0145678901', 'irfanirfan', 'irfan333', 'customer', 'Active'),
(13, 'Nurul Syafiqah binti Salleh', 'syafiqah.salleh@gmail.com', '0198889997', 'syafiqahsyq', 'syafiqah888', 'customer', 'Active'),
(14, 'Chong Wei Jie', 'chong.weijie@gmail.com', '0162233445', 'weijie', 'weijie222', 'customer', 'Active'),
(15, 'Tan Mei Ling', 'tan.meiling@gmail.com', '0123344556', 'meiling', 'meiling333', 'customer', 'Active'),
(16, 'Lim Xiu Ying', 'lim.xiuying@gmail.com', '0176574839', 'xiuying', 'xiuying444', 'customer', 'Active'),
(17, 'Syed Zain bin Syed Hassan', 'zain.syed@gmail.com', '0191112223', 'zainzain', 'zain555', 'customer', 'Active'),
(18, 'Farhan Azlan bin Mohamad', 'farhan.azlan@gmail.com', '0128882222', 'farhanfarhan', 'farhan666', 'customer', 'Active'),
(19, 'Danish Aiman bin Ramzi', 'danish.aiman@gmail.com', '0124455667', 'danishdanish', 'danish777', 'customer', 'Active'),
(20, 'Ayu Maisarah binti Roslan', 'ayu.maisarah@gmail.com', '0195566778', 'ayuayu', 'ayu888', 'customer', 'Active'),
(21, 'Zulkifli Ahmad bin Sulaiman', 'zulkifli.sulaiman@gmail.com', '0137755443', 'zulkifliza', 'zulkifli999', 'customer', 'Active'),
(22, 'Nor Amirah binti Rahim', 'amirah.rahim@gmail.com', '0128765432', 'amirahamirah', 'amirah111', 'customer', 'Active'),
(23, 'Rafidah Mat binti Ibrahim', 'rafidah.ibrahim@gmail.com', '0149999998', 'rafidahmat', 'rafidah222', 'customer', 'Active'),
(24, 'Kavitha Rani d/o Kumar', 'kavitha.kumar@gmail.com', '0175647382', 'kavitharani', 'kavitha333', 'customer', 'Active'),
(25, 'Pravin Kumar a/l Ganesan', 'pravin.ganesan@gmail.com', '0179871234', 'pravinkumar', 'pravin444', 'customer', 'Active'),
(26, 'Jason Tan Wei Hong', 'jason.tan@gmail.com', '0166532148', 'jasontan', 'jason555', 'customer', 'Active'),
(27, 'Qistina Rozana binti Aziz', 'qistina.aziz@gmail.com', '0125558899', 'qistina', 'qistina666', 'customer', 'Inactive'),
(28, 'Putri Natasya binti Johari', 'putri.johari@gmail.com', '0182223334', 'putrinatasya', 'putri777', 'customer', 'Active'),
(29, 'Hakim Rahman bin Hamid', 'hakim.hamid@gmail.com', '0148881112', 'hakimrahman', 'hakim888', 'customer', 'Active'),
(30, 'Siti Sarah binti Zainal', 'sarah.zainal@gmail.com', '0193322110', 'sitisarah', 'sarah999', 'customer', 'Active'),
(31, 'Mohd Zamri bin Ismail', 'zamri.ismail@gmail.com', '0112233445', 'zamrizamri', 'zamri111', 'customer', 'Active'),
(32, 'Nurul Ain binti Jalil', 'nurul.ain@gmail.com', '0126677889', 'nurulain', 'nurul222', 'customer', 'Active'),
(33, 'Syafiq Hamzah bin Othman', 'syafiq.hamzah@gmail.com', '0178877665', 'syafiqhamzah', 'syafiq333', 'customer', 'Active'),
(36, 'Muhammad Aqil Fadlan ', 'aqilfadlan77@gmail.com', '0119981322', 'aqil123', 'aqil111', 'customer', 'Active'),
(37, 'Muhammad Ali bin Bakar', 'ali.bakar@gmail.com', '01144832489', 'bakar33', 'bakar12', 'customer', 'Active'),
(38, 'Muhammad Ali bin Bakar', 'syafi.idham@gmail.com', '01144832489', 'ali123', 'ali123', 'customer', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `LOG_ID` bigint(20) NOT NULL,
  `LOG_DATE` datetime NOT NULL,
  `USER_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`LOG_ID`, `LOG_DATE`, `USER_ID`) VALUES
(1, '2025-07-07 11:23:50', 1),
(2, '2025-07-07 15:19:35', 1),
(3, '2025-07-07 16:06:22', 1),
(4, '2025-07-07 16:08:43', 1),
(5, '2025-01-02 08:24:15', 5),
(6, '2025-01-04 14:02:19', 11),
(7, '2025-01-07 19:17:40', 23),
(8, '2025-01-10 09:38:02', 8),
(9, '2025-01-11 16:55:44', 13),
(10, '2025-01-13 11:03:50', 16),
(11, '2025-01-15 07:20:25', 4),
(12, '2025-01-17 21:11:36', 28),
(13, '2025-01-18 12:41:58', 32),
(14, '2025-01-20 22:36:11', 22),
(15, '2025-01-22 17:29:10', 7),
(16, '2025-01-23 09:59:39', 18),
(17, '2025-01-25 20:15:13', 31),
(18, '2025-01-28 14:33:56', 25),
(19, '2025-01-29 18:10:05', 15),
(20, '2025-01-30 06:44:37', 26),
(21, '2025-01-31 10:20:08', 10),
(22, '2025-01-02 18:02:00', 19),
(23, '2025-01-04 22:01:25', 12),
(24, '2025-01-05 07:51:39', 20),
(25, '2025-01-09 17:33:14', 21),
(26, '2025-01-12 21:12:09', 33),
(27, '2025-01-14 16:55:41', 24),
(28, '2025-01-18 12:20:53', 27),
(29, '2025-01-21 15:30:02', 9),
(30, '2025-01-25 13:44:27', 30),
(31, '2025-01-27 18:11:38', 17),
(32, '2025-01-28 08:07:23', 6),
(33, '2025-01-29 12:38:45', 29),
(34, '2025-01-31 20:55:20', 14),
(35, '2025-02-01 09:15:14', 6),
(36, '2025-02-02 15:19:02', 2),
(37, '2025-02-03 11:37:50', 23),
(38, '2025-02-04 14:49:36', 19),
(39, '2025-02-06 08:10:05', 11),
(40, '2025-02-07 20:25:09', 30),
(41, '2025-02-09 10:50:12', 5),
(42, '2025-02-10 07:48:22', 13),
(43, '2025-02-11 18:43:16', 16),
(44, '2025-02-13 15:00:33', 28),
(45, '2025-02-14 12:03:57', 4),
(46, '2025-02-15 20:31:21', 26),
(47, '2025-02-16 06:38:42', 7),
(48, '2025-02-17 22:19:28', 14),
(49, '2025-02-18 10:47:52', 32),
(50, '2025-02-20 13:08:21', 10),
(51, '2025-02-21 11:59:03', 15),
(52, '2025-02-23 14:26:29', 17),
(53, '2025-02-25 08:47:17', 24),
(54, '2025-02-27 21:22:35', 8),
(55, '2025-02-28 19:09:41', 1),
(56, '2025-02-02 09:02:55', 21),
(57, '2025-02-06 19:50:33', 20),
(58, '2025-02-11 16:20:37', 3),
(59, '2025-02-14 07:38:01', 25),
(60, '2025-02-17 18:19:55', 22),
(61, '2025-02-20 11:57:24', 9),
(62, '2025-02-23 15:32:13', 18),
(63, '2025-02-26 17:44:02', 12),
(64, '2025-02-28 22:53:39', 31),
(65, '2025-03-01 09:03:03', 24),
(66, '2025-03-02 14:29:19', 9),
(67, '2025-03-03 11:40:15', 21),
(68, '2025-03-04 19:52:42', 32),
(69, '2025-03-05 10:35:08', 15),
(70, '2025-03-06 13:07:51', 18),
(71, '2025-03-07 08:19:20', 23),
(72, '2025-03-08 16:41:53', 13),
(73, '2025-03-09 20:55:38', 2),
(74, '2025-03-10 15:00:30', 26),
(75, '2025-03-11 09:47:12', 29),
(76, '2025-03-13 21:14:56', 19),
(77, '2025-03-15 08:22:45', 5),
(78, '2025-03-16 11:32:19', 30),
(79, '2025-03-18 16:17:30', 20),
(80, '2025-03-19 12:03:58', 22),
(81, '2025-03-20 17:48:22', 10),
(82, '2025-03-21 19:41:37', 33),
(83, '2025-03-22 14:59:27', 17),
(84, '2025-03-24 09:06:45', 4),
(85, '2025-03-26 18:19:52', 8),
(86, '2025-03-28 11:29:01', 31),
(87, '2025-03-30 10:21:49', 27),
(88, '2025-03-03 17:08:18', 14),
(89, '2025-03-07 12:14:33', 16),
(90, '2025-03-10 07:59:25', 6),
(91, '2025-03-13 22:13:11', 7),
(92, '2025-03-17 14:36:43', 1),
(93, '2025-03-21 10:55:57', 3),
(94, '2025-03-26 20:30:10', 28),
(95, '2025-04-01 12:13:32', 18),
(96, '2025-04-02 16:08:50', 27),
(97, '2025-04-04 09:31:17', 6),
(98, '2025-04-05 18:53:12', 17),
(99, '2025-04-06 10:45:19', 25),
(100, '2025-04-07 19:37:29', 13),
(101, '2025-04-09 13:14:09', 20),
(102, '2025-04-11 16:28:35', 19),
(103, '2025-04-13 12:07:52', 31),
(104, '2025-04-14 15:21:43', 22),
(105, '2025-04-15 18:40:28', 15),
(106, '2025-04-17 14:51:22', 4),
(107, '2025-04-19 21:17:56', 11),
(108, '2025-04-20 17:09:11', 8),
(109, '2025-04-22 10:48:40', 33),
(110, '2025-04-23 19:32:24', 21),
(111, '2025-04-25 13:44:07', 2),
(112, '2025-04-26 15:08:33', 9),
(113, '2025-04-28 16:39:54', 14),
(114, '2025-04-30 18:01:22', 12),
(115, '2025-04-03 09:24:37', 23),
(116, '2025-04-07 16:18:50', 29),
(117, '2025-04-12 20:59:36', 24),
(118, '2025-04-15 12:17:19', 16),
(119, '2025-04-18 14:32:21', 5),
(120, '2025-04-21 17:43:51', 3),
(121, '2025-04-24 11:28:13', 30),
(122, '2025-04-27 09:50:24', 32),
(123, '2025-04-29 13:40:18', 26),
(124, '2025-04-30 21:13:29', 28),
(125, '2025-05-01 09:44:11', 5),
(126, '2025-05-02 17:05:38', 24),
(127, '2025-05-04 10:13:42', 18),
(128, '2025-05-05 20:30:15', 7),
(129, '2025-05-06 13:49:27', 8),
(130, '2025-05-08 18:16:38', 21),
(131, '2025-05-09 16:42:55', 31),
(132, '2025-05-10 15:01:44', 19),
(133, '2025-05-12 21:35:23', 25),
(134, '2025-05-13 09:58:41', 3),
(135, '2025-05-14 12:46:31', 22),
(136, '2025-05-16 17:19:08', 10),
(137, '2025-05-17 19:42:11', 20),
(138, '2025-05-18 11:03:20', 13),
(139, '2025-05-20 14:28:35', 14),
(140, '2025-05-22 15:31:19', 23),
(141, '2025-05-24 09:55:03', 1),
(142, '2025-05-26 16:27:50', 17),
(143, '2025-05-27 18:14:37', 28),
(144, '2025-05-29 13:18:29', 12),
(145, '2025-05-31 08:23:19', 26),
(146, '2025-05-03 12:34:23', 27),
(147, '2025-05-07 14:18:42', 4),
(148, '2025-05-11 09:40:33', 2),
(149, '2025-05-15 13:47:29', 30),
(150, '2025-05-19 20:03:19', 9),
(151, '2025-05-23 16:33:05', 33),
(152, '2025-05-25 10:46:12', 11),
(153, '2025-05-28 21:14:37', 29),
(154, '2025-05-30 19:27:25', 15),
(155, '2025-06-01 10:19:40', 22),
(156, '2025-06-02 13:46:13', 16),
(157, '2025-06-03 15:54:05', 19),
(158, '2025-06-04 08:34:13', 31),
(159, '2025-06-06 21:25:16', 24),
(160, '2025-06-08 18:21:14', 27),
(161, '2025-06-09 11:49:22', 20),
(162, '2025-06-10 13:35:30', 17),
(163, '2025-06-12 09:50:13', 13),
(164, '2025-06-13 12:28:45', 23),
(165, '2025-06-14 14:32:17', 2),
(166, '2025-06-16 11:57:41', 12),
(167, '2025-06-18 10:22:58', 30),
(168, '2025-06-20 19:36:54', 14),
(169, '2025-06-22 08:39:06', 11),
(170, '2025-06-24 17:44:10', 25),
(171, '2025-06-25 20:16:32', 29),
(172, '2025-06-27 15:51:42', 8),
(173, '2025-06-29 12:05:58', 6),
(174, '2025-06-30 13:22:03', 4),
(175, '2025-06-05 09:57:29', 26),
(176, '2025-06-07 13:47:15', 32),
(177, '2025-06-11 20:23:35', 33),
(178, '2025-06-15 09:06:41', 28),
(179, '2025-06-19 10:55:31', 1),
(180, '2025-06-21 18:42:29', 10),
(181, '2025-06-23 21:29:57', 21),
(182, '2025-06-26 14:40:08', 3),
(183, '2025-06-28 08:25:17', 7),
(184, '2025-06-30 21:10:24', 9),
(185, '2025-07-01 09:08:29', 2),
(186, '2025-07-02 16:14:37', 19),
(187, '2025-07-03 11:47:23', 15),
(188, '2025-07-04 18:30:56', 24),
(189, '2025-07-05 12:38:25', 5),
(190, '2025-07-06 20:20:41', 21),
(191, '2025-07-07 15:09:10', 16),
(192, '2025-07-01 10:12:34', 22),
(193, '2025-07-02 19:21:07', 6),
(194, '2025-07-03 21:10:53', 8),
(195, '2025-07-04 13:45:28', 23),
(196, '2025-07-05 08:57:22', 12),
(197, '2025-07-06 11:11:44', 18),
(198, '2025-07-07 19:37:50', 27),
(199, '2025-07-02 09:50:30', 13),
(200, '2025-07-03 18:03:23', 31),
(201, '2025-07-04 15:24:07', 30),
(202, '2025-07-05 16:45:35', 14),
(203, '2025-07-06 09:32:48', 25),
(204, '2025-07-07 21:11:21', 28),
(205, '2025-07-07 17:27:08', 4),
(206, '2025-07-07 17:28:54', 4),
(207, '2025-07-07 18:13:06', 4),
(208, '2025-07-07 18:18:09', 4),
(209, '2025-07-07 18:30:56', 4),
(210, '2025-07-07 18:46:14', 1),
(211, '2025-07-07 22:04:50', 1),
(212, '2025-07-07 22:21:32', 1),
(213, '2025-07-07 23:40:03', 4),
(214, '2025-07-08 07:13:58', 1),
(215, '2025-07-08 09:07:14', 36),
(216, '2025-07-08 09:09:50', 1),
(217, '2025-07-08 09:14:07', 4),
(218, '2025-07-08 09:23:21', 1),
(219, '2025-07-08 09:24:38', 4),
(220, '2025-07-08 09:24:48', 1),
(221, '2025-07-08 09:29:36', 4),
(222, '2025-07-08 09:36:25', 1),
(223, '2025-07-08 21:30:47', 4),
(224, '2025-07-08 21:57:36', 4),
(225, '2025-07-08 22:10:58', 1),
(226, '2025-07-08 22:25:46', 4),
(227, '2025-07-09 04:54:35', 1),
(228, '2025-07-09 04:57:35', 4),
(229, '2025-07-09 05:10:44', 37),
(230, '2025-07-09 05:16:31', 4),
(231, '2025-07-10 08:16:02', 4),
(232, '2025-07-10 08:31:52', 1),
(233, '2025-07-10 08:38:36', 1),
(234, '2025-07-10 08:41:40', 5),
(235, '2025-07-10 08:42:36', 1),
(236, '2025-07-10 08:47:49', 1),
(237, '2025-07-10 09:19:23', 38),
(238, '2025-07-10 09:19:54', 1),
(239, '2025-07-10 09:27:00', 4),
(240, '2025-07-10 09:29:52', 1),
(241, '2025-07-12 19:31:07', 1),
(242, '2025-07-12 19:32:04', 4),
(243, '2025-07-12 19:33:42', 1),
(244, '2025-07-12 19:39:29', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`BANK_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`BUDGET_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`EXP_ID`),
  ADD KEY `BANK_ID` (`BANK_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `saving_goal`
--
ALTER TABLE `saving_goal`
  ADD PRIMARY KEY (`GOAL_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`LOG_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `BANK_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `BUDGET_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `EXP_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `saving_goal`
--
ALTER TABLE `saving_goal`
  MODIFY `GOAL_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `budget`
--
ALTER TABLE `budget`
  ADD CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`BANK_ID`) REFERENCES `bank` (`BANK_ID`),
  ADD CONSTRAINT `expense_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `saving_goal`
--
ALTER TABLE `saving_goal`
  ADD CONSTRAINT `saving_goal_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `user_log_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
