-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2017 at 11:19 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gigship`
--
CREATE DATABASE IF NOT EXISTS `gigship` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gigship`;

-- --------------------------------------------------------

--
-- Table structure for table `application_info`
--

DROP TABLE IF EXISTS `application_info`;
CREATE TABLE `application_info` (
  `id` int(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `footer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application_info`
--

INSERT INTO `application_info` (`id`, `name`, `file_name`, `version`, `footer`) VALUES
(1, 'GiGSHip', '', '0.01 Alpha', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` bigint(255) NOT NULL,
  `request_id` bigint(255) NOT NULL,
  `referer_chat_id` bigint(255) NOT NULL,
  `message_from` bigint(255) NOT NULL,
  `message_to` bigint(255) NOT NULL,
  `message` text NOT NULL,
  `has_file` int(1) NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL,
  `time_stamp` varchar(255) NOT NULL,
  `message_seen` int(1) NOT NULL DEFAULT '0',
  `report_message` text NOT NULL,
  `message_reported` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gigs`
--

DROP TABLE IF EXISTS `gigs`;
CREATE TABLE `gigs` (
  `id` bigint(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price_per_gig` double NOT NULL,
  `profit_margin` double NOT NULL,
  `date_posted` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gig_categories`
--

DROP TABLE IF EXISTS `gig_categories`;
CREATE TABLE `gig_categories` (
  `id` int(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `gig_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gig_promoted`
--

DROP TABLE IF EXISTS `gig_promoted`;
CREATE TABLE `gig_promoted` (
  `id` int(255) NOT NULL,
  `gig_id` bigint(255) NOT NULL,
  `date_promoted` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gig_sample_files`
--

DROP TABLE IF EXISTS `gig_sample_files`;
CREATE TABLE `gig_sample_files` (
  `id` bigint(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `gig_id` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gig_subcategory`
--

DROP TABLE IF EXISTS `gig_subcategory`;
CREATE TABLE `gig_subcategory` (
  `id` bigint(255) NOT NULL,
  `sub_category_id` bigint(20) NOT NULL,
  `gig_id` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gig_tags`
--

DROP TABLE IF EXISTS `gig_tags`;
CREATE TABLE `gig_tags` (
  `id` bigint(255) NOT NULL,
  `gig_id` int(255) NOT NULL,
  `tag_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` bigint(255) NOT NULL,
  `invoice_code` varchar(255) NOT NULL,
  `transaction_id` bigint(255) NOT NULL,
  `payment_mode_id` int(25) NOT NULL,
  `invoice_processed` int(2) NOT NULL DEFAULT '0',
  `date_created` varchar(255) NOT NULL,
  `date_completed` varchar(255) NOT NULL,
  `date_processed` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `processed_by` int(255) NOT NULL,
  `is_completed` int(1) NOT NULL DEFAULT '0',
  `amount` double NOT NULL,
  `processing_fee` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
CREATE TABLE `password_history` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_used` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

DROP TABLE IF EXISTS `payment_modes`;
CREATE TABLE `payment_modes` (
  `id` int(255) NOT NULL,
  `name` text NOT NULL,
  `information` text NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `gig_id` bigint(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `date_requested` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `unit_price` double NOT NULL,
  `date_closed` varchar(255) NOT NULL,
  `user_closed_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests_confirmations`
--

DROP TABLE IF EXISTS `requests_confirmations`;
CREATE TABLE `requests_confirmations` (
  `id` int(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `request_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests_status`
--

DROP TABLE IF EXISTS `requests_status`;
CREATE TABLE `requests_status` (
  `id` int(244) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests_status`
--

INSERT INTO `requests_status` (`id`, `name`, `description`) VALUES
(1, 'Pending', ''),
(2, 'Closed', '');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE `sub_categories` (
  `id` int(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(255) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` varchar(255) NOT NULL,
  `user_type` int(2) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `activation_code` varchar(255) NOT NULL,
  `password_recovery_code` varchar(255) NOT NULL,
  `referal_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `password`, `last_login`, `user_type`, `email`, `phone`, `file_name`, `activation_code`, `password_recovery_code`, `referal_code`) VALUES
(1, 'Isaac', 'Darko', 'hmbrainiac', 'sha256:1000:KAoTCAKd8Vmh/GCnANuhjLN84xDRs3um:MtRQHq/hJ3+7D8E4F/OpsO6zCDYMR9jY', '', 1, 'isaacbremang@gmail.com', '', '', '', '', ''),
(2, 'Isaac', 'Gyampo', 'alex', 'sha256:1000:dO9SSjkqvj91bFQJmdAXI4Yjf+8jrM8L:o4J8MkIfJL5jmmihcWJ6S58cwY3Oc6SY', '', 1, 'isaacbremang@gmail.com', '', '', '1663a09278f7004419f79b7e3d0dd1d6', '', ''),
(3, 'Isaac', 'Gyampo', 'alex', 'sha256:1000:PKa1ZH1dOsjhuVglaVEhF/6yJu6KjzMx:GzBro9FNFq3Qc8IoN5mjA0xmDffC7YDf', '', 1, 'isaacbremang@gmail.com', '', '', 'baa542a1ce65732fa305660813e44b3b', '', ''),
(4, 'Isaac', 'Gyampo', 'alex', 'sha256:1000:GfnjqQ66fZmXAxzr3laj3PvORwjNQ2cq:6Pgw9168jhyShZ2Efdv+rRGAPGOhuhbR', '', 1, 'isaacbremang@gmail.com', '', '', 'f6ae9e8b958b744046f1f34404d8e28e', '', ''),
(5, 'Isaac', 'Gyampo', 'alex', 'sha256:1000:UFDl36wOjMaEGMx4FxEb9BV3TYm62sYY:Y25gaiFwbYzfrdO06DhYQpd08M00mriF', '', 1, 'isaacbremang@gmail.com', '', '', 'e5f6abae9e83d411e255719a897e4230', '', '516808'),
(6, 'Isaac', 'Gyampo', 'alex', 'sha256:1000:DHy75RzfWiuivDBSk2SXWvS2pX2zctab:S9zTJGnMGyb6vZzYhxfRGG6lDix3lLau', '', 1, 'isaacbremang@gmail.com', '', '', '98b72f8f3152460da95cfe27ae0460b1', '', '623300'),
(7, 'Ken', 'Darko', 'hmbrainiac', 'sha256:1000:gZUcOMuSyt6Lj8+O5steVyxO1kwoRLbD:4IcLWT00boFAAS06ChIAnsUAyz1+YwCJ', '', 1, 'isaacbremang@gmail.com', '', '', '09473c307d5ca672c02990724dd7a227', '', '727586'),
(8, 'Ken', 'Gyampo', 'finxl_support_user', 'sha256:1000:uCkSV5gXyUFYWAhlutWZ78qX+4VBXD7L:5ZkJXAWPclv9NTrKEaVTZdLYurQkUG8N', '', 1, 'isaacbremang@gmail.com', '', '', '3b47a18665296d2b3229f78161265def', '', '861586'),
(9, 'Isaac', 'Gyampo', 'sdas', 'sha256:1000:ZP0icB1RB7gyv6LXVLX0XKN9Y8bfqTkQ:eAwXLp56KvN6lZH2XBPkGF8p73zAqgh7', '', 1, 'isaacbremang@gmail.com', '', '', 'e47d232b293b915306fe8274e6f934dd', '', '915360'),
(10, 'Isaac', 'Gyampo', 'hmbrainiac', 'sha256:1000:Q63nhastv6YDYspnK6y1KEc9ThHj+qQ3:sxob64DoMzkS9JkbuajKttjjwPexC+np', '', 1, 'isaacbremang@gmail.com', '', '', 'e071f30c95f37a493daf52aaeb4df6bf', '', '1044309');

-- --------------------------------------------------------

--
-- Table structure for table `user_referals`
--

DROP TABLE IF EXISTS `user_referals`;
CREATE TABLE `user_referals` (
  `id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `reference_code_used` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

DROP TABLE IF EXISTS `user_requests`;
CREATE TABLE `user_requests` (
  `id` bigint(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_requests_files`
--

DROP TABLE IF EXISTS `user_requests_files`;
CREATE TABLE `user_requests_files` (
  `id` bigint(255) NOT NULL,
  `user_request_id` bigint(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_requests_user`
--

DROP TABLE IF EXISTS `user_requests_user`;
CREATE TABLE `user_requests_user` (
  `id` bigint(255) NOT NULL,
  `user_request_id` bigint(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `date_rewarded` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_categories`
--

DROP TABLE IF EXISTS `user_request_categories`;
CREATE TABLE `user_request_categories` (
  `id` bigint(255) NOT NULL,
  `user_request_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_chats`
--

DROP TABLE IF EXISTS `user_request_chats`;
CREATE TABLE `user_request_chats` (
  `message_from` int(11) NOT NULL,
  `user_request_id` int(11) NOT NULL,
  `message_to` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `has_file` int(11) NOT NULL,
  `file_name` int(11) NOT NULL,
  `time_stamp` int(11) NOT NULL,
  `seen` int(11) NOT NULL,
  `id` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet`
--

DROP TABLE IF EXISTS `user_wallet`;
CREATE TABLE `user_wallet` (
  `id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `amount` double NOT NULL,
  `security_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet_transaction_history`
--

DROP TABLE IF EXISTS `user_wallet_transaction_history`;
CREATE TABLE `user_wallet_transaction_history` (
  `id` bigint(255) NOT NULL,
  `amount` double NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `transaction_date` varchar(255) NOT NULL,
  `invoice_id` bigint(255) NOT NULL,
  `processing_fee` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application_info`
--
ALTER TABLE `application_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gigs`
--
ALTER TABLE `gigs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gig_categories`
--
ALTER TABLE `gig_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gig_promoted`
--
ALTER TABLE `gig_promoted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gig_sample_files`
--
ALTER TABLE `gig_sample_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gig_subcategory`
--
ALTER TABLE `gig_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gig_tags`
--
ALTER TABLE `gig_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_history`
--
ALTER TABLE `password_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests_confirmations`
--
ALTER TABLE `requests_confirmations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests_status`
--
ALTER TABLE `requests_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_referals`
--
ALTER TABLE `user_referals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_requests_files`
--
ALTER TABLE `user_requests_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_requests_user`
--
ALTER TABLE `user_requests_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_categories`
--
ALTER TABLE `user_request_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_chats`
--
ALTER TABLE `user_request_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wallet`
--
ALTER TABLE `user_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wallet_transaction_history`
--
ALTER TABLE `user_wallet_transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application_info`
--
ALTER TABLE `application_info`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gigs`
--
ALTER TABLE `gigs`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gig_categories`
--
ALTER TABLE `gig_categories`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gig_promoted`
--
ALTER TABLE `gig_promoted`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gig_sample_files`
--
ALTER TABLE `gig_sample_files`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gig_subcategory`
--
ALTER TABLE `gig_subcategory`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gig_tags`
--
ALTER TABLE `gig_tags`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `password_history`
--
ALTER TABLE `password_history`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requests_confirmations`
--
ALTER TABLE `requests_confirmations`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requests_status`
--
ALTER TABLE `requests_status`
  MODIFY `id` int(244) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user_referals`
--
ALTER TABLE `user_referals`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_requests`
--
ALTER TABLE `user_requests`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_requests_files`
--
ALTER TABLE `user_requests_files`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_requests_user`
--
ALTER TABLE `user_requests_user`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_request_categories`
--
ALTER TABLE `user_request_categories`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_request_chats`
--
ALTER TABLE `user_request_chats`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_wallet`
--
ALTER TABLE `user_wallet`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_wallet_transaction_history`
--
ALTER TABLE `user_wallet_transaction_history`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
