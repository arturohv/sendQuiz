-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-10-2013 a las 21:50:33
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `nuevadb`
--
CREATE DATABASE IF NOT EXISTS `nuevadb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nuevadb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_text` text,
  `score` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `course`
--

INSERT INTO `course` (`id`, `code`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ISW', 'INGENIERIA DE SOFTWARE', 'INGENIERIA DE SOFTWARE', '0000-00-00 00:00:00', NULL),
(2, 'CYF', 'CONTABILIDAD Y FINANZAS', 'CONTABILIDAD Y FINANZAS', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groupinfo`
--

CREATE TABLE IF NOT EXISTS `groupinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `quarter` varchar(255) DEFAULT NULL,
  `professor_id` int(11) NOT NULL,
  `groupInfo_number` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `groupinfo`
--

INSERT INTO `groupinfo` (`id`, `course_id`, `quarter`, `professor_id`, `groupInfo_number`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 1, '1', 1, 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification_sent`
--

CREATE TABLE IF NOT EXISTS `notification_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `professor`
--

CREATE TABLE IF NOT EXISTS `professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_number` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `is_admin` int(11) DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `professor`
--

INSERT INTO `professor` (`id`, `document_number`, `first_name`, `last_name`, `password`, `username`, `is_admin`, `email`, `created_at`, `updated_at`) VALUES
(1, '205780071', 'ARTURO', 'HERRERA', '123', 'ARTUROHV', 0, 'arturohv@gmail.com', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `question_text` text,
  `correct_answer_text` text,
  `value` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupInfo_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_registration` (`groupInfo_id`,`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `registration`
--

INSERT INTO `registration` (`id`, `groupInfo_id`, `student_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` int(11) DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`id`, `first_name`, `username`, `last_name`, `document_number`, `password`, `is_admin`, `email`, `created_at`, `updated_at`) VALUES
(1, 'ARTURO', 'arturohv', 'MUNI', '1', '123', 0, 'arturohv@munisc.go.cr', '0000-00-00 00:00:00', NULL),
(2, 'ESTUDIANTE 1', 'ESTUDIANTE', 'ESTUDIANTE 1', '1', '123', 0, 'arturohv@gmail.com', '0000-00-00 00:00:00', NULL),
(4, 'ESTUDIANTE 2', 'ESTUDIANTE', 'ESTUDIANTE 2', '1', '123', 0, 'arturohv@gmail.com', '0000-00-00 00:00:00', NULL),
(5, 'ESTUDIANTE 3', 'ESTUDIANTE 4', 'ESTUDIANTE \r\n', '1', '123', 0, 'arturohv@gmail.com', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupInfo_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `application_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `term_in_minutes` int(11) DEFAULT '0',
  `percent` int(11) DEFAULT '0',
  `comments` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `test`
--

INSERT INTO `test` (`id`, `groupInfo_id`, `description`, `application_date`, `status`, `term_in_minutes`, `percent`, `comments`, `created_at`, `updated_at`) VALUES
(1, 1, 'quiz de pruebas', '2013-10-27 00:00:00', 1, 60, 10, NULL, '0000-00-00 00:00:00', NULL),
(2, 1, 'quiz 2', '2013-10-28 00:00:00', 1, 60, 10, NULL, '0000-00-00 00:00:00', NULL),
(3, 1, 'quiz 3', '2013-10-29 00:00:00', 1, 60, 10, NULL, '0000-00-00 00:00:00', NULL),
(4, 1, 'quiz 4', '2013-10-30 00:00:00', 1, 60, 10, NULL, '0000-00-00 00:00:00', NULL),
(5, 1, 'quiz 5', '2013-10-31 00:00:00', 1, 60, 10, NULL, '0000-00-00 00:00:00', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
