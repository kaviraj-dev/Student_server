-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 20, 2021 at 06:05 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tb_student_details`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_student_marks`
--

CREATE TABLE `tb_student_marks` (
  `student_id` int(200) NOT NULL,
  `mark_id` int(200) NOT NULL DEFAULT 1,
  `student_name` text NOT NULL,
  `mark_1` int(100) NOT NULL,
  `mark_2` int(100) NOT NULL,
  `mark_3` int(100) NOT NULL,
  `total` int(100) NOT NULL,
  `rank` int(100) DEFAULT NULL,
  `result` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_student_marks`
--

INSERT INTO `tb_student_marks` (`student_id`, `mark_id`, `student_name`, `mark_1`, `mark_2`, `mark_3`, `total`, `rank`, `result`) VALUES
(20, 1, 'Kaviraj', 95, 95, 67, 257, NULL, 'Pass'),
(22, 1, 'saru', 67, 80, 100, 247, NULL, 'Pass'),
(26, 1, 'mark', 24, 56, 45, 125, NULL, 'Fail');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_student_marks`
--
ALTER TABLE `tb_student_marks`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_student_marks`
--
ALTER TABLE `tb_student_marks`
  MODIFY `student_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
