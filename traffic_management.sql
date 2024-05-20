-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2024 at 07:17 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traffic_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`) VALUES
(1, 'Nirmal', 'admin', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `id` int(5) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `age` int(5) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(500) NOT NULL,
  `any_health_issue` varchar(500) NOT NULL,
  `wearing_glass` varchar(300) NOT NULL,
  `password` varchar(500) NOT NULL,
  `dealer_shop` text NOT NULL,
  `dealership_no` varchar(100) NOT NULL,
  `passkey` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `driving_instructor`
--

CREATE TABLE `driving_instructor` (
  `id` int(5) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `age` int(5) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(500) NOT NULL,
  `any_health_issue` varchar(500) NOT NULL,
  `wearing_glass` varchar(300) NOT NULL,
  `password` varchar(500) NOT NULL,
  `school_name` varchar(400) NOT NULL,
  `certificate_no` varchar(100) NOT NULL,
  `location` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `final_uk_license`
--

CREATE TABLE `final_uk_license` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `test_status` varchar(20) NOT NULL,
  `major_fault` text NOT NULL,
  `minor_fault` text NOT NULL,
  `rating` int(10) NOT NULL,
  `checklist_doc` text NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(2, 'traffic_officer'),
(3, 'driving_instructor'),
(4, 'user'),
(5, 'test_center'),
(6, 'dealer');

-- --------------------------------------------------------

--
-- Table structure for table `test_center`
--

CREATE TABLE `test_center` (
  `id` int(5) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `age` int(5) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(500) NOT NULL,
  `any_health_issue` varchar(500) NOT NULL,
  `wearing_glass` varchar(300) NOT NULL,
  `password` varchar(500) NOT NULL,
  `dealership_no` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `postal_code` int(10) NOT NULL,
  `passkey` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `test_center_nonavailability`
--

CREATE TABLE `test_center_nonavailability` (
  `id` int(11) NOT NULL,
  `test_center_id` int(5) NOT NULL,
  `non_availability_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `traffic_officer`
--

CREATE TABLE `traffic_officer` (
  `id` int(5) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `age` int(5) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(500) NOT NULL,
  `any_health_issue` varchar(500) NOT NULL,
  `wearing_glass` varchar(300) NOT NULL,
  `password` varchar(500) NOT NULL,
  `employee_no` varchar(100) NOT NULL,
  `working_location` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `age` int(5) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(500) NOT NULL,
  `any_health_issue` varchar(500) NOT NULL,
  `wearing_glass` varchar(300) NOT NULL,
  `password` varchar(500) NOT NULL,
  `photo` text NOT NULL,
  `government_doc` text NOT NULL,
  `provisional_license_status` int(5) NOT NULL COMMENT ' 1 -> applied, 2 -> approved, 3 -> reject',
  `comments_for_rejection` text NOT NULL,
  `final_uk_license_status` int(5) NOT NULL COMMENT '0 -> yet to apply, 1 -> applied, 2 -> approved, 3 -> rejected',
  `theory_test_status` int(2) NOT NULL COMMENT '0 -> pending, 1 -> completed',
  `practical_test_status` int(2) NOT NULL COMMENT '0 -> pending, 1 -> Applied, 2 -> scheduled,3-> completed',
  `created_by` int(5) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(5) NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_test_details`
--

CREATE TABLE `user_test_details` (
  `id` int(11) NOT NULL,
  `user_id` int(5) NOT NULL,
  `thoery_test_postal_code` int(20) NOT NULL,
  `test_center_id` int(20) NOT NULL,
  `theory_test_time_slot` varchar(200) NOT NULL,
  `test_center_result` varchar(100) NOT NULL,
  `theory_test_mark` varchar(100) NOT NULL,
  `hazard_perception` varchar(100) NOT NULL,
  `driving_practise_hours` int(10) NOT NULL,
  `driving_instructor_id` int(10) NOT NULL,
  `preferred_driving_instructor_id` int(10) NOT NULL,
  `practical_test_postal_code` int(20) NOT NULL,
  `training_proof` text NOT NULL,
  `practical_test_time_slot` varchar(200) NOT NULL,
  `practical_test_mark` varchar(20) NOT NULL,
  `theory_test_date` date NOT NULL,
  `practical_test_date` date NOT NULL,
  `theory_test_status` int(11) NOT NULL COMMENT '0 -> pending, 1 -> completed',
  `practical_test_status` int(11) NOT NULL COMMENT '0 -> pending, 1 -> Applied, 2 -> scheduled,3-> completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_vehicle`
--

CREATE TABLE `user_vehicle` (
  `id` int(10) NOT NULL,
  `dealer_id` int(10) NOT NULL,
  `traffic_officer_id` int(5) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `age` int(5) NOT NULL,
  `dob` date NOT NULL,
  `address` text NOT NULL,
  `vehicle_model` varchar(200) NOT NULL,
  `vehicle_no` varchar(200) NOT NULL,
  `has_vehicle_insurance` int(2) NOT NULL,
  `insurance_end_date` date NOT NULL,
  `complaint` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driving_instructor`
--
ALTER TABLE `driving_instructor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `final_uk_license`
--
ALTER TABLE `final_uk_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `test_center`
--
ALTER TABLE `test_center`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_center_nonavailability`
--
ALTER TABLE `test_center_nonavailability`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traffic_officer`
--
ALTER TABLE `traffic_officer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_test_details`
--
ALTER TABLE `user_test_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driving_instructor`
--
ALTER TABLE `driving_instructor`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_uk_license`
--
ALTER TABLE `final_uk_license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `test_center`
--
ALTER TABLE `test_center`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_center_nonavailability`
--
ALTER TABLE `test_center_nonavailability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `traffic_officer`
--
ALTER TABLE `traffic_officer`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_test_details`
--
ALTER TABLE `user_test_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
