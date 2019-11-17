-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2019 at 10:17 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `3ddx`
--

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
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2019_11_08_091320_create_quizes_table', 1),
(7, '2019_11_16_143829_add_type_field_to_users_table', 2),
(9, '2019_11_16_185305_create_question_user_table', 3),
(10, '2019_11_16_192221_create_quiz_user_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `possible_answers` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `explanation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_description`, `possible_answers`, `correct_answer`, `explanation`, `quiz_id`, `created_at`, `updated_at`) VALUES
(26, 'dsad', 'dsad', 'dsadsadsada', 'dsadas', 33, '2019-11-16 16:04:09', '2019-11-16 16:04:09'),
(30, '1+1=?', '3, 5, 2, 7', '2', 'By adding one and one we get two', 32, '2019-11-16 16:38:08', '2019-11-16 16:38:08'),
(31, '2*5=?', '6, 10, 8, 20, 50', '10', 'By multiplying two by five we get ten', 32, '2019-11-16 16:38:08', '2019-11-16 16:38:08'),
(35, 'Who ... you?', 'are, is, must, havn\'t', 'are', 'Present Simple', 34, '2019-11-16 19:09:09', '2019-11-16 19:09:09'),
(36, 'I .... want to go to the school', 'doesn\'t, haven\'t, hasn\'t, don\'t', 'don\'t', 'Singular Present Simple', 34, '2019-11-16 19:09:09', '2019-11-16 19:09:09'),
(37, 'There ... a cat.', 'is, are, don\'t, doesn\'t', 'is', 'Singular Present Simple', 34, '2019-11-16 19:09:09', '2019-11-16 19:09:09'),
(38, 'Question', 'Answers', 'correct', 'Explanation', 35, '2019-11-16 19:13:00', '2019-11-16 19:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `question_user`
--

CREATE TABLE `question_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_user`
--

INSERT INTO `question_user` (`id`, `question_id`, `user_id`, `answer`, `created_at`, `updated_at`) VALUES
(34, 30, 1, '6', NULL, NULL),
(35, 31, 1, '7', NULL, NULL),
(39, 35, 1, 'are', NULL, NULL),
(40, 36, 1, 'is', NULL, NULL),
(41, 37, 1, 'is', NULL, NULL),
(42, 38, 5, 'correct', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quizes`
--

CREATE TABLE `quizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizes`
--

INSERT INTO `quizes` (`id`, `description`, `published`, `user_id`, `created_at`, `updated_at`) VALUES
(32, 'Math', 1, 2, '2019-11-16 15:51:38', '2019-11-16 16:37:57'),
(33, 'dsad', 0, 3, '2019-11-16 16:04:09', '2019-11-16 16:04:09'),
(34, 'English Quiz', 1, 2, '2019-11-16 19:05:26', '2019-11-16 19:05:26'),
(35, 'Second Quiz', 1, 4, '2019-11-16 19:13:00', '2019-11-16 19:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_user`
--

CREATE TABLE `quiz_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_user`
--

INSERT INTO `quiz_user` (`id`, `quiz_id`, `user_id`, `grade`, `created_at`, `updated_at`) VALUES
(7, 32, 1, '0', NULL, NULL),
(9, 34, 1, '66.67', NULL, NULL),
(10, 35, 5, '100.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `type`) VALUES
(1, 'student1', 'kero_es7ak@yahoo.com', '$2y$10$6O5WXXDRvMi2YaRH65IJEeCUcq2tQh0jOXXi95xPa1pCUlBsT07EK', 'yffzQGSxFYjYMgBLXk1nvBFFe1sYR9NmZlmqdUNjUjXtHQXCG1hLVfEYVsBl', '2019-11-16 12:58:24', '2019-11-16 12:58:24', 'student'),
(2, 'teacher2', 'kero_es7ak@hotmail.com', '$2y$10$h6e3j6otYuqLZsgVHyXFNuIrZH1HJMqNGcmUcor.GcDtPUuzk6qmC', 'XkdBoLBOM555EhhjiELUsAa1i4b4QnRyl6m4GqzSgVT1kVFF9e1shPozacKg', '2019-11-16 13:11:10', '2019-11-16 13:11:10', 'teacher'),
(3, 'teacher1', 'keroes7ak80@gmail.com', '$2y$10$CPwe7V6gRzA9j1PQcfhkkON6KKgNUGReCqoIHZkSluv/aGqL.JxqO', 'YQt27ETFCrw1sfVxO2LnS7sfMwATwyspVjDSTg0FFPwsrAlPIvV2BG2F6nTt', '2019-11-16 14:33:04', '2019-11-16 14:33:04', 'teacher'),
(4, 'k', 'kero@kero.com', '$2y$10$K78/XqlJWppf6tWaT8o9C.bSoG9Xv8FGjZ.TFJBRjnXpQDK6lX4/6', 'qWtM5P0XNQEbic4nP6v21SJm6Crm4mV606fICYqqBghWQFsqlCCYjPFb8EBV', '2019-11-16 19:12:20', '2019-11-16 19:12:20', 'teacher'),
(5, 'koko', 'kero@kerollos.com', '$2y$10$JJuoq0PJIybHtXbC6IGcl.zAGGXpthWLhHA1Uzy/6ecakY3Ck0emi', NULL, '2019-11-16 19:13:43', '2019-11-16 19:13:43', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`) USING BTREE;

--
-- Indexes for table `question_user`
--
ALTER TABLE `question_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`) USING BTREE;

--
-- Indexes for table `quizes`
--
ALTER TABLE `quizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`user_id`) USING BTREE;

--
-- Indexes for table `quiz_user`
--
ALTER TABLE `quiz_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `question_user`
--
ALTER TABLE `question_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `quizes`
--
ALTER TABLE `quizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `quiz_user`
--
ALTER TABLE `quiz_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question_user`
--
ALTER TABLE `question_user`
  ADD CONSTRAINT `question_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_user_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quizes`
--
ALTER TABLE `quizes`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_user`
--
ALTER TABLE `quiz_user`
  ADD CONSTRAINT `quiz_user_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
