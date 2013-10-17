-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-10-2013 a las 20:32:10
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sendquiz`
--
CREATE DATABASE IF NOT EXISTS `sendquiz` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sendquiz`;

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
(1, 'ISW', 'Ingenieria de Software', 'Ingenieria de Software', '0000-00-00 00:00:00', NULL),
(2, 'CYF', 'Contabilidad y Finanzas', 'Contabilidad y Finanzas', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `quarter` varchar(255) DEFAULT NULL,
  `professor_id` int(11) NOT NULL,
  `group_number` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `group`
--

INSERT INTO `group` (`id`, `course_id`, `quarter`, `professor_id`, `group_number`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 1, '1', 1, 1, '0000-00-00 00:00:00', NULL, 1),
(2, 2, '1', 2, 2, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification_sent`
--

CREATE TABLE IF NOT EXISTS `notification_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `professor`
--

INSERT INTO `professor` (`id`, `document_number`, `first_name`, `last_name`, `password`, `username`, `is_admin`, `email`, `created_at`, `updated_at`) VALUES
(1, '205780079', 'CARLOS', 'ALFARO', '123', 'carlosaa', 0, 'carlosaa@gmail.com', '0000-00-00 00:00:00', NULL),
(2, '205780071', 'MATIAS', 'LARA', '456', 'matiasll', 0, 'matiasll@gmail.com', '0000-00-00 00:00:00', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `question`
--

INSERT INTO `question` (`id`, `test_id`, `question_text`, `correct_answer_text`, `value`) VALUES
(1, 1, 'PREGUNTA 1', 'RESPUESTA 1', 1),
(2, 1, 'PREGUNTA 2', 'RESPUESTA 2', 1),
(3, 2, 'REOGUNTA 1', 'RESPUESTA 1', 1),
(4, 2, 'PREGUNTA 2', 'RESPUESTA 2', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_registration` (`group_id`,`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `registration`
--

INSERT INTO `registration` (`id`, `group_id`, `student_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`id`, `first_name`, `username`, `last_name`, `document_number`, `password`, `is_admin`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Arturo', 'arturohv', 'Herrera', '205780071', '123', 0, 'arturohv@gmail.com', '0000-00-00 00:00:00', NULL),
(2, 'Yadira', 'yadiracv', 'Cespedes', '205780089', '123', 0, 'arturohv@gmail.com', '0000-00-00 00:00:00', NULL),
(3, 'Karla', 'karlauu', 'Umana', '205780071', '123', 0, 'arherrera19@hotmail.com', '0000-00-00 00:00:00', NULL),
(4, 'Maria', 'mariapp', 'Prado', '205780073', '123', 0, 'arturohv@munis.go.cr', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `application_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `term_in_minutes` int(11) DEFAULT '0',
  `percent` int(11) DEFAULT '0',
  `comments` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `test`
--

INSERT INTO `test` (`id`, `group_id`, `description`, `application_date`, `status`, `term_in_minutes`, `percent`, `comments`, `created_at`, `updated_at`) VALUES
(1, 1, 'QUIZ 1 - ISW', '2013-10-12 00:00:00', 1, 30, 5, 'NINGUNO', '0000-00-00 00:00:00', NULL),
(2, 1, 'QUIZ 2 - ISW', '2013-10-31 00:00:00', 1, 60, 5, 'NINGUNO', '0000-00-00 00:00:00', NULL),
(3, 2, 'QUIZ 1 - CONTA', '2013-10-17 00:00:00', 1, 60, 5, 'NINGUNO', '0000-00-00 00:00:00', NULL),
(4, 2, 'QUIZ 2 - CONTA', '2013-10-18 00:00:00', 1, 60, 5, 'NINGUNO', '0000-00-00 00:00:00', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
