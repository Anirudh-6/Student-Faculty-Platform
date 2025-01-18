-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2024 at 08:55 PM
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
-- Database: `faculty_expertise`
--

-- --------------------------------------------------------

--
-- Table structure for table `expertise_category`
--

CREATE TABLE `expertise_category` (
  `id` int(6) UNSIGNED NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expertise_category`
--

INSERT INTO `expertise_category` (`id`, `category_name`) VALUES
(1, 'Select Category'),
(2, 'Analog Electronics'),
(3, 'Antenna Design'),
(4, 'Control System'),
(5, 'Signal Processing'),
(6, 'Image Processing'),
(7, 'Multimedia Communication'),
(8, 'Microelectronics and Semiconductors'),
(9, 'Digital Electronics'),
(10, 'Microwaves'),
(11, 'Radio Frequency Circuits'),
(12, 'Communication Networks'),
(13, 'Protocol Engineering'),
(14, 'Wireless Networks'),
(15, 'VLSI Designs'),
(16, 'Embedded Systems'),
(17, 'Coding Theory'),
(18, 'Optical Sensors'),
(19, 'Microprocessors and Microcontrollers Interface'),
(20, 'Analog electronics IC and Lab Softwares'),
(21, 'Data Communication Software and Simulations'),
(22, 'Digital Electronics Simulation Softwares'),
(23, 'Digital Signal Processing Lab Simulations'),
(24, 'RF and Microwave Simulation Softwares'),
(25, 'Sensors , Modules and Drivers.');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `office_hours` text NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `name`, `department`, `email`, `phone`, `office_hours`, `photo`) VALUES
(1, 'Dr. K C Narasimhamurthy', 'ETE', 'kcnmurthy@sit.ac.in', '96202 43260', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'kcn.jpg'),
(2, 'Dr. K Viswanath', 'ETE', 'vishwanath@sit.ac.in', '94813 46724', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'kv.jpg'),
(3, 'Dr. M N Sujatha', 'ETE', 'mnsujatha@sit.ac.in', '98801 45094', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'mns.jpg'),
(4, 'Dr. Mallikarjun B C', 'ETE', 'mallikarjun_bc@sit.ac.in', '99806 80753', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'mbc.jpg'),
(5, 'Dr. T N Chandrika', 'ETE', 'tnchandrika@sit.ac.in', '98801 22944', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'tcn.jpg'),
(6, 'Dr. H M Chandrashekar', 'ETE', 'hmchandrashekar@sit.ac.in', '99645 29852', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'hmc.jpg'),
(7, 'R N Sathisha', 'ETE', 'sathisharyan@sit.ac.in', '97387 66635', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'rns.jpg'),
(8, 'D K Kumuda', 'ETE', 'kumuda@sit.ac.in', '98863 30082', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'dkk.jpg'),
(9, 'L Usha', 'ETE', 'ushal@sit.ac.in', '98864 24946', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'ul.jpg'),
(10, 'Dr. Puneeth Kumar T R', 'ETE', 'punithkumar@sit.ac.in', '89046 85053', 'Monday - Friday 9Am to 5Pm\r\nSaturday 9Am to 12 30Pm', 'ptr.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_expertise`
--

CREATE TABLE `faculty_expertise` (
  `faculty_id` int(11) DEFAULT NULL,
  `expertise_category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_expertise`
--

INSERT INTO `faculty_expertise` (`faculty_id`, `expertise_category_id`, `subcategory_id`) VALUES
(1, 2, 1),
(1, 2, 2),
(1, 2, 3),
(1, 2, 4),
(1, 2, 5),
(3, 3, 6),
(3, 3, 7),
(3, 3, 8),
(3, 3, 9),
(3, 3, 10),
(9, 3, 6),
(9, 3, 7),
(9, 3, 8),
(9, 3, 9),
(9, 3, 10),
(10, 3, 6),
(10, 3, 7),
(10, 3, 8),
(10, 3, 9),
(10, 3, 10),
(1, 4, 11),
(1, 4, 12),
(1, 4, 13),
(1, 4, 14),
(1, 4, 15),
(6, 5, 16),
(6, 5, 17),
(6, 5, 18),
(6, 5, 19),
(6, 5, 20),
(6, 6, 21),
(6, 6, 22),
(6, 6, 23),
(6, 6, 24),
(6, 6, 25),
(2, 6, 21),
(2, 6, 22),
(2, 6, 23),
(2, 6, 24),
(2, 6, 25),
(6, 7, 26),
(6, 7, 27),
(6, 7, 28),
(6, 7, 29),
(6, 7, 30),
(1, 8, 31),
(1, 8, 32),
(1, 8, 33),
(1, 8, 34),
(1, 8, 35),
(4, 8, 31),
(4, 8, 32),
(4, 8, 33),
(4, 8, 34),
(4, 8, 35),
(1, 9, 36),
(1, 9, 37),
(1, 9, 38),
(1, 9, 39),
(1, 9, 40),
(4, 9, 36),
(4, 9, 37),
(4, 9, 38),
(4, 9, 39),
(4, 9, 40),
(5, 9, 36),
(5, 9, 37),
(5, 9, 38),
(5, 9, 39),
(5, 9, 40),
(6, 9, 36),
(6, 9, 37),
(6, 9, 38),
(6, 9, 39),
(6, 9, 40),
(10, 9, 36),
(10, 9, 37),
(10, 9, 38),
(10, 9, 39),
(10, 9, 40),
(3, 10, 41),
(3, 10, 42),
(3, 10, 43),
(3, 10, 44),
(3, 10, 45),
(10, 10, 41),
(10, 10, 42),
(10, 10, 43),
(10, 10, 44),
(10, 10, 45),
(9, 10, 41),
(9, 10, 42),
(9, 10, 43),
(9, 10, 44),
(9, 10, 45),
(3, 11, 46),
(3, 11, 47),
(3, 11, 48),
(3, 11, 49),
(3, 11, 50),
(10, 11, 46),
(10, 11, 47),
(10, 11, 48),
(10, 11, 49),
(10, 11, 50),
(9, 11, 46),
(9, 11, 47),
(9, 11, 48),
(9, 11, 49),
(9, 11, 50),
(4, 12, 51),
(4, 12, 52),
(4, 12, 53),
(4, 12, 54),
(4, 12, 55),
(5, 12, 51),
(5, 12, 52),
(5, 12, 53),
(5, 12, 54),
(5, 12, 55),
(10, 12, 51),
(10, 12, 52),
(10, 12, 53),
(10, 12, 54),
(10, 12, 55),
(4, 13, 56),
(4, 13, 57),
(4, 13, 58),
(4, 13, 59),
(4, 13, 60),
(5, 13, 56),
(5, 13, 57),
(5, 13, 58),
(5, 13, 59),
(5, 13, 60),
(10, 13, 56),
(10, 13, 57),
(10, 13, 58),
(10, 13, 59),
(10, 13, 60),
(4, 14, 61),
(4, 14, 62),
(4, 14, 63),
(4, 14, 64),
(4, 14, 65),
(10, 14, 61),
(10, 14, 62),
(10, 14, 63),
(10, 14, 64),
(10, 14, 65),
(1, 15, 66),
(1, 15, 67),
(1, 15, 68),
(1, 15, 69),
(1, 15, 70),
(4, 16, 71),
(4, 16, 72),
(4, 16, 73),
(4, 16, 74),
(4, 16, 75),
(5, 16, 71),
(5, 16, 72),
(5, 16, 73),
(5, 16, 74),
(5, 16, 75),
(10, 16, 71),
(10, 16, 72),
(10, 16, 73),
(10, 16, 74),
(10, 16, 75),
(4, 17, 76),
(4, 17, 77),
(4, 17, 78),
(4, 17, 79),
(4, 17, 80),
(6, 17, 76),
(6, 17, 77),
(6, 17, 78),
(6, 17, 79),
(6, 17, 80),
(10, 17, 76),
(10, 17, 77),
(10, 17, 78),
(10, 17, 79),
(10, 17, 80),
(5, 18, 81),
(5, 18, 82),
(5, 18, 83),
(5, 18, 84),
(5, 18, 85),
(1, 19, 87),
(1, 19, 89),
(4, 19, 86),
(4, 19, 90),
(1, 19, 91),
(6, 19, 86),
(6, 19, 88),
(1, 20, 92),
(1, 20, 93),
(1, 20, 93),
(1, 20, 94),
(1, 20, 95),
(1, 20, 96),
(1, 20, 97),
(4, 21, 98),
(4, 21, 100),
(4, 21, 101),
(1, 22, 102),
(5, 22, 102),
(5, 22, 103),
(4, 22, 103),
(6, 23, 105),
(6, 23, 106),
(6, 23, 107),
(6, 23, 108),
(4, 23, 105),
(4, 23, 107),
(3, 24, 109),
(10, 24, 109),
(10, 24, 110),
(10, 24, 111),
(9, 24, 109),
(1, 25, 112),
(1, 25, 113),
(1, 25, 114),
(1, 25, 115),
(1, 25, 116),
(1, 25, 117),
(4, 25, 112),
(4, 25, 113),
(4, 25, 114),
(4, 25, 115),
(4, 25, 116),
(3, 25, 112),
(3, 25, 114),
(3, 25, 115),
(3, 25, 116),
(3, 24, 118);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(6) UNSIGNED NOT NULL,
  `question_text` text NOT NULL,
  `question_category_id` int(6) UNSIGNED NOT NULL,
  `question_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `question_subcategory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_text`, `question_category_id`, `question_date`, `question_subcategory_id`) VALUES
(132, 'skjdhakashdkjassjdasd', 13, '2024-07-07 15:01:46', 56),
(133, 'skjdhakashdkjassjdasd', 14, '2024-07-07 15:01:54', 61),
(134, 'skjdhakashdkjassjdasd', 15, '2024-07-07 15:02:01', 66),
(135, 'skjdhakashdkjassjdasd', 16, '2024-07-07 15:02:06', 71),
(136, 'skjdhakashdkjassjdasd', 17, '2024-07-07 15:02:15', 76),
(137, 'skjdhakashdkjassjdasd', 18, '2024-07-07 15:02:24', 81),
(138, 'skjdhakashdkjassjdasd', 19, '2024-07-07 15:02:32', 86),
(139, 'skjdhakashdkjassjdasd', 2, '2024-07-07 15:02:40', 1),
(140, 'skjdhakashdkjassjdasd', 2, '2024-07-07 15:05:07', 1),
(141, 'skjdhakashdkjassjdasd', 19, '2024-07-07 15:11:38', 86),
(142, 'skjdhakashdkjassjdasd', 19, '2024-07-07 15:11:42', 86),
(143, 'skjdhakashdkjassjdasd', 15, '2024-07-07 15:11:53', 66),
(144, 'skjdhakashdkjassjdasd', 19, '2024-07-07 15:12:05', 88),
(145, 'sdsds', 19, '2024-07-07 15:12:23', 87),
(146, 'sdsdszds', 20, '2024-07-07 15:13:13', 93),
(147, 'dhksda', 20, '2024-07-07 15:21:55', 93),
(148, 'dhksdaaa', 2, '2024-07-07 15:22:06', 4),
(149, 'dhksdaaa', 2, '2024-07-07 15:22:10', 4);

-- --------------------------------------------------------

--
-- Table structure for table `question_category`
--

CREATE TABLE `question_category` (
  `id` int(6) UNSIGNED NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_category`
--

INSERT INTO `question_category` (`id`, `category_name`) VALUES
(1, 'ETE'),
(2, 'Computer Science'),
(3, 'Signal Processing'),
(4, 'Image Processing'),
(5, 'Image Processing'),
(6, 'Digital Electronics'),
(7, 'Multimedia Communication'),
(8, 'Microelectronics and Semiconductors'),
(9, 'Digital Electronics'),
(10, 'Microwaves'),
(11, 'Radio Frequency Circuits'),
(12, 'Communication Networks'),
(13, 'Protocol Engineering'),
(14, 'Wireless Networks'),
(15, 'VLSI Designs'),
(16, 'Embedded Systems'),
(17, 'Coding Theory'),
(18, 'Optical Sensors'),
(19, 'Microprocessors and Microcontrollers Interface'),
(20, 'Analog electronics IC and Lab Softwares');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(6) UNSIGNED NOT NULL,
  `reply_text` text NOT NULL,
  `question_id` int(6) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `faculty_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `reply_text`, `question_id`, `created_at`, `faculty_id`) VALUES
(41, 'Answer is Answer', 84, '2024-07-06 17:17:28', 0),
(42, 'analog electronics is analog electronics', 101, '2024-07-07 10:50:50', 0),
(43, 'khfejfewkj', 101, '2024-07-07 10:55:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(6) UNSIGNED NOT NULL,
  `expertise_category_id` int(6) UNSIGNED NOT NULL,
  `subcategory_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `expertise_category_id`, `subcategory_name`) VALUES
(1, 2, 'OpAmps'),
(2, 2, 'Analog Filters and Oscillators'),
(3, 2, 'DAC and ADC'),
(4, 2, 'Power Amplifiers'),
(5, 2, 'Others'),
(6, 3, 'Antennas and Radiation Pattern'),
(7, 3, 'Antenna Types and Arrays'),
(8, 3, 'Antenna Design and Parameters'),
(9, 3, 'Antenna Applications and Case Studies'),
(10, 3, 'Others'),
(11, 4, 'LTI Systems'),
(12, 4, 'Time Response Analysis and Feedback Control'),
(13, 4, 'Root Locus Techniques'),
(14, 4, 'Frequency Response Analysis - Bode Plot'),
(15, 4, 'Others'),
(16, 5, 'Classification of Systems and LTI System.'),
(17, 5, 'FT , FS and DFT'),
(18, 5, 'Z-Transformation'),
(19, 5, 'FIR and IIR Filters'),
(20, 5, 'Others'),
(21, 6, 'Image Enhancement Techniques'),
(22, 6, 'Image Transformation and Restoration'),
(23, 6, 'Image Compression'),
(24, 6, 'Image Segmentation and Object Recognition'),
(25, 6, 'Others'),
(26, 7, 'Multimedia Networking and Transport'),
(27, 7, 'Multimedia Data Compression'),
(28, 7, 'Multimedia Data Coding'),
(29, 7, 'Multimedia Content Delivery'),
(30, 7, 'Others'),
(31, 8, 'Semiconductor Physics'),
(32, 8, 'Semiconductor Devices'),
(33, 8, 'Analog and Digital Integrated Circuits'),
(34, 8, 'Microfabrication and Packaging'),
(35, 8, 'Others'),
(36, 9, 'Combinational Logic Circuits'),
(37, 9, 'Sequential Logic Circuits'),
(38, 9, 'Digital System Design'),
(39, 9, 'Memory and Programmable Logic'),
(40, 9, 'Others'),
(41, 10, 'Microwave Network Analysis'),
(42, 10, 'Microwave Components and Devices'),
(43, 10, 'Microwave Amplifiers and Oscillators'),
(44, 10, 'Microwave Antennas and Systems'),
(45, 10, 'others'),
(46, 11, 'RF Circuit Design Fundamentals'),
(47, 11, 'Passive RF Components and Networks'),
(48, 11, 'Active RF Components and Amplifiers'),
(49, 11, 'RF Oscillators and Mixers'),
(50, 11, 'others'),
(51, 12, 'Network Protocols and Architecture'),
(52, 12, 'Wireless and Mobile Networking'),
(53, 12, 'Network Security and Management'),
(54, 12, 'Quality of Service (QoS) and Traffic Management:'),
(55, 12, 'Others'),
(56, 13, 'Fundamentals of Protocols'),
(57, 13, 'Protocol Specification and Modeling'),
(58, 13, 'Protocol Design and Development'),
(59, 13, 'Protocol Implementation and Standardization'),
(60, 13, 'Others'),
(61, 14, 'Wireless Channel Characteristics'),
(62, 14, 'Principles of Wireless Communication '),
(63, 14, 'Wireless Medium Access Control (MAC) Protocols'),
(64, 14, 'Wireless Network Security'),
(65, 14, 'Others'),
(66, 15, 'MOSFETS and It\'s Fabrication'),
(67, 15, 'Combinational Logic Design'),
(68, 15, 'Sequential Logic Circuits'),
(69, 15, 'Design For Testability'),
(70, 15, 'others'),
(71, 16, 'Embedded System Architectures'),
(72, 16, 'Embedded Hardware and Software Development'),
(73, 16, 'Interrupt and Interrupt Handling'),
(74, 16, 'Embedded Systems peripherals'),
(75, 16, 'Others'),
(76, 17, 'Linear Block Codes'),
(77, 17, 'Cyclic Codes'),
(78, 17, 'Convolutional Codes and Hamming Code'),
(79, 17, 'Channel Coding'),
(80, 17, 'Others'),
(81, 18, 'Fundamentals of Optical Sensors'),
(82, 18, 'Optical Fiber Sensors'),
(83, 18, 'Photonic Sensors'),
(84, 18, 'Chemical and Biological Optic Sensore'),
(85, 18, 'Others'),
(86, 19, 'ARM Processor'),
(87, 19, 'Arduino and Raspberry Pi'),
(88, 19, '8051 Microcontroller'),
(89, 19, 'Tinkercad'),
(90, 19, 'Keil'),
(91, 19, 'Others'),
(92, 20, 'LM741 OpAmp IC'),
(93, 20, 'LM555 Timer'),
(94, 20, 'DAC and ADC'),
(95, 20, 'LT Spice and MicroWind'),
(96, 20, 'Waveform and 20Sim'),
(97, 20, 'Others'),
(98, 21, 'NS2 Simulator'),
(99, 21, 'NS3 and 5G Lena'),
(100, 21, 'LabView'),
(101, 21, 'Others'),
(102, 22, 'ISE Design '),
(103, 22, 'keil '),
(104, 22, 'Others'),
(105, 23, 'MATLAB'),
(106, 23, 'Simulink'),
(107, 23, 'Scilab'),
(108, 23, 'Others'),
(109, 24, 'AWR'),
(110, 24, 'ANSYS HFSS'),
(111, 24, 'Others'),
(112, 25, 'Baisc Sesnor and Actuators'),
(113, 25, 'Bluetooth and WIFI modules'),
(114, 25, 'Motor Driver'),
(115, 25, 'Relay '),
(116, 25, 'RF Transmitter and Receivers'),
(117, 25, 'others'),
(118, 24, 'IE3D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(6) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` enum('admin','faculty','tudent') NOT NULL DEFAULT 'faculty'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'kcn', 'kcn1234', ' kcnmurthy@sit.ac.in', 'faculty'),
(2, 'kv', 'kv1234', 'vishwanath@sit.ac.in', 'faculty'),
(3, 'mns', 'mns1234', 'mnsujatha@sit.ac.in', 'faculty'),
(4, 'mbc', 'mbc1234', 'mallikarjun_bc@sit.ac.in', 'faculty'),
(5, 'tnc', 'tcn1234', 'tnchandrika@sit.ac.in', 'faculty'),
(6, 'hmc', 'hmc1234', 'hmchandrashekar@sit.ac.in', 'faculty'),
(7, 'rns', 'rns1234', 'sathisharyan@sit.ac.in', 'faculty'),
(8, 'dkk', 'dkk1234', 'kumuda@sit.ac.in', 'faculty'),
(9, 'ul', 'ul1234', 'ushal@sit.ac.in', 'faculty'),
(10, 'ptr', 'ptr1234', 'punithkumar@sit.ac.in', 'faculty'),
(11, 'admin', 'password', 'admin@sit.ac.in', 'admin'),
(13, 'Anirudh', 'password', 'anirudh@sit.ac.in', 'tudent'),
(14, 'john_doe', 'password123', 'john.doe@example.com', 'faculty'),
(15, 'jane_doe', 'qwerty456', 'jane.doe@example.com', 'faculty'),
(16, 'admin', 'admin123', 'admin@example.com', 'faculty');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expertise_category`
--
ALTER TABLE `expertise_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_category_id` (`question_category_id`);

--
-- Indexes for table `question_category`
--
ALTER TABLE `question_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expertise_category_id` (`expertise_category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expertise_category`
--
ALTER TABLE `expertise_category`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `question_category`
--
ALTER TABLE `question_category`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`question_category_id`) REFERENCES `question_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
