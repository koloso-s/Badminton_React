-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 26, 2026 at 11:24 PM
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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `turniej_zawodnik`
--

CREATE TABLE `turniej_zawodnik` (
  `id` int(11) NOT NULL,
  `turniej_data` date NOT NULL,
  `zawodnik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabela_24x`
--
ALTER TABLE `tabela_24x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabela_32x`
--
ALTER TABLE `tabela_32x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabela_48x`
--
ALTER TABLE `tabela_48x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `turniej_tabele`
--
ALTER TABLE `turniej_tabele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `turniej_zawodnik`
--
ALTER TABLE `turniej_zawodnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zawodnik`
--
ALTER TABLE `zawodnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
