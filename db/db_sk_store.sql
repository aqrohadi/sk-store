-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2020 at 04:45 PM
-- Server version: 8.0.16
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sk_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(6, 'Sayur', 'sayur', 'apL6B8XlAOzwLnVq.png', '2020-05-27 05:08:04', '2020-05-28 18:15:05'),
(7, 'Buah', 'buah', 'vNQncxl0BRWqmCUZ.png', '2020-05-27 05:08:38', '2020-05-28 18:14:49'),
(8, 'Karbohidrat', 'karbohidrat', 'E4hBWSP2nHEpHfaI.png', '2020-05-27 05:09:09', '2020-05-28 18:14:38'),
(9, 'Daging', 'daging', 'pSPYejOAnFufobzR.png', '2020-05-28 16:53:48', '2020-05-28 18:14:27'),
(10, 'Ikan ', 'ikan', 'jUKM54IxLQeFzxky.png', '2020-05-28 16:55:29', '2020-05-28 18:14:02'),
(11, 'Minuman', 'minuman', 'VYuqYZbxofK4JVrI.png', '2020-05-28 16:57:11', '2020-05-28 18:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Faisal Mahadi', 'faisal@gmail.com', NULL, '$2y$10$oaKK8Lx53KBIOv29.1ZOSOw3nSN4SkIktUNskes0N3GjMjuIf22L.', NULL, '2020-05-29 22:23:51', '2020-05-29 22:23:51'),
(2, 'Kurnia Andi Nugroho', 'kurnia@gmail.com', NULL, '$2y$10$99Es/06HdDIUCsliK7PI5O2fZq4WAwSZTI9iO7Dina1cOG9OUgjwS', NULL, '2020-05-30 04:20:41', '2020-05-30 04:20:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `courier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_courier` bigint(20) NOT NULL,
  `weight` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `no_resi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('menunggu pembayaran','menunggu konfirmasi','pembayaran tidak valid','pesanan diproses','pesanan dikirim','pesanan selesai') COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice`, `customer_id`, `courier`, `service`, `cost_courier`, `weight`, `name`, `phone`, `province`, `city`, `district`, `address`, `note`, `no_resi`, `status`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 'INVOICE-YTW416Y829', 2, 'jne', 'OKE', 84000, 3250, 'Kurnia Andi Nugroho', 85785852224, 11, 164, 2276, 'Rejoagung, Ngoro, Jombang', '-', '063320000660820', 'pesanan selesai', 117419, '2020-05-30 22:40:29', '2020-06-01 00:49:40'),
(2, 'INVOICE-XOW17680I1', 2, 'jne', 'OKE', 84000, 3500, 'Kurnia Andi Nugroho', 85785851113, 11, 164, 2276, 'Rejoagung, Ngoro, Jombang', '-', NULL, 'menunggu pembayaran', 125680, '2020-05-31 00:19:50', '2020-05-31 00:19:50'),
(4, 'INVOICE-UD13SZ1J7I', 1, 'jne', 'YES', 144000, 3500, 'Faisal Mahadi', 85785857776, 11, 164, 2269, 'Pulo Lor, Jombang, Jawa Timur', NULL, NULL, 'menunggu konfirmasi', 179898, '2020-05-31 23:08:38', '2020-05-31 23:09:18'),
(5, 'INVOICE-88R53V0235', 2, 'jne', 'REG', 96000, 4000, 'Kurnia Andi Nugroho', 85785852224, 11, 164, 2268, 'Jogoroto, Jombang, Jawa Timur', NULL, '063320000660820', 'pesanan selesai', 154735, '2020-06-02 00:24:30', '2020-06-02 00:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_05_27_023311_create_tags_table', 2),
(4, '2020_05_27_031115_create_categories_table', 3),
(5, '2020_05_27_230235_create_settings_table', 4),
(6, '2020_05_28_000343_create_sliders_table', 5),
(7, '2020_05_28_012827_create_pages_table', 6),
(8, '2020_05_28_041349_create_vouchers_table', 7),
(10, '2020_05_29_012934_create_products_table', 8),
(11, '2020_05_30_035939_create_customers_table', 9),
(12, '2020_05_31_030644_create_invoices_table', 10),
(15, '2020_05_31_030647_create_orders_table', 11),
(16, '2020_05_31_111619_create_payment_confirmations_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_weight` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_id`, `invoice`, `product_id`, `product_name`, `image`, `unit`, `unit_weight`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'INVOICE-YTW416Y829', 8, 'Semangka Merah', 'lBjW0dpq34iyqLIJ.jpg', 'kg', 3, 24030, '2020-05-30 22:40:29', '2020-05-30 22:40:29'),
(2, 1, 'INVOICE-YTW416Y829', 1, 'Wortel Jepang', 'aimocILM1hXfdnt7.jpg', 'gram', 250, 9360, '2020-05-30 22:40:29', '2020-05-30 22:40:29'),
(3, 2, 'INVOICE-XOW17680I1', 8, 'Semangka Merah', 'lBjW0dpq34iyqLIJ.jpg', 'kg', 3, 24030, '2020-05-31 00:19:50', '2020-05-31 00:19:50'),
(4, 2, 'INVOICE-XOW17680I1', 2, 'Curly Lettuce', 'dnwoUD8egamodlXe.jpg', 'gram', 250, 8280, '2020-05-31 00:19:50', '2020-05-31 00:19:50'),
(5, 2, 'INVOICE-XOW17680I1', 1, 'Wortel Jepang', 'aimocILM1hXfdnt7.jpg', 'gram', 250, 9360, '2020-05-31 00:19:50', '2020-05-31 00:19:50'),
(8, 4, 'INVOICE-UD13SZ1J7I', 8, 'Semangka Merah', 'lBjW0dpq34iyqLIJ.jpg', 'kg', 3, 24030, '2020-05-31 23:08:38', '2020-05-31 23:08:38'),
(9, 4, 'INVOICE-UD13SZ1J7I', 4, 'Buah Naga Merah (1 pcs)', 'qLIYsTeK4pLXRxUY.jpg', 'gram', 500, 11780, '2020-05-31 23:08:38', '2020-05-31 23:08:38'),
(10, 5, 'INVOICE-88R53V0235', 8, 'Semangka Merah', 'lBjW0dpq34iyqLIJ.jpg', 'kg', 3, 24030, '2020-06-02 00:24:30', '2020-06-02 00:24:30'),
(11, 5, 'INVOICE-88R53V0235', 7, 'Mangga Harum Manis', 'J2SO3h3IR1CiSc04.jpg', 'kg', 1, 35150, '2020-06-02 00:24:30', '2020-06-02 00:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `keywords`, `description`, `created_at`, `updated_at`) VALUES
(2, 'About Us', 'about-us', 'About Us', 'About Us', 'About Us', '2020-05-27 21:07:40', '2020-05-27 21:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `payment_confirmations`
--

CREATE TABLE `payment_confirmations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_transfer_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_transfer_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` bigint(20) NOT NULL,
  `transfer_date` date NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_confirmations`
--

INSERT INTO `payment_confirmations` (`id`, `customer_id`, `name`, `phone`, `invoice`, `bank_transfer_from`, `bank_transfer_to`, `from_name`, `total`, `transfer_date`, `image`, `note`, `created_at`, `updated_at`) VALUES
(2, 2, 'Kurnia Andi Nugroho', 85785852224, 'INVOICE-YTW416Y829', 'BRI', 'BCA - 1131458971 - AN. FIKA RIDAUL MAULAYYA', 'Kurnia Andi Nugroho', 117419, '2020-05-31', 'PzfSiv0ZRo7VCzsy.jpg', NULL, '2020-05-31 05:20:34', '2020-05-31 05:20:34'),
(3, 1, 'Faisal Mahadi', 85785857776, 'INVOICE-UD13SZ1J7I', 'BRI', 'BCA - 1131458971 - AN. FIKA RIDAUL MAULAYYA', 'Faisal Mahadi', 179898, '2020-06-01', '2vyMJEjamy6Z6qhD.jpg', NULL, '2020-05-31 23:09:18', '2020-05-31 23:09:18'),
(4, 2, 'Kurnia Andi Nugroho', 85785852224, 'INVOICE-88R53V0235', 'BRI', 'BCA - 1131458971 - AN. FIKA RIDAUL MAULAYYA', 'Kurnia Andi Nugroho', 154735, '2020-06-02', 'XaSh8p7NdETlTCBs.jpg', NULL, '2020-06-02 00:25:41', '2020-06-02 00:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_weight` bigint(20) NOT NULL,
  `weight` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `title`, `slug`, `category_id`, `content`, `unit`, `unit_weight`, `weight`, `price`, `discount`, `keywords`, `description`, `created_at`, `updated_at`) VALUES
(1, 'aimocILM1hXfdnt7.jpg', 'Wortel Jepang', 'wortel-jepang', 6, 'Wortel jepang', 'gram', 250, 250, 11700, 20, 'wortel,sayur', 'wortel sayur', '2020-05-28 20:18:46', '2020-05-29 06:02:21'),
(2, 'dnwoUD8egamodlXe.jpg', 'Curly Lettuce', 'curly-lettuce', 6, 'Curly Lettuce', 'gram', 250, 250, 9200, 10, 'Curly Lettuce', 'Curly Lettuce', '2020-05-28 20:20:42', '2020-05-28 20:20:42'),
(3, '6bB7TiPRfvoHUg1w.jpg', 'Fillet Dada Ayam', 'fillet-dada-ayam', 9, 'Fillet Dada Ayam', 'gram', 500, 500, 41700, 23, 'Fillet Dada Ayam', 'Fillet Dada Ayam', '2020-05-28 23:31:08', '2020-05-28 23:31:33'),
(4, 'qLIYsTeK4pLXRxUY.jpg', 'Buah Naga Merah (1 pcs)', 'buah-naga-merah-1-pcs', 7, 'Buah Naga Merah (1 pcs)', 'gram', 500, 500, 12400, 5, 'Buah Naga Merah (1 pcs)', 'Buah Naga Merah (1 pcs)', '2020-05-28 23:34:27', '2020-05-28 23:34:27'),
(5, 'ZqzAJmazUIuTVW6S.jpg', 'Terong', 'terong', 6, 'Terong', 'gram', 300, 300, 8800, 40, 'Terong', 'Terong', '2020-05-29 07:07:00', '2020-05-29 07:07:50'),
(6, 'qtt3yTun5cKKZ664.jpg', 'Jagung Manis', 'jagung-manis', 6, 'Jagung Manis', 'pcs', 2, 300, 12400, 11, 'Jagung Manis', 'Jagung Manis', '2020-05-29 07:09:31', '2020-05-29 07:09:31'),
(7, 'J2SO3h3IR1CiSc04.jpg', 'Mangga Harum Manis', 'mangga-harum-manis', 7, 'Mangga Harum Manis', 'kg', 1, 1000, 37000, 5, 'Mangga Harum Manis', 'Mangga Harum Manis', '2020-05-29 07:11:38', '2020-05-29 07:11:38'),
(8, 'lBjW0dpq34iyqLIJ.jpg', 'Semangka Merah', 'semangka-merah', 7, '<p>Semangka Merah mantap</p>\n', 'kg', 3, 3000, 27000, 11, 'Semangka Merah', 'Semangka Merah', '2020-05-29 07:13:17', '2020-05-30 17:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`product_id`, `tag_id`) VALUES
(1, 4),
(2, 3),
(2, 4),
(3, 5),
(4, 4),
(5, 3),
(6, 3),
(7, 4),
(8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_footer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_footer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_recived` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `admin_title`, `admin_footer`, `site_title`, `site_footer`, `email_recived`, `city`, `keywords`, `description`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'SK Store — Toko Online Sayur No. 1 di Indonesia', 'SK Store', 'SK Store —  Toko Online Sayur No. 1 di Indonesia', 'SK Store', 'ridaulmaulayya@gmail.com', '113', 'SK Store', 'SK Store', 'GVFvjGAFjlVeN4sl.png', NULL, '2020-05-30 04:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(7, 'WUSPkfqVFGWfrF2F.jpg', '#', '2020-05-31 00:50:36', '2020-05-31 00:50:36'),
(8, 'b5uIkAbQVxmttqXN.jpg', '#', '2020-05-31 00:50:43', '2020-05-31 00:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(3, 'Sayuran', 'sayuran', '2020-05-26 19:58:17', '2020-05-26 19:58:17'),
(4, 'Buah', 'buah', '2020-05-26 19:58:22', '2020-05-26 19:58:22'),
(5, 'Daging', 'daging', '2020-05-26 19:58:33', '2020-05-26 20:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Fika Ridaul Maulayya', 'ridaulmaulayya@gmail.com', NULL, '$2y$10$dRk0M1bXpxn1UaE/tJOqjO0wJRGnLsX3jvwRhyPKcV4v2g26a45vS', NULL, '2020-05-23 00:53:30', '2020-05-23 00:53:30'),
(3, 'Kurnia Andi Nugroho', 'kurnia@gmail.com', NULL, '$2y$10$11aEIoftHGnSK0ylBiC0mebB1hrctR6u24Cy35VZDKwYszXSWE3lm', NULL, '2020-05-26 19:26:22', '2020-05-26 19:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal_voucher` bigint(20) NOT NULL,
  `total_minimal_shopping` bigint(20) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `title`, `voucher`, `nominal_voucher`, `total_minimal_shopping`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Potongan 500 Rupiah', 'CASHBACK5', 500, 1000, 'Potongan Sampai 500 Rupiah, untuk pembelian minimal 1000 RB.', 'D8eHWrNUtDWKFk7G.jpg', '2020-05-27 22:33:09', '2020-05-30 20:35:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_confirmations`
--
ALTER TABLE `payment_confirmations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_confirmations`
--
ALTER TABLE `payment_confirmations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
