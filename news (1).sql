-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2023 at 02:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categoryname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categoryname`) VALUES
(1, 'Business'),
(2, 'Sports'),
(3, 'Historical'),
(6, 'Local'),
(9, 'Technology');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `userName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `regDate`, `userName`, `email`, `subject`, `message`) VALUES
(1, '2023-10-30 00:08:18', 'Qassem', 'qassem30@gmail.com', 'My opinion.', 'My opinion is ........'),
(2, '2023-10-30 00:09:47', 'Alaa', 'alaa24@gmail.com', 'Ask a question.', 'My question is ........'),
(3, '2023-10-30 00:55:48', 'Hind', 'hind23@gmail.com', 'Ask about somthing.', 'I want to ask ..........');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `newsDate` date NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(1500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '0 Inactive, 1 Active',
  `image` varchar(50) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `newsDate`, `title`, `content`, `author`, `active`, `image`, `views`, `category_id`) VALUES
(1, '2023-10-19', 'Tennis sport', 'Tennis is an adaptation of an ancient sport. Have you ever heard that fact? The ancient sport was known as jeu de pamme, which was later codified as tennis in England around 1870.', 'Ali Hassan', 1, 'Tennis_sporting.jpeg', 2, 2),
(3, '2023-10-20', 'Football sport', 'Liverpool and Everton have been far from their best so far this season but Dyche told TNT Sports that the Toffees have an opportunity to change their fortunes in this fixture.', 'Kelvin Adam', 1, '11094fb473b9fdc94bd020a91c8b8a07.jpeg', 1, 2),
(4, '2023-10-22', 'Student loan', 'A student loan deferment means that you won\'t have to make any payments for a predetermined period of time. The length of the deferment varies based on your situation. ', 'Hassan Youssef', 1, 'Student_loan.webp', 5, 1),
(5, '2023-10-21', 'Cleopatra\'s Daughter', 'By 42 BC the last of Gaius Julius Caesar’s assassins, Marcus Junius Brutus and Gaius Cassius Longinus, had been defeated and killed. ', 'Jane Draycott', 1, 'Cleopatra\'s_Daughter.jpeg', 3, 3),
(6, '2023-10-13', ' Five-star hotel for dogs opens in Rehab', 'There are 15 rooms in the hotel, which offers the dogs two meals per day, and workers in the hotel take care of the dogs psychologically and health wise and take them out for “fun and entertainment,” Ayoub added.\r\nThe hotel has hosted several purebred dogs in addition to mixed breeds.', ' Azza Ayoub', 1, '_Five-star_hotel_for_dogs_opens_in_Rehab.jpeg', 0, 6),
(10, '2023-10-30', 'Brazil’s plans', 'Brazil’s federal government plans to expand internet access throughout the country. \r\n\r\nNational Communications Agency (Anatel) will be responsible for developing tools, projects and actions to ensure continuous improvement, as reported by TV CULTURA, a partner of TV BRICS.\r\n\r\nThe federal government has established ConectaBR, a national programme that aims to increase coverage and access to the Internet throughout Brazil.\r\n\r\nIn the Official Gazette (DOU), the Department of Communications specifies that the initiative aims to “reduce regional disparities by providing a similar experience to users of telecoms services throughout the country”.\r\n\r\nThe National Communications Agency (Anatel), which will be in charge of developing tools, projects and actions to foster this improvement, will introduce a “Mobile Broadband Quality Mark” to assess the performance of service providers.', 'Gamal Kareem', 1, '706313977562e74c5b4b3c5d40b8c974.jpeg', 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `fullname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `image` varchar(50) NOT NULL,
  `active` int(1) NOT NULL COMMENT '0 Inactive, 1 Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `regDate`, `fullname`, `username`, `email`, `password`, `image`, `active`) VALUES
(1, '2023-10-18 07:17:00', 'Alaa Mohamed', 'alaaelhadi', 'alaa@gmail.com', '$2y$10$keSlYKbo6MUZEbVgpO4jYuBvFazqqsGw8.jxg0SDqAfBaTsh8NfE6', 'g1.png', 1),
(2, '2023-10-18 07:18:32', 'Ahmed Mohamed', 'ahmedelhadi', 'ahmed@gmail.com', '$2y$10$fGDFedqwF1b6u49P5GQRBuJ0INyUNDw1A8S8zvxTHI0tCEUmpkhRu', 'boy.webp', 0),
(3, '2023-10-18 07:19:17', 'Marwa Adel ', 'marwaadel', 'marwa@gmail.com', '$2y$10$efv8fMesPZiUZpWfAkEbvuXmdU74uc8DTTTT0b2GYGh34z80Rn.Ny', 'g2.jpeg', 1),
(4, '2023-10-18 09:32:10', 'Malak Mohamed', 'malakelhadi', 'malak@gmail.com', '$2y$10$ol/kXdq295WYex4twBEIdOudMLAMNGYW0valhyc1EvUMgYV.JqfOO', '2f62a83fa074d55274ac71fadc701cfd.jpeg', 1),
(6, '2023-10-18 09:38:45', 'Mona Anas', 'monaanas', 'mona@gmail.com', '$2y$10$rJVbkq3vWYDfUMhoN1NaaeM0T0WZM5wrI/oEZ0mkLtg7YKYHlkFuK', 'da2e5cea90fb3701d26ecf825a027a04.jpeg', 1),
(7, '2023-10-20 15:17:56', 'Ali Yasser', 'aliyasser', 'ali@gmail.com', '$2y$10$vaH2RaXWNRp0tSE4/tA3O.y/FKNOTXV39D1S7UPxcpEMm0USTGZym', 'boy.webp', 1),
(8, '2023-10-24 23:28:17', 'Hind Amer', 'hindamer', 'hind@gmail.com', '$2y$10$FgGKiZdXEfVUI6gC2fPp3esQPnhhvXwP.1p.qwIEM9sctEbAj1Ou2', '170faefeb4425e6c9cec99d7af5ef7f2.jpeg', 0),
(9, '2023-10-29 20:51:45', 'Younis Seif', 'younisseif', 'younis@gmail.com', '$2y$10$DJsjRzA2ggJlqpd90HrxpOxS9kAIFoCSzfrLi/orPfZVkITClT0sy', 'a678a3db113f6ad8a0be3019a13f88ac.jpeg', 1),
(10, '2023-10-30 00:23:43', 'Mariam Alaa', 'mariamalaa', 'mariam@gmail.com', '$2y$10$BQcI3JHpz60UPsZm8V7.O.H5x0KUh0hYXsci/Tu6Is8d9dRgVhe0y', '608e245377a2e937f3f17ee506b84330.jpeg', 1),
(12, '2023-10-30 00:28:30', 'Shahd Alaa', 'shahdalaa', 'shahd@gmail.com', '$2y$10$g9CX4JbW2OV41TX2t7mh4OTVNz8sUtbB4FQWaEw6/18j5CS0rmNbu', '82f8101b04809455588cebae94fdf999.jpeg', 0),
(13, '2023-10-30 00:39:44', 'Habiba Mohamed', 'habibamohamed', 'habiba@gmail.com', '$2y$10$eV7j97detLhGTCX3DE.kQ.M9Nyo8ZYi5KXGWkH5CClS.D4rNeEts.', '8754bf413cc3ec3cbfaf3f84a3a0f3b0.jpeg', 0),
(15, '2023-10-30 00:42:38', 'Youssef Mohamed', 'youssefmohamed', 'youssef@gmail.com', '$2y$10$G25tEuzc5tTfaikqmxmxru7LfqbXCzxbO2wE.L7SZjjQ1h6tqospG', 'bfef29e25c6a8195f9f3125b6275f5aa.jpeg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author` (`author`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fullname` (`fullname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
