-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2025 at 11:20 AM
-- Server version: 8.0.42-0ubuntu0.22.04.1
-- PHP Version: 8.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Portfolio_laravel_7thApril`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `social_links` json DEFAULT NULL,
  `social_links_completed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`, `social_links`, `social_links_completed`) VALUES
(1, 1, 'About', 'I’m a passionate software developer with experience in Laravel and Magento. Skilled in Software design,testing, Agile Frameworks and Problem Solving Fimiliar with front-end tech(HTML, CSS, JS, Vue Js), databases(SQL, Firebase). Strong problem-solving and communication skills. Also adept at leveraging AI tools for innovative solutions.', '2025-01-31 05:17:09', '2025-05-19 01:22:37', '[{\"url\": \"https://facebook.com\", \"platform\": \"instagram\"}, {\"url\": \"https://www.linkedin.com/in/priyanshu-dave2001/\", \"platform\": \"linkedin\"}, {\"url\": \"https://www.linkedin.com/in/priyanshu-dave2001/\", \"platform\": \"linkedin\"}]', 0),
(6, 28, 'About', 'testing', '2025-04-09 08:30:20', '2025-04-09 08:30:20', NULL, 0),
(8, 48, 'About', NULL, '2025-05-16 05:46:02', '2025-05-16 06:28:52', '[{\"url\": \"https://www.linkedin.com/in/priyanshu-dave2001/\", \"platform\": \"facebook\"}, {\"url\": \"https://www.linkedin.com/in/priyanshu-dave2001/\", \"platform\": \"linkedin\"}]', 0),
(9, 50, 'About', NULL, '2025-05-22 04:03:30', '2025-05-22 04:03:30', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `about_service`
--

CREATE TABLE `about_service` (
  `id` bigint UNSIGNED NOT NULL,
  `about_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_service`
--

INSERT INTO `about_service` (`id`, `about_id`, `service_id`, `order`, `created_at`, `updated_at`) VALUES
(23, 6, 1, NULL, NULL, NULL),
(24, 6, 2, NULL, NULL, NULL),
(25, 6, 3, NULL, NULL, NULL),
(26, 6, 4, NULL, NULL, NULL),
(27, 1, 1, 3, NULL, NULL),
(31, 1, 2, 1, NULL, NULL),
(32, 1, 3, 4, NULL, NULL),
(38, 8, 1, 1, NULL, NULL),
(39, 8, 2, 2, NULL, NULL),
(40, 8, 3, 3, NULL, NULL),
(41, 8, 4, 4, NULL, NULL),
(45, 1, 6, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `institute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `user_id`, `institute`, `duration`, `degree`, `percentile`, `created_at`, `updated_at`) VALUES
(1, 1, 'L.J Institute of Computer Application', '2019 - 2024', 'Integrated Master of Computer Application', 'CPI - 7.74', '2025-01-31 05:19:27', '2025-03-31 05:40:47'),
(2, 1, 'Shraddha VidyaMandir', 'March 2019', 'Higher Secondary Board', 'Percentile - 89.36', '2025-01-31 05:20:13', '2025-01-31 05:20:13'),
(3, 1, 'Shraddha VidyaMandir', 'March 2017', 'Secondary School Certificate', 'Percentile - 80.45', '2025-01-31 05:20:37', '2025-01-31 05:20:37'),
(24, 50, 'tesdt', '2017', 'tesdt', '23', '2025-05-22 01:39:13', '2025-05-22 01:39:13');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `user_id`, `job_title`, `company_name`, `company_url`, `job_duration`, `job_location`, `job_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'PHP Trainee', 'Abbacus Technologies', 'https://www.abbacustechnologies.com/', 'January 2024 - March 2024', 'Ahmedabad, India', 'During my time as a PHP Trainee, I developed a Task Management System and a Food Ordering System using Core PHP and OOP concepts. I gained hands-on experience in working with PHP in a real-world setting and collaborated with senior developers to learn and apply industry best practices.', '2025-01-31 05:28:41', '2025-04-11 08:37:28'),
(2, 1, 'PHP Developer', 'Abbacus Technologies', 'https://www.abbacustechnologies.com/', 'March 2024 - Present', 'Ahmedabad, India', 'As a PHP Developer, I gained extensive experience in developing and maintaining web applications using Laravel and Magento. I successfully upgraded multiple websites to the latest Magento versions, ensuring smooth transitions and improved functionality. Additionally, I created and updated many custom Magento modules to meet specific business needs.', '2025-01-31 05:29:39', '2025-01-31 05:29:39'),
(12, 50, 'tesdt', 'tesdt`', NULL, 'tesdt', 'tesdt', 'tesdt', '2025-05-22 01:40:18', '2025-05-22 01:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'How can I access my dashboard?', 'After logging into your account, you will be automatically redirected to your personal dashboard. If you\'re exploring different sections of the dashboard and need to return, simply click on your name at the top of the page.', '2025-02-06 08:03:50', '2025-02-07 01:11:35'),
(2, 'How do I create my personal portfolio?', 'Click the **\"Get Started\"** button in the top-right corner and sign up for an account. Once registered, you\'ll be directed to your dashboard, where you\'ll find step-by-step guidance on setting up your portfolio.', '2025-02-06 09:00:46', '2025-02-07 01:12:10'),
(3, 'How can I share my portfolio with others?', 'After logging into your dashboard, you’ll find your unique portfolio link displayed on the dashboard page. You can click on it to view your portfolio or copy and share the link with others.', '2025-02-07 01:24:13', '2025-02-07 01:24:13'),
(4, 'How do I provide feedback about the site?', 'Once logged in, navigate to the **\"Feedback\"** section in the sidebar menu on your dashboard. From there, you can submit your feedback and suggestions to help us improve.', '2025-02-07 01:24:35', '2025-02-07 01:24:35'),
(5, 'Can I add multiple projects to my portfolio?', 'Yes, you can currently add multiple projects to your portfolio. However, this feature may become part of a premium plan in the future. To stay updated on upcoming changes.', '2025-02-07 01:25:09', '2025-02-07 01:25:09');

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `user_id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(7, 1, 'Drums', 1, '2025-02-06 07:05:56', '2025-02-06 07:05:56'),
(8, 1, 'Gaming', 1, '2025-02-06 07:05:56', '2025-02-06 07:05:56'),
(9, 1, 'Workout', 1, '2025-02-06 07:05:56', '2025-02-06 07:05:56'),
(10, 1, 'Video Editing', 1, '2025-02-06 07:05:56', '2025-02-06 07:05:56'),
(40, 50, 'laravel', 18, '2025-05-20 01:26:20', '2025-05-20 01:26:20');

-- --------------------------------------------------------

--
-- Table structure for table `interest_categories`
--

CREATE TABLE `interest_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interest_categories`
--

INSERT INTO `interest_categories` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Interest', '2025-02-06 05:08:47', '2025-02-06 05:24:42'),
(17, 1, '12132132', '2025-05-19 07:02:30', '2025-05-19 07:02:30'),
(18, 50, 'development', '2025-05-20 01:25:52', '2025-05-20 01:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_27_100548_create_profiles_table', 1),
(5, '2025_01_27_130634_create_abouts_table', 1),
(6, '2025_01_28_063338_create_education_table', 1),
(7, '2025_01_28_103339_create_experiences_table', 1),
(8, '2025_01_29_081234_create_projects_table', 1),
(9, '2025_01_30_072616_create_skill_categories_table', 1),
(10, '2025_01_30_072616_create_skills_table', 1),
(11, '2025_01_31_101758_add_profile_picture_to_profiles_table', 1),
(12, '2025_02_03_111358_add_images_to_projects_table', 2),
(13, '2025_02_04_063015_add_banner_image_to_profiles_table', 3),
(14, '2025_02_04_123813_create_testimonials_table', 4),
(15, '2025_02_05_130739_add_role_to_users_table', 5),
(20, '2025_02_06_075126_add_user_id_to_skill_categories_table', 6),
(21, '2025_02_06_075211_add_user_id_to_skills_table', 6),
(24, '2025_02_06_093443_create_interest_categories_table', 7),
(25, '2025_02_06_093452_create_interests_table', 7),
(26, '2025_02_06_131306_create_faqs_table', 8),
(27, '2025_02_14_071136_add_otp_columns_to_users_table', 9),
(30, '2025_02_20_082302_add_membership_fields_to_users_table', 10),
(31, '2025_02_20_083030_create_payment_requests_table', 10),
(32, '2025_03_25_134826_add_resume_to_profiles_table', 11),
(33, '2025_04_03_082217_add_payment_fields_to_users_table', 12),
(34, '2025_04_07_064613_add_category_to_projects_table', 13),
(35, '2025_04_07_080451_create_service_categories_table', 13),
(36, '2025_04_07_080518_create_services_table', 13),
(37, '2025_04_07_080600_create_about_service_table', 13),
(38, '2025_04_07_135313_add_user_id_to_services_table', 14),
(39, '2025_04_10_100221_add_is_new_to_users_table', 15),
(41, '2025_04_25_103735_create_reminders_table', 16),
(45, '2025_04_28_103300_create_plans_table', 17),
(46, '2025_04_28_103349_create_subscriptions_table', 17),
(47, '2025_04_28_103427_add_subscription_id_to_payment_requests_table', 17),
(48, '2025_04_29_081154_add_social_links_to_abouts_table', 18),
(49, '2025_04_30_073625_add_plan_fields_to_users_table', 19),
(51, '2025_05_14_124250_add_new_fields_to_projects_table', 20),
(52, '2025_05_16_070820_add_social_links_completed_to_abouts_table', 21),
(53, '2025_05_16_113534_add_order_to_about_service_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('priyanshutest2001@gmail.com', '$2y$12$tnveBoZMChhCOrHECwHtzubiTBslDT2TnxxfdTUj1vIjaDZtULZw2', '2025-05-12 07:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `subscription_id` bigint UNSIGNED DEFAULT NULL,
  `selected_tier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` decimal(8,2) NOT NULL,
  `screenshot_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','verified','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `billing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_requests`
--

INSERT INTO `payment_requests` (`id`, `name`, `email`, `user_id`, `subscription_id`, `selected_tier`, `payment_amount`, `screenshot_path`, `status`, `created_at`, `updated_at`, `billing`) VALUES
(39, 'Starter', 'priyanshutest2001@gmail.com', 1, 14, 'starter', '49.00', 'payment_screenshots/1745841074.jpg', 'verified', '2025-04-28 06:21:14', '2025-04-28 06:59:53', 'monthly'),
(40, 'Starter', 'lases40671@macho3.com', 28, 15, 'starter', '49.00', 'payment_screenshots/1745919317.jpg', 'verified', '2025-04-29 04:05:17', '2025-04-29 04:20:14', 'monthly');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `billing_cycle` enum('monthly','yearly','trial') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `price`, `billing_cycle`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Starter', '49.00', 'monthly', NULL, NULL, NULL),
(2, 'Starter', '490.00', 'yearly', NULL, NULL, NULL),
(5, 'Basic', '0.00', 'trial', '14-day free trial', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `github_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_picture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `name`, `job_title`, `location`, `email`, `github_url`, `resume`, `created_at`, `updated_at`, `profile_picture`) VALUES
(1, 1, 'Priyanshu Dave', 'Software Developer | Laravel & Magento Enthusiast', 'Ahmedabad, India', 'davepriyanshu2001@gmail.com', 'https://github.com/Dave-Priyanshu', 'resumes/1743413883_priyanshu_dave_resume.pdf', '2025-01-31 05:15:47', '2025-05-19 01:21:14', 'profile_pictures/1738928369.jpeg'),
(7, 28, 'tesingMaill', 'my job', NULL, 'lases40671@macho3.com', NULL, 'resumes/1745920942_tesingmaill_resume.pdf', '2025-04-29 04:32:22', '2025-04-29 04:41:16', 'profile_pictures/default.png'),
(9, 48, 'batman', NULL, NULL, 'wamec80175@hazhab.com', NULL, NULL, '2025-05-16 08:48:11', '2025-05-16 08:51:52', 'profile_pictures/1747405312.jpg'),
(10, 51, 'newUser', 'Software Developer | Laravel & Magento Enthusiast', 'Ahmedabad, India', 'bewine1471@jazipo.com', NULL, NULL, '2025-05-20 02:58:07', '2025-05-20 02:58:07', 'profile_pictures/default.png');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `for_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_summary` text COLLATE utf8mb4_unicode_ci,
  `live_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_url_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_url_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_images` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `title`, `description`, `role`, `project_type`, `for_company`, `category`, `project_summary`, `live_url`, `live_url_title`, `github_url`, `github_url_title`, `created_at`, `updated_at`, `banner_image`, `additional_images`) VALUES
(1, 1, 'LaraQuiz Game', 'A live interactive quiz application built with Laravel 11. This project is designed to help users test their knowledge in various topics through quizzes. It features user authentication with OTP verification, quiz management, and score tracking', 'Developer', 'Company Project', 'Priyanshu PVT', 'quiz', 'testing project summary', 'https://lara-quiz.wuaze.com/home', 'Visit LaraQuiz Game', 'https://github.com/Dave-Priyanshu/Laravel-QuizApp', 'Github', '2025-01-31 05:32:11', '2025-05-19 05:52:39', 'banner_images/1747224125.jpg', '\"[\\\"additional_images\\\\/1747224071.jpg\\\",\\\"additional_images\\\\/1747224071.jpg\\\",\\\"additional_images\\\\/1747224071.jpg\\\"]\"'),
(2, 1, 'Job Posting Website', 'This web application allows users to post and apply for jobs. It includes features like job listings, user registration, and application management, all powered by Laravel.', '', '', '', NULL, NULL, NULL, NULL, 'https://github.com/Dave-Priyanshu/JobPortal-LaravelApp', NULL, '2025-01-31 05:35:23', '2025-02-25 02:16:00', NULL, NULL),
(3, 1, 'Blog Posting Website', '\"\\u0022A platform for creating and publishing blog posts. The site features a simple content management system where users can post, edit, and manage blog entries.\\u0022\"', '', '', '', NULL, NULL, NULL, NULL, 'https://github.com/Dave-Priyanshu/Laravel-BlogPost', NULL, '2025-01-31 05:35:56', '2025-04-25 02:36:39', NULL, NULL),
(16, 1, 'hello', '\"\\u0022hello\\u0022\"', '', '', '', 'hrllo', NULL, NULL, NULL, NULL, NULL, '2025-04-16 07:08:40', '2025-04-16 07:23:49', NULL, '\"[]\"');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` enum('request_feature','payment_review','account_issue','bug_report','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','resolved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `admin_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `user_id`, `type`, `message`, `status`, `admin_read`, `created_at`, `updated_at`) VALUES
(1, 1, 'payment_review', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'resolved', 0, '2025-04-25 06:08:43', '2025-04-25 07:22:37'),
(2, 1, 'other', 'testtt', 'pending', 0, '2025-05-19 08:19:34', '2025-05-19 08:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `service_category_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_category_id`, `user_id`, `title`, `icon_url`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Full Stack Development', 'https://i.postimg.cc/ZqgqrqzG/icon-dev.png', 'Building responsive and scalable full-stack web applications.', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(2, 1, NULL, 'API Integration', 'https://i.postimg.cc/4389jZkP/icon-design.png', 'Integrating RESTful and GraphQL APIs securely and efficiently.', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(3, 2, NULL, 'Figma Design', 'service/figma.png', 'Creating modern UI designs using Figma and prototyping tools.', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(4, 3, NULL, 'iOS App Development', 'https://i.postimg.cc/xjLdzYxZ/icon-app.png', 'Developing sleek and fast iOS applications with Swift.', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(5, 3, NULL, 'Android App Development', 'service/mobile.png', 'Building native and hybrid Android apps for all devices.', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(6, 4, NULL, 'Portrait Photography', 'https://i.postimg.cc/0NL8zHpx/icon-photo.png', 'Capturing professional portraits in natural or studio lighting.', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(7, 5, NULL, 'SEO Optimization', 'service/seo.png', 'Improving site visibility with smart on-page and off-page SEO.', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(8, 1, NULL, 'Full Stack Development', 'https://i.postimg.cc/ZqgqrqzG/icon-dev.png', 'Building responsive and scalable full-stack web applications.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(9, 1, NULL, 'API Integration', 'https://i.postimg.cc/4389jZkP/icon-design.png', 'Integrating RESTful and GraphQL APIs securely and efficiently.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(10, 1, NULL, 'E-commerce Development', 'service/online-store.png', 'Crafting online stores with payment integration and inventory management.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(11, 2, NULL, 'Figma Design', 'service/figma.png', 'Creating modern UI designs using Figma and prototyping tools.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(12, 2, NULL, 'User Experience Audit', 'service/ui.png', 'Evaluating user flows to improve usability and satisfaction.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(13, 3, NULL, 'iOS App Development', 'https://i.postimg.cc/xjLdzYxZ/icon-app.png', 'Developing sleek and fast iOS applications with Swift.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(14, 3, NULL, 'Android App Development', 'service/mobile.png', 'Building native and hybrid Android apps for all devices.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(15, 3, NULL, 'Flutter App Development', 'service/flutter.png', 'Creating cross-platform apps with Flutter and Dart.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(16, 4, NULL, 'Portrait Photography', 'https://i.postimg.cc/0NL8zHpx/icon-photo.png', 'Capturing professional portraits in natural or studio lighting.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(17, 4, NULL, 'Product Photography', 'https://i.postimg.cc/0NL8zHpx/icon-photo.png', 'High-quality images tailored for e-commerce and branding.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(18, 4, NULL, 'Street Photography', 'service/photograph.png', 'Capturing candid moments and the raw essence of everyday life in urban environments through a creative lens.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(19, 5, NULL, 'SEO Optimization', 'service/seo.png', 'Improving site visibility with smart on-page and off-page SEO.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(20, 5, NULL, 'Social Media Management', 'service/bullhorn.png', 'Creating and managing content for all major social platforms.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(21, 5, NULL, 'Email Marketing Campaigns', 'service/email.png', 'Designing and tracking email newsletters with high engagement.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(22, 6, NULL, 'AWS Deployment', 'service/aws.png', 'Deploy and manage scalable web services using AWS.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(23, 6, NULL, 'Docker & CI/CD Setup', 'service/docker.png', 'Containerized deployment and automation pipelines.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(24, 7, NULL, 'Manual Testing', 'service/man-testing.png', 'Thorough functional and regression testing by experts.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(25, 7, NULL, 'Automated Testing', 'service/auto-testing.png', 'Boost reliability with end-to-end automated test suites.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(26, 8, NULL, 'Video Editing', 'service/editing.png', 'Crafting professional videos with effects, transitions, and color grading.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(27, 8, NULL, 'Animation & Motion Graphics', 'service/animate.png', 'Creating eye-catching animations and explainer videos.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(28, 9, NULL, 'Chatbot Development', 'service/chatbot.png', 'Creating smart conversational bots using NLP and AI.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(29, 9, NULL, 'Data Modeling & Prediction', 'service/data-modal.png', 'Building predictive models using Python and TensorFlow.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(30, 10, NULL, 'Blog & Article Writing', 'service/blogging.png', 'Creating SEO-friendly blog posts and long-form articles.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(31, 10, NULL, 'Technical Documentation', 'service/tech-doc.png', 'Writing detailed and developer-friendly technical docs.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(32, 11, NULL, 'Logo Design', 'service/logo-des.png', 'Designing unique, scalable, and brand-consistent logos.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(33, 11, NULL, 'Brand Identity Kit', 'service/bradning.png', 'Creating full brand kits with colors, typography, and mockups.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(34, 12, NULL, 'Website Localization', 'service/local-seo.png', 'Translating and localizing websites for global audiences.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(35, 12, NULL, 'Technical Translation', 'service/technical-support.png', 'Converting technical documents into multiple languages accurately.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(36, 13, NULL, 'Remote Desktop Support', 'service/help-desk.png', 'Solving user issues through secure remote sessions.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(37, 13, NULL, 'System Maintenance', 'service/maintenance.png', 'Performing system diagnostics and routine maintenance.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(38, 14, NULL, 'Python Development', 'service/python.png', 'Scripting, data analysis, automation, and web apps using Python.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(39, 14, NULL, 'JavaScript Development', 'service/java-script.png', 'Frontend and backend development with modern JavaScript stacks.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(40, 14, NULL, 'PHP Development', 'service/php.png', 'Server-side scripting and Laravel web app development with PHP.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(41, 14, NULL, 'Java Development', 'service/java.png', 'Building enterprise-grade and Android apps with Java.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(42, 14, NULL, 'C++ Programming', 'service/cpp.png', 'High-performance applications, gaming, and system-level programming.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(43, 15, NULL, 'Laravel Framework', 'service/laravel.png', 'Developing powerful PHP web apps using Laravel MVC.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(44, 15, NULL, 'React.js', 'service/react.png', 'Building fast, component-based UIs using React.js.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(45, 15, NULL, 'Vue.js', 'service/vuejs.png', 'Lightweight frontend apps with Vue and Vue Router.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(46, 15, NULL, 'Django Framework', 'service/django.png', 'Secure and scalable Python web apps with Django.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(47, 16, NULL, 'WordPress Development', 'service/wordpress.png', 'Custom themes, plugins, and optimization for WordPress.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(48, 16, NULL, 'Shopify Customization', 'service/shopify.png', 'Designing and customizing Shopify stores for e-commerce.', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(49, 16, NULL, 'Drupal Solutions', 'service/drupal.png', 'Scalable content platforms using Drupal CMS.', '2025-04-07 08:15:11', '2025-04-07 08:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Web Development', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(2, 'UI/UX Design', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(3, 'Mobile Development', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(4, 'Photography', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(5, 'Marketing', '2025-04-07 06:18:50', '2025-04-07 06:18:50'),
(6, 'Cloud & DevOps', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(7, 'QA & Testing', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(8, 'Video Production', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(9, 'AI & Machine Learning', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(10, 'Content Writing', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(11, 'Branding', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(12, 'Translation', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(13, 'IT Support', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(14, 'Programming Languages', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(15, 'Frameworks', '2025-04-07 08:15:11', '2025-04-07 08:15:11'),
(16, 'CMS Platforms', '2025-04-07 08:15:11', '2025-04-07 08:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8fZJ9dNSFtARY0l7vQvkpUpjkdGBDdaXEqwq1Sl9', 50, '192.168.192.126', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia1U1SVRuZjFycmxhOEVsMHJabUVxeFRoREw0aW5UODNpejhLcTB3cCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9wb3J0Zm9saW8ubG9jL2V4cGVyaWVuY2UiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1MDt9', 1747897818),
('BbMtGcCwxoGUCWzyl9EoKOMUbnYUWhR0E24YUfnS', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWTFxbjQ5NEEwWjlhUzJRbmlDNkhGaUFObjVYMExNTDh0c2kwYzAyayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hYm91dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1747906615),
('MyzTyARYrRkp23BPS8gnpKz1C6MlbsKbXQ2Qfo54', NULL, '192.168.192.126', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0tzSHNmem4zTzV2TWxnMnlJTTRpQzk0SjJoNnl1VVA2dHpZMHpyMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9wb3J0Zm9saW8ubG9jIjt9fQ==', 1747906510),
('qrnphAWyV6ZXs1AVLAmS7AQYBJF89DIisXpetncf', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieW5XNEpJbVVrOFdaZ1d6dlNhaGlPSVZyenJ4UEtQQ3B5N2hoalB6USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9wb3J0Zm9saW8ubG9jL1ByaXlhbnNodURhdmUiO319', 1747906617);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `category_id`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'HTML 2', 1, '2025-01-31 05:38:00', '2025-02-24 02:46:36', 1),
(2, 'CSS', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(3, 'Tailwind CSS', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(4, 'JavaScript', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(5, 'PHP', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(6, 'MySQl', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(7, 'Laravel', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(8, 'Vue Js', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(9, 'Magento', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(10, 'Git & Github', 1, '2025-01-31 05:38:00', '2025-01-31 05:38:00', 1),
(11, 'Requirement Analysis', 2, '2025-01-31 05:38:30', '2025-01-31 05:38:30', 1),
(12, 'Project Planning & Execution', 2, '2025-01-31 05:38:30', '2025-01-31 05:38:30', 1),
(13, 'Analytical Skills', 2, '2025-01-31 05:38:30', '2025-01-31 05:38:30', 1),
(14, 'Communication', 2, '2025-01-31 05:38:30', '2025-01-31 05:38:30', 1),
(15, 'Teamwork', 2, '2025-01-31 05:38:30', '2025-01-31 05:38:30', 1),
(16, 'Decision Making', 2, '2025-01-31 05:38:30', '2025-01-31 05:38:30', 1),
(17, 'Verbal & Written Communication', 3, '2025-01-31 05:38:53', '2025-01-31 05:38:53', 1),
(18, 'Technical Doucumentation', 3, '2025-01-31 05:38:53', '2025-01-31 05:38:53', 1),
(19, 'Presentation Skills', 3, '2025-01-31 05:38:53', '2025-01-31 05:38:53', 1),
(20, 'Project Documentation', 3, '2025-01-31 05:38:53', '2025-01-31 05:38:53', 1),
(62, 'laravel', 19, '2025-05-20 01:29:36', '2025-05-20 01:29:36', 50),
(63, 'mysql', 19, '2025-05-20 01:29:37', '2025-05-20 01:29:37', 50);

-- --------------------------------------------------------

--
-- Table structure for table `skill_categories`
--

CREATE TABLE `skill_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_categories`
--

INSERT INTO `skill_categories` (`id`, `name`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Techincal Skills', '2025-01-31 05:36:45', '2025-02-24 04:12:04', 1),
(2, 'Project Management & Collaboration', '2025-01-31 05:36:56', '2025-01-31 05:36:56', 1),
(3, 'Communication & Documentation', '2025-01-31 05:37:04', '2025-01-31 05:37:04', 1),
(19, 'development', '2025-05-20 01:29:23', '2025-05-20 01:29:23', 50);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('trial','pending','active','expired','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `plan_id`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(11, 1, 2, '2025-04-28', NULL, 'pending', '2025-04-28 06:03:33', '2025-04-28 06:03:33'),
(13, 1, 1, '2025-04-28', NULL, 'pending', '2025-04-28 06:12:06', '2025-04-28 06:12:06'),
(14, 1, 1, '2025-04-28', '2025-05-28', 'active', '2025-04-28 06:21:14', '2025-04-28 06:59:53'),
(15, 28, 1, '2025-04-29', '2025-05-29', 'active', '2025-04-29 04:05:17', '2025-04-29 04:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `user_id`, `review`, `rating`, `created_at`, `updated_at`) VALUES
(5, 1, 'Super Easy Way to create Portfolio', 5, '2025-02-05 04:49:51', '2025-02-10 00:56:34'),
(6, 1, 'testing', 4, '2025-02-11 02:54:59', '2025-02-11 02:54:59'),
(7, 1, '123465798', 4, '2025-02-11 02:55:05', '2025-02-11 02:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_expires_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `plan_expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `trial_expires_at`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `otp`, `otp_expires_at`, `is_new`, `plan_id`, `plan_expires_at`) VALUES
(1, 'priyanshu dave', 'PriyanshuDave', 'priyanshutest2001@gmail.com', NULL, NULL, '$2y$12$Cc/ok8a8OHpb1vzys9.9AOnOt208aAgzsazRkbkHpxnSKZeJwCGXm', NULL, '2025-01-31 04:52:37', '2025-05-20 02:13:38', 'user', NULL, NULL, 0, NULL, NULL),
(2, 'Super Admin', 'superadmin', 'superadmin@gmail.com', NULL, NULL, '$2y$12$MeQ2CdtCghfCYwofKtKSPuWPAp9JJqSiODdbqvJyBHg1w2hrXSZUO', 'bGrWjb3g7AFQNralwxmcYCbBOFYHCp87n5VLxbFSZPFMdabOs55qjcSMKTqC', NULL, '2025-02-06 03:48:36', 'super_admin', NULL, NULL, 0, NULL, NULL),
(28, 'tesingMaill', 'maillsds', 'lases40671@macho3.com', NULL, '2025-04-02 08:31:21', '$2y$12$QwKfRczb8DtxPJuvQbk8LuLvcvK1uCNvrT5rCbH9FX/cROFIJ9NF.', NULL, '2025-04-02 08:31:21', '2025-04-28 07:17:19', 'user', NULL, NULL, 0, NULL, NULL),
(48, 'batman', 'batman', 'wamec80175@hazhab.com', '2025-05-30 05:45:28', NULL, '$2y$12$bvXGkSp3zowRLM5dvmY8Pes7dUII3QaWS/VNRgRMrcDKNE/sFQszS', NULL, '2025-05-16 05:45:28', '2025-05-16 08:54:23', 'user', NULL, NULL, 0, 5, '2025-05-30 05:45:28'),
(50, 'Yash Gohil', 'yashobv', 'yashkumar.9687@gmail.com', '2025-06-03 00:37:00', NULL, '$2y$12$1h2/BixxNqRAgOCcQEA7tu7egyqovFWLZaD1pgPAHlCGFM6.xa79m', NULL, '2025-05-20 00:37:00', '2025-05-20 00:37:23', 'user', NULL, NULL, 0, 5, '2025-06-03 00:37:00'),
(51, 'newUser', 'NewUser', 'bewine1471@jazipo.com', '2025-06-03 02:57:09', NULL, '$2y$12$aDzIOHvXTihWxk4t8wpH0uRxYj55wZRwvbq/3uMtIi.j4HZ3uqRrK', NULL, '2025-05-20 02:57:09', '2025-05-20 06:01:54', 'user', NULL, NULL, 0, 5, '2025-06-03 02:57:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abouts_user_id_foreign` (`user_id`);

--
-- Indexes for table `about_service`
--
ALTER TABLE `about_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `about_service_about_id_foreign` (`about_id`),
  ADD KEY `about_service_service_id_foreign` (`service_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `education_user_id_foreign` (`user_id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiences_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interests_user_id_foreign` (`user_id`),
  ADD KEY `interests_category_id_foreign` (`category_id`);

--
-- Indexes for table `interest_categories`
--
ALTER TABLE `interest_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `interest_categories_name_unique` (`name`),
  ADD KEY `interest_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_requests_user_id_foreign` (`user_id`),
  ADD KEY `payment_requests_subscription_id_foreign` (`subscription_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_user_id_foreign` (`user_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_user_id_foreign` (`user_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_service_category_id_foreign` (`service_category_id`),
  ADD KEY `services_user_id_foreign` (`user_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skills_category_id_foreign` (`category_id`),
  ADD KEY `skills_user_id_foreign` (`user_id`);

--
-- Indexes for table `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `skill_categories_name_unique` (`name`),
  ADD KEY `skill_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_foreign` (`user_id`),
  ADD KEY `subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_plan_id_foreign` (`plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `about_service`
--
ALTER TABLE `about_service`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `interest_categories`
--
ALTER TABLE `interest_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `skill_categories`
--
ALTER TABLE `skill_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abouts`
--
ALTER TABLE `abouts`
  ADD CONSTRAINT `abouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `about_service`
--
ALTER TABLE `about_service`
  ADD CONSTRAINT `about_service_about_id_foreign` FOREIGN KEY (`about_id`) REFERENCES `abouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `about_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `experiences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `interest_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interest_categories`
--
ALTER TABLE `interest_categories`
  ADD CONSTRAINT `interest_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD CONSTRAINT `payment_requests_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `skill_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `skills_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD CONSTRAINT `skill_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
