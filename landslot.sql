-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 13, 2020 at 03:29 PM
-- Server version: 5.7.26
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `landslot`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `payable`, `created_at`, `updated_at`) VALUES
(1, 'Plumbing', '0', NULL, NULL),
(2, 'Electrical Maintenance', '0', NULL, NULL),
(3, 'Structural Repairs', '0', NULL, NULL),
(4, 'Security Operatives', '0', NULL, NULL),
(5, 'Gardening/Cleaning', '0', NULL, NULL),
(6, 'Generator Servicing/Maintenance', '0', NULL, NULL),
(7, 'AC Repairs/Maintenance', '0', NULL, NULL),
(8, 'Water issues/pumping machine', '0', NULL, NULL),
(9, 'Swimming pool issues', '0', NULL, NULL),
(10, 'Fumigation', '0', NULL, NULL),
(11, 'DSTV', '1', NULL, NULL),
(12, 'GOTV', '1', NULL, NULL),
(13, 'AEDC', '1', NULL, NULL),
(14, 'AEPB', '1', NULL, NULL),
(15, 'Diesel Bill', '1', NULL, NULL),
(16, 'Water Bill', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `from`, `message`, `created_at`, `updated_at`) VALUES
(1, '2', '1', 'Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups', '2020-03-03 12:28:06', '2020-03-03 12:28:06'),
(2, '2', '0', 'Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups', '2020-03-03 12:28:06', '2020-03-03 12:28:06'),
(3, '1', '0', 'Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups', '2020-03-03 12:28:39', '2020-03-03 12:28:39'),
(4, '3', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2020-03-03 12:48:52', '2020-03-03 12:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2020_01_15_222913_create_categories_table', 1),
(3, '2021_01_15_222918_create_workorders_table', 1),
(4, '2020_01_17_210029_create_workorders_table', 2),
(5, '2020_01_20_100624_create_notifications_table', 3),
(6, '2020_03_03_120747_create_messages_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'Public Service Announcement 2', 'Lorem ipsum skdhf iudhfowei eroafiue efba fosfg skfogsf s dfisvdf sdjfsidu ejw aifs d gfa aidfh e ra fuew ahuf as fsdfua adu df dfsduff g gfiaf difsbdf adkgasd fadbf ae 2', '1', '2020-02-03 08:34:21', '2020-02-03 08:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_admin` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_admin`, `is_active`, `username`, `password`, `phone`, `flat_number`, `street`, `city`, `state`, `access_token`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Christopher Ntuk', 'engchris95@gmail.com', NULL, 1, 1, 'devchris', '$2y$10$Zu4RFZ514YAj7r5astdkX.lY2RyaMPdr0Cwf67WWgw7yMMeN02bSy', '09057941663', '220', NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-15 21:19:20', '2020-03-08 16:04:57'),
(2, 'Ehis Ali', 'root@gmail.com', NULL, 0, 1, 'devchris', '$2y$10$Zu4RFZ514YAj7r5astdkX.lY2RyaMPdr0Cwf67WWgw7yMMeN02bSy', '09057941663', '220', '3', 'Garki', 'Abuja', NULL, NULL, NULL, '2020-01-17 21:39:56', '2020-03-08 15:59:36'),
(3, 'Wilson Anambra', 'christopher@devchris.com.ng', NULL, 0, 1, NULL, '$2y$10$SThbIqK1A1siGMUGHprSXOLsekyHRft8bzLCGDYWYo.WagQ4RkpA2', '09057041663', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-19 14:19:59', '2020-02-19 14:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `workorders`
--

DROP TABLE IF EXISTS `workorders`;
CREATE TABLE IF NOT EXISTS `workorders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `transaction_ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workorders`
--

INSERT INTO `workorders` (`id`, `user_id`, `categories_id`, `title`, `priority`, `description`, `progress`, `status`, `feedback`, `amount`, `transaction_ref`, `payment_status`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 'Public Service Announcement 2', 'low', 'Updating the content above', '49', 'PROCESSING', NULL, '0', NULL, 'unpaid', '2020-01-20 11:37:28', '2020-01-20 20:17:15'),
(2, 1, 6, 'New Workorder', 'low', 'akdjf dfibf a fiwe aif aifwifhaf adsifuas dfs dfksdfuhsdf sidfb s df sdfh sdgfidfdg df gmdf ga gd fgjd fgd fg dfgd fg ', '0', 'PENDING', NULL, '37000', 'T810993576986680', 'paid', '2020-01-17 21:44:59', '2020-03-05 16:01:21');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
