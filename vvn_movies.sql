-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2025 at 11:10 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vvn_movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `actors` varchar(255) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `image`, `description`, `genre`, `actors`, `duration`, `video_url`) VALUES
(1, 'Венъм', 'https://www.kinoarena.com/uploads/media/stenik_movies_image/0001/15/thumb_14680_stenik_movies_image_index.jpg', 'Докато заплахата става все по-голяма...', 'Екшън, Научна фантастика', 'Том Харди, Мишел Уилямс, Уди Харелсън', '120 минути', 'https://www.youtube.com/embed/u9Mv98Gr5pY'),
(2, 'Злосторница', 'https://www.kinoarena.com/uploads/media/stenik_movies_image/0001/15/thumb_14628_stenik_movies_image_index.jpeg', 'Мащабната фентъзи продукция...', 'Фентъзи, Драма', 'Синтия Ериво, Ариана Гранде, Джеф Голдблум', '150 минути', 'https://www.youtube.com/embed/d7eiEGO3jXk'),
(3, 'Гунди', 'https://www.kinoarena.com/uploads/media/stenik_movies_image/0001/15/thumb_14766_stenik_movies_image_index.png', 'Филм, посветен на легендарния футболист...', 'Биографичен, Драма', 'Популярни български актьори', '130 минути', '');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `review_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `movie_id`, `rating`, `review_text`) VALUES
(1, 1, 9.3, 'Епичен екшън с невероятни визуални ефекти. Том Харди е страхотен!'),
(2, 1, 8.5, 'Интересен сюжет и отлична актьорска игра.'),
(3, 2, 9.0, 'Впечатляващо фентъзи с богата история и страхотни персонажи.'),
(4, 2, 8.8, 'Добър баланс между драма и визуални ефекти.'),
(5, 3, 9.5, 'Много емоционален и вдъхновяващ филм за легендарния футболист.'),
(6, 3, 8.7, 'Хубава българска продукция с интересна история.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
