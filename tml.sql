-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2018 at 11:34 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tml`
--

-- --------------------------------------------------------

--
-- Table structure for table `available_product`
--

CREATE TABLE `available_product` (
  `id` int(8) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `avail_quantity` varchar(30) DEFAULT NULL,
  `update_at` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `pro_category_id` varchar(30) NOT NULL,
  `pro_category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category_details`
--

CREATE TABLE `category_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(120) DEFAULT NULL,
  `category_description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_details`
--

INSERT INTO `category_details` (`id`, `category_name`, `category_description`) VALUES
(20, 'pen', 'Boll Pen'),
(21, 'Clock', 'CricleClock'),
(22, 'Book', 'Note Book'),
(23, 'Pencil', 'HB Pencil'),
(24, 'BOX', 'Instrument Box'),
(25, 'BOLL', 'Rubber Ball'),
(26, 'Key Chain', 'Key chain'),
(27, 'Pen drive', 'Sandisk Pendrive'),
(28, 'Nokia 6300', 'Nokia 6300'),
(29, 'Bat', 'cricket Bat'),
(30, 'Lap Top', 'computer'),
(31, 'Tab', 'Samsung Tab'),
(32, 'Fan', 'Ceiling Fan'),
(33, 'Bag', 'School bag'),
(34, 'Sweet Corn', 'Vegitable'),
(35, 'Bananas', 'Vegitable'),
(36, 'Bulk Rolls', 'Vegitable');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` varchar(30) NOT NULL,
  `id` int(11) NOT NULL,
  `cust_name` varchar(100) DEFAULT NULL,
  `cust_address` varchar(200) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `contact_number_01` varchar(30) DEFAULT NULL,
  `contact_number_02` varchar(30) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `id`, `cust_name`, `cust_address`, `date`, `contact_number_01`, `contact_number_02`, `status`) VALUES
('CUS-1', 1, 'satu', 'sdgsdg', '2018-02-07', 'dfafda', 'dfafda', '1'),
('CUS-2', 2, 'satu', 'sdgsdg', '2018-02-07', 'dfafda', 'dfafda', '1'),
('CUS-3', 3, 'satu', 'dfadf dfa', '2018-02-07', '01620497314', 'dfafda', '1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `customer_address` varchar(500) DEFAULT NULL,
  `customer_contact1` varchar(100) DEFAULT NULL,
  `customer_contact2` varchar(100) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`id`, `customer_name`, `customer_address`, `customer_contact1`, `customer_contact2`, `balance`) VALUES
(8, 'Chandru', 'hsr layout', '7787876786', '989898988', 0),
(9, 'dhanush', 'hsr layout', '7787876786', '989898988', 0),
(10, 'bala', 'hsr layout', '7787876786', '989898988', 0),
(11, 'suraya', 'hsr layout', '7787876786', '989898988', 0),
(12, 'sridhar', 'hsr layout', '7787876786', '989898988', 0),
(13, 'jacob', 'hsr layout', '7787876786', '989898988', 80),
(14, 'sam', 'hsr layout', '7787876786', '989898988', 6240),
(15, 'nifin', 'hsr layout', '7787876786', '989898988', 0),
(16, 'jerin', 'hsr layout', '7787876786', '989898988', 1810),
(17, 'amal', 'hsr layout', '7787876786', '989898988', 0);

-- --------------------------------------------------------

--
-- Table structure for table `in_stock`
--

CREATE TABLE `in_stock` (
  `id` int(8) NOT NULL,
  `in_stock_id` varchar(30) NOT NULL,
  `product_id` varchar(30) DEFAULT NULL,
  `supplier_id` varchar(30) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `quantity` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `out_stock`
--

CREATE TABLE `out_stock` (
  `id` int(30) NOT NULL,
  `out_stock_id` varchar(30) NOT NULL,
  `product_id` varchar(30) DEFAULT NULL,
  `cust_id` varchar(30) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `quantity` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `id` int(11) NOT NULL,
  `pro_id` varchar(30) NOT NULL,
  `pro_name` varchar(30) DEFAULT NULL,
  `pro_barcode` varchar(30) DEFAULT NULL,
  `pro_category_id` varchar(30) DEFAULT NULL,
  `pro_description` varchar(30) DEFAULT NULL,
  `pro_image` varchar(30) DEFAULT NULL,
  `pro_date` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_avail`
--

CREATE TABLE `stock_avail` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_avail`
--

INSERT INTO `stock_avail` (`id`, `name`, `quantity`) VALUES
(22, 'Cello griper', 287),
(23, 'techo tip', 877),
(24, 'cello', 0),
(25, 'ceParker Urban Fashion ', 0),
(26, 'Satzuma Diamante Pen', 0),
(27, 'Lamy Mod 17 Safari Matt ...', 0),
(28, 'abc', 12),
(29, 'def', 10);

-- --------------------------------------------------------

--
-- Table structure for table `stock_details`
--

CREATE TABLE `stock_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_id` varchar(120) DEFAULT NULL,
  `stock_name` varchar(120) DEFAULT NULL,
  `stock_quatity` int(11) DEFAULT NULL,
  `supplier_id` varchar(250) DEFAULT NULL,
  `company_price` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `category` varchar(120) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expire_date` datetime DEFAULT NULL,
  `uom` varchar(120) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'remove'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_details`
--

INSERT INTO `stock_details` (`id`, `stock_id`, `stock_name`, `stock_quatity`, `supplier_id`, `company_price`, `selling_price`, `category`, `date`, `expire_date`, `uom`, `status`) VALUES
(34, 'SD1', 'Cello griper', 0, 'arjun', '9.00', '10.00', 'pen', '2013-08-14 21:01:01', '0000-00-00 00:00:00', '', 'remove'),
(35, 'SD35', 'techo tip', 0, 'sadham', '8.00', '10.00', 'pen', '2013-08-14 21:01:50', '0000-00-00 00:00:00', '', 'remove'),
(36, 'SD36', 'cello', 0, 'sadham', '7.00', '10.00', 'pen', '2013-08-14 21:02:08', '0000-00-00 00:00:00', '', 'remove'),
(37, 'SD37', 'ceParker Urban Fashion ', 0, 'sadham', '1000.00', '1100.00', 'pen', '2013-08-14 21:03:30', '0000-00-00 00:00:00', '', 'remove'),
(38, 'SD38', 'Satzuma Diamante Pen', 0, 'sadham', '500.00', '550.00', 'pen', '2013-08-14 21:03:52', '0000-00-00 00:00:00', '', 'remove'),
(39, 'SD39', 'Lamy Mod 17 Safari Matt ...', 0, 'sadham', '1980.00', '2000.00', 'pen', '2013-08-14 21:04:17', '0000-00-00 00:00:00', '', 'remove'),
(40, '', 'techo tip', 23, '', '0.00', '0.00', '', '2018-01-31 06:04:28', '2018-01-31 12:04:28', '', 'remove'),
(41, '', 'Cello griper', 1, '', '0.00', '0.00', '', '2018-02-06 11:40:53', '2018-02-06 17:40:53', '', NULL),
(42, '', 'Cello griper', 2, '', '0.00', '0.00', '', '2018-02-06 11:41:48', '2018-02-06 17:41:48', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_entries`
--

CREATE TABLE `stock_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_id` varchar(120) DEFAULT NULL,
  `stock_name` varchar(260) DEFAULT NULL,
  `stock_supplier_name` varchar(200) DEFAULT NULL,
  `category` varchar(120) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `company_price` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `opening_stock` int(11) DEFAULT NULL,
  `closing_stock` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `username` varchar(120) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `salesid` varchar(120) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `mode` varchar(150) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `count1` int(11) DEFAULT NULL,
  `billnumber` varchar(120) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'add'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_entries`
--

INSERT INTO `stock_entries` (`id`, `stock_id`, `stock_name`, `stock_supplier_name`, `category`, `quantity`, `company_price`, `selling_price`, `opening_stock`, `closing_stock`, `date`, `username`, `type`, `salesid`, `total`, `payment`, `balance`, `mode`, `description`, `due`, `subtotal`, `count1`, `billnumber`, `status`) VALUES
(261, 'PR3', 'Cello griper', 'arjun', '', 1000, '9.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '9000.00', '9000.00', '0.00', 'cheque', 'uouo', '0000-00-00 00:00:00', 9000, 1, 'BILL-126', 'add'),
(262, 'PR264', 'techo tip', 'Monish', '', 1000, '8.00', '10.00', 0, 1000, '2013-08-15 00:00:00', 'admin', 'entry', '', '8000.00', '8000.00', '0.00', 'cheque', '768768', '0000-00-00 00:00:00', 8000, 1, 'BILL-126', 'add'),
(263, 'SD263', 'Cello griper', '', '', 10, '0.00', '10.00', 1000, 990, '2013-08-15 00:00:00', 'admin', 'sales', 'SD263', '100.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 1, 'BILL-126', 'add'),
(264, 'SD264', 'Cello griper', '', '', 100, '0.00', '10.00', 990, 890, '2013-08-15 00:00:00', 'admin', 'sales', 'SD264', '1000.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 1, 'BILL-127', 'add'),
(265, 'SD265', 'Cello griper', '', '', 100, '0.00', '10.00', 890, 790, '2013-08-15 00:00:00', 'admin', 'sales', 'SD265', '1000.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 1, 'BILL-127', 'add'),
(266, 'SD266', 'Cello griper', '', '', 100, '0.00', '10.00', 790, 690, '2013-08-15 00:00:00', 'admin', 'sales', 'SD266', '1000.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 1, 'BILL-127', 'add'),
(267, 'SD267', 'Cello griper', '', '', 100, '0.00', '10.00', 690, 590, '2013-08-15 00:00:00', 'admin', 'sales', 'SD267', '1000.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 1, 'BILL-127', 'add'),
(268, 'SD268', 'Cello griper', '', '', 100, '0.00', '10.00', 590, 490, '2013-08-15 00:00:00', 'admin', 'sales', 'SD268', '1000.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 1, 'BILL-127', 'add'),
(269, 'SD269', 'Cello griper', '', '', 100, '0.00', '10.00', 490, 390, '2013-08-15 00:00:00', 'admin', 'sales', 'SD269', '1000.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 1, 'BILL-127', 'add'),
(270, 'SD270', 'Cello griper', '', '', 100, '0.00', '10.00', 390, 290, '2013-08-15 00:00:00', 'admin', 'sales', 'SD270', '1000.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 1, 'BILL-127', 'add'),
(271, 'SD270', 'techo tip', '', '', 100, '0.00', '10.00', 1000, 900, '2013-08-15 00:00:00', 'admin', 'sales', 'SD270', '1000.00', '0.00', '0.00', '', '', '0000-00-00 00:00:00', 0, 2, 'BILL-127', 'add');

-- --------------------------------------------------------

--
-- Table structure for table `stock_sales`
--

CREATE TABLE `stock_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `transactionid` varchar(250) DEFAULT NULL,
  `stock_name` varchar(200) DEFAULT NULL,
  `category` varchar(120) DEFAULT NULL,
  `supplier_name` varchar(200) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `username` varchar(120) DEFAULT NULL,
  `customer_id` varchar(120) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,0) DEFAULT NULL,
  `tax` decimal(10,0) DEFAULT NULL,
  `tax_dis` varchar(100) DEFAULT NULL,
  `dis_amount` decimal(10,0) DEFAULT NULL,
  `grand_total` decimal(10,0) DEFAULT NULL,
  `due` date DEFAULT NULL,
  `mode` varchar(250) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `count1` int(11) DEFAULT NULL,
  `billnumber` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_sales`
--

INSERT INTO `stock_sales` (`id`, `transactionid`, `stock_name`, `category`, `supplier_name`, `selling_price`, `quantity`, `amount`, `date`, `username`, `customer_id`, `subtotal`, `payment`, `balance`, `discount`, `tax`, `tax_dis`, `dis_amount`, `grand_total`, `due`, `mode`, `description`, `count1`, `billnumber`) VALUES
(20, 'SD263', 'Cello griper', '', '', '10.00', '10.00', '100.00', '2013-08-15', 'admin', 'jacob', '90.00', '10.00', '80.00', '10', '87879', 'bnmnbmn', '10', '100', '1970-01-01', 'cheque', 'uuuoiuo', 1, 'BILL-126'),
(21, 'SD264', 'Cello griper', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(22, 'SD265', 'Cello griper', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(23, 'SD266', 'Cello griper', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(24, 'SD267', 'Cello griper', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(25, 'SD268', 'Cello griper', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(26, 'SD269', 'Cello griper', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'sam', '990.00', '100.00', '890.00', '0', '10', '8787', '10', '1000', '1970-01-01', 'cheque', 'iyiuy', 1, 'BILL-127'),
(27, 'SD270', 'Cello griper', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'jerin', '1900.00', '190.00', '1810.00', '0', '78', 'hjhjkh', '100', '2000', '1970-01-01', 'cheque', 'khksg', 1, 'BILL-127'),
(28, 'SD270', 'techo tip', '', '', '10.00', '100.00', '1000.00', '2013-08-15', 'admin', 'jerin', '1900.00', '190.00', '1810.00', '0', '78', 'hjhjkh', '100', '2000', '1970-01-01', 'cheque', 'khksg', 2, 'BILL-127');

-- --------------------------------------------------------

--
-- Table structure for table `stock_user`
--

CREATE TABLE `stock_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_user`
--

INSERT INTO `stock_user` (`id`, `username`, `password`, `user_type`, `answer`) VALUES
(1, 'admin', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `store_details`
--

CREATE TABLE `store_details` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `log` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `pin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_details`
--

INSERT INTO `store_details` (`id`, `name`, `log`, `type`, `address`, `place`, `city`, `phone`, `email`, `web`, `pin`) VALUES
(1, 'Posnic', 'geobram -frnt.png', 'image/png', '133', 'HSR layout', 'bangalore', '7779897878', 'info@posnic.com', 'ponic.com', '60080');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `sup_id` varchar(30) DEFAULT NULL,
  `sup_name` varchar(100) DEFAULT NULL,
  `sup_address` varchar(100) DEFAULT NULL,
  `sup_contact_01` varchar(30) DEFAULT NULL,
  `sup_contact_02` varchar(30) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_details`
--

CREATE TABLE `supplier_details` (
  `id` int(10) NOT NULL,
  `supplier_name` varchar(200) DEFAULT NULL,
  `supplier_address` varchar(500) DEFAULT NULL,
  `supplier_contact1` varchar(100) DEFAULT NULL,
  `supplier_contact2` varchar(100) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_details`
--

INSERT INTO `supplier_details` (`id`, `supplier_name`, `supplier_address`, `supplier_contact1`, `supplier_contact2`, `balance`) VALUES
(37, 'Rahul', '#123,2nd sector ,hsr layout,nbangalore', '7787876786', '89798', 0),
(38, 'Monish', '#124,2nd sector,hsr layout,bangalore', '7787876786', '9539126325', 0),
(39, 'kiran', '#126,2nd sector,hsr layout,bangalore', '7787876786', '9539126325', 0),
(40, 'arjun', '#126,2nd sector,hsr layout,bangalore', '7787876786', '9539126325', 0),
(41, 'libin', '#126,2nd sector,hsr layout,bangalore', '7787876786', '9539126325', 0),
(42, 'sadham', '#126,2nd sector,hsr layout bangalore', '7787876786', '9539126325', 0),
(43, 'alex', '#126,2nd sector,hsr layout bangalore', '7787876786', '9539126325', 0),
(44, 'arun', '#126,2nd sector,hsr layout bangalore', '7787876786', '9539126325', 0),
(45, 'sachu', '#126,2nd sector,hsr layout bangalore', '7787876786', '9539126325', 0),
(46, 'nijan', '#126,2nd sector,hsr layout bangalore', '7787876786', '9539126325', 0),
(47, 'karthik', '#126,2nd sector,hsr layout bangalore', '7787876786', '9539126325', 0),
(48, 'santhosh', '#126,2nd sector,hsr layout bangalore', '7787876786', '9539126325', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `customer` varchar(250) DEFAULT NULL,
  `supplier` varchar(250) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rid` varchar(120) DEFAULT NULL,
  `receiptid` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uom_details`
--

CREATE TABLE `uom_details` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `spec` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uom_details`
--

INSERT INTO `uom_details` (`id`, `name`, `spec`) VALUES
(0000000006, 'UOM1', 'UOM1 Specification'),
(0000000007, 'UOM2', 'UOM2 Specification'),
(0000000008, 'UOM3', 'UOM3 Specification'),
(0000000009, 'UOM4', 'UOM4 Specification');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `utype` varchar(30) DEFAULT NULL,
  `image_path` varchar(200) DEFAULT NULL,
  `secret_answer` varchar(100) DEFAULT NULL,
  `access` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `email`, `password`, `username`, `utype`, `image_path`, `secret_answer`, `access`) VALUES
(1, 'Aseem', 'Chakrabarthy', 'aseem.cse.cu@gmail.com', '12345', 'aseemcu', 'admin', 'dsfsdfdsgfd', 'good', '1'),
(2, 'Monir', 'Islam', 'monirulislam@gmail.com', '12345', 'monirulislam', 'admin', 'dfgfdghfh', 'bad', '1'),
(3, 'Aseem', 'Chakrabarthy', 'aseem.cse.cu@gmail.com', '12345', 'rajancse', 'user', 'fdsdfdsf', 'cat', '0'),
(4, 'aseem', 'Chakrabarthy', 'aseem.cse.cu@gmail.com', '12345', 'zeoinfinity', 'User', 'WEB-INF\\resources\\user_image\\africanprogrammerslowerinternet.png', 'hasan', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `available_product`
--
ALTER TABLE `available_product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`pro_category_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `category_details`
--
ALTER TABLE `category_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `in_stock`
--
ALTER TABLE `in_stock`
  ADD PRIMARY KEY (`in_stock_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `out_stock`
--
ALTER TABLE `out_stock`
  ADD PRIMARY KEY (`out_stock_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`pro_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `stock_avail`
--
ALTER TABLE `stock_avail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_details`
--
ALTER TABLE `stock_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_entries`
--
ALTER TABLE `stock_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_sales`
--
ALTER TABLE `stock_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_user`
--
ALTER TABLE `stock_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_details`
--
ALTER TABLE `store_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `supplier_details`
--
ALTER TABLE `supplier_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uom_details`
--
ALTER TABLE `uom_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `available_product`
--
ALTER TABLE `available_product`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_details`
--
ALTER TABLE `category_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `in_stock`
--
ALTER TABLE `in_stock`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `out_stock`
--
ALTER TABLE `out_stock`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_info`
--
ALTER TABLE `product_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_avail`
--
ALTER TABLE `stock_avail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `stock_details`
--
ALTER TABLE `stock_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `stock_entries`
--
ALTER TABLE `stock_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `stock_sales`
--
ALTER TABLE `stock_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `stock_user`
--
ALTER TABLE `stock_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_details`
--
ALTER TABLE `store_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_details`
--
ALTER TABLE `supplier_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `uom_details`
--
ALTER TABLE `uom_details`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
