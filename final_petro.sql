-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2023 at 08:50 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_petro`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_expired_orders` ()  BEGIN
    DECLARE count INT;
    SELECT COUNT(Oid) INTO count FROM ordert WHERE ndate < CURRENT_DATE();
    IF(count > 0) THEN
        UPDATE ordert SET remark = "EXPIRED" WHERE ndate < CURRENT_DATE();
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `all_manager`
--

CREATE TABLE `all_manager` (
  `manager_id` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_manager`
--

INSERT INTO `all_manager` (`manager_id`, `email`, `type`) VALUES
('FM_001', 'achala.magallagoda@gmail.com', 'manager'),
('SM_001', 'mrm.ashfak1@gmail.com', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Oid` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `p_id` int(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `odt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `com_id` int(10) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `issue_type` varchar(100) NOT NULL,
  `complain` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Pending',
  `response_date` varchar(100) NOT NULL DEFAULT '0000-00-00',
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complain`
--

INSERT INTO `complain` (`com_id`, `user_id`, `issue_type`, `complain`, `date_time`, `status`, `response_date`, `response`) VALUES
(1, 'PUM005', '', 'issue with the payment sheet for April, Can I know my Ot hours in April', '2023-05-13 12:56:17', 'Viewed', '2023-05-02', 'I send those details to the working Gmail.'),
(2, 'PUM005', '', 'can\'t change my password because I have forgotten the existing password', '2023-05-13 12:55:37', 'Replied', '2023-05-03', 'Now your password has been reset, use default password 1234.'),
(3, 'PUM005', '', 'order_id 12 that order i completed correctly,but that details are not update in system', '2023-05-12 13:22:48', 'Pending', '0000-00-00', ''),
(9, 'CUST012', '', 'I have a issue on Store Order', '2023-05-13 12:57:22', 'Viewed', '0000-00-00', NULL),
(10, '2', '', 'I have a issue on my order ID 2', '2023-05-13 22:56:50', 'Pending', '0000-00-00', NULL),
(11, '2', '', 'I have a issue in my Order ID 62', '2023-05-15 00:11:35', 'Pending', '0000-00-00', NULL),
(12, '3', '', 'i hv a', '2023-05-15 06:18:26', 'Pending', '0000-00-00', NULL),
(13, '3', '', 'hello', '2023-05-15 06:18:41', 'Pending', '0000-00-00', NULL),
(14, '3', '', 'hello', '2023-05-15 06:24:12', 'Pending', '0000-00-00', NULL),
(15, '3', 'Fuel', 'wwww', '2023-05-15 06:33:06', 'Pending', '0000-00-00', NULL),
(16, '3', 'Store', 'order issue', '2023-05-15 06:39:31', 'Pending', '0000-00-00', NULL),
(17, '3', 'Store', 'hgkegkg', '2023-05-15 06:47:59', 'Pending', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complete_order`
--

CREATE TABLE `complete_order` (
  `ID` int(11) NOT NULL,
  `order_id` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pumper_id` varchar(256) NOT NULL,
  `Fuel_Type` varchar(256) NOT NULL,
  `vehicle_no` varchar(110) NOT NULL,
  `Remaining` int(11) NOT NULL,
  `pumped_liters` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MachineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complete_order`
--

INSERT INTO `complete_order` (`ID`, `order_id`, `user_id`, `pumper_id`, `Fuel_Type`, `vehicle_no`, `Remaining`, `pumped_liters`, `pay`, `time`, `MachineID`) VALUES
(91, '27', 9, 'PUM005', 'octane 92', 'CAQ-1232', 8, 1, 330, '2023-05-12 13:15:38', 3),
(92, '28', 9, 'PUM005', 'octane 92', 'CAW-2322', 7, 1, 330, '2023-05-12 13:15:38', 3),
(93, '21', 9, 'PUM005', 'octane 92', 'CAQ-1333', 6, 1, 330, '2023-05-12 13:15:38', 4),
(94, '23', 9, 'PUM005', 'octane 92', 'CBB-0001', 5, 5, 1500, '2023-05-12 13:15:38', 3),
(95, '31', 9, 'PUM005', 'octane 92', 'CAW-1232', 4, 4, 1200, '2023-05-12 13:15:38', 3),
(96, '33', 9, 'PUM005', 'octane 92', 'CAW-1212', 3, 5, 1650, '2023-05-12 13:15:38', 4),
(97, 'Non-OID', 1, 'PUM005', 'octane 95', 'CAQ-133', 0, 1, 380, '2023-05-12 13:15:38', 3),
(98, 'Non-OID', 1, 'PUM005', 'octane 95', 'CAW-1234', 0, 1, 380, '2023-05-12 13:15:38', 3),
(99, 'Non-OID', 1, 'PUM005', 'octane 95', 'CAW-1234', 0, 2, 720, '2023-05-12 13:15:38', 4),
(100, '25', 9, 'PUM005', 'octane 92', 'CAQ-1212', 11, 1, 330, '2023-05-12 13:15:38', 3),
(101, '38', 1, 'PUM005', 'octane 92', 'CAW-1234', 8, 12, 3600, '2023-05-12 13:15:38', 4),
(102, '38', 1, 'PUM005', 'octane 92', 'CAW-1234', 0, 8, 2400, '2023-05-12 13:15:38', 3),
(105, '39', 2, 'PUM005', 'octane 92', 'CAS-8989', 8, 2, 600, '2023-05-14 23:57:49', 3),
(106, 'Non-OID', 1, 'PUM005', 'octane 92', 'CAQ-1333', 0, 3, 900, '2023-05-12 13:15:38', 3),
(107, '38', 1, 'PUM005', 'octane 92', 'CAW-1234', 5, 1, 300, '2023-05-12 13:15:38', 3),
(109, '39', 1, 'PUM005', 'octane 92', 'CAS-1200', 8, 2, 600, '2023-05-12 13:15:38', 3),
(110, '39', 1, 'PUM005', 'octane 92', 'CAS-1200', 4, 4, 1200, '2023-05-12 13:15:39', 4),
(111, 'Non-OID', 1, 'PUM005', 'octane 92', 'CAQ-1333', 0, 3, 900, '2023-05-12 13:15:39', 3),
(112, '40', 1, 'PUM005', 'octane 95', 'CAQ-1333', 1, 1, 330, '2023-05-12 13:13:06', 4),
(113, '40', 1, 'PUM005', 'octane 95', 'CAQ-1333', 0, 1, 0, '2023-05-12 13:15:39', 3),
(114, 'Non-OID', 1, 'PUM005', 'octane 92', 'CAQ-1333', 0, 1, 300, '2023-05-12 13:13:07', 3),
(115, 'Non-OID', 1, 'PUM005', 'octane 92', 'CAQ-1333', 0, 1, 300, '2023-05-12 13:13:07', 4),
(121, '38', 1, 'PUM005', 'octane 92', 'CAW-1234', 3, 1, 300, '2023-05-12 17:30:29', 4),
(122, '38', 1, 'PUM005', 'octane 92', 'CAW-1234', 2, 1, 300, '2023-05-12 17:30:35', 4),
(123, 'Non-OID', 2, 'PUM005', 'octane 92', 'CAS-8989', 0, 2, 600, '2023-05-14 23:57:05', 4),
(124, '39', 1, 'PUM005', 'octane 92', 'CAS-1200', 2, 2, 600, '2023-05-13 03:45:24', 4),
(126, '43', 2, 'PUM005', 'octane 92', 'CAD-0989', 0, 5, 1500, '2023-05-13 09:51:06', 4),
(127, '42', 2, 'PUM005', 'octane 92', 'CAD-6765', 4, 3, 900, '2023-05-13 09:58:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `daily_report`
--

CREATE TABLE `daily_report` (
  `date` date NOT NULL,
  `reduced92` int(11) NOT NULL,
  `complete92` int(11) NOT NULL,
  `diff92` int(11) NOT NULL,
  `reduced95` int(11) NOT NULL,
  `complete95` int(11) NOT NULL,
  `diff95` int(11) NOT NULL,
  `reducedSdl` int(11) NOT NULL,
  `completeSdl` int(11) NOT NULL,
  `diffSdl` int(11) NOT NULL,
  `reducedAdl` int(11) NOT NULL,
  `completeAdl` int(11) NOT NULL,
  `diffAdl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_report`
--

INSERT INTO `daily_report` (`date`, `reduced92`, `complete92`, `diff92`, `reduced95`, `complete95`, `diff95`, `reducedSdl`, `completeSdl`, `diffSdl`, `reducedAdl`, `completeAdl`, `diffAdl`) VALUES
('0000-00-00', 45, 0, 45, 45, 0, 45, 45, 0, 45, 45, 0, 45),
('2023-01-01', 222, 0, 0, 333, 0, 0, 444, 0, 0, 555, 0, 0),
('2023-01-03', 22, 0, 22, 22, 0, 22, 22, 0, 22, 22, 0, 22),
('2023-01-05', 45, 46, -1, 12, 0, 12, 12, 0, 12, 12, 0, 12),
('2023-01-12', 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1),
('2023-01-15', 20, 12, 8, 20, 28, -8, 20, 23, -3, 20, 16, 4),
('2023-01-16', 55, 0, 55, 55, 0, 55, 55, 0, 55, 55, 0, 55),
('2023-01-17', 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1),
('2023-01-18', 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1),
('2023-01-22', 23, 0, 23, 23, 0, 23, 32, 0, 32, 22, 0, 22),
('2023-01-28', 12, 0, 12, 12, 0, 12, 12, 0, 12, 12, 0, 12),
('2023-01-29', 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1),
('2023-01-30', 10, 0, 10, 10, 0, 10, 11, 0, 11, 11, 0, 11),
('2023-02-04', 22, 0, 22, 22, 0, 22, 22, 0, 22, 22, 0, 22),
('2023-02-05', 99, 0, 99, 99, 0, 99, 99, 0, 99, 99, 0, 99),
('2023-02-10', 100, 0, 100, 100, 0, 100, 105, 0, 105, 105, 0, 105),
('2023-05-12', 120, 59, 61, 350, 6, 344, 280, 0, 280, 200, 0, 200);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rating` varchar(100) NOT NULL,
  `feedback` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `date`, `rating`, `feedback`) VALUES
(1, 0, '2023-05-14 01:08:29', 'Average', 'Your Services are very helpful'),
(2, 2, '2023-05-14 01:08:42', 'Good', 'sss'),
(3, 2, '2023-05-15 00:11:03', 'satisfied', 'good'),
(4, 3, '2023-05-15 06:19:00', 'neutral', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `finalorder`
--

CREATE TABLE `finalorder` (
  `Oid` int(11) NOT NULL,
  `pids` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `total` double NOT NULL,
  `pmethod` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `used_points` int(100) NOT NULL,
  `odate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `finalorder`
--

INSERT INTO `finalorder` (`Oid`, `pids`, `user_id`, `address`, `phone`, `total`, `pmethod`, `status`, `used_points`, `odate`) VALUES
(5, '162,163', 2, '132/11,Hiripitiya,Pannipitiya', '0704122822', 8111, 'Cash', 1, 0, '2023-05-15 00:00:32'),
(6, '165', 2, '132,Kottawa,Pannipitiya', '0701097409', 7000, 'Cash', 1, 0, '2023-05-14 05:37:44'),
(7, '169', 2, '3 lane', '0701097565', 7000, 'Cash', 0, 0, '2023-05-14 23:51:13'),
(8, '170,171', 2, '3 lane', '0701097565', 6711, 'Cash', 0, 0, '2023-05-14 23:51:50'),
(9, '172', 2, '3 lane', '0701097565', 14000, 'Cash', 0, 0, '2023-05-14 23:52:18'),
(10, '173', 2, '3 lane', '0701097565', 6000, 'Cash', 0, 0, '2023-05-14 23:53:34'),
(11, '175', 3, '3 lane', '0701097565', 1111, 'Cash', 0, 0, '2023-05-15 06:17:07'),
(12, '177,179', 3, '143', '0701097409', 800800, 'Cash', 0, 0, '2023-05-15 06:22:44');

-- --------------------------------------------------------

--
-- Table structure for table `fuel_availability`
--

CREATE TABLE `fuel_availability` (
  `id` int(11) NOT NULL,
  `fuel_id` varchar(20) NOT NULL,
  `fuel_type` varchar(20) NOT NULL,
  `eligible_amount` int(20) NOT NULL,
  `remain_amount` int(20) NOT NULL,
  `price` double NOT NULL,
  `empty_space` int(11) NOT NULL,
  `tank_size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuel_availability`
--

INSERT INTO `fuel_availability` (`id`, `fuel_id`, `fuel_type`, `eligible_amount`, `remain_amount`, `price`, `empty_space`, `tank_size`) VALUES
(1, 'ADL', 'auto diesel', 15600, 700, 280, 4400, 20000),
(2, 'O92', 'octane 92', 28569, 690, 300, -6597, 22000),
(3, 'O95', 'octane 95', 36289, 1500, 330, -19789, 18000),
(4, 'SDL', 'super diesel', 15203, 575, 330, 4797, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `fuel_stock`
--

CREATE TABLE `fuel_stock` (
  `id` int(11) NOT NULL,
  `date_field` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fuel_type` varchar(20) NOT NULL,
  `arrive_amount` int(11) NOT NULL,
  `buying_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuel_stock`
--

INSERT INTO `fuel_stock` (`id`, `date_field`, `fuel_type`, `arrive_amount`, `buying_price`) VALUES
(1, '2023-05-09 05:04:52', 'octane 95', 12000, 0),
(2, '2023-05-09 08:33:04', 'auto diesel', 5000, 0),
(3, '2023-05-09 08:33:32', 'auto diesel', 600, 0),
(4, '2023-05-09 08:33:43', 'super diesel', 600, 0),
(5, '2023-05-13 04:12:40', 'octane 95', 5000, 1500000);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `first_name`, `last_name`, `nic`, `phone_no`, `type`, `gender`, `email`, `password`, `image`) VALUES
('SM001', 'Kamal', 'Perera', '2000164635', '0764589632', 'staff', 'Male', 'Kamal123@gmail.com', '12341234', '');

-- --------------------------------------------------------

--
-- Table structure for table `max`
--

CREATE TABLE `max` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `max`
--

INSERT INTO `max` (`id`, `vehicle`, `max`) VALUES
(1, 'car', 15),
(2, 'van', 15),
(3, '3 Wheel', 12),
(4, 'Mcycle', 10),
(5, 'bus', 30),
(6, 'Generator', 20),
(7, 'boats', 15),
(8, 'construction', 20),
(9, 'other', 10);

-- --------------------------------------------------------

--
-- Table structure for table `ordert`
--

CREATE TABLE `ordert` (
  `Oid` int(11) NOT NULL,
  `id` int(100) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `VMno` varchar(100) NOT NULL,
  `vtype` varchar(100) NOT NULL,
  `ftype` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ndate` varchar(100) NOT NULL,
  `points` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordert`
--

INSERT INTO `ordert` (`Oid`, `id`, `Email`, `VMno`, `vtype`, `ftype`, `amount`, `price`, `cdate`, `ndate`, `points`, `remark`) VALUES
(42, 2, 'thisuraperera09@gmail.com', 'CAD-6765', 'car', 'octane 92', '0', '3000', '2023-05-13 10:03:05', '2023/05/15', 0, 'completed'),
(43, 2, 'thisuraperera09@gmail.com', 'CAD-0989', 'car', 'octane 92', '0', '1500', '2023-05-13 09:51:06', '2023/05/15', 0, 'completed'),
(44, 2, 'thisuraperera09@gmail.com', 'My Machines', 'Any', 'super diesel', '1', '4290', '2023-05-13 10:43:50', '2023/05/14', 0, 'pending'),
(45, 2, 'thisuraperera09@gmail.com', 'CAD-6765', 'car', 'octane 95', '12', '3960', '2023-05-13 15:39:11', '2023/05/15', 0, 'pending'),
(47, 2, 'thisuraperera09@gmail.com', 'CAS-8989', 'threewheel', 'octane 92', '5', '1500', '2023-05-15 00:29:57', '2023/05/17', 0, 'pending'),
(49, 3, 'ucsc123@gmail.com', 'CAD-1111', 'car', 'octane 92', '5', '1500', '2023-05-15 06:16:36', '2023/05/17', 0, 'pending'),
(50, 2, 'thisuraperera09@gmail.com', 'CAD-0989', 'car', 'octane 92', '3', '900', '2023-09-15 06:41:35', '2023/09/17', 0, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `ot`
--

CREATE TABLE `ot` (
  `ID` int(11) NOT NULL,
  `Pumper_id` varchar(200) NOT NULL,
  `month` varchar(250) NOT NULL,
  `hours` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ot`
--

INSERT INTO `ot` (`ID`, `Pumper_id`, `month`, `hours`, `year`) VALUES
(2, 'Pum005', 'April', 1, 2023),
(6, 'Pum005', 'May', 2, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `porder`
--

CREATE TABLE `porder` (
  `Oid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `VMno` varchar(255) NOT NULL,
  `vtype` varchar(255) DEFAULT NULL,
  `ftype` varchar(255) NOT NULL,
  `amount` int(100) DEFAULT NULL,
  `points` int(11) NOT NULL,
  `petropoints` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `porder`
--

INSERT INTO `porder` (`Oid`, `id`, `email`, `VMno`, `vtype`, `ftype`, `amount`, `points`, `petropoints`) VALUES
(1, 4, '', '12', 'car', '92-Octane', 10, 0, 0),
(2, 3, '', 'CAD-3628', 'car', '92-Octane', 11, 0, 0),
(3, 4, '', 'CAD-3626', 'car', '92-Octane', 45, 0, 0),
(4, 4, '', 'CAD-3626', 'car', '92-Octane', 11, 0, 0),
(5, 4, '', 'CAD-3626', 'car', '92-Octane', 45, 0, 0),
(6, 4, '', 'FTG-8767', 'van', '92-Octane', 10, 0, 0),
(9, 4, '', 'CRS-9876', 'car', '92-Octane', 10, 0, 0),
(10, 5, '', 'CAA-2000', 'car', '95-Octane', 23, 0, 0),
(11, 5, '', 'CAA-2000', 'car', '95-Octane', 23, 0, 0),
(12, 5, '', 'CAA-2000', 'car', 'octane 92', 24, 0, 0),
(13, 5, '', 'CAA-2000', 'car', '95-Octane', 45, 0, 0),
(14, 5, '', 'CAA-2000', 'car', '95-Octane', 11, 0, 0),
(15, 5, '', 'CAA-2000', 'car', 'octane 92', 11, 0, 0),
(16, 5, '', 'CAA-2000', 'car', 'octane 92', 11, 0, 0),
(17, 5, '', 'CAA-2000', 'car', 'octane 92', 5, 0, 0),
(18, 5, '', 'CAA-2000', 'car', 'octane 92', 11, 0, 0),
(19, 0, 'nihindumethmadu123@gmail.com', 'CAQ-1233', 'car', '92-Octane', 10, 0, 0),
(20, 0, 'nihindumethmadu123@gmail.com', 'CAQ-1233', 'car', '92-Octane', 10, 0, 0),
(21, 0, 'nihindumethmadu123@gmail.com', 'CAQ-1233', 'car', '92-Octane', 10, 0, 0),
(22, 0, 'nihindumethmadu123@gmail.com', 'CAQ-1233', 'car', '92-Octane', 10, 0, 0),
(23, 6, 'nihindumethmadu123@gmail.com', 'CAQ-1233', 'car', '92-Octane', 4, 0, 0),
(24, 6, 'nihindumethmadu123@gmail.com', 'CAQ-1233', 'car', '92-Octane', 2, 0, 0),
(25, 6, 'nihindumethmadu123@gmail.com', 'CSA-8987', 'car', 'octane 95', 10, 0, 0),
(26, 6, 'nihindumethmadu123@gmail.com', 'CSA-8987', 'car', 'octane 95', 10, 0, 0),
(27, 1, 'nihindumethmadu123@gmail.com', 'CAQ-133', 'car', 'octane 92', 3, 0, 120),
(28, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 12, 0, 120),
(29, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 4, 0, 120),
(30, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 2, 0, 120),
(31, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 1, 0, 120),
(32, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 12, 0, 120),
(33, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 12, 0, 120),
(34, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 1, 0, 120),
(35, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 1, 0, 120),
(36, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 2, 0, 120),
(37, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 4, 0, 120),
(38, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 2, 0, 120),
(39, 1, 'nihindumethmadu123@gmail.com', 'CAS-1200', 'car', 'octane 92', 12, 0, 120),
(40, 1, 'nihindumethmadu123@gmail.com', 'CAQ-1333', 'car', 'octane 95', 2, 0, 90),
(41, 1, 'nihindumethmadu123@gmail.com', 'CAW-1234', 'car', 'octane 92', 4, 0, 127),
(42, 2, 'thisuraperera09@gmail.com', 'CAD-6765', 'car', 'octane 92', 10, 0, 0),
(43, 2, 'thisuraperera09@gmail.com', 'CAD-0989', 'car', 'octane 92', 5, 0, 0),
(44, 2, 'thisuraperera09@gmail.com', 'My Machines', NULL, 'super diesel', 13, 0, 0),
(45, 2, 'thisuraperera09@gmail.com', 'CAD-6765', 'car', 'octane 95', 12, 0, 4),
(46, 2, 'thisuraperera09@gmail.com', 'CAS-8989', 'threewheel', 'octane 92', 3, 0, 4),
(47, 2, 'thisuraperera09@gmail.com', 'CAS-8989', 'threewheel', 'octane 92', 5, 0, 16),
(48, 3, 'ucsc123@gmail.com', 'CAD-1111', 'car', 'octane 92', 5, 0, 0),
(49, 3, 'ucsc123@gmail.com', 'CAD-1111', 'car', 'octane 92', 5, 0, 0),
(50, 2, 'thisuraperera09@gmail.com', 'CAD-0989', 'car', 'octane 92', 3, 0, 16);

-- --------------------------------------------------------

--
-- Table structure for table `price_history`
--

CREATE TABLE `price_history` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fuel_type` varchar(100) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price_history`
--

INSERT INTO `price_history` (`id`, `date`, `fuel_type`, `price`) VALUES
(1, '2023-05-13 04:08:58', 'super diesel', 330);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `name`, `description`, `price`, `image`, `quantity`) VALUES
(14, 'Toyota Motor Oil SL/CF 10W-30', 'Toyota Motor Oil SL/CF 10W-30 European Car Formula (North America) or Protection Formula (rest of the World) Advanced Full Synthetic Motor Oil is engineered for the latest gasoline and diesel (without Diesel Particulate Filters or DPFs) engine technology delivering excellent all-round performance. It provides exceptional cleaning power, wear protection and overall performance. Mobil 1 0W-40 keeps your engine running like new in all driving conditions.', 5600, 'mo.jpg', 0),
(15, 'Toyota Motor Oil SN/CF 5W-30', 'Toyota Motor Oil SN/CF 5W-30 is meticulously engineered for today’s tougher engine specifications. It provides very good engine protection and helps promote long engine life.\r\n\r\nExtended protection against engine wear and deposits formation\r\nEngine protection during start up\r\nHelps combat sludge', 7000, 'mo.jpg', 0),
(16, 'Toyota Motor Oil 15W-40 CI-4', 'Toyota Motor Oil 15W-40 CI-4 European Car Formula (North America) or Protection Formula (rest of the World) Advanced Full Synthetic Motor Oil is engineered for the latest gasoline and diesel (without Diesel Particulate Filters or DPFs) engine technology delivering excellent all-round performance. It provides exceptional cleaning power, wear protection and overall performance. Mobil 1 0W-40 keeps your engine running like new in all driving conditions.', 1111, 'mo2.jpg', 19),
(17, 'PRESTONE ATF MV Stop Leak Fluid', 'PRESTONE ATF MV Stop Leak Fluid European Car Formula (North America) or Protection Formula (rest of the World) Advanced Full Synthetic Motor Oil is engineered for the latest gasoline and diesel (without Diesel Particulate Filters or DPFs) engine technology delivering excellent all-round performance. It provides exceptional cleaning power, wear protection and overall performance. Mobil 1 0W-40 keeps your engine running like new in all driving conditions.', 3000, 'mo3.png', 20),
(18, 'CALTEX Havoline Super 4T 20W-40', 'CALTEX Havoline Super 4T 20W-40 European Car Formula (North America) or Protection Formula (rest of the World) Advanced Full Synthetic Motor Oil is engineered for the latest gasoline and diesel (without Diesel Particulate Filters or DPFs) engine technology delivering excellent all-round performance. It provides exceptional cleaning power, wear protection and overall performance. Mobil 1 0W-40 keeps your engine running like new in all driving conditions.', 2600, 'mo4.png', 56),
(19, 'CALTEX Havoline Formula [SN] 10W-30', 'CALTEX Havoline Formula [SN] 10W-30 European Car Formula (North America) or Protection Formula (rest of the World) Advanced Full Synthetic Motor Oil is engineered for the latest gasoline and diesel (without Diesel Particulate Filters or DPFs) engine technology delivering excellent all-round performance. It provides exceptional cleaning power, wear protection and overall performance. Mobil 1 0W-40 keeps your engine running like new in all driving conditions.', 3400, 'mo5.jpg', 66),
(20, 'CALTEX Lanka Super Plus 40', 'CALTEX Lanka Super Plus 40 European Car Formula (North America) or Protection Formula (rest of the World) Advanced Full Synthetic Motor Oil is engineered for the latest gasoline and diesel (without Diesel Particulate Filters or DPFs) engine technology delivering excellent all-round performance. It provides exceptional cleaning power, wear protection and overall performance. Mobil 1 0W-40 keeps your engine running like new in all driving conditions.', 14000, 'mo6.jpg', 100),
(21, 'CALTEX Havoline Fully Synthetic CVT FLUID', 'CALTEX Havoline Fully Synthetic CVT FLUID European Car Formula (North America) or Protection Formula (rest of the World) Advanced Full Synthetic Motor Oil is engineered for the latest gasoline and diesel (without Diesel Particulate Filters or DPFs) engine technology delivering excellent all-round performance. It provides exceptional cleaning power, wear protection and overall performance. Mobil 1 0W-40 keeps your engine running like new in all driving conditions.', 12000, 'mo7.png', 77);

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `Oid` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `p_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `odt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_order`
--

INSERT INTO `product_order` (`Oid`, `user_id`, `p_id`, `name`, `price`, `quantity`, `image`, `odt`, `status`) VALUES
(162, 2, 15, 'Toyota Motor Oil SN/CF 5W-30', 7000, 1, 'mo.jpg', '2023-05-15 00:00:32', 1),
(163, 2, 16, 'Toyota Motor Oil 15W-40 CI-4', 1111, 1, 'mo2.jpg', '2023-05-15 00:00:32', 1),
(165, 2, 15, 'Toyota Motor Oil SN/CF 5W-30', 7000, 1, 'mo.jpg', '2023-05-14 05:37:44', 1),
(169, 2, 15, 'Toyota Motor Oil SN/CF 5W-30', 7000, 1, 'mo.jpg', '2023-05-14 23:50:54', 0),
(170, 2, 14, 'Toyota Motor Oil SL/CF 10W-30', 5600, 1, 'mo.jpg', '2023-05-14 23:51:19', 0),
(171, 2, 16, 'Toyota Motor Oil 15W-40 CI-4', 1111, 1, 'mo2.jpg', '2023-05-14 23:51:31', 0),
(172, 2, 15, 'Toyota Motor Oil SN/CF 5W-30', 7000, 2, 'mo.jpg', '2023-05-14 23:52:08', 0),
(173, 2, 17, 'PRESTONE ATF MV Stop Leak Fluid', 3000, 2, 'mo3.png', '2023-05-14 23:53:22', 0),
(175, 3, 16, 'Toyota Motor Oil 15W-40 CI-4', 1111, 1, 'mo2.jpg', '2023-05-15 06:16:55', 0),
(177, 3, 14, 'Toyota Motor Oil SL/CF 10W-30', 5600, 18, 'mo.jpg', '2023-05-15 06:20:54', 0),
(179, 3, 20, 'CALTEX Lanka Super Plus 40', 14000, 50, 'mo6.jpg', '2023-05-15 06:22:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pumper`
--

CREATE TABLE `pumper` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'not assigned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pumper`
--

INSERT INTO `pumper` (`id`, `email`, `status`) VALUES
('PUM001', 'lasal123.PUM@gmail.com', '0'),
('PUM002', 'saman75@gmail.com', 'not assigned'),
('PUM003', 'namal123.PUM@gmail.com', '0'),
('PUM004', 'nimesh123.PUM@gmail.com', 'not assigned'),
('PUM005', 'pasindugura123@gmail.com', 'assigned'),
('PUM006', 'hasindu78.pumper@gmail.com', 'assigned');

-- --------------------------------------------------------

--
-- Table structure for table `pumper_mashine`
--

CREATE TABLE `pumper_mashine` (
  `MachineID` varchar(10) NOT NULL,
  `PumpID` varchar(11) NOT NULL,
  `fuelType` varchar(11) NOT NULL,
  `pumperID` varchar(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pumper_mashine`
--

INSERT INTO `pumper_mashine` (`MachineID`, `PumpID`, `fuelType`, `pumperID`, `date`) VALUES
('1', 'D001', 'Diesel', '0', '0000-00-00'),
('1', 'D002', 'Diesel', '0', '0000-00-00'),
('2', 'D003', 'Diesel', 'PUM006', '2023-05-13'),
('2', 'D004', 'Diesel', '0', '0000-00-00'),
('3', 'P001', 'Petrol', '0', '0000-00-00'),
('3', 'P002', 'Petrol', '0', '0000-00-00'),
('4', 'P003', 'Petrol', '0', '0000-00-00'),
('4', 'P004', 'Petrol', 'PUM005', '2023-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `registered_users`
--

CREATE TABLE `registered_users` (
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `NIC` varchar(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `role` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registered_users`
--

INSERT INTO `registered_users` (`email`, `password`, `fname`, `lname`, `NIC`, `phone`, `role`, `status`) VALUES
('achala.magallagoda@gmail.com', '$2y$10$oHioRYtu3NJVYhg5Wq5FC.fGf7PLxLdmPywR9GkO0jq8It6ELEbK2', 'achala', 'punsara', '961440973V', '0774123722', 'manager', 1),
('hasindu78.pumper@gmail.com', '$2y$10$57.64vWYgOCYHVp0R.2Ex.Q6jZi5/qWnB.Gagj3gQkSAAB0HHToja', 'Hasindu', 'Sudeepa', '951740984V', '0704148264', 'pumper', 1),
('kamala@gmail.com', '$2y$10$TILiZ6i5JxaBPMYcCXZztuLgFPoIXFoosKuUxkXfht7lqJ21.e5vO', 'Namal', 'Rajapaksha', '961440984V', '0724122822', 'Admin', 1),
('lasal123.PUM@gmail.com', '$2y$10$5iCH5aiRmk1ekHh4Sha/sO.GRQM460iP06W4.kwQbHjj2wvLyLIEi', 'Lasal', 'Dimantha', '971440984V', '0788028108', 'pumper', 0),
('mrm.ashfak1@gmail.com', '$2y$10$sMZJ2Ig1qSF9VsD0ly9qKe0Q2jEneiuPx8hG8Jn.qWDLN7P3yN8py', 'Mohomed', 'Ashfak', '9914409715V', '0718908708', 'staff', 1),
('namal123.PUM@gmail.com', '$2y$10$tnAOY1H2YeUQ6SIoA0cnB.VOkXuVz83DhIR7RxEp9fNEAUPlxkim2', 'Namal', 'Rajakurana', '951440984V', '07604123876', 'pumper', 0),
('nihindumethmadu123@gmail.com', '$2y$10$NLq.wchcYXwpTW5TjvIa3.I3ph6caFOd8e/y.dahOBGlUfPP25R2O', 'lasindu', 'wathsan', '9914409785V', '0718028108', 'customer', 0),
('nimesh123.PUM@gmail.com', '$2y$10$/JRgnaNNPbvRTvBVo8slAeVXfMugrUhjiylM1tHQmr0tQvW1zXxLm', 'Nimesh', 'Lakmal', '941440984V', '0704132876', 'pumper', 1),
('pasindugura123@gmail.com', '$2y$10$9dHf4YEnbsGNL02rYmjtO.6nd3mq0CzQb7WZs9LuRFLY72ErHSryy', 'Isuru', 'Udana', '981230984V', '0704122877', 'pumper', 1),
('saman75@gmail.com', '$2y$10$DD/eenlujpe5sIDn/WnSVeZrLsL04U/mYUYv3c/dL7pZkjaL23IaK', 'Saman', 'Kumara', '991760984V', '0704122827', 'pumper', 1),
('thisuraperera09@gmail.com', '$2y$10$9dHf4YEnbsGNL02rYmjtO.6nd3mq0CzQb7WZs9LuRFLY72ErHSryy', 'Thisura', 'Perea', '990691232V', '0701097565', 'customer', 1),
('ucsc123@gmail.com', '$2y$10$Hr829rdlrmtAzGwgesO/OOmhRV4p4q5tV1g3cCulEA/5fLvOf62RO', 'ucsc', '123', '990691231V', '0701098780', 'customer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_precentage`
--

CREATE TABLE `salary_precentage` (
  `id` int(11) NOT NULL,
  `HRA` float NOT NULL,
  `Daily_allowances` float NOT NULL,
  `provident_fund` float NOT NULL,
  `OT` float NOT NULL,
  `Basic_salary` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary_precentage`
--

INSERT INTO `salary_precentage` (`id`, `HRA`, `Daily_allowances`, `provident_fund`, `OT`, `Basic_salary`, `date`) VALUES
(1, 2, 4, 1, 12, 10000, '2023-04-21 17:03:29'),
(2, 10, 5, 2, 50, 21000, '2023-05-02 14:30:43'),
(4, 8, 6, 3, 100, 25000, '2023-05-12 09:48:43'),
(5, 5, 4, 2, 120, 30000, '2023-05-13 13:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `total_salary`
--

CREATE TABLE `total_salary` (
  `id` int(11) NOT NULL,
  `Pumper_id` varchar(110) NOT NULL,
  `month` varchar(11) NOT NULL,
  `year` varchar(11) NOT NULL,
  `salary` double NOT NULL,
  `basic` double NOT NULL,
  `HRA` double NOT NULL,
  `DA` double NOT NULL,
  `GS` double NOT NULL,
  `PF` double NOT NULL,
  `OT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `total_salary`
--

INSERT INTO `total_salary` (`id`, `Pumper_id`, `month`, `year`, `salary`, `basic`, `HRA`, `DA`, `GS`, `PF`, `OT`) VALUES
(1, 'PUM005', 'March', '2023', 10000, 2000, 120, 123, 134, 45, 100),
(2, 'PUM005', 'April', '2023', 24730, 21000, 2100, 1050, 25150, 420, 1000),
(4, 'PUM005', 'May', '2023', 14335.44, 13200, 660, 528, 14628, 292.56, 240);

-- --------------------------------------------------------

--
-- Table structure for table `user_form`
--

CREATE TABLE `user_form` (
  `id` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `vno` varchar(255) DEFAULT NULL,
  `vno1` varchar(255) DEFAULT NULL,
  `vno2` varchar(255) DEFAULT NULL,
  `sNo` varchar(110) DEFAULT 'My Machines',
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_form`
--

INSERT INTO `user_form` (`id`, `email`, `vno`, `vno1`, `vno2`, `sNo`, `points`) VALUES
(1, 'nihindumethmadu123@gmail.com', 'CAQ-1333', 'CAW-1234', 'CAS-1200', '354', 127),
(2, 'thisuraperera09@gmail.com', NULL, 'CAS-8989', 'CAD-0989', 'My Machines', 16),
(3, 'ucsc123@gmail.com', 'CAD-8912', NULL, NULL, 'My Machines', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `v_id` int(11) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `vno` varchar(10) DEFAULT NULL,
  `vtype` varchar(10) DEFAULT NULL,
  `ftype` varchar(10) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`v_id`, `phone`, `vno`, `vtype`, `ftype`, `status`, `date`) VALUES
(1, '0718028108', 'CAQ-1333', 'car', 'petrol', 1, '2023-05-10 17:18:48'),
(10, '0718028108', 'CAW-1234', 'car', 'petrol', 1, '2023-05-09 07:38:43'),
(11, '0718028108', 'CAS-1200', 'car', 'petrol', 1, '2023-05-09 07:39:18'),
(12, '0701097409', 'CAD-6765', 'car', 'petrol', 0, '2023-05-13 22:51:02'),
(13, '0701097409', 'CAD-8981', 'car', 'petrol', 0, '2023-05-13 08:11:59'),
(14, '0701097409', 'CAD-0989', 'car', 'petrol', 1, '2023-05-13 08:13:45'),
(15, '0718028103', 'CAS-8989', 'threewheel', 'petrol', 1, '2023-05-13 22:51:17'),
(16, '0701098787', 'CAD-1111', 'car', 'petrol', 0, '2023-05-15 06:19:12'),
(17, '0701098780', 'CAD-8912', 'van', 'petrol', 1, '2023-05-15 06:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `working_time`
--

CREATE TABLE `working_time` (
  `id` int(11) NOT NULL,
  `Pumper_id` varchar(256) NOT NULL,
  `Login_Time` time NOT NULL,
  `Logout_TIME` time NOT NULL,
  `Date` date NOT NULL,
  `working_hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `working_time`
--

INSERT INTO `working_time` (`id`, `Pumper_id`, `Login_Time`, `Logout_TIME`, `Date`, `working_hours`) VALUES
(215, 'PUM005', '09:01:41', '09:02:21', '2023-05-02', 40),
(216, 'PUM005', '09:09:32', '10:27:55', '2023-05-02', 4703),
(217, 'PUM005', '12:53:49', '14:11:08', '2023-05-02', 4639),
(219, 'PUM005', '18:45:33', '19:21:50', '2023-05-02', 2177),
(220, 'PUM005', '19:45:13', '19:45:22', '2023-05-02', 9),
(221, 'PUM005', '19:46:12', '19:56:40', '2023-05-02', 628),
(222, 'PUM005', '21:49:09', '22:39:00', '2023-05-02', 2991),
(223, 'PUM005', '22:44:30', '00:45:10', '2023-05-03', 79160),
(224, 'PUM005', '10:31:47', '11:33:06', '2023-05-03', 3679),
(225, 'PUM005', '11:34:03', '11:34:10', '2023-05-03', 7),
(226, 'PUM005', '18:11:55', '18:11:58', '2023-05-03', 3),
(227, 'PUM005', '08:47:50', '12:21:43', '2023-05-04', 12833),
(228, 'PUM005', '14:19:22', '20:50:32', '2023-05-04', 23470),
(229, 'PUM005', '20:51:28', '20:54:38', '2023-05-04', 190),
(230, 'PUM005', '09:18:04', '09:24:15', '2023-05-05', 371),
(231, 'PUM005', '14:41:15', '14:41:27', '2023-05-05', 175),
(232, 'PUM005', '14:41:15', '14:44:10', '2023-05-05', 175),
(233, 'PUM005', '08:47:31', '09:12:50', '2023-05-07', 1519),
(235, 'PUM005', '09:13:42', '11:52:20', '2023-05-07', 9518),
(236, 'PUM005', '12:51:33', '15:30:04', '2023-05-07', 9511),
(237, 'PUM005', '16:20:49', '17:51:10', '2023-05-07', 5421),
(238, 'PUM005', '20:36:52', '20:39:43', '2023-05-07', 171),
(239, 'PUM005', '10:44:42', '11:10:17', '2023-05-08', 1535),
(240, 'PUM005', '14:04:24', '14:20:08', '2023-05-08', 944),
(241, 'PUM005', '18:50:57', '19:29:21', '2023-05-08', 2304),
(242, 'PUM005', '19:45:21', '19:46:12', '2023-05-08', 51),
(243, 'PUM005', '21:42:41', '22:18:34', '2023-05-08', 2153),
(244, 'PUM005', '09:34:21', '09:34:44', '2023-05-09', 23),
(245, 'PUM005', '09:35:06', '09:56:32', '2023-05-09', 1286),
(246, 'PUM005', '11:17:01', '11:38:03', '2023-05-09', 1262),
(247, 'PUM005', '17:44:54', '17:45:11', '2023-05-09', 17),
(249, 'PUM005', '17:46:00', '18:34:11', '2023-05-09', 2891),
(250, 'PUM005', '18:36:51', '20:21:38', '2023-05-09', 6287),
(251, 'PUM005', '20:31:30', '20:46:03', '2023-05-09', 873),
(252, 'PUM005', '02:05:34', '02:05:58', '0000-00-00', 24),
(253, 'Pum005', '10:16:55', '10:17:30', '2023-05-10', 35),
(254, 'Pum005', '10:17:53', '10:20:11', '2023-05-10', 138),
(257, 'Pum005', '10:38:26', '12:23:32', '2023-05-10', 6306),
(258, 'Pum005', '12:28:09', '12:38:18', '2023-05-10', 609),
(259, 'Pum005', '12:42:26', '14:57:13', '2023-05-10', 8087),
(260, 'Pum005', '14:57:20', '15:22:49', '2023-05-10', 1529),
(261, 'Pum005', '15:23:06', '16:38:30', '2023-05-10', 4524),
(262, 'Pum005', '21:12:15', '21:27:48', '2023-05-10', 933),
(263, 'Pum005', '21:32:07', '22:01:02', '2023-05-10', 1735),
(264, 'Pum005', '22:10:30', '22:47:18', '2023-05-10', 2208),
(265, 'Pum005', '09:49:07', '09:53:28', '2023-05-11', 261),
(266, 'Pum005', '10:03:41', '10:08:32', '2023-05-11', 291),
(267, 'Pum005', '12:51:34', '14:29:18', '2023-05-11', 5864),
(268, 'Pum005', '14:31:41', '15:07:04', '2023-05-11', 2123),
(269, 'Pum005', '09:19:23', '09:54:23', '2023-05-12', 2100),
(270, 'Pum005', '09:59:57', '10:08:50', '2023-05-12', 533),
(272, 'Pum005', '10:16:04', '10:46:16', '2023-05-12', 1812),
(273, 'Pum005', '11:18:16', '12:23:45', '2023-05-12', 3929),
(275, 'Pum005', '13:15:01', '13:22:07', '2023-05-12', 426),
(276, 'PUM005', '18:37:05', '19:26:06', '2023-05-12', 2941),
(277, 'PUM005', '19:39:31', '20:06:09', '2023-05-12', 1598),
(278, 'PUM005', '23:00:10', '23:46:56', '2023-05-12', 2806),
(279, 'PUM005', '08:52:43', '09:24:19', '2023-05-13', 1896),
(280, 'PUM005', '09:40:05', '09:41:13', '2023-05-13', 68),
(281, 'PUM005', '10:04:08', '10:09:37', '2023-05-13', 329),
(282, 'PUM005', '10:12:39', '10:50:40', '2023-05-13', 2281),
(283, 'PUM005', '21:04:06', '21:08:09', '2023-05-13', 243);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_manager`
--
ALTER TABLE `all_manager`
  ADD PRIMARY KEY (`manager_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Oid`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `complete_order`
--
ALTER TABLE `complete_order`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `daily_report`
--
ALTER TABLE `daily_report`
  ADD PRIMARY KEY (`date`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `finalorder`
--
ALTER TABLE `finalorder`
  ADD PRIMARY KEY (`Oid`);

--
-- Indexes for table `fuel_availability`
--
ALTER TABLE `fuel_availability`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuel_stock`
--
ALTER TABLE `fuel_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `max`
--
ALTER TABLE `max`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordert`
--
ALTER TABLE `ordert`
  ADD PRIMARY KEY (`Oid`);

--
-- Indexes for table `ot`
--
ALTER TABLE `ot`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `porder`
--
ALTER TABLE `porder`
  ADD PRIMARY KEY (`Oid`);

--
-- Indexes for table `price_history`
--
ALTER TABLE `price_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`Oid`);

--
-- Indexes for table `pumper`
--
ALTER TABLE `pumper`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pumper_mashine`
--
ALTER TABLE `pumper_mashine`
  ADD PRIMARY KEY (`PumpID`);

--
-- Indexes for table `registered_users`
--
ALTER TABLE `registered_users`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `salary_precentage`
--
ALTER TABLE `salary_precentage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `total_salary`
--
ALTER TABLE `total_salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_form`
--
ALTER TABLE `user_form`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `vno1` (`vno1`,`vno2`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`v_id`);

--
-- Indexes for table `working_time`
--
ALTER TABLE `working_time`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `com_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `complete_order`
--
ALTER TABLE `complete_order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `finalorder`
--
ALTER TABLE `finalorder`
  MODIFY `Oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fuel_availability`
--
ALTER TABLE `fuel_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fuel_stock`
--
ALTER TABLE `fuel_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `max`
--
ALTER TABLE `max`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ordert`
--
ALTER TABLE `ordert`
  MODIFY `Oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ot`
--
ALTER TABLE `ot`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `porder`
--
ALTER TABLE `porder`
  MODIFY `Oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `price_history`
--
ALTER TABLE `price_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `p_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `salary_precentage`
--
ALTER TABLE `salary_precentage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `total_salary`
--
ALTER TABLE `total_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_form`
--
ALTER TABLE `user_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `working_time`
--
ALTER TABLE `working_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_manager`
--
ALTER TABLE `all_manager`
  ADD CONSTRAINT `all_manager_ibfk_1` FOREIGN KEY (`email`) REFERENCES `registered_users` (`email`);

--
-- Constraints for table `pumper`
--
ALTER TABLE `pumper`
  ADD CONSTRAINT `pumper_ibfk_1` FOREIGN KEY (`email`) REFERENCES `registered_users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
