-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Czas generowania: 05 Gru 2021, 22:21
-- Wersja serwera: 5.7.36
-- Wersja PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `Forum`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Posts`
--

CREATE TABLE `Posts` (
  `Post_ID` int(11) NOT NULL,
  `Author_ID` int(11) NOT NULL,
  `Post_Title` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Post` longtext CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Posts`
--

INSERT INTO `Posts` (`Post_ID`, `Author_ID`, `Post_Title`, `Post`, `Date`) VALUES
(1, 1, 'Brak miejsca na VMWare', 'Wie ktoś jak powiększyć dysk an Windowsie 10 stojącym na VMWAre?', '2021-11-28'),
(2, 1, 'Dysk do laptopa', 'Poleci ktoś jakiś niedrogi dysk do laptopa na studia na M.2?', '2021-11-28'),
(3, 2, 'Zepsuty zasilacz', 'Szukam zasilacza do laptopa ThinkPad t430S, najlepiej z gwarancją', '2021-11-28'),
(4, 2, 'Pewny Pendrive', 'Szukam pendrive który się nie zepsuje po miesiącu, minimum 64GB', '2021-11-28'),
(5, 1, 'Dysk przenośny', 'Polecicie jakiś adapter usb-sata? Mam stary dysk i zrobiłbym z niego większego pendrive na rzeczy ze studiów', '2021-11-28');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Relies`
--

CREATE TABLE `Relies` (
  `Reply_ID` int(11) NOT NULL,
  `Post_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Reply` mediumtext CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Relies`
--

INSERT INTO `Relies` (`Reply_ID`, `Post_ID`, `User_ID`, `Reply`, `Date`) VALUES
(1, 4, 12, 'Kup jakiś mały przenośny dysk SSD, będzie i szybszy i lepszy', '2021-12-01'),
(3, 3, 12, 'SprawdzaÅeÅ na OLX?', '2021-12-05'),
(4, 4, 12, 'Samsungi zawsze byÅy dobre', '2021-12-05'),
(5, 4, 11, 'Crucial czerwony, jak zawsze!', '2021-12-05');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

CREATE TABLE `Users` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `Role` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Users`
--

INSERT INTO `Users` (`User_ID`, `Username`, `passwd`, `Role`) VALUES
(1, 'user', 'user', 1),
(2, 'usr2', 'password', 1),
(11, 'user@user.com', 'password', 1),
(12, 'admin', 'password', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`Post_ID`);

--
-- Indeksy dla tabeli `Relies`
--
ALTER TABLE `Relies`
  ADD PRIMARY KEY (`Reply_ID`);

--
-- Indeksy dla tabeli `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `Posts`
--
ALTER TABLE `Posts`
  MODIFY `Post_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `Relies`
--
ALTER TABLE `Relies`
  MODIFY `Reply_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `Users`
--
ALTER TABLE `Users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
