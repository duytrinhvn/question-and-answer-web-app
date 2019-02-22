-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2019 at 04:10 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qanda`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(255) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_content` text NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_author`, `comment_date`, `comment_content`, `question_id`) VALUES
(1, 'user1', '2018-12-28 20:26:57', 'AWESOME!!!', 1),
(2, 'Authorr', '2018-12-29 14:24:34', 'Contentt', 1),
(7, 'Trinh', '2018-12-29 17:08:00', 'New comment here!', 1),
(8, 'Trinh', '2018-12-29 17:09:04', 'Another comm', 1),
(14, 'Justin', '2018-12-29 18:23:57', 'Not bad!!', 1),
(15, 'Duy', '2018-12-30 17:04:12', 'A bit rainy', 3),
(16, 'User2', '2018-12-30 17:04:31', 'Yes, It is :(', 3),
(18, 'user2', '2018-12-30 17:40:35', 'Eyyy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(255) NOT NULL,
  `question_author` varchar(255) NOT NULL,
  `question_title` varchar(255) NOT NULL,
  `question_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `question_author`, `question_title`, `question_date`, `question_content`) VALUES
(1, 'John English', 'Who Am I?', '2018-12-24 00:00:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin luctus enim libero, in luctus lacus dignissim eget. Nulla felis ligula, porta eu euismod vitae, varius non est. Curabitur faucibus ipsum dignissim nisl tincidunt tempus. Etiam ac iaculis turpis. Suspendisse consequat felis ut tortor feugiat, sed tempor nulla porta. Nulla elementum et velit pellentesque sollicitudin. Suspendisse rhoncus erat nunc, in maximus ligula feugiat quis.\r\n\r\nMaecenas dictum congue mi. Vivamus egestas odio eget diam malesuada, vel lobortis sem dictum. Nullam ipsum urna, semper non purus et, semper tempus augue. Maecenas posuere mi eget sapien malesuada accumsan. Nunc id nunc metus. Praesent sapien elit, tempus at risus at, elementum suscipit justo. Phasellus diam augue, tincidunt in vestibulum quis, bibendum non dui. Fusce lorem purus, porttitor ac rutrum a, blandit non arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac posuere erat. Etiam imperdiet urna neque, quis auctor lacus elementum ac. Fusce porttitor semper velit, vitae placerat dui egestas eu. Donec facilisis sem sit amet mi lobortis, sit amet accumsan diam sodales. Nam at ipsum massa.\r\n\r\nMorbi ullamcorper egestas risus, vel convallis ligula euismod sit amet. Donec sit amet pretium velit. Nunc facilisis vitae est ut lobortis. Pellentesque ut molestie leo, quis malesuada arcu. Ut consequat hendrerit lorem, sit amet iaculis justo consequat ut. Praesent semper libero est. Proin dignissim nec magna sit amet tincidunt. Aliquam erat volutpat. Sed dapibus, lacus nec fermentum interdum, tortor sem ornare lectus, suscipit imperdiet lectus libero a dui. Nunc rutrum, dolor vitae pharetra condimentum, arcu sapien tempor orci, eget rutrum ex ex at tortor. Curabitur pretium purus ut sollicitudin dignissim. Etiam id magna placerat, sagittis felis at, convallis augue. Etiam rhoncus metus nec rutrum lobortis.\r\n\r\nCras sed tristique libero, in condimentum turpis. Nunc vel tempor magna. Duis nisl quam, sodales et finibus eget, aliquet at purus. Nunc porta sapien ac libero blandit molestie. Ut vitae feugiat neque, ut dapibus ligula. Morbi elementum orci et gravida iaculis. Etiam sodales nibh et est dignissim rhoncus. Fusce quis diam est. Cras id leo non nisl laoreet rutrum a eu leo. Proin semper orci ac nibh dignissim bibendum. In id nulla ut nisi egestas fermentum. Vivamus pharetra consequat ante, et pulvinar enim mattis eu. Aliquam et lectus nec est elementum pellentesque blandit vel nisi.\r\n\r\nProin sed justo eu enim vehicula pretium ac ornare diam. Duis non pretium tortor, eu accumsan nunc. Cras sit amet volutpat nunc, eu lobortis felis. Fusce sollicitudin ornare diam sed posuere. Nam placerat diam sed nulla ornare eleifend. In nulla ligula, faucibus eu aliquam sed, mattis a erat. Duis in velit aliquam mi rhoncus tincidunt a eu dui. Vestibulum scelerisque enim vitae pretium pulvinar. Vestibulum sit amet semper libero. Donec dui felis, cursus quis semper quis, consequat id ipsum. Vivamus in nisl luctus metus pellentesque varius. Nunc et efficitur ex.\r\n\r\nGenerated 5 paragraphs, 464 words, 30'),
(3, 'Britney Spear', 'How\'s the weather today?', '2018-12-24 00:00:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin luctus enim libero, in luctus lacus dignissim eget. Nulla felis ligula, porta eu euismod vitae, varius non est. Curabitur faucibus ipsum dignissim nisl tincidunt tempus. Etiam ac iaculis turpis. Suspendisse consequat felis ut tortor feugiat, sed tempor nulla porta. Nulla elementum et velit pellentesque sollicitudin. Suspendisse rhoncus erat nunc, in maximus ligula feugiat quis.\r\n\r\nMaecenas dictum congue mi. Vivamus egestas odio eget diam malesuada, vel lobortis sem dictum. Nullam ipsum urna, semper non purus et, semper tempus augue. Maecenas posuere mi eget sapien malesuada accumsan. Nunc id nunc metus. Praesent sapien elit, tempus at risus at, elementum suscipit justo. Phasellus diam augue, tincidunt in vestibulum quis, bibendum non dui. Fusce lorem purus, porttitor ac rutrum a, blandit non arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac posuere erat. Etiam imperdiet urna neque, quis auctor lacus elementum ac. Fusce porttitor semper velit, vitae placerat dui egestas eu. Donec facilisis sem sit amet mi lobortis, sit amet accumsan diam sodales. Nam at ipsum massa.\r\n\r\nMorbi ullamcorper egestas risus, vel convallis ligula euismod sit amet. Donec sit amet pretium velit. Nunc facilisis vitae est ut lobortis. Pellentesque ut molestie leo, quis malesuada arcu. Ut consequat hendrerit lorem, sit amet iaculis justo consequat ut. Praesent semper libero est. Proin dignissim nec magna sit amet tincidunt. Aliquam erat volutpat. Sed dapibus, lacus nec fermentum interdum, tortor sem ornare lectus, suscipit imperdiet lectus libero a dui. Nunc rutrum, dolor vitae pharetra condimentum, arcu sapien tempor orci, eget rutrum ex ex at tortor. Curabitur pretium purus ut sollicitudin dignissim. Etiam id magna placerat, sagittis felis at, convallis augue. Etiam rhoncus metus nec rutrum lobortis.\r\n\r\nCras sed tristique libero, in condimentum turpis. Nunc vel tempor magna. Duis nisl quam, sodales et finibus eget, aliquet at purus. Nunc porta sapien ac libero blandit molestie. Ut vitae feugiat neque, ut dapibus ligula. Morbi elementum orci et gravida iaculis. Etiam sodales nibh et est dignissim rhoncus. Fusce quis diam est. Cras id leo non nisl laoreet rutrum a eu leo. Proin semper orci ac nibh dignissim bibendum. In id nulla ut nisi egestas fermentum. Vivamus pharetra consequat ante, et pulvinar enim mattis eu. Aliquam et lectus nec est elementum pellentesque blandit vel nisi.'),
(5, 'Duy', 'How To Become A Badass Programmer?', '2018-12-30 18:16:43', 'Hello, World!');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
