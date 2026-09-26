-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 25, 2026 at 11:20 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turniej2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tabela_8x`
--

CREATE TABLE `tabela_8x` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `grupa` varchar(50) NOT NULL,
  `main1` int(11) DEFAULT NULL,
  `main2` int(11) DEFAULT NULL,
  `main3` int(11) DEFAULT NULL,
  `main4` int(11) DEFAULT NULL,
  `main5` int(11) DEFAULT NULL,
  `main6` int(11) DEFAULT NULL,
  `main7` int(11) DEFAULT NULL,
  `main8` int(11) DEFAULT NULL,
  `p1_4_1` int(11) DEFAULT NULL,
  `p1_4_2` int(11) DEFAULT NULL,
  `p1_4_3` int(11) DEFAULT NULL,
  `p1_4_4` int(11) DEFAULT NULL,
  `p1_2_1` int(11) DEFAULT NULL,
  `p1_2_2` int(11) DEFAULT NULL,
  `l_1_4_1` int(11) DEFAULT NULL,
  `l_1_4_2` int(11) DEFAULT NULL,
  `l_1_4_3` int(11) DEFAULT NULL,
  `l_1_4_4` int(11) DEFAULT NULL,
  `l_1_4_c1` int(11) DEFAULT NULL,
  `l_1_4_c2` int(11) DEFAULT NULL,
  `l_1_4_c3` int(11) DEFAULT NULL,
  `l_1_4_c4` int(11) DEFAULT NULL,
  `l_1_2_1` int(11) DEFAULT NULL,
  `l_1_2_2` int(11) DEFAULT NULL,
  `l_1_2_c1` int(11) DEFAULT NULL,
  `l_1_2_c2` int(11) DEFAULT NULL,
  `7_8_1` int(11) DEFAULT NULL,
  `7_8_2` int(11) DEFAULT NULL,
  `5_6_1` int(11) DEFAULT NULL,
  `5_6_2` int(11) DEFAULT NULL,
  `1` int(11) DEFAULT NULL,
  `2` int(11) DEFAULT NULL,
  `3` int(11) DEFAULT NULL,
  `4` int(11) DEFAULT NULL,
  `5` int(11) DEFAULT NULL,
  `6` int(11) DEFAULT NULL,
  `7` int(11) DEFAULT NULL,
  `8` int(11) DEFAULT NULL,
  `1_2_1` int(11) DEFAULT NULL,
  `1_2_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabela_8x`
--

INSERT INTO `tabela_8x` (`id`, `data`, `grupa`, `main1`, `main2`, `main3`, `main4`, `main5`, `main6`, `main7`, `main8`, `p1_4_1`, `p1_4_2`, `p1_4_3`, `p1_4_4`, `p1_2_1`, `p1_2_2`, `l_1_4_1`, `l_1_4_2`, `l_1_4_3`, `l_1_4_4`, `l_1_4_c1`, `l_1_4_c2`, `l_1_4_c3`, `l_1_4_c4`, `l_1_2_1`, `l_1_2_2`, `l_1_2_c1`, `l_1_2_c2`, `7_8_1`, `7_8_2`, `5_6_1`, `5_6_2`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `1_2_1`, `1_2_2`) VALUES
(1, '2026-09-20', 'podstawowa', 49, 1, 7, 14, 19, 3, 8, 9, 9, 14, 7, 8, 9, 7, 49, 19, 3, 1, 49, 8, 3, 14, 8, 14, 8, 7, 19, 1, 49, 3, 9, 7, 8, 14, 49, 3, 19, 1, 9, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tabela_16x`
--

CREATE TABLE `tabela_16x` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `grupa` varchar(50) NOT NULL,
  `main1` int(11) DEFAULT NULL,
  `main2` int(11) DEFAULT NULL,
  `main3` int(11) DEFAULT NULL,
  `main4` int(11) DEFAULT NULL,
  `main5` int(11) DEFAULT NULL,
  `main6` int(11) DEFAULT NULL,
  `main7` int(11) DEFAULT NULL,
  `main8` int(11) DEFAULT NULL,
  `main9` int(11) DEFAULT NULL,
  `main10` int(11) DEFAULT NULL,
  `main11` int(11) DEFAULT NULL,
  `main12` int(11) DEFAULT NULL,
  `main13` int(11) DEFAULT NULL,
  `main14` int(11) DEFAULT NULL,
  `main15` int(11) DEFAULT NULL,
  `main16` int(11) DEFAULT NULL,
  `p1_8_1` int(11) DEFAULT NULL,
  `p1_8_2` int(11) DEFAULT NULL,
  `p1_8_3` int(11) DEFAULT NULL,
  `p1_8_4` int(11) DEFAULT NULL,
  `p1_8_5` int(11) DEFAULT NULL,
  `p1_8_6` int(11) DEFAULT NULL,
  `p1_8_7` int(11) DEFAULT NULL,
  `p1_8_8` int(11) DEFAULT NULL,
  `p1_4_1` int(11) DEFAULT NULL,
  `p1_4_2` int(11) DEFAULT NULL,
  `p1_4_3` int(11) DEFAULT NULL,
  `p1_4_4` int(11) DEFAULT NULL,
  `p1_2_1` int(11) DEFAULT NULL,
  `p1_2_2` int(11) DEFAULT NULL,
  `l1_8_1` int(11) DEFAULT NULL,
  `l1_8_2` int(11) DEFAULT NULL,
  `l1_8_3` int(11) DEFAULT NULL,
  `l1_8_4` int(11) DEFAULT NULL,
  `l1_8_5` int(11) DEFAULT NULL,
  `l1_8_6` int(11) DEFAULT NULL,
  `l1_8_7` int(11) DEFAULT NULL,
  `l1_8_8` int(11) DEFAULT NULL,
  `l1_8_c1` int(11) DEFAULT NULL,
  `l1_8_c2` int(11) DEFAULT NULL,
  `l1_8_c3` int(11) DEFAULT NULL,
  `l1_8_c4` int(11) DEFAULT NULL,
  `l1_8_c5` int(11) DEFAULT NULL,
  `l1_8_c6` int(11) DEFAULT NULL,
  `l1_8_c7` int(11) DEFAULT NULL,
  `l1_8_c8` int(11) DEFAULT NULL,
  `l_1_4_1` int(11) DEFAULT NULL,
  `l_1_4_2` int(11) DEFAULT NULL,
  `l_1_4_3` int(11) DEFAULT NULL,
  `l_1_4_4` int(11) DEFAULT NULL,
  `l_1_4_c1` int(11) DEFAULT NULL,
  `l_1_4_c2` int(11) DEFAULT NULL,
  `l_1_4_c3` int(11) DEFAULT NULL,
  `l_1_4_c4` int(11) DEFAULT NULL,
  `l_1_2_1` int(11) DEFAULT NULL,
  `l_1_2_2` int(11) DEFAULT NULL,
  `l_1_2_c1` int(11) DEFAULT NULL,
  `l_1_2_c2` int(11) DEFAULT NULL,
  `7_8_1` int(11) DEFAULT NULL,
  `7_8_2` int(11) DEFAULT NULL,
  `5_6_1` int(11) DEFAULT NULL,
  `5_6_2` int(11) DEFAULT NULL,
  `1` int(11) DEFAULT NULL,
  `2` int(11) DEFAULT NULL,
  `3` int(11) DEFAULT NULL,
  `4` int(11) DEFAULT NULL,
  `5` int(11) DEFAULT NULL,
  `6` int(11) DEFAULT NULL,
  `7` int(11) DEFAULT NULL,
  `8` int(11) DEFAULT NULL,
  `9` int(11) DEFAULT NULL,
  `10` int(11) DEFAULT NULL,
  `11` int(11) DEFAULT NULL,
  `12` int(11) DEFAULT NULL,
  `13` int(11) DEFAULT NULL,
  `14` int(11) DEFAULT NULL,
  `15` int(11) DEFAULT NULL,
  `16` int(11) DEFAULT NULL,
  `1_2_1` int(11) DEFAULT NULL,
  `1_2_2` int(11) DEFAULT NULL,
  `9_12_1` int(11) DEFAULT NULL,
  `9_12_2` int(11) DEFAULT NULL,
  `9_12_3` int(11) DEFAULT NULL,
  `9_12_4` int(11) DEFAULT NULL,
  `13_16_1` int(11) DEFAULT NULL,
  `13_16_2` int(11) DEFAULT NULL,
  `13_16_3` int(11) DEFAULT NULL,
  `13_16_4` int(11) DEFAULT NULL,
  `13_14_1` int(11) DEFAULT NULL,
  `13_14_2` int(11) DEFAULT NULL,
  `15_16_1` int(11) DEFAULT NULL,
  `15_16_2` int(11) DEFAULT NULL,
  `9_10_1` int(11) DEFAULT NULL,
  `9_10_2` int(11) DEFAULT NULL,
  `11_12_1` int(11) DEFAULT NULL,
  `11_12_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabela_16x`
--

INSERT INTO `tabela_16x` (`id`, `data`, `grupa`, `main1`, `main2`, `main3`, `main4`, `main5`, `main6`, `main7`, `main8`, `main9`, `main10`, `main11`, `main12`, `main13`, `main14`, `main15`, `main16`, `p1_8_1`, `p1_8_2`, `p1_8_3`, `p1_8_4`, `p1_8_5`, `p1_8_6`, `p1_8_7`, `p1_8_8`, `p1_4_1`, `p1_4_2`, `p1_4_3`, `p1_4_4`, `p1_2_1`, `p1_2_2`, `l1_8_1`, `l1_8_2`, `l1_8_3`, `l1_8_4`, `l1_8_5`, `l1_8_6`, `l1_8_7`, `l1_8_8`, `l1_8_c1`, `l1_8_c2`, `l1_8_c3`, `l1_8_c4`, `l1_8_c5`, `l1_8_c6`, `l1_8_c7`, `l1_8_c8`, `l_1_4_1`, `l_1_4_2`, `l_1_4_3`, `l_1_4_4`, `l_1_4_c1`, `l_1_4_c2`, `l_1_4_c3`, `l_1_4_c4`, `l_1_2_1`, `l_1_2_2`, `l_1_2_c1`, `l_1_2_c2`, `7_8_1`, `7_8_2`, `5_6_1`, `5_6_2`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `1_2_1`, `1_2_2`, `9_12_1`, `9_12_2`, `9_12_3`, `9_12_4`, `13_16_1`, `13_16_2`, `13_16_3`, `13_16_4`, `13_14_1`, `13_14_2`, `15_16_1`, `15_16_2`, `9_10_1`, `9_10_2`, `11_12_1`, `11_12_2`) VALUES
(1, '2026-09-13', 'podstawowa', 3, 1, 6, 2, 4, 5, 9, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7, 4, 2, 6, 5, 9, 1, 3, 2, 5, 1, 2, 5, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, 8, 9, NULL, 6, NULL, 4, NULL, 7, 8, 6, 4, 7, 6, 3, 7, 1, 6, 7, 6, 5, 8, 4, 3, 1, 2, 6, 5, 7, 3, 1, 8, 4, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(2, '2026-09-14', 'podstawowa', 2, 1, 6, 7, 9, 19, 4, 3, 8, 32, 33, 35, 36, 34, 37, NULL, 2, 8, 9, 36, 34, 19, 4, 37, 2, 9, 34, 4, 2, 34, NULL, 3, 35, 7, 6, 33, 32, 1, 3, 37, 35, 19, 6, 36, 32, 8, 3, 35, 6, 32, 3, 9, 6, 4, 3, 6, 3, 34, 35, 32, 9, 4, 2, 34, 3, 6, 4, 9, 35, 32, 19, 36, 37, 8, 7, 33, 1, NULL, 2, 34, 37, 19, 36, 8, NULL, 7, 33, 1, 7, 33, NULL, 1, 19, 36, 37, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tabela_24x`
--

CREATE TABLE `tabela_24x` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `grupa` varchar(50) NOT NULL,
  `main1` int(11) DEFAULT NULL,
  `main2` int(11) DEFAULT NULL,
  `main3` int(11) DEFAULT NULL,
  `main4` int(11) DEFAULT NULL,
  `main5` int(11) DEFAULT NULL,
  `main6` int(11) DEFAULT NULL,
  `main7` int(11) DEFAULT NULL,
  `main8` int(11) DEFAULT NULL,
  `main9` int(11) DEFAULT NULL,
  `main10` int(11) DEFAULT NULL,
  `main11` int(11) DEFAULT NULL,
  `main12` int(11) DEFAULT NULL,
  `main13` int(11) DEFAULT NULL,
  `main14` int(11) DEFAULT NULL,
  `main15` int(11) DEFAULT NULL,
  `main16` int(11) DEFAULT NULL,
  `main17` int(11) DEFAULT NULL,
  `main18` int(11) DEFAULT NULL,
  `main19` int(11) DEFAULT NULL,
  `main20` int(11) DEFAULT NULL,
  `main21` int(11) DEFAULT NULL,
  `main22` int(11) DEFAULT NULL,
  `main23` int(11) DEFAULT NULL,
  `main24` int(11) DEFAULT NULL,
  `p1_8_1` int(11) DEFAULT NULL,
  `p1_8_2` int(11) DEFAULT NULL,
  `p1_8_3` int(11) DEFAULT NULL,
  `p1_8_4` int(11) DEFAULT NULL,
  `p1_8_5` int(11) DEFAULT NULL,
  `p1_8_6` int(11) DEFAULT NULL,
  `p1_8_7` int(11) DEFAULT NULL,
  `p1_8_8` int(11) DEFAULT NULL,
  `p1_4_1` int(11) DEFAULT NULL,
  `p1_4_2` int(11) DEFAULT NULL,
  `p1_4_3` int(11) DEFAULT NULL,
  `p1_4_4` int(11) DEFAULT NULL,
  `p1_2_1` int(11) DEFAULT NULL,
  `p1_2_2` int(11) DEFAULT NULL,
  `l1_8_1` int(11) DEFAULT NULL,
  `l1_8_2` int(11) DEFAULT NULL,
  `l1_8_3` int(11) DEFAULT NULL,
  `l1_8_4` int(11) DEFAULT NULL,
  `l1_8_5` int(11) DEFAULT NULL,
  `l1_8_6` int(11) DEFAULT NULL,
  `l1_8_7` int(11) DEFAULT NULL,
  `l1_8_8` int(11) DEFAULT NULL,
  `l1_8_c1` int(11) DEFAULT NULL,
  `l1_8_c2` int(11) DEFAULT NULL,
  `l1_8_c3` int(11) DEFAULT NULL,
  `l1_8_c4` int(11) DEFAULT NULL,
  `l1_8_c5` int(11) DEFAULT NULL,
  `l1_8_c6` int(11) DEFAULT NULL,
  `l1_8_c7` int(11) DEFAULT NULL,
  `l1_8_c8` int(11) DEFAULT NULL,
  `l_1_4_1` int(11) DEFAULT NULL,
  `l_1_4_2` int(11) DEFAULT NULL,
  `l_1_4_3` int(11) DEFAULT NULL,
  `l_1_4_4` int(11) DEFAULT NULL,
  `l_1_4_c1` int(11) DEFAULT NULL,
  `l_1_4_c2` int(11) DEFAULT NULL,
  `l_1_4_c3` int(11) DEFAULT NULL,
  `l_1_4_c4` int(11) DEFAULT NULL,
  `l_1_2_1` int(11) DEFAULT NULL,
  `l_1_2_2` int(11) DEFAULT NULL,
  `l_1_2_c1` int(11) DEFAULT NULL,
  `l_1_2_c2` int(11) DEFAULT NULL,
  `7_8_1` int(11) DEFAULT NULL,
  `7_8_2` int(11) DEFAULT NULL,
  `5_6_1` int(11) DEFAULT NULL,
  `5_6_2` int(11) DEFAULT NULL,
  `1` int(11) DEFAULT NULL,
  `2` int(11) DEFAULT NULL,
  `3` int(11) DEFAULT NULL,
  `4` int(11) DEFAULT NULL,
  `5` int(11) DEFAULT NULL,
  `6` int(11) DEFAULT NULL,
  `7` int(11) DEFAULT NULL,
  `8` int(11) DEFAULT NULL,
  `9` int(11) DEFAULT NULL,
  `10` int(11) DEFAULT NULL,
  `11` int(11) DEFAULT NULL,
  `12` int(11) DEFAULT NULL,
  `13` int(11) DEFAULT NULL,
  `14` int(11) DEFAULT NULL,
  `15` int(11) DEFAULT NULL,
  `16` int(11) DEFAULT NULL,
  `1_2_1` int(11) DEFAULT NULL,
  `1_2_2` int(11) DEFAULT NULL,
  `9_12_1` int(11) DEFAULT NULL,
  `9_12_2` int(11) DEFAULT NULL,
  `9_12_3` int(11) DEFAULT NULL,
  `9_12_4` int(11) DEFAULT NULL,
  `13_16_1` int(11) DEFAULT NULL,
  `13_16_2` int(11) DEFAULT NULL,
  `13_16_3` int(11) DEFAULT NULL,
  `13_16_4` int(11) DEFAULT NULL,
  `13_14_1` int(11) DEFAULT NULL,
  `13_14_2` int(11) DEFAULT NULL,
  `15_16_1` int(11) DEFAULT NULL,
  `15_16_2` int(11) DEFAULT NULL,
  `9_10_1` int(11) DEFAULT NULL,
  `9_10_2` int(11) DEFAULT NULL,
  `11_12_1` int(11) DEFAULT NULL,
  `11_12_2` int(11) DEFAULT NULL,
  `Pmain_1` int(11) DEFAULT NULL,
  `Pmain_2` int(11) DEFAULT NULL,
  `Pmain_3` int(11) DEFAULT NULL,
  `Pmain_4` int(11) DEFAULT NULL,
  `Pmain_5` int(11) DEFAULT NULL,
  `Pmain_6` int(11) DEFAULT NULL,
  `Pmain_7` int(11) DEFAULT NULL,
  `Pmain_8` int(11) DEFAULT NULL,
  `Lmain_1` int(11) DEFAULT NULL,
  `Lmain_2` int(11) DEFAULT NULL,
  `Lmain_3` int(11) DEFAULT NULL,
  `Lmain_4` int(11) DEFAULT NULL,
  `Lmain_5` int(11) DEFAULT NULL,
  `Lmain_6` int(11) DEFAULT NULL,
  `Lmain_7` int(11) DEFAULT NULL,
  `Lmain_8` int(11) DEFAULT NULL,
  `Lmain_9` int(11) DEFAULT NULL,
  `Lmain_10` int(11) DEFAULT NULL,
  `Lmain_11` int(11) DEFAULT NULL,
  `Lmain_12` int(11) DEFAULT NULL,
  `Lmain_13` int(11) DEFAULT NULL,
  `Lmain_14` int(11) DEFAULT NULL,
  `Lmain_15` int(11) DEFAULT NULL,
  `Lmain_16` int(11) DEFAULT NULL,
  `17_24_1` int(11) DEFAULT NULL,
  `17_24_2` int(11) DEFAULT NULL,
  `17_24_3` int(11) DEFAULT NULL,
  `17_24_4` int(11) DEFAULT NULL,
  `17_24_5` int(11) DEFAULT NULL,
  `17_24_6` int(11) DEFAULT NULL,
  `17_24_7` int(11) DEFAULT NULL,
  `17_24_8` int(11) DEFAULT NULL,
  `17_20_1` int(11) DEFAULT NULL,
  `17_20_2` int(11) DEFAULT NULL,
  `17_20_3` int(11) DEFAULT NULL,
  `17_20_4` int(11) DEFAULT NULL,
  `21_24_1` int(11) DEFAULT NULL,
  `21_24_2` int(11) DEFAULT NULL,
  `21_24_3` int(11) DEFAULT NULL,
  `21_24_4` int(11) DEFAULT NULL,
  `17` int(11) DEFAULT NULL,
  `18` int(11) DEFAULT NULL,
  `19` int(11) DEFAULT NULL,
  `20` int(11) DEFAULT NULL,
  `21` int(11) DEFAULT NULL,
  `22` int(11) DEFAULT NULL,
  `23` int(11) DEFAULT NULL,
  `24` int(11) DEFAULT NULL,
  `17_18_1` int(11) DEFAULT NULL,
  `17_18_2` int(11) DEFAULT NULL,
  `19_20_1` int(11) DEFAULT NULL,
  `19_20_2` int(11) DEFAULT NULL,
  `21_22_1` int(11) DEFAULT NULL,
  `21_22_2` int(11) DEFAULT NULL,
  `23_24_1` int(11) DEFAULT NULL,
  `23_24_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabela_24x`
--

INSERT INTO `tabela_24x` (`id`, `data`, `grupa`, `main1`, `main2`, `main3`, `main4`, `main5`, `main6`, `main7`, `main8`, `main9`, `main10`, `main11`, `main12`, `main13`, `main14`, `main15`, `main16`, `main17`, `main18`, `main19`, `main20`, `main21`, `main22`, `main23`, `main24`, `p1_8_1`, `p1_8_2`, `p1_8_3`, `p1_8_4`, `p1_8_5`, `p1_8_6`, `p1_8_7`, `p1_8_8`, `p1_4_1`, `p1_4_2`, `p1_4_3`, `p1_4_4`, `p1_2_1`, `p1_2_2`, `l1_8_1`, `l1_8_2`, `l1_8_3`, `l1_8_4`, `l1_8_5`, `l1_8_6`, `l1_8_7`, `l1_8_8`, `l1_8_c1`, `l1_8_c2`, `l1_8_c3`, `l1_8_c4`, `l1_8_c5`, `l1_8_c6`, `l1_8_c7`, `l1_8_c8`, `l_1_4_1`, `l_1_4_2`, `l_1_4_3`, `l_1_4_4`, `l_1_4_c1`, `l_1_4_c2`, `l_1_4_c3`, `l_1_4_c4`, `l_1_2_1`, `l_1_2_2`, `l_1_2_c1`, `l_1_2_c2`, `7_8_1`, `7_8_2`, `5_6_1`, `5_6_2`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `1_2_1`, `1_2_2`, `9_12_1`, `9_12_2`, `9_12_3`, `9_12_4`, `13_16_1`, `13_16_2`, `13_16_3`, `13_16_4`, `13_14_1`, `13_14_2`, `15_16_1`, `15_16_2`, `9_10_1`, `9_10_2`, `11_12_1`, `11_12_2`, `Pmain_1`, `Pmain_2`, `Pmain_3`, `Pmain_4`, `Pmain_5`, `Pmain_6`, `Pmain_7`, `Pmain_8`, `Lmain_1`, `Lmain_2`, `Lmain_3`, `Lmain_4`, `Lmain_5`, `Lmain_6`, `Lmain_7`, `Lmain_8`, `Lmain_9`, `Lmain_10`, `Lmain_11`, `Lmain_12`, `Lmain_13`, `Lmain_14`, `Lmain_15`, `Lmain_16`, `17_24_1`, `17_24_2`, `17_24_3`, `17_24_4`, `17_24_5`, `17_24_6`, `17_24_7`, `17_24_8`, `17_20_1`, `17_20_2`, `17_20_3`, `17_20_4`, `21_24_1`, `21_24_2`, `21_24_3`, `21_24_4`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`, `17_18_1`, `17_18_2`, `19_20_1`, `19_20_2`, `21_22_1`, `21_22_2`, `23_24_1`, `23_24_2`) VALUES
(1, '2026-09-13', 'zaawansowana', 10, 11, 14, 15, 16, 18, 19, 22, 23, 24, 26, 27, 28, 31, 12, 17, 30, 20, 25, 29, 13, 21, NULL, NULL, 10, 23, 16, 15, 14, 26, 19, 12, 10, 16, 14, 19, 10, 14, 29, 13, 22, 28, 11, 21, 18, 25, 29, 12, 22, 26, 11, 15, 18, 23, 29, 22, 11, 18, 29, 16, 11, 19, 29, 19, 29, 14, 22, 18, 16, 11, 10, 29, 14, 19, 16, 11, 22, 18, 12, 23, 26, 15, 13, 21, 28, 25, 10, 29, 12, 26, 15, 23, 13, 28, 21, 25, 13, 21, 28, 25, 12, 23, 26, 15, 30, 23, 13, 29, 25, 26, 24, 12, 29, 17, NULL, 13, 22, 27, 28, 30, 11, 31, 21, 24, 18, NULL, 20, 25, 17, NULL, 27, 30, 31, 24, NULL, 20, 17, 27, 31, 20, NULL, 30, 24, NULL, 17, 31, 27, 20, 24, 30, NULL, NULL, 17, 31, 27, 20, 30, 24, NULL, NULL),
(2, '2026-09-20', 'zaawansowana', 6, 5, 15, 12, 16, 17, 30, 40, 41, 44, 20, 23, 24, 25, 26, 29, 38, 39, 42, 43, 45, 46, 47, 11, 6, 41, 16, 24, 15, 20, 30, 39, 6, 16, 15, 39, 6, 39, 12, 11, 40, 43, 5, 46, 17, 26, 12, 30, 40, 20, 5, 24, 17, 41, 12, 40, 5, 17, 12, 16, 5, 15, 16, 5, 5, 39, 40, 17, 12, 15, 6, 5, 39, 16, 15, 12, 40, 17, 30, 41, 20, 24, 11, 46, 43, 26, 6, 5, 30, 20, 24, 41, 11, 43, 46, 26, 11, 46, 43, 26, 30, 41, 20, 24, 38, 41, 45, 24, 42, 20, 47, 39, 12, 29, 11, 45, 40, 23, 43, 38, 5, 25, 46, 47, 17, 44, 26, 42, 29, 45, 23, 38, 25, 47, 44, 42, 29, 23, 25, 44, 45, 38, 47, 42, 44, 29, 23, 25, 45, 47, 38, 42, 29, 44, 23, 25, 45, 47, 38, 42);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tabela_32x`
--

CREATE TABLE `tabela_32x` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `grupa` varchar(50) NOT NULL,
  `main1` int(11) DEFAULT NULL,
  `main2` int(11) DEFAULT NULL,
  `main3` int(11) DEFAULT NULL,
  `main4` int(11) DEFAULT NULL,
  `main5` int(11) DEFAULT NULL,
  `main6` int(11) DEFAULT NULL,
  `main7` int(11) DEFAULT NULL,
  `main8` int(11) DEFAULT NULL,
  `main9` int(11) DEFAULT NULL,
  `main10` int(11) DEFAULT NULL,
  `main11` int(11) DEFAULT NULL,
  `main12` int(11) DEFAULT NULL,
  `main13` int(11) DEFAULT NULL,
  `main14` int(11) DEFAULT NULL,
  `main15` int(11) DEFAULT NULL,
  `main16` int(11) DEFAULT NULL,
  `main17` int(11) DEFAULT NULL,
  `main18` int(11) DEFAULT NULL,
  `main19` int(11) DEFAULT NULL,
  `main20` int(11) DEFAULT NULL,
  `main21` int(11) DEFAULT NULL,
  `main22` int(11) DEFAULT NULL,
  `main23` int(11) DEFAULT NULL,
  `main24` int(11) DEFAULT NULL,
  `main25` int(11) DEFAULT NULL,
  `main26` int(11) DEFAULT NULL,
  `main27` int(11) DEFAULT NULL,
  `main28` int(11) DEFAULT NULL,
  `main29` int(11) DEFAULT NULL,
  `main30` int(11) DEFAULT NULL,
  `main31` int(11) DEFAULT NULL,
  `main32` int(11) DEFAULT NULL,
  `p1_8_1` int(11) DEFAULT NULL,
  `p1_8_2` int(11) DEFAULT NULL,
  `p1_8_3` int(11) DEFAULT NULL,
  `p1_8_4` int(11) DEFAULT NULL,
  `p1_8_5` int(11) DEFAULT NULL,
  `p1_8_6` int(11) DEFAULT NULL,
  `p1_8_7` int(11) DEFAULT NULL,
  `p1_8_8` int(11) DEFAULT NULL,
  `p1_4_1` int(11) DEFAULT NULL,
  `p1_4_2` int(11) DEFAULT NULL,
  `p1_4_3` int(11) DEFAULT NULL,
  `p1_4_4` int(11) DEFAULT NULL,
  `p1_2_1` int(11) DEFAULT NULL,
  `p1_2_2` int(11) DEFAULT NULL,
  `l1_8_1` int(11) DEFAULT NULL,
  `l1_8_2` int(11) DEFAULT NULL,
  `l1_8_3` int(11) DEFAULT NULL,
  `l1_8_4` int(11) DEFAULT NULL,
  `l1_8_5` int(11) DEFAULT NULL,
  `l1_8_6` int(11) DEFAULT NULL,
  `l1_8_7` int(11) DEFAULT NULL,
  `l1_8_8` int(11) DEFAULT NULL,
  `l1_8_c1` int(11) DEFAULT NULL,
  `l1_8_c2` int(11) DEFAULT NULL,
  `l1_8_c3` int(11) DEFAULT NULL,
  `l1_8_c4` int(11) DEFAULT NULL,
  `l1_8_c5` int(11) DEFAULT NULL,
  `l1_8_c6` int(11) DEFAULT NULL,
  `l1_8_c7` int(11) DEFAULT NULL,
  `l1_8_c8` int(11) DEFAULT NULL,
  `l_1_4_1` int(11) DEFAULT NULL,
  `l_1_4_2` int(11) DEFAULT NULL,
  `l_1_4_3` int(11) DEFAULT NULL,
  `l_1_4_4` int(11) DEFAULT NULL,
  `l_1_4_c1` int(11) DEFAULT NULL,
  `l_1_4_c2` int(11) DEFAULT NULL,
  `l_1_4_c3` int(11) DEFAULT NULL,
  `l_1_4_c4` int(11) DEFAULT NULL,
  `l_1_2_1` int(11) DEFAULT NULL,
  `l_1_2_2` int(11) DEFAULT NULL,
  `l_1_2_c1` int(11) DEFAULT NULL,
  `l_1_2_c2` int(11) DEFAULT NULL,
  `7_8_1` int(11) DEFAULT NULL,
  `7_8_2` int(11) DEFAULT NULL,
  `5_6_1` int(11) DEFAULT NULL,
  `5_6_2` int(11) DEFAULT NULL,
  `1` int(11) DEFAULT NULL,
  `2` int(11) DEFAULT NULL,
  `3` int(11) DEFAULT NULL,
  `4` int(11) DEFAULT NULL,
  `5` int(11) DEFAULT NULL,
  `6` int(11) DEFAULT NULL,
  `7` int(11) DEFAULT NULL,
  `8` int(11) DEFAULT NULL,
  `9` int(11) DEFAULT NULL,
  `10` int(11) DEFAULT NULL,
  `11` int(11) DEFAULT NULL,
  `12` int(11) DEFAULT NULL,
  `13` int(11) DEFAULT NULL,
  `14` int(11) DEFAULT NULL,
  `15` int(11) DEFAULT NULL,
  `16` int(11) DEFAULT NULL,
  `1_2_1` int(11) DEFAULT NULL,
  `1_2_2` int(11) DEFAULT NULL,
  `9_12_1` int(11) DEFAULT NULL,
  `9_12_2` int(11) DEFAULT NULL,
  `9_12_3` int(11) DEFAULT NULL,
  `9_12_4` int(11) DEFAULT NULL,
  `13_16_1` int(11) DEFAULT NULL,
  `13_16_2` int(11) DEFAULT NULL,
  `13_16_3` int(11) DEFAULT NULL,
  `13_16_4` int(11) DEFAULT NULL,
  `13_14_1` int(11) DEFAULT NULL,
  `13_14_2` int(11) DEFAULT NULL,
  `15_16_1` int(11) DEFAULT NULL,
  `15_16_2` int(11) DEFAULT NULL,
  `9_10_1` int(11) DEFAULT NULL,
  `9_10_2` int(11) DEFAULT NULL,
  `11_12_1` int(11) DEFAULT NULL,
  `11_12_2` int(11) DEFAULT NULL,
  `p1_16_1` int(11) DEFAULT NULL,
  `p1_16_2` int(11) DEFAULT NULL,
  `p1_16_3` int(11) DEFAULT NULL,
  `p1_16_4` int(11) DEFAULT NULL,
  `p1_16_5` int(11) DEFAULT NULL,
  `p1_16_6` int(11) DEFAULT NULL,
  `p1_16_7` int(11) DEFAULT NULL,
  `p1_16_8` int(11) DEFAULT NULL,
  `p1_16_9` int(11) DEFAULT NULL,
  `p1_16_10` int(11) DEFAULT NULL,
  `p1_16_11` int(11) DEFAULT NULL,
  `p1_16_12` int(11) DEFAULT NULL,
  `p1_16_13` int(11) DEFAULT NULL,
  `p1_16_14` int(11) DEFAULT NULL,
  `p1_16_15` int(11) DEFAULT NULL,
  `p1_16_16` int(11) DEFAULT NULL,
  `l1_16_1` int(11) DEFAULT NULL,
  `l1_16_2` int(11) DEFAULT NULL,
  `l1_16_3` int(11) DEFAULT NULL,
  `l1_16_4` int(11) DEFAULT NULL,
  `l1_16_5` int(11) DEFAULT NULL,
  `l1_16_6` int(11) DEFAULT NULL,
  `l1_16_7` int(11) DEFAULT NULL,
  `l1_16_8` int(11) DEFAULT NULL,
  `l1_16_9` int(11) DEFAULT NULL,
  `l1_16_10` int(11) DEFAULT NULL,
  `l1_16_11` int(11) DEFAULT NULL,
  `l1_16_12` int(11) DEFAULT NULL,
  `l1_16_13` int(11) DEFAULT NULL,
  `l1_16_14` int(11) DEFAULT NULL,
  `l1_16_15` int(11) DEFAULT NULL,
  `l1_16_16` int(11) DEFAULT NULL,
  `l1_16_c1` int(11) DEFAULT NULL,
  `l1_16_c2` int(11) DEFAULT NULL,
  `l1_16_c3` int(11) DEFAULT NULL,
  `l1_16_c4` int(11) DEFAULT NULL,
  `l1_16_c5` int(11) DEFAULT NULL,
  `l1_16_c6` int(11) DEFAULT NULL,
  `l1_16_c7` int(11) DEFAULT NULL,
  `l1_16_c8` int(11) DEFAULT NULL,
  `l1_16_c9` int(11) DEFAULT NULL,
  `l1_16_c10` int(11) DEFAULT NULL,
  `l1_16_c11` int(11) DEFAULT NULL,
  `l1_16_c12` int(11) DEFAULT NULL,
  `l1_16_c13` int(11) DEFAULT NULL,
  `l1_16_c14` int(11) DEFAULT NULL,
  `l1_16_c15` int(11) DEFAULT NULL,
  `l1_16_c16` int(11) DEFAULT NULL,
  `17_24_1` int(11) DEFAULT NULL,
  `17_24_2` int(11) DEFAULT NULL,
  `17_24_3` int(11) DEFAULT NULL,
  `17_24_4` int(11) DEFAULT NULL,
  `17_24_5` int(11) DEFAULT NULL,
  `17_24_6` int(11) DEFAULT NULL,
  `17_24_7` int(11) DEFAULT NULL,
  `17_24_8` int(11) DEFAULT NULL,
  `17_20_1` int(11) DEFAULT NULL,
  `17_20_2` int(11) DEFAULT NULL,
  `17_20_3` int(11) DEFAULT NULL,
  `17_20_4` int(11) DEFAULT NULL,
  `21_24_1` int(11) DEFAULT NULL,
  `21_24_2` int(11) DEFAULT NULL,
  `21_24_3` int(11) DEFAULT NULL,
  `21_24_4` int(11) DEFAULT NULL,
  `17` int(11) DEFAULT NULL,
  `18` int(11) DEFAULT NULL,
  `19` int(11) DEFAULT NULL,
  `20` int(11) DEFAULT NULL,
  `21` int(11) DEFAULT NULL,
  `22` int(11) DEFAULT NULL,
  `23` int(11) DEFAULT NULL,
  `24` int(11) DEFAULT NULL,
  `25` int(11) DEFAULT NULL,
  `26` int(11) DEFAULT NULL,
  `27` int(11) DEFAULT NULL,
  `28` int(11) DEFAULT NULL,
  `29` int(11) DEFAULT NULL,
  `30` int(11) DEFAULT NULL,
  `31` int(11) DEFAULT NULL,
  `32` int(11) DEFAULT NULL,
  `17_18_1` int(11) DEFAULT NULL,
  `17_18_2` int(11) DEFAULT NULL,
  `19_20_1` int(11) DEFAULT NULL,
  `19_20_2` int(11) DEFAULT NULL,
  `21_22_1` int(11) DEFAULT NULL,
  `21_22_2` int(11) DEFAULT NULL,
  `23_24_1` int(11) DEFAULT NULL,
  `23_24_2` int(11) DEFAULT NULL,
  `25_32_1` int(11) DEFAULT NULL,
  `25_32_2` int(11) DEFAULT NULL,
  `25_32_3` int(11) DEFAULT NULL,
  `25_32_4` int(11) DEFAULT NULL,
  `25_32_5` int(11) DEFAULT NULL,
  `25_32_6` int(11) DEFAULT NULL,
  `25_32_7` int(11) DEFAULT NULL,
  `25_32_8` int(11) DEFAULT NULL,
  `25_28_1` int(11) DEFAULT NULL,
  `25_28_2` int(11) DEFAULT NULL,
  `25_28_3` int(11) DEFAULT NULL,
  `25_28_4` int(11) DEFAULT NULL,
  `29_32_1` int(11) DEFAULT NULL,
  `29_32_2` int(11) DEFAULT NULL,
  `29_32_3` int(11) DEFAULT NULL,
  `29_32_4` int(11) DEFAULT NULL,
  `25_26_1` int(11) DEFAULT NULL,
  `25_26_2` int(11) DEFAULT NULL,
  `27_28_1` int(11) DEFAULT NULL,
  `27_28_2` int(11) DEFAULT NULL,
  `29_30_1` int(11) DEFAULT NULL,
  `29_30_2` int(11) DEFAULT NULL,
  `31_32_1` int(11) DEFAULT NULL,
  `31_32_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabela_32x`
--

INSERT INTO `tabela_32x` (`id`, `data`, `grupa`, `main1`, `main2`, `main3`, `main4`, `main5`, `main6`, `main7`, `main8`, `main9`, `main10`, `main11`, `main12`, `main13`, `main14`, `main15`, `main16`, `main17`, `main18`, `main19`, `main20`, `main21`, `main22`, `main23`, `main24`, `main25`, `main26`, `main27`, `main28`, `main29`, `main30`, `main31`, `main32`, `p1_8_1`, `p1_8_2`, `p1_8_3`, `p1_8_4`, `p1_8_5`, `p1_8_6`, `p1_8_7`, `p1_8_8`, `p1_4_1`, `p1_4_2`, `p1_4_3`, `p1_4_4`, `p1_2_1`, `p1_2_2`, `l1_8_1`, `l1_8_2`, `l1_8_3`, `l1_8_4`, `l1_8_5`, `l1_8_6`, `l1_8_7`, `l1_8_8`, `l1_8_c1`, `l1_8_c2`, `l1_8_c3`, `l1_8_c4`, `l1_8_c5`, `l1_8_c6`, `l1_8_c7`, `l1_8_c8`, `l_1_4_1`, `l_1_4_2`, `l_1_4_3`, `l_1_4_4`, `l_1_4_c1`, `l_1_4_c2`, `l_1_4_c3`, `l_1_4_c4`, `l_1_2_1`, `l_1_2_2`, `l_1_2_c1`, `l_1_2_c2`, `7_8_1`, `7_8_2`, `5_6_1`, `5_6_2`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `1_2_1`, `1_2_2`, `9_12_1`, `9_12_2`, `9_12_3`, `9_12_4`, `13_16_1`, `13_16_2`, `13_16_3`, `13_16_4`, `13_14_1`, `13_14_2`, `15_16_1`, `15_16_2`, `9_10_1`, `9_10_2`, `11_12_1`, `11_12_2`, `p1_16_1`, `p1_16_2`, `p1_16_3`, `p1_16_4`, `p1_16_5`, `p1_16_6`, `p1_16_7`, `p1_16_8`, `p1_16_9`, `p1_16_10`, `p1_16_11`, `p1_16_12`, `p1_16_13`, `p1_16_14`, `p1_16_15`, `p1_16_16`, `l1_16_1`, `l1_16_2`, `l1_16_3`, `l1_16_4`, `l1_16_5`, `l1_16_6`, `l1_16_7`, `l1_16_8`, `l1_16_9`, `l1_16_10`, `l1_16_11`, `l1_16_12`, `l1_16_13`, `l1_16_14`, `l1_16_15`, `l1_16_16`, `l1_16_c1`, `l1_16_c2`, `l1_16_c3`, `l1_16_c4`, `l1_16_c5`, `l1_16_c6`, `l1_16_c7`, `l1_16_c8`, `l1_16_c9`, `l1_16_c10`, `l1_16_c11`, `l1_16_c12`, `l1_16_c13`, `l1_16_c14`, `l1_16_c15`, `l1_16_c16`, `17_24_1`, `17_24_2`, `17_24_3`, `17_24_4`, `17_24_5`, `17_24_6`, `17_24_7`, `17_24_8`, `17_20_1`, `17_20_2`, `17_20_3`, `17_20_4`, `21_24_1`, `21_24_2`, `21_24_3`, `21_24_4`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`, `25`, `26`, `27`, `28`, `29`, `30`, `31`, `32`, `17_18_1`, `17_18_2`, `19_20_1`, `19_20_2`, `21_22_1`, `21_22_2`, `23_24_1`, `23_24_2`, `25_32_1`, `25_32_2`, `25_32_3`, `25_32_4`, `25_32_5`, `25_32_6`, `25_32_7`, `25_32_8`, `25_28_1`, `25_28_2`, `25_28_3`, `25_28_4`, `29_32_1`, `29_32_2`, `29_32_3`, `29_32_4`, `25_26_1`, `25_26_2`, `27_28_1`, `27_28_2`, `29_30_1`, `29_30_2`, `31_32_1`, `31_32_2`) VALUES
(1, '2026-09-14', 'zaawansowana', 10, 11, 14, 15, 16, 18, 22, 23, 24, 26, 27, 28, 31, 12, 13, 20, 21, 25, 30, 5, 17, 29, 38, 39, 41, 43, 44, 46, 47, 40, 42, 45, 10, 24, 16, 31, 14, 27, 22, 13, 10, 16, 14, 13, 10, 13, 45, 39, 46, 5, 40, 29, 43, 25, 39, 31, 5, 24, 40, 22, 43, 27, 39, 5, 40, 43, 5, 14, 43, 16, 5, 16, 5, 10, 39, 40, 14, 43, 13, 10, 5, 16, 43, 14, 39, 40, 24, 22, 31, 27, 45, 29, 46, 25, 13, 10, 31, 24, 22, 27, 45, 46, 29, 25, 45, 29, 46, 25, 24, 22, 31, 27, 10, 21, 24, 41, 16, 17, 31, 47, 14, 30, 27, 44, 22, 38, 13, 42, 45, 20, 39, 23, 46, 28, 5, 15, 40, 12, 29, 18, 43, 26, 25, 11, 45, 42, 39, 38, 46, 44, 5, 30, 40, 47, 29, 17, 43, 41, 25, 21, 42, 38, 44, 30, 47, 17, 41, 21, 42, 44, 47, 41, 38, 30, 17, 21, 42, 47, 44, 41, 38, 17, 30, 21, 20, 12, 28, 11, 23, 18, 15, 26, 42, 47, 44, 41, 38, 17, 30, 21, 20, 23, 28, 15, 12, 18, 26, 11, 20, 28, 12, 11, 23, 15, 18, 26, 20, 12, 28, 11, 23, 18, 15, 26);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `turniej_tabele`
--

CREATE TABLE `turniej_tabele` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `tabela` varchar(50) NOT NULL,
  `grupa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turniej_tabele`
--

INSERT INTO `turniej_tabele` (`id`, `data`, `tabela`, `grupa`) VALUES
(1, '2026-09-13', 'tabela_16x', 'podstawowa'),
(2, '2026-09-13', 'tabela_24x', 'zaawansowana'),
(3, '2026-09-14', 'tabela_16x', 'podstawowa'),
(4, '2026-09-14', 'tabela_32x', 'zaawansowana'),
(5, '2026-09-20', 'tabela_8x', 'podstawowa'),
(6, '2026-09-20', 'tabela_24x', 'zaawansowana');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `turniej_zawodnik`
--

CREATE TABLE `turniej_zawodnik` (
  `id` int(11) NOT NULL,
  `turniej_data` date NOT NULL,
  `zawodnik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turniej_zawodnik`
--

INSERT INTO `turniej_zawodnik` (`id`, `turniej_data`, `zawodnik_id`) VALUES
(11, '2026-09-13', 1),
(13, '2026-09-13', 2),
(10, '2026-09-13', 3),
(14, '2026-09-13', 4),
(15, '2026-09-13', 5),
(12, '2026-09-13', 6),
(18, '2026-09-13', 7),
(17, '2026-09-13', 8),
(16, '2026-09-13', 9),
(19, '2026-09-13', 10),
(20, '2026-09-13', 11),
(33, '2026-09-13', 12),
(39, '2026-09-13', 13),
(21, '2026-09-13', 14),
(22, '2026-09-13', 15),
(23, '2026-09-13', 16),
(34, '2026-09-13', 17),
(24, '2026-09-13', 18),
(25, '2026-09-13', 19),
(36, '2026-09-13', 20),
(40, '2026-09-13', 21),
(26, '2026-09-13', 22),
(27, '2026-09-13', 23),
(28, '2026-09-13', 24),
(37, '2026-09-13', 25),
(29, '2026-09-13', 26),
(30, '2026-09-13', 27),
(31, '2026-09-13', 28),
(38, '2026-09-13', 29),
(35, '2026-09-13', 30),
(32, '2026-09-13', 31),
(42, '2026-09-14', 1),
(41, '2026-09-14', 2),
(48, '2026-09-14', 3),
(47, '2026-09-14', 4),
(75, '2026-09-14', 5),
(43, '2026-09-14', 6),
(44, '2026-09-14', 7),
(49, '2026-09-14', 8),
(45, '2026-09-14', 9),
(56, '2026-09-14', 10),
(57, '2026-09-14', 11),
(69, '2026-09-14', 12),
(70, '2026-09-14', 13),
(58, '2026-09-14', 14),
(59, '2026-09-14', 15),
(60, '2026-09-14', 16),
(76, '2026-09-14', 17),
(61, '2026-09-14', 18),
(46, '2026-09-14', 19),
(71, '2026-09-14', 20),
(72, '2026-09-14', 21),
(62, '2026-09-14', 22),
(63, '2026-09-14', 23),
(64, '2026-09-14', 24),
(73, '2026-09-14', 25),
(65, '2026-09-14', 26),
(66, '2026-09-14', 27),
(67, '2026-09-14', 28),
(77, '2026-09-14', 29),
(74, '2026-09-14', 30),
(68, '2026-09-14', 31),
(50, '2026-09-14', 32),
(51, '2026-09-14', 33),
(54, '2026-09-14', 34),
(52, '2026-09-14', 35),
(53, '2026-09-14', 36),
(55, '2026-09-14', 37),
(78, '2026-09-14', 38),
(79, '2026-09-14', 39),
(85, '2026-09-14', 40),
(80, '2026-09-14', 41),
(86, '2026-09-14', 42),
(81, '2026-09-14', 43),
(82, '2026-09-14', 44),
(87, '2026-09-14', 45),
(83, '2026-09-14', 46),
(84, '2026-09-14', 47),
(90, '2026-09-20', 1),
(96, '2026-09-20', 3),
(93, '2026-09-20', 5),
(92, '2026-09-20', 6),
(91, '2026-09-20', 7),
(97, '2026-09-20', 8),
(98, '2026-09-20', 9),
(120, '2026-09-20', 11),
(100, '2026-09-20', 12),
(94, '2026-09-20', 14),
(99, '2026-09-20', 15),
(101, '2026-09-20', 16),
(102, '2026-09-20', 17),
(95, '2026-09-20', 19),
(107, '2026-09-20', 20),
(108, '2026-09-20', 23),
(109, '2026-09-20', 24),
(110, '2026-09-20', 25),
(111, '2026-09-20', 26),
(112, '2026-09-20', 29),
(103, '2026-09-20', 30),
(113, '2026-09-20', 38),
(114, '2026-09-20', 39),
(104, '2026-09-20', 40),
(105, '2026-09-20', 41),
(115, '2026-09-20', 42),
(116, '2026-09-20', 43),
(106, '2026-09-20', 44),
(117, '2026-09-20', 45),
(118, '2026-09-20', 46),
(119, '2026-09-20', 47),
(89, '2026-09-20', 49);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki`
--

CREATE TABLE `wyniki` (
  `id` int(11) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `tabela` varchar(50) NOT NULL,
  `box_id` varchar(50) NOT NULL,
  `player1_id` int(11) DEFAULT NULL,
  `player2_id` int(11) DEFAULT NULL,
  `player1_points` int(11) DEFAULT 0,
  `player2_points` int(11) DEFAULT 0,
  `status` enum('','trwajacy','zakonczony') NOT NULL DEFAULT '',
  `grupa` enum('podstawowa','zaawansowana') NOT NULL,
  `boisko` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wyniki`
--

INSERT INTO `wyniki` (`id`, `data`, `tabela`, `box_id`, `player1_id`, `player2_id`, `player1_points`, `player2_points`, `status`, `grupa`, `boisko`) VALUES
(1, '2026-09-13', 'tabela_16x', 'main_1', 3, NULL, 11, 0, 'zakonczony', 'podstawowa', 7),
(2, '2026-09-13', 'tabela_16x', 'main_3', 4, NULL, 11, 0, 'zakonczony', 'podstawowa', 7),
(3, '2026-09-13', 'tabela_16x', 'main_4', NULL, 2, 0, 11, 'zakonczony', 'podstawowa', 7),
(4, '2026-09-13', 'tabela_16x', 'main_5', 6, NULL, 11, 0, 'zakonczony', 'podstawowa', 7),
(5, '2026-09-13', 'tabela_16x', 'main_6', NULL, 5, 0, 11, 'zakonczony', 'podstawowa', 7),
(6, '2026-09-13', 'tabela_16x', 'main_7', 9, NULL, 11, 0, 'zakonczony', 'podstawowa', 7),
(7, '2026-09-13', 'tabela_16x', 'main_8', NULL, 1, 0, 11, 'zakonczony', 'podstawowa', 7),
(8, '2026-09-13', 'tabela_16x', 'main_2', 7, 8, 11, 6, 'zakonczony', 'podstawowa', 1),
(9, '2026-09-13', 'tabela_24x', 'main_2', 23, NULL, 11, 0, 'zakonczony', 'zaawansowana', 7),
(10, '2026-09-13', 'tabela_24x', 'main_7', NULL, 24, 0, 11, 'zakonczony', 'zaawansowana', 7),
(11, '2026-09-13', 'tabela_24x', 'main_1', 30, 17, 11, 3, 'zakonczony', 'zaawansowana', 2),
(12, '2026-09-13', 'tabela_24x', 'main_3', 13, 27, 11, 6, 'zakonczony', 'zaawansowana', 3),
(13, '2026-09-13', 'tabela_24x', 'main_4', 28, 29, 4, 11, 'zakonczony', 'zaawansowana', 4),
(14, '2026-09-13', 'tabela_24x', 'main_5', 25, 31, 11, 4, 'zakonczony', 'zaawansowana', 5),
(15, '2026-09-13', 'tabela_24x', 'main_6', 26, 21, 11, 5, 'zakonczony', 'zaawansowana', 6),
(16, '2026-09-13', 'tabela_16x', 'P1_8_1', 3, 7, 11, 0, 'zakonczony', 'podstawowa', 4),
(17, '2026-09-13', 'tabela_16x', 'P1_8_2', 4, 2, 0, 11, 'zakonczony', 'podstawowa', 5),
(18, '2026-09-13', 'tabela_16x', 'P1_8_3', 6, 5, 0, 11, 'zakonczony', 'podstawowa', 6),
(19, '2026-09-13', 'tabela_16x', 'P1_8_4', 9, 1, 0, 11, 'zakonczony', 'podstawowa', 1),
(20, '2026-09-13', 'tabela_24x', 'Pmain_1', 10, 30, 11, 0, 'zakonczony', 'zaawansowana', 2),
(21, '2026-09-13', 'tabela_24x', 'Pmain_2', 23, 22, 11, 0, 'zakonczony', 'zaawansowana', 3),
(22, '2026-09-13', 'tabela_16x', 'L1_8_1', NULL, 8, 0, 11, 'zakonczony', 'podstawowa', 7),
(23, '2026-09-13', 'tabela_16x', 'P1_4_1', 3, 2, 0, 11, 'zakonczony', 'podstawowa', 1),
(24, '2026-09-13', 'tabela_16x', 'P1_4_2', 5, 1, 11, 0, 'zakonczony', 'podstawowa', 4),
(25, '2026-09-13', 'tabela_16x', 'L1_8_c_1', 8, 9, 11, 0, 'zakonczony', 'podstawowa', 5),
(26, '2026-09-13', 'tabela_16x', 'L1_8_c_2', NULL, 6, 0, 11, 'zakonczony', 'podstawowa', 7),
(27, '2026-09-13', 'tabela_16x', 'L1_8_c_3', NULL, 4, 0, 11, 'zakonczony', 'podstawowa', 7),
(28, '2026-09-13', 'tabela_16x', 'L1_8_c_4', NULL, 7, 0, 11, 'zakonczony', 'podstawowa', 7),
(29, '2026-09-13', 'tabela_16x', '9_12_1', 9, NULL, 11, 0, 'zakonczony', 'podstawowa', 7),
(30, '2026-09-13', 'tabela_16x', '9_10', 9, NULL, 11, 0, 'zakonczony', 'podstawowa', 7),
(33, '2026-09-13', 'tabela_24x', 'Pmain_3', 16, 13, 11, 0, 'zakonczony', 'zaawansowana', 2),
(34, '2026-09-13', 'tabela_24x', 'Pmain_4', 29, 15, 0, 11, 'zakonczony', 'zaawansowana', 5),
(35, '2026-09-13', 'tabela_24x', 'Pmain_5', 14, 25, 11, 0, 'zakonczony', 'zaawansowana', 6),
(36, '2026-09-13', 'tabela_24x', 'Pmain_6', 26, 18, 11, 0, 'zakonczony', 'zaawansowana', 3),
(37, '2026-09-13', 'tabela_24x', 'Pmain_7', 19, 24, 11, 0, 'zakonczony', 'zaawansowana', 5),
(38, '2026-09-13', 'tabela_24x', 'main_8', 12, 20, 11, 0, 'zakonczony', 'zaawansowana', 6),
(39, '2026-09-13', 'tabela_24x', 'Pmain_8', 12, 11, 11, 0, 'zakonczony', 'zaawansowana', 6),
(40, '2026-09-13', 'tabela_24x', 'Lmain_2', NULL, 13, 0, 11, 'zakonczony', 'zaawansowana', 7),
(41, '2026-09-13', 'tabela_24x', 'Lmain_7', 18, NULL, 11, 0, 'zakonczony', 'zaawansowana', 7),
(42, '2026-09-13', 'tabela_24x', 'Lmain_1', 29, 17, 11, 0, 'zakonczony', 'zaawansowana', 2),
(43, '2026-09-13', 'tabela_24x', 'Lmain_3', 22, 27, 11, 0, 'zakonczony', 'zaawansowana', 5),
(44, '2026-09-13', 'tabela_24x', 'Lmain_4', 28, 30, 11, 0, 'zakonczony', 'zaawansowana', 6),
(45, '2026-09-13', 'tabela_24x', 'Lmain_5', 11, 31, 11, 0, 'zakonczony', 'zaawansowana', 3),
(46, '2026-09-13', 'tabela_24x', 'Lmain_6', 21, 24, 11, 0, 'zakonczony', 'zaawansowana', 2),
(47, '2026-09-13', 'tabela_24x', 'Lmain_8', 20, 25, 0, 11, 'zakonczony', 'zaawansowana', 5),
(48, '2026-09-13', 'tabela_24x', 'P1_8_1', 10, 23, 11, 0, 'zakonczony', 'zaawansowana', 2),
(49, '2026-09-13', 'tabela_24x', 'P1_8_2', 16, 15, 11, 0, 'zakonczony', 'zaawansowana', 5),
(50, '2026-09-13', 'tabela_24x', 'P1_8_3', 14, 26, 11, 0, 'zakonczony', 'zaawansowana', 6),
(51, '2026-09-13', 'tabela_24x', 'P1_8_4', 19, 12, 11, 0, 'zakonczony', 'zaawansowana', 3),
(52, '2026-09-13', 'tabela_24x', '17_24_1', 17, NULL, 11, 0, 'zakonczony', 'zaawansowana', 7),
(53, '2026-09-13', 'tabela_24x', '17_24_4', NULL, 20, 0, 11, 'zakonczony', 'zaawansowana', 7),
(54, '2026-09-13', 'tabela_24x', '17_24_2', 27, 30, 11, 0, 'zakonczony', 'zaawansowana', 2),
(55, '2026-09-13', 'tabela_24x', '17_24_3', 31, 24, 11, 0, 'zakonczony', 'zaawansowana', 5),
(56, '2026-09-13', 'tabela_24x', '21_24_1', NULL, 30, 0, 11, 'zakonczony', 'zaawansowana', 7),
(57, '2026-09-13', 'tabela_24x', '21_24_2', 24, NULL, 11, 0, 'zakonczony', 'zaawansowana', 7),
(60, '2026-09-13', 'tabela_16x', 'L1_4_2', 4, 7, 0, 11, 'zakonczony', 'podstawowa', 3),
(61, '2026-09-13', 'tabela_16x', 'L1_4_1', 8, 6, 0, 11, 'zakonczony', 'podstawowa', 1),
(62, '2026-09-13', 'tabela_16x', 'L1_4_c_1', 6, 3, 11, 0, 'zakonczony', 'podstawowa', 1),
(63, '2026-09-13', 'tabela_16x', 'L1_4_c_2', 7, 1, 11, 0, 'zakonczony', 'podstawowa', 2),
(64, '2026-09-13', 'tabela_16x', 'P1_2_1', 2, 5, 11, 0, 'zakonczony', 'podstawowa', 1),
(65, '2026-09-13', 'tabela_16x', 'L1_2_1', 6, 7, 11, 0, 'zakonczony', 'podstawowa', 2),
(66, '2026-09-13', 'tabela_16x', '7_8_1', 8, 4, 11, 0, 'zakonczony', 'podstawowa', 1),
(67, '2026-09-13', 'tabela_16x', '5_6_1', 3, 1, 11, 0, 'zakonczony', 'podstawowa', 2),
(68, '2026-09-13', 'tabela_16x', 'L1_2_c_1', 6, 5, 11, 0, 'zakonczony', 'podstawowa', 3),
(69, '2026-09-13', 'tabela_24x', 'L1_8_1', 29, 13, 11, 0, 'zakonczony', 'zaawansowana', 4),
(70, '2026-09-13', 'tabela_24x', 'L1_8_2', 22, 28, 11, 0, 'zakonczony', 'zaawansowana', 5),
(71, '2026-09-13', 'tabela_24x', 'L1_8_3', 11, 21, 11, 0, 'zakonczony', 'zaawansowana', 4),
(72, '2026-09-13', 'tabela_24x', 'L1_8_4', 18, 25, 11, 0, 'zakonczony', 'zaawansowana', 5),
(73, '2026-09-13', 'tabela_24x', 'P1_4_1', 10, 16, 11, 0, 'zakonczony', 'zaawansowana', 4),
(74, '2026-09-13', 'tabela_24x', 'P1_4_2', 14, 19, 11, 0, 'zakonczony', 'zaawansowana', 5),
(75, '2026-09-13', 'tabela_24x', 'L1_8_c_1', 29, 12, 11, 0, 'zakonczony', 'zaawansowana', 4),
(76, '2026-09-13', 'tabela_24x', 'L1_8_c_2', 22, 26, 11, 0, 'zakonczony', 'zaawansowana', 5),
(77, '2026-09-13', 'tabela_24x', 'L1_8_c_3', 11, 15, 11, 0, 'zakonczony', 'zaawansowana', 6),
(78, '2026-09-13', 'tabela_24x', 'L1_8_c_4', 18, 23, 11, 0, 'zakonczony', 'zaawansowana', 3),
(79, '2026-09-13', 'tabela_24x', 'L1_4_1', 29, 22, 11, 0, 'zakonczony', 'zaawansowana', 3),
(80, '2026-09-13', 'tabela_24x', 'L1_4_2', 11, 18, 11, 0, 'zakonczony', 'zaawansowana', 4),
(81, '2026-09-13', 'tabela_24x', 'P1_2_1', 10, 14, 11, 0, 'zakonczony', 'zaawansowana', 3),
(82, '2026-09-13', 'tabela_24x', 'L1_4_c_1', 29, 16, 11, 0, 'zakonczony', 'zaawansowana', 3),
(83, '2026-09-13', 'tabela_24x', 'L1_4_c_2', 11, 19, 0, 11, 'zakonczony', 'zaawansowana', 5),
(84, '2026-09-13', 'tabela_24x', 'L1_2_1', 29, 19, 11, 0, 'zakonczony', 'zaawansowana', 3),
(85, '2026-09-13', 'tabela_24x', '17_20_1', 17, 27, 11, 0, 'zakonczony', 'zaawansowana', 3),
(86, '2026-09-13', 'tabela_24x', '17_20_2', 31, 20, 11, 0, 'zakonczony', 'zaawansowana', 4),
(87, '2026-09-13', 'tabela_24x', '17_18', 17, 31, 11, 0, 'zakonczony', 'zaawansowana', 3),
(88, '2026-09-13', 'tabela_24x', '19_20', 27, 20, 11, 0, 'zakonczony', 'zaawansowana', 3),
(89, '2026-09-13', 'tabela_24x', '13_16_1', 13, 28, 11, 0, 'zakonczony', 'zaawansowana', 3),
(90, '2026-09-13', 'tabela_24x', '13_16_2', 21, 25, 11, 0, 'zakonczony', 'zaawansowana', 4),
(91, '2026-09-13', 'tabela_24x', '13_14', 13, 21, 11, 0, 'zakonczony', 'zaawansowana', 3),
(92, '2026-09-13', 'tabela_24x', '15_16', 28, 25, 11, 0, 'zakonczony', 'zaawansowana', 3),
(93, '2026-09-13', 'tabela_24x', '9_12_1', 12, 26, 11, 0, 'zakonczony', 'zaawansowana', 3),
(94, '2026-09-13', 'tabela_24x', '9_12_2', 15, 23, 0, 11, 'zakonczony', 'zaawansowana', 4),
(95, '2026-09-13', 'tabela_24x', '9_10', 12, 23, 11, 0, 'zakonczony', 'zaawansowana', 3),
(96, '2026-09-13', 'tabela_24x', '11_12', 26, 15, 11, 0, 'zakonczony', 'zaawansowana', 4),
(97, '2026-09-13', 'tabela_24x', '7_8_1', 22, 18, 11, 0, 'zakonczony', 'zaawansowana', 3),
(98, '2026-09-13', 'tabela_24x', '5_6_1', 16, 11, 11, 0, 'zakonczony', 'zaawansowana', 4),
(99, '2026-09-13', 'tabela_24x', '21_22', 30, 24, 0, 11, 'zakonczony', 'zaawansowana', 1),
(100, '2026-09-13', 'tabela_24x', 'L1_2_c_1', 29, 14, 11, 0, 'zakonczony', 'zaawansowana', 2),
(101, '2026-09-13', 'tabela_24x', '1_2_1', 10, 29, 11, 0, 'zakonczony', 'zaawansowana', 3),
(102, '2026-09-13', 'tabela_16x', '1_2_1', 2, 6, 11, 0, 'zakonczony', 'podstawowa', 1),
(103, '2026-09-14', 'tabela_32x', 'main_1', 10, 45, 11, 0, 'zakonczony', 'zaawansowana', 1),
(104, '2026-09-14', 'tabela_32x', 'main_2', 21, 20, 11, 0, 'zakonczony', 'zaawansowana', 2),
(105, '2026-09-14', 'tabela_32x', 'main_3', 24, 39, 11, 0, 'zakonczony', 'zaawansowana', 3),
(106, '2026-09-14', 'tabela_32x', 'main_4', 41, 23, 11, 0, 'zakonczony', 'zaawansowana', 4),
(107, '2026-09-14', 'tabela_32x', 'main_5', 16, 46, 11, 0, 'zakonczony', 'zaawansowana', 5),
(108, '2026-09-14', 'tabela_32x', 'main_6', 17, 28, 11, 0, 'zakonczony', 'zaawansowana', 6),
(109, '2026-09-14', 'tabela_32x', 'main_7', 31, 5, 11, 0, 'zakonczony', 'zaawansowana', 1),
(110, '2026-09-14', 'tabela_32x', 'main_8', 47, 15, 11, 0, 'zakonczony', 'zaawansowana', 2),
(111, '2026-09-14', 'tabela_32x', 'main_9', 14, 40, 11, 0, 'zakonczony', 'zaawansowana', 3),
(112, '2026-09-14', 'tabela_32x', 'main_10', 30, 12, 11, 0, 'zakonczony', 'zaawansowana', 4),
(113, '2026-09-14', 'tabela_32x', 'main_11', 27, 29, 11, 0, 'zakonczony', 'zaawansowana', 5),
(114, '2026-09-14', 'tabela_32x', 'main_12', 44, 18, 11, 0, 'zakonczony', 'zaawansowana', 6),
(115, '2026-09-14', 'tabela_32x', 'main_13', 22, 43, 11, 0, 'zakonczony', 'zaawansowana', 1),
(116, '2026-09-14', 'tabela_32x', 'main_15', 13, 25, 11, 0, 'zakonczony', 'zaawansowana', 5),
(117, '2026-09-14', 'tabela_32x', 'main_14', 38, 26, 11, 0, 'zakonczony', 'zaawansowana', 4),
(118, '2026-09-14', 'tabela_32x', 'main_16', 42, 11, 11, 0, 'zakonczony', 'zaawansowana', 3),
(119, '2026-09-14', 'tabela_32x', 'P1_16_1', 10, 21, 11, 0, 'zakonczony', 'zaawansowana', 1),
(120, '2026-09-14', 'tabela_32x', 'P1_16_2', 24, 41, 11, 0, 'zakonczony', 'zaawansowana', 4),
(121, '2026-09-14', 'tabela_32x', 'P1_16_3', 16, 17, 11, 0, 'zakonczony', 'zaawansowana', 5),
(122, '2026-09-14', 'tabela_32x', 'P1_16_4', 31, 47, 11, 0, 'zakonczony', 'zaawansowana', 2),
(123, '2026-09-14', 'tabela_32x', 'P1_16_5', 14, 30, 11, 0, 'zakonczony', 'zaawansowana', 6),
(124, '2026-09-14', 'tabela_32x', 'P1_16_6', 27, 44, 11, 0, 'zakonczony', 'zaawansowana', 3),
(125, '2026-09-14', 'tabela_32x', 'P1_16_7', 22, 38, 11, 0, 'zakonczony', 'zaawansowana', 1),
(126, '2026-09-14', 'tabela_32x', 'P1_16_8', 13, 42, 11, 0, 'zakonczony', 'zaawansowana', 2),
(127, '2026-09-14', 'tabela_32x', 'P1_8_1', 10, 24, 11, 0, 'zakonczony', 'zaawansowana', 1),
(128, '2026-09-14', 'tabela_32x', 'P1_8_2', 16, 31, 11, 0, 'zakonczony', 'zaawansowana', 2),
(129, '2026-09-14', 'tabela_32x', 'P1_8_3', 14, 27, 11, 0, 'zakonczony', 'zaawansowana', 3),
(130, '2026-09-14', 'tabela_32x', 'P1_8_4', 22, 13, 0, 11, 'zakonczony', 'zaawansowana', 4),
(131, '2026-09-14', 'tabela_32x', 'P1_4_1', 10, 16, 11, 0, 'zakonczony', 'zaawansowana', 1),
(132, '2026-09-14', 'tabela_32x', 'P1_4_2', 14, 13, 0, 11, 'zakonczony', 'zaawansowana', 4),
(133, '2026-09-14', 'tabela_32x', 'P1_2_1', 10, 13, 0, 11, 'zakonczony', 'zaawansowana', 1),
(134, '2026-09-14', 'tabela_32x', 'L1_16_1', 45, 20, 11, 0, 'zakonczony', 'zaawansowana', 1),
(135, '2026-09-14', 'tabela_32x', 'L1_16_2', 39, 23, 11, 0, 'zakonczony', 'zaawansowana', 1),
(136, '2026-09-14', 'tabela_32x', 'L1_16_3', 46, 28, 11, 0, 'zakonczony', 'zaawansowana', 1),
(137, '2026-09-14', 'tabela_32x', 'L1_16_4', 5, 15, 11, 0, 'zakonczony', 'zaawansowana', 2),
(138, '2026-09-14', 'tabela_32x', 'L1_16_5', 40, 12, 11, 0, 'zakonczony', 'zaawansowana', 4),
(139, '2026-09-14', 'tabela_32x', 'L1_16_6', 29, 18, 11, 0, 'zakonczony', 'zaawansowana', 5),
(140, '2026-09-14', 'tabela_32x', 'L1_16_7', 43, 26, 11, 0, 'zakonczony', 'zaawansowana', 6),
(141, '2026-09-14', 'tabela_32x', 'L1_16_8', 25, 11, 11, 0, 'zakonczony', 'zaawansowana', 3),
(142, '2026-09-14', 'tabela_32x', '25_32_1', 20, 23, 11, 0, 'zakonczony', 'zaawansowana', 1),
(143, '2026-09-14', 'tabela_32x', '25_32_2', 28, 15, 11, 0, 'zakonczony', 'zaawansowana', 2),
(144, '2026-09-14', 'tabela_32x', '25_32_3', 12, 18, 11, 0, 'zakonczony', 'zaawansowana', 4),
(145, '2026-09-14', 'tabela_32x', '25_32_4', 26, 11, 0, 11, 'zakonczony', 'zaawansowana', 5),
(146, '2026-09-14', 'tabela_32x', '29_32_1', 23, 15, 11, 0, 'zakonczony', 'zaawansowana', 1),
(147, '2026-09-14', 'tabela_32x', '29_32_2', 18, 26, 11, 0, 'zakonczony', 'zaawansowana', 2),
(148, '2026-09-14', 'tabela_32x', '25_28_1', 20, 28, 11, 0, 'zakonczony', 'zaawansowana', 5),
(149, '2026-09-14', 'tabela_32x', '25_28_2', 12, 11, 11, 0, 'zakonczony', 'zaawansowana', 4),
(150, '2026-09-14', 'tabela_32x', '31_32', 15, 26, 11, 0, 'zakonczony', 'zaawansowana', 2),
(151, '2026-09-14', 'tabela_32x', '29_30', 23, 18, 11, 0, 'zakonczony', 'zaawansowana', 2),
(152, '2026-09-14', 'tabela_32x', '27_28', 28, 11, 11, 0, 'zakonczony', 'zaawansowana', 1),
(153, '2026-09-14', 'tabela_32x', '25_26', 20, 12, 11, 0, 'zakonczony', 'zaawansowana', 2),
(154, '2026-09-14', 'tabela_32x', 'L1_16_c_1', 45, 42, 11, 0, 'zakonczony', 'zaawansowana', 1),
(155, '2026-09-14', 'tabela_32x', 'L1_16_c_2', 39, 38, 11, 0, 'zakonczony', 'zaawansowana', 4),
(156, '2026-09-14', 'tabela_32x', 'L1_16_c_3', 46, 44, 11, 0, 'zakonczony', 'zaawansowana', 2),
(157, '2026-09-14', 'tabela_32x', 'L1_16_c_4', 5, 30, 11, 0, 'zakonczony', 'zaawansowana', 5),
(158, '2026-09-14', 'tabela_32x', 'L1_16_c_5', 40, 47, 11, 0, 'zakonczony', 'zaawansowana', 3),
(159, '2026-09-14', 'tabela_32x', 'L1_16_c_6', 29, 17, 11, 0, 'zakonczony', 'zaawansowana', 6),
(160, '2026-09-14', 'tabela_32x', 'L1_16_c_7', 43, 41, 11, 0, 'zakonczony', 'zaawansowana', 2),
(161, '2026-09-14', 'tabela_32x', 'L1_16_c_8', 25, 21, 11, 0, 'zakonczony', 'zaawansowana', 5),
(162, '2026-09-14', 'tabela_32x', '17_24_1', 42, 38, 11, 0, 'zakonczony', 'zaawansowana', 2),
(163, '2026-09-14', 'tabela_32x', '17_24_2', 44, 30, 11, 0, 'zakonczony', 'zaawansowana', 5),
(164, '2026-09-14', 'tabela_32x', '17_24_3', 47, 17, 11, 0, 'zakonczony', 'zaawansowana', 4),
(165, '2026-09-14', 'tabela_32x', '17_24_4', 41, 21, 11, 0, 'zakonczony', 'zaawansowana', 6),
(166, '2026-09-14', 'tabela_32x', '21_24_1', 38, 30, 11, 0, 'zakonczony', 'zaawansowana', 1),
(167, '2026-09-14', 'tabela_32x', '21_24_2', 17, 21, 11, 0, 'zakonczony', 'zaawansowana', 4),
(168, '2026-09-14', 'tabela_32x', '23_24', 30, 21, 11, 0, 'zakonczony', 'zaawansowana', 3),
(169, '2026-09-14', 'tabela_32x', '21_22', 38, 17, 11, 0, 'zakonczony', 'zaawansowana', 2),
(170, '2026-09-14', 'tabela_32x', '17_20_1', 42, 44, 11, 0, 'zakonczony', 'zaawansowana', 1),
(171, '2026-09-14', 'tabela_32x', '17_20_2', 47, 41, 11, 0, 'zakonczony', 'zaawansowana', 4),
(172, '2026-09-14', 'tabela_32x', '19_20', 44, 41, 11, 0, 'zakonczony', 'zaawansowana', 6),
(173, '2026-09-14', 'tabela_32x', '17_18', 42, 47, 11, 0, 'zakonczony', 'zaawansowana', 3),
(174, '2026-09-14', 'tabela_32x', 'L1_8_1', 45, 39, 0, 11, 'zakonczony', 'zaawansowana', 1),
(175, '2026-09-14', 'tabela_32x', 'L1_8_2', 46, 5, 0, 11, 'zakonczony', 'zaawansowana', 1),
(176, '2026-09-14', 'tabela_32x', 'L1_8_3', 40, 29, 11, 0, 'zakonczony', 'zaawansowana', 2),
(177, '2026-09-14', 'tabela_32x', 'L1_8_4', 43, 25, 11, 0, 'zakonczony', 'zaawansowana', 2),
(178, '2026-09-14', 'tabela_32x', '13_16_1', 45, 46, 11, 0, 'zakonczony', 'zaawansowana', 2),
(179, '2026-09-14', 'tabela_32x', '13_16_2', 29, 25, 11, 0, 'zakonczony', 'zaawansowana', 5),
(180, '2026-09-14', 'tabela_32x', '15_16', 46, 25, 11, 0, 'zakonczony', 'zaawansowana', 1),
(181, '2026-09-14', 'tabela_32x', '13_14', 45, 29, 11, 0, 'zakonczony', 'zaawansowana', 2),
(182, '2026-09-14', 'tabela_32x', 'L1_8_c_1', 39, 31, 11, 0, 'zakonczony', 'zaawansowana', 2),
(183, '2026-09-14', 'tabela_32x', 'L1_8_c_2', 5, 24, 11, 0, 'zakonczony', 'zaawansowana', 5),
(184, '2026-09-14', 'tabela_32x', '9_12_1', 31, 24, 0, 11, 'zakonczony', 'zaawansowana', 2),
(185, '2026-09-14', 'tabela_32x', 'L1_8_c_3', 40, 22, 11, 0, 'zakonczony', 'zaawansowana', 1),
(186, '2026-09-14', 'tabela_32x', 'L1_8_c_4', 43, 27, 11, 0, 'zakonczony', 'zaawansowana', 4),
(187, '2026-09-14', 'tabela_32x', '9_12_2', 22, 27, 11, 0, 'zakonczony', 'zaawansowana', 1),
(188, '2026-09-14', 'tabela_32x', '11_12', 31, 27, 11, 0, 'zakonczony', 'zaawansowana', 1),
(189, '2026-09-14', 'tabela_32x', '9_10', 24, 22, 11, 0, 'zakonczony', 'zaawansowana', 3),
(190, '2026-09-14', 'tabela_32x', 'L1_4_1', 39, 5, 0, 11, 'zakonczony', 'zaawansowana', 1),
(191, '2026-09-14', 'tabela_32x', 'L1_4_2', 40, 43, 0, 11, 'zakonczony', 'zaawansowana', 3),
(192, '2026-09-14', 'tabela_32x', '7_8_1', 39, 40, 11, 0, 'zakonczony', 'zaawansowana', 3),
(193, '2026-09-14', 'tabela_32x', 'L1_4_c_1', 5, 14, 11, 0, 'zakonczony', 'zaawansowana', 1),
(194, '2026-09-14', 'tabela_32x', 'L1_4_c_2', 43, 16, 0, 11, 'zakonczony', 'zaawansowana', 3),
(195, '2026-09-14', 'tabela_32x', 'L1_2_1', 5, 16, 11, 0, 'zakonczony', 'zaawansowana', 1),
(196, '2026-09-14', 'tabela_32x', '5_6_1', 14, 43, 0, 11, 'zakonczony', 'zaawansowana', 2),
(197, '2026-09-14', 'tabela_32x', 'L1_2_c_1', 5, 10, 0, 11, 'zakonczony', 'zaawansowana', 2),
(198, '2026-09-14', 'tabela_32x', '1_2_1', 13, 10, 11, 0, 'zakonczony', 'zaawansowana', 3),
(199, '2026-09-14', 'tabela_16x', 'main_1', 2, NULL, 11, 0, 'zakonczony', 'podstawowa', 7),
(200, '2026-09-14', 'tabela_16x', 'main_2', 8, 3, 11, 0, 'zakonczony', 'podstawowa', 1),
(201, '2026-09-14', 'tabela_16x', 'main_3', 9, 35, 11, 0, 'zakonczony', 'podstawowa', 2),
(202, '2026-09-14', 'tabela_16x', 'main_4', 36, 7, 11, 0, 'zakonczony', 'podstawowa', 2),
(206, '2026-09-14', 'tabela_16x', 'main_8', 37, 1, 11, 0, 'zakonczony', 'podstawowa', 4),
(208, '2026-09-14', 'tabela_16x', 'main_5', 6, 34, 0, 11, 'zakonczony', 'podstawowa', 2),
(209, '2026-09-14', 'tabela_16x', 'main_6', 33, 19, 0, 11, 'zakonczony', 'podstawowa', 2),
(212, '2026-09-14', 'tabela_16x', 'main_7', 4, 32, 11, 0, 'zakonczony', 'podstawowa', 3),
(213, '2026-09-14', 'tabela_16x', 'P1_8_1', 2, 8, 11, 0, 'zakonczony', 'podstawowa', 1),
(214, '2026-09-14', 'tabela_16x', 'P1_8_2', 9, 36, 11, 0, 'zakonczony', 'podstawowa', 2),
(215, '2026-09-14', 'tabela_16x', 'P1_8_3', 34, 19, 11, 0, 'zakonczony', 'podstawowa', 3),
(216, '2026-09-14', 'tabela_16x', 'P1_8_4', 4, 37, 11, 0, 'zakonczony', 'podstawowa', 2),
(217, '2026-09-14', 'tabela_16x', 'P1_4_1', 2, 9, 11, 0, 'zakonczony', 'podstawowa', 2),
(218, '2026-09-14', 'tabela_16x', 'P1_4_2', 34, 4, 11, 0, 'zakonczony', 'podstawowa', 5),
(219, '2026-09-14', 'tabela_16x', 'P1_2_1', 2, 34, 11, 0, 'zakonczony', 'podstawowa', 3),
(220, '2026-09-14', 'tabela_16x', 'L1_8_1', NULL, 3, 0, 11, 'zakonczony', 'podstawowa', 7),
(221, '2026-09-14', 'tabela_16x', 'L1_8_2', 35, 7, 11, 0, 'zakonczony', 'podstawowa', 1),
(222, '2026-09-14', 'tabela_16x', 'L1_8_3', 6, 33, 11, 0, 'zakonczony', 'podstawowa', 2),
(223, '2026-09-14', 'tabela_16x', 'L1_8_4', 32, 1, 11, 0, 'zakonczony', 'podstawowa', 3),
(224, '2026-09-14', 'tabela_16x', 'L1_8_c_1', 3, 37, 11, 0, 'zakonczony', 'podstawowa', 1),
(225, '2026-09-14', 'tabela_16x', 'L1_8_c_2', 35, 19, 11, 0, 'zakonczony', 'podstawowa', 5),
(226, '2026-09-14', 'tabela_16x', 'L1_8_c_3', 6, 36, 11, 0, 'zakonczony', 'podstawowa', 2),
(227, '2026-09-14', 'tabela_16x', 'L1_8_c_4', 32, 8, 11, 0, 'zakonczony', 'podstawowa', 6),
(228, '2026-09-14', 'tabela_16x', '13_16_1', NULL, 7, 0, 11, 'zakonczony', 'podstawowa', 7),
(229, '2026-09-14', 'tabela_16x', '13_16_2', 33, 1, 11, 0, 'zakonczony', 'podstawowa', 2),
(230, '2026-09-14', 'tabela_16x', '15_16', NULL, 1, 0, 11, 'zakonczony', 'podstawowa', 7),
(231, '2026-09-14', 'tabela_16x', '13_14', 7, 33, 11, 0, 'zakonczony', 'podstawowa', 2),
(232, '2026-09-14', 'tabela_16x', '9_12_1', 37, 19, 0, 11, 'zakonczony', 'podstawowa', 3),
(233, '2026-09-14', 'tabela_16x', '9_12_2', 36, 8, 11, 0, 'zakonczony', 'podstawowa', 3),
(234, '2026-09-14', 'tabela_16x', '11_12', 37, 8, 11, 0, 'zakonczony', 'podstawowa', 3),
(235, '2026-09-14', 'tabela_16x', '9_10', 19, 36, 11, 0, 'zakonczony', 'podstawowa', 3),
(236, '2026-09-14', 'tabela_16x', 'L1_4_1', 3, 35, 11, 0, 'zakonczony', 'podstawowa', 3),
(237, '2026-09-14', 'tabela_16x', 'L1_4_2', 6, 32, 11, 0, 'zakonczony', 'podstawowa', 6),
(238, '2026-09-14', 'tabela_16x', '7_8_1', 35, 32, 11, 0, 'zakonczony', 'podstawowa', 1),
(239, '2026-09-14', 'tabela_16x', 'L1_4_c_1', 3, 9, 11, 0, 'zakonczony', 'podstawowa', 2),
(240, '2026-09-14', 'tabela_16x', 'L1_4_c_2', 6, 4, 11, 0, 'zakonczony', 'podstawowa', 3),
(241, '2026-09-14', 'tabela_16x', 'L1_2_1', 3, 6, 11, 0, 'zakonczony', 'podstawowa', 3),
(242, '2026-09-14', 'tabela_16x', 'L1_2_c_1', 3, 34, 0, 11, 'zakonczony', 'podstawowa', 3),
(243, '2026-09-14', 'tabela_16x', '5_6_1', 9, 4, 0, 11, 'zakonczony', 'podstawowa', 2),
(244, '2026-09-14', 'tabela_16x', '1_2_1', 2, 34, 11, 0, 'zakonczony', 'podstawowa', 3),
(245, '2026-09-20', 'tabela_8x', 'main_1', 49, 9, 3, 11, 'zakonczony', 'podstawowa', 1),
(247, '2026-09-20', 'tabela_8x', 'main_3', 7, 3, 11, 2, 'zakonczony', 'podstawowa', 2),
(248, '2026-09-20', 'tabela_8x', 'main_4', 8, 1, 11, 3, 'zakonczony', 'podstawowa', 5),
(249, '2026-09-20', 'tabela_24x', 'main_1', 38, 29, 11, 0, 'zakonczony', 'zaawansowana', 3),
(250, '2026-09-20', 'tabela_24x', 'main_2', 41, 11, 11, 0, 'zakonczony', 'zaawansowana', 6),
(251, '2026-09-20', 'tabela_8x', 'main_2', 19, 14, 3, 11, 'zakonczony', 'podstawowa', 4),
(252, '2026-09-20', 'tabela_8x', 'P1_4_1', 9, 14, 11, 1, 'zakonczony', 'podstawowa', 4),
(253, '2026-09-20', 'tabela_8x', 'P1_4_2', 7, 8, 11, 5, 'zakonczony', 'podstawowa', 1),
(254, '2026-09-20', 'tabela_8x', 'L1_4_1', 49, 19, 11, 0, 'zakonczony', 'podstawowa', 1),
(255, '2026-09-20', 'tabela_8x', 'L1_4_2', 3, 1, 11, 0, 'zakonczony', 'podstawowa', 4),
(256, '2026-09-20', 'tabela_8x', '7_8_1', 19, 1, 11, 0, 'zakonczony', 'podstawowa', 2),
(257, '2026-09-20', 'tabela_8x', 'L1_4_c_1', 49, 8, 0, 11, 'zakonczony', 'podstawowa', 2),
(258, '2026-09-20', 'tabela_8x', 'L1_4_c_2', 3, 14, 0, 11, 'zakonczony', 'podstawowa', 5),
(259, '2026-09-20', 'tabela_8x', 'P1_2_1', 9, 7, 11, 0, 'zakonczony', 'podstawowa', 2),
(260, '2026-09-20', 'tabela_8x', 'L1_2_1', 8, 14, 11, 0, 'zakonczony', 'podstawowa', 2),
(261, '2026-09-20', 'tabela_8x', 'L1_2_c_1', 8, 7, 0, 11, 'zakonczony', 'podstawowa', 2),
(262, '2026-09-20', 'tabela_8x', '5_6_1', 49, 3, 11, 0, 'zakonczony', 'podstawowa', 2),
(263, '2026-09-20', 'tabela_8x', '1_2_1', 9, 7, 11, 0, 'zakonczony', 'podstawowa', 2),
(264, '2026-09-20', 'tabela_24x', 'main_3', 45, 23, 11, 0, 'zakonczony', 'zaawansowana', 4),
(265, '2026-09-20', 'tabela_24x', 'main_4', 24, 43, 11, 0, 'zakonczony', 'zaawansowana', 5),
(266, '2026-09-20', 'tabela_24x', 'main_5', 42, 25, 11, 0, 'zakonczony', 'zaawansowana', 6),
(267, '2026-09-20', 'tabela_24x', 'main_6', 20, 46, 11, 0, 'zakonczony', 'zaawansowana', 5),
(268, '2026-09-20', 'tabela_24x', 'main_7', 47, 44, 11, 0, 'zakonczony', 'zaawansowana', 6),
(269, '2026-09-20', 'tabela_24x', 'main_8', 26, 39, 0, 11, 'zakonczony', 'zaawansowana', 3),
(270, '2026-09-20', 'tabela_24x', 'Pmain_1', 6, 38, 11, 0, 'zakonczony', 'zaawansowana', 1),
(271, '2026-09-20', 'tabela_24x', 'Pmain_2', 41, 40, 11, 0, 'zakonczony', 'zaawansowana', 4),
(272, '2026-09-20', 'tabela_24x', 'Pmain_3', 16, 45, 11, 0, 'zakonczony', 'zaawansowana', 5),
(273, '2026-09-20', 'tabela_24x', 'Pmain_4', 24, 12, 11, 0, 'zakonczony', 'zaawansowana', 2),
(274, '2026-09-20', 'tabela_24x', 'Pmain_5', 15, 42, 11, 0, 'zakonczony', 'zaawansowana', 6),
(275, '2026-09-20', 'tabela_24x', 'Pmain_6', 20, 17, 11, 0, 'zakonczony', 'zaawansowana', 3),
(276, '2026-09-20', 'tabela_24x', 'Pmain_7', 30, 47, 11, 0, 'zakonczony', 'zaawansowana', 3),
(277, '2026-09-20', 'tabela_24x', 'Pmain_8', 39, 5, 11, 0, 'zakonczony', 'zaawansowana', 6),
(278, '2026-09-20', 'tabela_24x', 'Lmain_5', 5, 25, 11, 0, 'zakonczony', 'zaawansowana', 3),
(279, '2026-09-20', 'tabela_24x', 'P1_8_1', 6, 41, 11, 0, 'zakonczony', 'zaawansowana', 2),
(280, '2026-09-20', 'tabela_24x', 'P1_8_2', 16, 24, 11, 0, 'zakonczony', 'zaawansowana', 4),
(281, '2026-09-20', 'tabela_24x', 'P1_8_3', 15, 20, 11, 0, 'zakonczony', 'zaawansowana', 1),
(282, '2026-09-20', 'tabela_24x', 'P1_8_4', 30, 39, 0, 11, 'zakonczony', 'zaawansowana', 3),
(283, '2026-09-20', 'tabela_24x', 'P1_4_1', 6, 16, 11, 0, 'zakonczony', 'zaawansowana', 3),
(284, '2026-09-20', 'tabela_24x', 'P1_4_2', 15, 39, 0, 11, 'zakonczony', 'zaawansowana', 6),
(285, '2026-09-20', 'tabela_24x', 'P1_2_1', 6, 39, 11, 0, 'zakonczony', 'zaawansowana', 2),
(286, '2026-09-20', 'tabela_24x', 'Lmain_1', 12, 29, 11, 0, 'zakonczony', 'zaawansowana', 1),
(287, '2026-09-20', 'tabela_24x', 'Lmain_2', 11, 45, 11, 0, 'zakonczony', 'zaawansowana', 5),
(288, '2026-09-20', 'tabela_24x', 'Lmain_3', 40, 23, 11, 0, 'zakonczony', 'zaawansowana', 4),
(289, '2026-09-20', 'tabela_24x', 'Lmain_4', 43, 38, 11, 0, 'zakonczony', 'zaawansowana', 6),
(290, '2026-09-20', 'tabela_24x', 'Lmain_6', 46, 47, 11, 0, 'zakonczony', 'zaawansowana', 2),
(291, '2026-09-20', 'tabela_24x', 'Lmain_7', 17, 44, 11, 0, 'zakonczony', 'zaawansowana', 3),
(292, '2026-09-20', 'tabela_24x', 'Lmain_8', 26, 42, 11, 0, 'zakonczony', 'zaawansowana', 3),
(293, '2026-09-20', 'tabela_24x', 'L1_8_1', 12, 11, 11, 0, 'zakonczony', 'zaawansowana', 2),
(294, '2026-09-20', 'tabela_24x', 'L1_8_2', 40, 43, 11, 0, 'zakonczony', 'zaawansowana', 1),
(295, '2026-09-20', 'tabela_24x', 'L1_8_3', 5, 46, 11, 0, 'zakonczony', 'zaawansowana', 5),
(296, '2026-09-20', 'tabela_24x', 'L1_8_4', 17, 26, 11, 0, 'zakonczony', 'zaawansowana', 6),
(297, '2026-09-20', 'tabela_24x', 'L1_8_c_3', 5, 24, 11, 0, 'zakonczony', 'zaawansowana', 2),
(298, '2026-09-20', 'tabela_24x', 'L1_8_c_4', 17, 41, 11, 0, 'zakonczony', 'zaawansowana', 3),
(299, '2026-09-20', 'tabela_24x', 'L1_8_c_2', 40, 20, 11, 0, 'zakonczony', 'zaawansowana', 5),
(300, '2026-09-20', 'tabela_24x', 'L1_8_c_1', 12, 30, 11, 0, 'zakonczony', 'zaawansowana', 4),
(301, '2026-09-20', 'tabela_24x', 'L1_4_2', 5, 17, 11, 0, 'zakonczony', 'zaawansowana', 2),
(302, '2026-09-20', 'tabela_24x', 'L1_4_1', 12, 40, 11, 0, 'zakonczony', 'zaawansowana', 3),
(303, '2026-09-20', 'tabela_24x', 'L1_4_c_2', 5, 15, 11, 0, 'zakonczony', 'zaawansowana', 1),
(304, '2026-09-20', 'tabela_24x', 'L1_4_c_1', 12, 16, 0, 11, 'zakonczony', 'zaawansowana', 3),
(305, '2026-09-20', 'tabela_24x', 'L1_2_1', 16, 5, 0, 11, 'zakonczony', 'zaawansowana', 2),
(306, '2026-09-20', 'tabela_24x', 'L1_2_c_1', 5, 39, 11, 0, 'zakonczony', 'zaawansowana', 3),
(307, '2026-09-20', 'tabela_24x', '5_6_1', 12, 15, 0, 11, 'zakonczony', 'zaawansowana', 3),
(308, '2026-09-20', 'tabela_24x', '7_8_1', 40, 17, 11, 0, 'zakonczony', 'zaawansowana', 2),
(309, '2026-09-20', 'tabela_24x', '9_12_2', 24, 41, 0, 11, 'zakonczony', 'zaawansowana', 2),
(310, '2026-09-20', 'tabela_24x', '9_12_1', 30, 20, 11, 0, 'zakonczony', 'zaawansowana', 5),
(311, '2026-09-20', 'tabela_24x', '11_12', 20, 24, 11, 0, 'zakonczony', 'zaawansowana', 5),
(312, '2026-09-20', 'tabela_24x', '9_10', 30, 41, 11, 0, 'zakonczony', 'zaawansowana', 2),
(313, '2026-09-20', 'tabela_24x', '13_16_2', 46, 26, 11, 0, 'zakonczony', 'zaawansowana', 1),
(314, '2026-09-20', 'tabela_24x', '13_16_1', 11, 43, 11, 0, 'zakonczony', 'zaawansowana', 4),
(315, '2026-09-20', 'tabela_24x', '13_14', 11, 46, 11, 0, 'zakonczony', 'zaawansowana', 3),
(316, '2026-09-20', 'tabela_24x', '15_16', 43, 26, 11, 0, 'zakonczony', 'zaawansowana', 5),
(317, '2026-09-20', 'tabela_24x', '17_24_4', 44, 42, 11, 0, 'zakonczony', 'zaawansowana', 5),
(318, '2026-09-20', 'tabela_24x', '17_24_3', 25, 47, 11, 0, 'zakonczony', 'zaawansowana', 6),
(319, '2026-09-20', 'tabela_24x', '17_24_2', 23, 38, 11, 0, 'zakonczony', 'zaawansowana', 2),
(320, '2026-09-20', 'tabela_24x', '17_24_1', 29, 45, 11, 0, 'zakonczony', 'zaawansowana', 4),
(321, '2026-09-20', 'tabela_24x', '21_24_1', 45, 38, 11, 0, 'zakonczony', 'zaawansowana', 5),
(322, '2026-09-20', 'tabela_24x', '21_24_2', 47, 42, 11, 0, 'zakonczony', 'zaawansowana', 6),
(323, '2026-09-20', 'tabela_24x', '17_20_1', 29, 23, 11, 0, 'zakonczony', 'zaawansowana', 2),
(324, '2026-09-20', 'tabela_24x', '17_20_2', 25, 44, 0, 11, 'zakonczony', 'zaawansowana', 3),
(325, '2026-09-20', 'tabela_24x', '23_24', 38, 42, 11, 0, 'zakonczony', 'zaawansowana', 5),
(326, '2026-09-20', 'tabela_24x', '21_22', 45, 47, 11, 0, 'zakonczony', 'zaawansowana', 6),
(327, '2026-09-20', 'tabela_24x', '19_20', 23, 25, 11, 0, 'zakonczony', 'zaawansowana', 5),
(328, '2026-09-20', 'tabela_24x', '17_18', 29, 44, 0, 11, 'zakonczony', 'zaawansowana', 2),
(329, '2026-09-20', 'tabela_24x', '1_2_1', 6, 5, 11, 0, 'zakonczony', 'zaawansowana', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawodnik`
--

CREATE TABLE `zawodnik` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `grupa` varchar(20) NOT NULL,
  `group_change_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zawodnik`
--

INSERT INTO `zawodnik` (`id`, `fname`, `lname`, `grupa`, `group_change_date`) VALUES
(1, 'Adam', 'Marek', 'podstawowa', NULL),
(2, 'Jan', 'Kowalski', 'podstawowa', NULL),
(3, 'Maciek', 'Sołtys', 'podstawowa', NULL),
(4, 'krystian', 'Wójcik', 'podstawowa', NULL),
(5, 'Stachu', 'Jones', 'zaawansowana', '2026-09-14'),
(6, 'Jan', 'Giblartar', 'zaawansowana', '2026-09-20'),
(7, 'Edek', 'Polska', 'podstawowa', NULL),
(8, 'Wojciech', 'Duży', 'podstawowa', NULL),
(9, 'Wacek', 'Placek', 'podstawowa', NULL),
(10, 'Adam', 'Nowak', 'zaawansowana', NULL),
(11, 'Kamil', 'Kowalski', 'zaawansowana', NULL),
(12, 'Mateusz', 'Wiśniewski', 'zaawansowana', NULL),
(13, 'Jakub', 'Wójcik', 'zaawansowana', NULL),
(14, 'Michał', 'Kowalczyk', 'podstawowa', '2026-09-20'),
(15, 'Paweł', 'Kamiński', 'zaawansowana', NULL),
(16, 'Tomasz', 'Lewandowski', 'zaawansowana', NULL),
(17, 'Piotr', 'Zieliński', 'zaawansowana', NULL),
(18, 'Damian', 'Szymański', 'zaawansowana', NULL),
(19, 'Łukasz', 'Woźniak', 'podstawowa', '2026-09-14'),
(20, 'Marcin', 'Dąbrowski', 'zaawansowana', NULL),
(21, 'Patryk', 'Kozłowski', 'zaawansowana', NULL),
(22, 'Bartosz', 'Jankowski', 'zaawansowana', NULL),
(23, 'Rafał', 'Mazur', 'zaawansowana', NULL),
(24, 'Sebastian', 'Krawczyk', 'zaawansowana', NULL),
(25, 'Grzegorz', 'Piotrowski', 'zaawansowana', NULL),
(26, 'Dominik', 'Grabowski', 'zaawansowana', NULL),
(27, 'Krzysztof', 'Pawłowski', 'zaawansowana', NULL),
(28, 'Maciej', 'Michalski', 'zaawansowana', NULL),
(29, 'Artur', 'Król', 'zaawansowana', NULL),
(30, 'Szymon', 'Wieczorek', 'zaawansowana', NULL),
(31, 'Dawid', 'Jabłoński', 'zaawansowana', NULL),
(32, 'Marek', 'Nowicki', 'podstawowa', NULL),
(33, 'Kacper', 'Kubiak', 'podstawowa', NULL),
(34, 'Oskar', 'Lis', 'podstawowa', NULL),
(35, 'Filip', 'Czarnecki', 'podstawowa', NULL),
(36, 'Norbert', 'Sawicki', 'podstawowa', NULL),
(37, 'Wiktor', 'Górski', 'podstawowa', NULL),
(38, 'Antoni', 'Borkowski', 'zaawansowana', NULL),
(39, 'Igor', 'Rogalski', 'zaawansowana', NULL),
(40, 'Maksymilian', 'Chmielewski', 'zaawansowana', NULL),
(41, 'Alan', 'Pietrzak', 'zaawansowana', NULL),
(42, 'Konrad', 'Rutkowski', 'zaawansowana', NULL),
(43, 'Hubert', 'Sikora', 'zaawansowana', NULL),
(44, 'Nikodem', 'Wasilewski', 'zaawansowana', NULL),
(45, 'Adrian', 'Ostrowski', 'zaawansowana', NULL),
(46, 'Kornel', 'Marciniak', 'zaawansowana', NULL),
(47, 'Fabian', 'Zawadzki', 'zaawansowana', NULL),
(49, 'Maciek', 'Kowalski', 'podstawowa', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `tabela_8x`
--
ALTER TABLE `tabela_8x`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tabela_16x`
--
ALTER TABLE `tabela_16x`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tabela_24x`
--
ALTER TABLE `tabela_24x`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tabela_32x`
--
ALTER TABLE `tabela_32x`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `turniej_tabele`
--
ALTER TABLE `turniej_tabele`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `turniej_zawodnik`
--
ALTER TABLE `turniej_zawodnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `turniej_data` (`turniej_data`,`zawodnik_id`),
  ADD KEY `zawodnik_id` (`zawodnik_id`);

--
-- Indeksy dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player1_id` (`player1_id`),
  ADD KEY `player2_id` (`player2_id`);

--
-- Indeksy dla tabeli `zawodnik`
--
ALTER TABLE `zawodnik`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabela_8x`
--
ALTER TABLE `tabela_8x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tabela_16x`
--
ALTER TABLE `tabela_16x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tabela_24x`
--
ALTER TABLE `tabela_24x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tabela_32x`
--
ALTER TABLE `tabela_32x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `turniej_tabele`
--
ALTER TABLE `turniej_tabele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `turniej_zawodnik`
--
ALTER TABLE `turniej_zawodnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `zawodnik`
--
ALTER TABLE `zawodnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `turniej_zawodnik`
--
ALTER TABLE `turniej_zawodnik`
  ADD CONSTRAINT `turniej_zawodnik_ibfk_1` FOREIGN KEY (`zawodnik_id`) REFERENCES `zawodnik` (`id`);

--
-- Constraints for table `wyniki`
--
ALTER TABLE `wyniki`
  ADD CONSTRAINT `wyniki_ibfk_1` FOREIGN KEY (`player1_id`) REFERENCES `zawodnik` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wyniki_ibfk_2` FOREIGN KEY (`player2_id`) REFERENCES `zawodnik` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
