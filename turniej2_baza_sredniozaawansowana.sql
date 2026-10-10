-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 27, 2026 at 05:57 PM
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
(3, '2026-09-27', 'zaawansowana', 1, 31, 32, 33, 34, 35, 36, 37, 38, 40, 41, 42, 43, 44, NULL, NULL, 1, 38, 42, 43, 44, 41, 40, 31, 38, 43, 44, 31, 43, 44, NULL, 37, 34, 33, 32, 35, 36, NULL, 37, 40, 33, 41, 35, 42, 36, 1, 40, 33, 42, 1, 33, 38, 42, 31, 33, 42, 33, 44, 40, 1, 38, 31, 43, 44, 33, 42, 38, 31, 40, 1, 37, 36, 35, 41, 32, 34, NULL, NULL, 43, 44, 37, 41, 35, 36, NULL, 34, 32, NULL, 34, 32, NULL, NULL, 37, 36, 41, 35);

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
(3, '2026-09-27', 'podstawowa', 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 39, 45, NULL, 18, 9, 22, 21, 39, 7, 11, 3, 9, 21, 39, 11, 9, 39, 16, 25, 12, 20, 4, 28, 10, 2, 16, 22, 20, 18, 4, 3, 2, 7, 16, 20, 3, 2, 20, 11, 3, 21, 11, 3, 11, 9, 16, 2, 20, 21, 39, 9, 11, 3, 20, 21, 2, 16, 7, 18, 4, 22, 28, 25, 10, 12, 39, 9, 22, 18, 4, 7, 25, 12, 28, 10, 25, 28, 12, 10, 18, 7, 22, 4, 2, 18, 10, 9, 29, 22, 21, 30, 39, 20, 12, 7, 27, 11, 16, 3, NULL, 17, 25, 26, 6, 13, 14, 5, 4, 15, 23, 28, 8, 24, 19, 45, 17, 16, 25, 27, 13, 12, 14, 20, 4, 30, 28, 29, 8, 10, 19, 2, 17, 27, 13, 14, 30, 29, 8, 19, 27, 14, 30, 19, 17, 13, 29, 8, 19, 27, 30, 14, 13, 29, 17, 8, 26, 15, 45, 6, 23, 5, 24, NULL, 27, 19, 14, 30, 13, 29, 17, 8, NULL, 26, 6, 5, 15, 23, 24, 45, 26, 6, 15, 45, NULL, 5, 23, 24, 26, 15, 6, 45, 5, 23, NULL, 24);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tabela_48x`
--

CREATE TABLE `tabela_48x` (
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
  `main33` int(11) DEFAULT NULL,
  `main34` int(11) DEFAULT NULL,
  `main35` int(11) DEFAULT NULL,
  `main36` int(11) DEFAULT NULL,
  `main37` int(11) DEFAULT NULL,
  `main38` int(11) DEFAULT NULL,
  `main39` int(11) DEFAULT NULL,
  `main40` int(11) DEFAULT NULL,
  `main41` int(11) DEFAULT NULL,
  `main42` int(11) DEFAULT NULL,
  `main43` int(11) DEFAULT NULL,
  `main44` int(11) DEFAULT NULL,
  `main45` int(11) DEFAULT NULL,
  `main46` int(11) DEFAULT NULL,
  `main47` int(11) DEFAULT NULL,
  `main48` int(11) DEFAULT NULL,
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
  `31_32_2` int(11) DEFAULT NULL,
  `Pmain_1` int(11) DEFAULT NULL,
  `Pmain_2` int(11) DEFAULT NULL,
  `Pmain_3` int(11) DEFAULT NULL,
  `Pmain_4` int(11) DEFAULT NULL,
  `Pmain_5` int(11) DEFAULT NULL,
  `Pmain_6` int(11) DEFAULT NULL,
  `Pmain_7` int(11) DEFAULT NULL,
  `Pmain_8` int(11) DEFAULT NULL,
  `Pmain_9` int(11) DEFAULT NULL,
  `Pmain_10` int(11) DEFAULT NULL,
  `Pmain_11` int(11) DEFAULT NULL,
  `Pmain_12` int(11) DEFAULT NULL,
  `Pmain_13` int(11) DEFAULT NULL,
  `Pmain_14` int(11) DEFAULT NULL,
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
  `Lmain_17` int(11) DEFAULT NULL,
  `Lmain_18` int(11) DEFAULT NULL,
  `Lmain_19` int(11) DEFAULT NULL,
  `Lmain_20` int(11) DEFAULT NULL,
  `Lmain_21` int(11) DEFAULT NULL,
  `Lmain_22` int(11) DEFAULT NULL,
  `Lmain_23` int(11) DEFAULT NULL,
  `Lmain_24` int(11) DEFAULT NULL,
  `33` int(11) DEFAULT NULL,
  `34` int(11) DEFAULT NULL,
  `35` int(11) DEFAULT NULL,
  `36` int(11) DEFAULT NULL,
  `37` int(11) DEFAULT NULL,
  `38` int(11) DEFAULT NULL,
  `39` int(11) DEFAULT NULL,
  `40` int(11) DEFAULT NULL,
  `41` int(11) DEFAULT NULL,
  `42` int(11) DEFAULT NULL,
  `43` int(11) DEFAULT NULL,
  `44` int(11) DEFAULT NULL,
  `45` int(11) DEFAULT NULL,
  `46` int(11) DEFAULT NULL,
  `47` int(11) DEFAULT NULL,
  `48` int(11) DEFAULT NULL,
  `33_48_1` int(11) DEFAULT NULL,
  `33_48_2` int(11) DEFAULT NULL,
  `33_48_3` int(11) DEFAULT NULL,
  `33_48_4` int(11) DEFAULT NULL,
  `33_48_5` int(11) DEFAULT NULL,
  `33_48_6` int(11) DEFAULT NULL,
  `33_48_7` int(11) DEFAULT NULL,
  `33_48_8` int(11) DEFAULT NULL,
  `33_48_9` int(11) DEFAULT NULL,
  `33_48_10` int(11) DEFAULT NULL,
  `33_48_11` int(11) DEFAULT NULL,
  `33_48_12` int(11) DEFAULT NULL,
  `33_48_13` int(11) DEFAULT NULL,
  `33_48_14` int(11) DEFAULT NULL,
  `33_48_15` int(11) DEFAULT NULL,
  `33_48_16` int(11) DEFAULT NULL,
  `33_40_1` int(11) DEFAULT NULL,
  `33_40_2` int(11) DEFAULT NULL,
  `33_40_3` int(11) DEFAULT NULL,
  `33_40_4` int(11) DEFAULT NULL,
  `33_40_5` int(11) DEFAULT NULL,
  `33_40_6` int(11) DEFAULT NULL,
  `33_40_7` int(11) DEFAULT NULL,
  `33_40_8` int(11) DEFAULT NULL,
  `41_48_1` int(11) DEFAULT NULL,
  `41_48_2` int(11) DEFAULT NULL,
  `41_48_3` int(11) DEFAULT NULL,
  `41_48_4` int(11) DEFAULT NULL,
  `41_48_5` int(11) DEFAULT NULL,
  `41_48_6` int(11) DEFAULT NULL,
  `41_48_7` int(11) DEFAULT NULL,
  `41_48_8` int(11) DEFAULT NULL,
  `33_36_1` int(11) DEFAULT NULL,
  `33_36_2` int(11) DEFAULT NULL,
  `33_36_3` int(11) DEFAULT NULL,
  `33_36_4` int(11) DEFAULT NULL,
  `37_40_1` int(11) DEFAULT NULL,
  `37_40_2` int(11) DEFAULT NULL,
  `37_40_3` int(11) DEFAULT NULL,
  `37_40_4` int(11) DEFAULT NULL,
  `41_44_1` int(11) DEFAULT NULL,
  `41_44_2` int(11) DEFAULT NULL,
  `41_44_3` int(11) DEFAULT NULL,
  `41_44_4` int(11) DEFAULT NULL,
  `45_48_1` int(11) DEFAULT NULL,
  `45_48_2` int(11) DEFAULT NULL,
  `45_48_3` int(11) DEFAULT NULL,
  `45_48_4` int(11) DEFAULT NULL,
  `33_34_1` int(11) DEFAULT NULL,
  `33_34_2` int(11) DEFAULT NULL,
  `35_36_1` int(11) DEFAULT NULL,
  `35_36_2` int(11) DEFAULT NULL,
  `37_38_1` int(11) DEFAULT NULL,
  `37_38_2` int(11) DEFAULT NULL,
  `39_40_1` int(11) DEFAULT NULL,
  `39_40_2` int(11) DEFAULT NULL,
  `41_42_1` int(11) DEFAULT NULL,
  `41_42_2` int(11) DEFAULT NULL,
  `43_44_1` int(11) DEFAULT NULL,
  `43_44_2` int(11) DEFAULT NULL,
  `45_46_1` int(11) DEFAULT NULL,
  `45_46_2` int(11) DEFAULT NULL,
  `47_48_1` int(11) DEFAULT NULL,
  `47_48_2` int(11) DEFAULT NULL,
  `Pmain_15` int(11) DEFAULT NULL,
  `Pmain_16` int(11) DEFAULT NULL,
  `Lmain_25` int(11) DEFAULT NULL,
  `Lmain_26` int(11) DEFAULT NULL,
  `Lmain_27` int(11) DEFAULT NULL,
  `Lmain_28` int(11) DEFAULT NULL,
  `Lmain_29` int(11) DEFAULT NULL,
  `Lmain_30` int(11) DEFAULT NULL,
  `Lmain_31` int(11) DEFAULT NULL,
  `Lmain_32` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(5, '2026-09-27', 'tabela_32x', 'podstawowa'),
(6, '2026-09-27', 'tabela_16x', 'zaawansowana');

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
(1, '2026-09-27', 1),
(2, '2026-09-27', 2),
(3, '2026-09-27', 3),
(4, '2026-09-27', 4),
(5, '2026-09-27', 5),
(6, '2026-09-27', 6),
(7, '2026-09-27', 7),
(8, '2026-09-27', 8),
(9, '2026-09-27', 9),
(10, '2026-09-27', 10),
(11, '2026-09-27', 11),
(12, '2026-09-27', 12),
(13, '2026-09-27', 13),
(14, '2026-09-27', 14),
(15, '2026-09-27', 15),
(16, '2026-09-27', 16),
(17, '2026-09-27', 17),
(18, '2026-09-27', 18),
(19, '2026-09-27', 19),
(20, '2026-09-27', 20),
(21, '2026-09-27', 21),
(22, '2026-09-27', 22),
(23, '2026-09-27', 23),
(24, '2026-09-27', 24),
(25, '2026-09-27', 25),
(26, '2026-09-27', 26),
(27, '2026-09-27', 27),
(28, '2026-09-27', 28),
(29, '2026-09-27', 29),
(30, '2026-09-27', 30),
(31, '2026-09-27', 31),
(32, '2026-09-27', 32),
(33, '2026-09-27', 33),
(34, '2026-09-27', 34),
(35, '2026-09-27', 35),
(36, '2026-09-27', 36),
(37, '2026-09-27', 37),
(38, '2026-09-27', 38),
(39, '2026-09-27', 39),
(40, '2026-09-27', 40),
(41, '2026-09-27', 41),
(42, '2026-09-27', 42),
(43, '2026-09-27', 43),
(44, '2026-09-27', 44),
(45, '2026-09-27', 45);

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
  `grupa` enum('podstawowa','zaawansowana','średniozaawansowana') NOT NULL,
  `boisko` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wyniki`
--

INSERT INTO `wyniki` (`id`, `data`, `tabela`, `box_id`, `player1_id`, `player2_id`, `player1_points`, `player2_points`, `status`, `grupa`, `boisko`) VALUES
(2, '2026-09-27', 'tabela_32x', 'main_2', 18, 17, 11, 6, 'zakonczony', 'podstawowa', 1),
(3, '2026-09-27', 'tabela_32x', 'main_3', 10, 25, 11, 9, 'zakonczony', 'podstawowa', 2),
(4, '2026-09-27', 'tabela_32x', 'main_4', 26, 9, 10, 11, 'zakonczony', 'podstawowa', 3),
(5, '2026-09-27', 'tabela_32x', 'main_5', 6, 29, 10, 11, 'zakonczony', 'podstawowa', 4),
(6, '2026-09-27', 'tabela_32x', 'main_6', 22, 13, 11, 5, 'zakonczony', 'podstawowa', 5),
(7, '2026-09-27', 'tabela_32x', 'main_7', 14, 21, 4, 11, 'zakonczony', 'podstawowa', 6),
(10, '2026-09-27', 'tabela_32x', 'main_8', 30, 5, 11, 6, 'zakonczony', 'podstawowa', 1),
(11, '2026-09-27', 'tabela_32x', 'main_9', 4, 39, 5, 11, 'zakonczony', 'podstawowa', 2),
(12, '2026-09-27', 'tabela_32x', 'main_10', 20, 15, 11, 0, 'zakonczony', 'podstawowa', 3),
(13, '2026-09-27', 'tabela_32x', 'main_11', 12, 23, 11, 6, 'zakonczony', 'podstawowa', 5),
(14, '2026-09-27', 'tabela_32x', 'main_12', 28, 7, 3, 11, 'zakonczony', 'podstawowa', 6),
(15, '2026-09-27', 'tabela_32x', 'main_13', 8, 27, 8, 11, 'zakonczony', 'podstawowa', 4),
(16, '2026-09-27', 'tabela_32x', 'main_14', 24, 11, 2, 11, 'zakonczony', 'podstawowa', 1),
(17, '2026-09-27', 'tabela_32x', 'main_15', 16, 19, 11, 8, 'zakonczony', 'podstawowa', 2),
(18, '2026-09-27', 'tabela_32x', 'main_16', 45, 3, 4, 11, 'zakonczony', 'podstawowa', 3),
(19, '2026-09-27', 'tabela_32x', 'main_1', 2, NULL, 11, 0, 'zakonczony', 'podstawowa', 7),
(20, '2026-09-27', 'tabela_16x', 'main_1', 1, NULL, 11, 0, 'zakonczony', 'zaawansowana', 7),
(21, '2026-09-27', 'tabela_16x', 'main_8', NULL, 31, 0, 11, 'zakonczony', 'zaawansowana', 7),
(22, '2026-09-27', 'tabela_16x', 'main_2', 38, 37, 11, 5, 'zakonczony', 'zaawansowana', 5),
(23, '2026-09-27', 'tabela_16x', 'main_3', 34, 42, 4, 11, 'zakonczony', 'zaawansowana', 6),
(24, '2026-09-27', 'tabela_16x', 'main_4', 43, 33, 11, 7, 'zakonczony', 'zaawansowana', 4),
(25, '2026-09-27', 'tabela_32x', 'P1_16_1', 2, 18, 4, 11, 'zakonczony', 'podstawowa', 1),
(26, '2026-09-27', 'tabela_32x', 'P1_16_2', 10, 9, 10, 11, 'zakonczony', 'podstawowa', 2),
(27, '2026-09-27', 'tabela_32x', 'P1_16_3', 29, 22, 7, 11, 'zakonczony', 'podstawowa', 3),
(28, '2026-09-27', 'tabela_16x', 'main_5', 32, 44, 2, 11, 'zakonczony', 'zaawansowana', 5),
(29, '2026-09-27', 'tabela_16x', 'main_6', 41, 35, 11, 5, 'zakonczony', 'zaawansowana', 6),
(30, '2026-09-27', 'tabela_32x', 'P1_16_4', 21, 30, 11, 0, 'zakonczony', 'podstawowa', 1),
(32, '2026-09-27', 'tabela_16x', 'main_7', 36, 40, 6, 11, 'zakonczony', 'zaawansowana', 5),
(33, '2026-09-27', 'tabela_32x', 'P1_16_6', 12, 7, 2, 11, 'zakonczony', 'podstawowa', 2),
(34, '2026-09-27', 'tabela_32x', 'P1_16_7', 27, 11, 10, 11, 'zakonczony', 'podstawowa', 6),
(35, '2026-09-27', 'tabela_32x', 'P1_16_8', 16, 3, 3, 11, 'zakonczony', 'podstawowa', 1),
(36, '2026-09-27', 'tabela_32x', 'L1_16_1', NULL, 17, 0, 11, 'zakonczony', 'podstawowa', 7),
(37, '2026-09-27', 'tabela_32x', 'L1_16_2', 25, 26, 11, 8, 'zakonczony', 'podstawowa', 3),
(38, '2026-09-27', 'tabela_32x', 'L1_16_3', 6, 13, 9, 11, 'zakonczony', 'podstawowa', 4),
(39, '2026-09-27', 'tabela_32x', 'L1_16_4', 14, 5, 11, 7, 'zakonczony', 'podstawowa', 2),
(40, '2026-09-27', 'tabela_32x', 'L1_16_5', 4, 15, 11, 5, 'zakonczony', 'podstawowa', 5),
(41, '2026-09-27', 'tabela_16x', 'L1_8_1', NULL, 37, 0, 11, 'zakonczony', 'zaawansowana', 7),
(42, '2026-09-27', 'tabela_16x', 'L1_8_4', 36, NULL, 11, 0, 'zakonczony', 'zaawansowana', 7),
(43, '2026-09-27', 'tabela_16x', 'P1_8_1', 1, 38, 7, 11, 'zakonczony', 'zaawansowana', 1),
(44, '2026-09-27', 'tabela_32x', 'L1_16_c_1', 17, 16, 8, 11, 'zakonczony', 'podstawowa', 3),
(45, '2026-09-27', 'tabela_16x', 'L1_8_2', 34, 33, 3, 11, 'zakonczony', 'zaawansowana', 6),
(46, '2026-09-27', 'tabela_16x', 'L1_8_3', 32, 35, 9, 11, 'zakonczony', 'zaawansowana', 2),
(47, '2026-09-27', 'tabela_32x', 'L1_16_6', 23, 28, 3, 11, 'zakonczony', 'podstawowa', 5),
(48, '2026-09-27', 'tabela_32x', 'L1_16_7', 8, 24, 11, 9, 'zakonczony', 'podstawowa', 1),
(49, '2026-09-27', 'tabela_32x', 'L1_16_8', 19, 45, 11, 9, 'zakonczony', 'podstawowa', 4),
(50, '2026-09-27', 'tabela_32x', 'L1_16_c_2', 25, 27, 11, 10, 'zakonczony', 'podstawowa', 3),
(51, '2026-09-27', 'tabela_32x', 'L1_16_c_3', 13, 12, 9, 11, 'zakonczony', 'podstawowa', 6),
(52, '2026-09-27', 'tabela_32x', 'P1_16_5', 39, 20, 11, 9, 'zakonczony', 'podstawowa', 5),
(53, '2026-09-27', 'tabela_32x', 'L1_16_c_4', 14, 20, 4, 11, 'zakonczony', 'podstawowa', 5),
(54, '2026-09-27', 'tabela_32x', '25_32_1', NULL, 26, 0, 11, 'zakonczony', 'podstawowa', 7),
(55, '2026-09-27', 'tabela_32x', '25_32_2', 6, 5, 11, 6, 'zakonczony', 'podstawowa', 1),
(56, '2026-09-27', 'tabela_32x', '25_32_3', 15, 23, 11, 5, 'zakonczony', 'podstawowa', 2),
(57, '2026-09-27', 'tabela_32x', '25_32_4', 24, 45, 5, 11, 'zakonczony', 'podstawowa', 4),
(58, '2026-09-27', 'tabela_16x', 'P1_8_4', 40, 31, 10, 11, 'zakonczony', 'zaawansowana', 3),
(59, '2026-09-27', 'tabela_32x', 'L1_16_c_5', 4, 30, 11, 3, 'zakonczony', 'podstawowa', 5),
(60, '2026-09-27', 'tabela_32x', 'L1_16_c_6', 28, 29, 11, 1, 'zakonczony', 'podstawowa', 6),
(61, '2026-09-27', 'tabela_32x', 'L1_16_c_7', 8, 10, 5, 11, 'zakonczony', 'podstawowa', 1),
(62, '2026-09-27', 'tabela_32x', 'L1_16_c_8', 19, 2, 7, 11, 'zakonczony', 'podstawowa', 2),
(63, '2026-09-27', 'tabela_16x', 'P1_8_2', 42, 43, 5, 11, 'zakonczony', 'zaawansowana', 5),
(64, '2026-09-27', 'tabela_16x', 'P1_8_3', 44, 41, 11, 2, 'zakonczony', 'zaawansowana', 3),
(65, '2026-09-27', 'tabela_16x', '13_16_1', NULL, 34, 0, 11, 'zakonczony', 'zaawansowana', 7),
(66, '2026-09-27', 'tabela_16x', '13_16_2', 32, NULL, 11, 0, 'zakonczony', 'zaawansowana', 7),
(67, '2026-09-27', 'tabela_32x', '29_32_1', NULL, 5, 0, 11, 'zakonczony', 'podstawowa', 7),
(68, '2026-09-27', 'tabela_32x', '29_32_2', 23, 24, 11, 1, 'zakonczony', 'podstawowa', 1),
(69, '2026-09-27', 'tabela_32x', '25_28_1', 26, 6, 11, 0, 'zakonczony', 'podstawowa', 4),
(70, '2026-09-27', 'tabela_32x', '25_28_2', 15, 45, 11, 10, 'zakonczony', 'podstawowa', 6),
(71, '2026-09-27', 'tabela_32x', '17_24_1', 17, 27, 7, 11, 'zakonczony', 'podstawowa', 2),
(72, '2026-09-27', 'tabela_32x', 'P1_8_4', 11, 3, 11, 9, 'zakonczony', 'podstawowa', 3),
(73, '2026-09-27', 'tabela_32x', 'L1_8_1', 16, 25, 11, 10, 'zakonczony', 'podstawowa', 5),
(74, '2026-09-27', 'tabela_16x', '13_14', 34, 32, 6, 11, 'zakonczony', 'zaawansowana', 4),
(75, '2026-09-27', 'tabela_32x', '29_30', 5, 23, 5, 11, 'zakonczony', 'podstawowa', 1),
(76, '2026-09-27', 'tabela_32x', '31_32', NULL, 24, 0, 11, 'zakonczony', 'podstawowa', 7),
(77, '2026-09-27', 'tabela_32x', 'P1_8_3', 39, 7, 11, 8, 'zakonczony', 'podstawowa', 2),
(78, '2026-09-27', 'tabela_32x', 'P1_8_2', 22, 21, 6, 11, 'zakonczony', 'podstawowa', 3),
(79, '2026-09-27', 'tabela_32x', 'L1_8_2', 12, 20, 4, 11, 'zakonczony', 'podstawowa', 5),
(80, '2026-09-27', 'tabela_32x', '27_28', 6, 45, 4, 11, 'zakonczony', 'podstawowa', 6),
(81, '2026-09-27', 'tabela_16x', 'P1_4_1', 38, 43, 5, 11, 'zakonczony', 'zaawansowana', 4),
(82, '2026-09-27', 'tabela_32x', '17_24_2', 13, 14, 10, 11, 'zakonczony', 'podstawowa', 1),
(83, '2026-09-27', 'tabela_32x', 'P1_8_1', 18, 9, 9, 11, 'zakonczony', 'podstawowa', 5),
(84, '2026-09-27', 'tabela_32x', 'L1_8_3', 4, 28, 11, 6, 'zakonczony', 'podstawowa', 2),
(85, '2026-09-27', 'tabela_32x', 'L1_8_4', 10, 2, 6, 11, 'zakonczony', 'podstawowa', 3),
(86, '2026-09-27', 'tabela_16x', 'L1_8_c_2', 33, 41, 11, 6, 'zakonczony', 'zaawansowana', 6),
(87, '2026-09-27', 'tabela_32x', '17_24_3', 30, 29, 11, 10, 'zakonczony', 'podstawowa', 4),
(88, '2026-09-27', 'tabela_32x', '17_24_4', 8, 19, 7, 11, 'zakonczony', 'podstawowa', 3),
(89, '2026-09-27', 'tabela_16x', 'L1_8_c_3', 35, 42, 3, 11, 'zakonczony', 'zaawansowana', 5),
(90, '2026-09-27', 'tabela_32x', '25_26', 26, 15, 11, 3, 'zakonczony', 'podstawowa', 2),
(91, '2026-09-27', 'tabela_16x', 'P1_4_2', 44, 31, 11, 2, 'zakonczony', 'zaawansowana', 1),
(92, '2026-09-27', 'tabela_32x', '13_16_1', 25, 12, 11, 7, 'zakonczony', 'podstawowa', 6),
(93, '2026-09-27', 'tabela_32x', 'P1_4_1', 9, 21, 11, 1, 'zakonczony', 'podstawowa', 3),
(94, '2026-09-27', 'tabela_32x', '13_16_2', 28, 10, 11, 10, 'zakonczony', 'podstawowa', 4),
(95, '2026-09-27', 'tabela_32x', 'P1_4_2', 39, 11, 11, 6, 'zakonczony', 'podstawowa', 2),
(96, '2026-09-27', 'tabela_16x', 'L1_8_c_1', 37, 40, 10, 11, 'zakonczony', 'zaawansowana', 5),
(97, '2026-09-27', 'tabela_16x', 'L1_8_c_4', 36, 1, 4, 11, 'zakonczony', 'zaawansowana', 1),
(98, '2026-09-27', 'tabela_32x', '21_24_1', 17, 13, 6, 11, 'zakonczony', 'podstawowa', 3),
(99, '2026-09-27', 'tabela_32x', '21_24_2', 29, 8, 11, 5, 'zakonczony', 'podstawowa', 2),
(100, '2026-09-27', 'tabela_32x', '17_20_1', 27, 14, 11, 3, 'zakonczony', 'podstawowa', 6),
(101, '2026-09-27', 'tabela_32x', '17_20_2', 30, 19, 10, 11, 'zakonczony', 'podstawowa', 4),
(102, '2026-09-27', 'tabela_16x', '9_12_1', 37, 41, 11, 3, 'zakonczony', 'zaawansowana', 5),
(103, '2026-09-27', 'tabela_32x', 'L1_8_c_1', 16, 22, 11, 7, 'zakonczony', 'podstawowa', 1),
(104, '2026-09-27', 'tabela_32x', 'L1_8_c_2', 20, 18, 11, 6, 'zakonczony', 'podstawowa', 2),
(105, '2026-09-27', 'tabela_32x', 'L1_8_c_3', 4, 3, 7, 11, 'zakonczony', 'podstawowa', 3),
(106, '2026-09-27', 'tabela_32x', '21_22', 13, 29, 11, 5, 'zakonczony', 'podstawowa', 6),
(107, '2026-09-27', 'tabela_32x', 'L1_8_c_4', 2, 7, 11, 7, 'zakonczony', 'podstawowa', 5),
(108, '2026-09-27', 'tabela_32x', '23_24', 17, 8, 11, 5, 'zakonczony', 'podstawowa', 1),
(109, '2026-09-27', 'tabela_16x', 'L1_4_1', 40, 33, 6, 11, 'zakonczony', 'zaawansowana', 4),
(110, '2026-09-27', 'tabela_32x', '19_20', 14, 30, 1, 11, 'zakonczony', 'podstawowa', 2),
(111, '2026-09-27', 'tabela_32x', '17_18', 27, 19, 9, 11, 'zakonczony', 'podstawowa', 3),
(112, '2026-09-27', 'tabela_16x', '9_12_2', 35, 36, 9, 11, 'zakonczony', 'zaawansowana', 5),
(113, '2026-09-27', 'tabela_32x', '13_14', 25, 28, 9, 11, 'zakonczony', 'podstawowa', 1),
(114, '2026-09-27', 'tabela_32x', '15_16', 12, 10, 6, 11, 'zakonczony', 'podstawowa', 6),
(115, '2026-09-27', 'tabela_16x', 'L1_4_2', 42, 1, 11, 5, 'zakonczony', 'zaawansowana', 4),
(116, '2026-09-27', 'tabela_32x', 'L1_4_1', 16, 20, 10, 11, 'zakonczony', 'podstawowa', 2),
(117, '2026-09-27', 'tabela_32x', 'L1_4_2', 3, 2, 11, 8, 'zakonczony', 'podstawowa', 3),
(118, '2026-09-27', 'tabela_32x', '9_12_1', 22, 18, 5, 11, 'zakonczony', 'podstawowa', 1),
(119, '2026-09-27', 'tabela_32x', '9_12_2', 4, 7, 5, 11, 'zakonczony', 'podstawowa', 4),
(120, '2026-09-27', 'tabela_16x', '9_10', 37, 36, 11, 5, 'zakonczony', 'zaawansowana', 5),
(121, '2026-09-27', 'tabela_16x', 'L1_4_c_1', 33, 38, 11, 6, 'zakonczony', 'zaawansowana', 6),
(122, '2026-09-27', 'tabela_32x', 'L1_4_c_1', 20, 11, 3, 11, 'zakonczony', 'podstawowa', 1),
(123, '2026-09-27', 'tabela_32x', 'L1_4_c_2', 3, 21, 11, 5, 'zakonczony', 'podstawowa', 2),
(124, '2026-09-27', 'tabela_32x', 'P1_2_1', 9, 39, 5, 11, 'zakonczony', 'podstawowa', 3),
(125, '2026-09-27', 'tabela_16x', '11_12', 41, 35, 0, 11, 'zakonczony', 'zaawansowana', 4),
(126, '2026-09-27', 'tabela_32x', '11_12', 22, 4, 5, 11, 'zakonczony', 'podstawowa', 5),
(127, '2026-09-27', 'tabela_32x', '9_10', 18, 7, 9, 11, 'zakonczony', 'podstawowa', 6),
(128, '2026-09-27', 'tabela_32x', '7_8_1', 16, 2, 8, 11, 'zakonczony', 'podstawowa', 2),
(129, '2026-09-27', 'tabela_16x', 'L1_4_c_2', 42, 31, 11, 9, 'zakonczony', 'zaawansowana', 4),
(130, '2026-09-27', 'tabela_16x', 'P1_2_1', 43, 44, 11, 5, 'zakonczony', 'zaawansowana', 1),
(131, '2026-09-27', 'tabela_32x', '5_6_1', 20, 21, 11, 9, 'zakonczony', 'podstawowa', 3),
(132, '2026-09-27', 'tabela_32x', 'L1_2_1', 11, 3, 11, 4, 'zakonczony', 'podstawowa', 5),
(133, '2026-09-27', 'tabela_16x', '7_8_1', 40, 1, 11, 7, 'zakonczony', 'zaawansowana', 2),
(134, '2026-09-27', 'tabela_16x', '5_6_1', 38, 31, 11, 8, 'zakonczony', 'zaawansowana', 5),
(135, '2026-09-27', 'tabela_16x', 'L1_2_1', 33, 42, 11, 10, 'zakonczony', 'zaawansowana', 6),
(136, '2026-09-27', 'tabela_32x', 'L1_2_c_1', 11, 9, 10, 11, 'zakonczony', 'podstawowa', 3),
(137, '2026-09-27', 'tabela_16x', 'L1_2_c_1', 33, 44, 6, 11, 'zakonczony', 'zaawansowana', 5),
(138, '2026-09-27', 'tabela_32x', '1_2_1', 39, 9, 11, 6, 'zakonczony', 'podstawowa', 6),
(139, '2026-09-27', 'tabela_16x', '1_2_1', 43, 44, 11, 3, 'zakonczony', 'zaawansowana', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawodnik`
--

CREATE TABLE `zawodnik` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `grupa` enum('podstawowa','średniozaawansowana','zaawansowana','') NOT NULL,
  `group_change_date` date DEFAULT NULL,
  `zmiana_2_turniej` enum('podstawowa','średniozaawansowana','zaawansowana') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zawodnik`
--

INSERT INTO `zawodnik` (`id`, `fname`, `lname`, `grupa`, `group_change_date`, `zmiana_2_turniej`) VALUES
(1, 'Krystian', 'Zarych', 'zaawansowana', NULL, NULL),
(2, 'Szczepan', 'Wójcik', 'podstawowa', NULL, NULL),
(3, 'Antoni', 'Rajner', 'podstawowa', NULL, NULL),
(4, 'Andżelika', 'Lubas', 'podstawowa', NULL, NULL),
(5, 'Kornelia', 'Lubas', 'podstawowa', NULL, NULL),
(6, 'Olivia', 'Lubas', 'podstawowa', NULL, NULL),
(7, 'Lena', 'Kędzia', 'podstawowa', NULL, NULL),
(8, 'Lena', 'Babiarz', 'podstawowa', NULL, NULL),
(9, 'Franek', 'Plęs', 'podstawowa', NULL, NULL),
(10, 'Kacper', 'Sołtys', 'podstawowa', NULL, NULL),
(11, 'Przemysław', 'Kordecki', 'podstawowa', NULL, NULL),
(12, 'Antosia', 'Tomoń', 'podstawowa', NULL, NULL),
(13, 'Lena', 'Koczot', 'podstawowa', NULL, NULL),
(14, 'Malwina', 'Koczot', 'podstawowa', NULL, NULL),
(15, 'Milena', 'Kowalska', 'podstawowa', NULL, NULL),
(16, 'Wiktoria', 'Babiarz', 'podstawowa', NULL, NULL),
(17, 'Nataniel', 'Stachura', 'podstawowa', NULL, NULL),
(18, 'Filip', 'Tomoń', 'podstawowa', NULL, NULL),
(19, 'Maciej', 'Pasternak', 'podstawowa', NULL, NULL),
(20, 'Tomasz', 'Kozak', 'podstawowa', NULL, NULL),
(21, 'Arkadiusz', 'Bator', 'podstawowa', NULL, NULL),
(22, 'Dawid', 'Babiarz', 'podstawowa', NULL, NULL),
(23, 'Maja', 'Bator', 'podstawowa', NULL, NULL),
(24, 'Filip', 'Kozak', 'podstawowa', NULL, NULL),
(25, 'Wiktor', 'Herbut', 'podstawowa', NULL, NULL),
(26, 'Magdalena', 'Babiarz', 'podstawowa', NULL, NULL),
(27, 'Barbara', 'Kozak', 'podstawowa', NULL, NULL),
(28, 'Natalia', 'Herbut', 'podstawowa', NULL, NULL),
(29, 'Zuzanna', 'Tomoń', 'podstawowa', NULL, NULL),
(30, 'Wiktoria', 'Stanisławczyk', 'podstawowa', NULL, NULL),
(31, 'Paweł', 'Banaś', 'zaawansowana', NULL, NULL),
(32, 'Michał', 'Wójcik', 'zaawansowana', NULL, NULL),
(33, 'Robert', 'Rajner', 'zaawansowana', NULL, NULL),
(34, 'Sławomir', 'Lubas', 'zaawansowana', NULL, NULL),
(35, 'Mateusz', 'Szoka', 'zaawansowana', NULL, NULL),
(36, 'Zuzanna', 'Szoka', 'zaawansowana', NULL, NULL),
(37, 'Wojciech', 'Herbut', 'zaawansowana', NULL, NULL),
(38, 'Fabian', 'Herbut', 'zaawansowana', NULL, NULL),
(39, 'Piotr', 'Kozak', 'zaawansowana', NULL, NULL),
(40, 'Franciszek', 'Stawarz', 'zaawansowana', NULL, NULL),
(41, 'Sławomir', 'Bator', 'zaawansowana', NULL, NULL),
(42, 'Jacek', 'Wójcik', 'zaawansowana', NULL, NULL),
(43, 'Piotr', 'Tomoń', 'zaawansowana', NULL, NULL),
(44, 'Paweł', 'Babiarz', 'zaawansowana', NULL, NULL),
(45, 'Martyna', 'Ząbek', 'podstawowa', NULL, NULL);


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
-- Indeksy dla tabeli `tabela_48x`
--
ALTER TABLE `tabela_48x`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabela_16x`
--
ALTER TABLE `tabela_16x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tabela_24x`
--
ALTER TABLE `tabela_24x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabela_32x`
--
ALTER TABLE `tabela_32x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tabela_48x`
--
ALTER TABLE `tabela_48x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `turniej_tabele`
--
ALTER TABLE `turniej_tabele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `turniej_zawodnik`
--
ALTER TABLE `turniej_zawodnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `zawodnik`
--
ALTER TABLE `zawodnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
