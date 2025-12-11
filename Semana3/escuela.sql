-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2025 a las 00:14:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `nombrecompleto` varchar(200) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `id_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombrecompleto`, `direccion`, `telefono`, `id_grupo`) VALUES
(1, 'Pablo Mozuca', 'Cr 5 #55-55', 355555555, 1),
(2, 'Pablo Daza', 'Cr 6 #66-66', 366666666, 3),
(3, 'Johan Castro', 'Cr7 #77-77', 377777777, 3),
(4, 'Santiago Beltran', 'Cr 8 #88-88', 388888888, 2),
(5, 'Johan Daza', 'Cr 9 #99-99', 399999999, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `nombre`) VALUES
(1, 'Inglés'),
(2, 'Álgebra'),
(3, 'Geometría'),
(4, 'Filosofía'),
(5, 'Ciencias Sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `salon` int(11) DEFAULT NULL,
  `id_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `nombre`, `turno`, `salon`, `id_profesor`) VALUES
(1, 'Grupo 1A', 'Tarde', 1, 2),
(2, 'Grupo 2A', 'Tarde', 2, 1),
(3, 'Grupo 1B', 'Mañana', 3, 5),
(4, 'Grupo 2B', 'Mañana', 4, 4),
(5, 'Grupo 3B', 'Tarde', 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imparticion`
--

CREATE TABLE `imparticion` (
  `id_grupo` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `horario` varchar(100) DEFAULT NULL,
  `id_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imparticion`
--

INSERT INTO `imparticion` (`id_grupo`, `id_curso`, `horario`, `id_profesor`) VALUES
(1, 2, 'Lunes 12-5pm', 2),
(2, 1, 'Martes 1-6pm', 1),
(3, 5, 'Miércoles 8-10am', 5),
(4, 4, 'Jueves 7-10am', 4),
(5, 3, 'Viernes 1-6pm', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `id` int(11) NOT NULL,
  `fecha_matricula` date DEFAULT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`id`, `fecha_matricula`, `id_grupo`, `id_alumno`) VALUES
(1, '2025-01-10', 1, 1),
(2, '2025-01-11', 3, 2),
(3, '2025-01-11', 3, 3),
(4, '2025-01-12', 2, 4),
(5, '2025-01-15', 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `id` int(11) NOT NULL,
  `valornota` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_alumno` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`id`, `valornota`, `fecha`, `id_alumno`, `id_curso`) VALUES
(1, 4.7, '2025-11-04 22:27:13', 1, 2),
(2, 3.2, '2025-11-04 22:27:13', 2, 5),
(3, 2.5, '2025-11-04 22:27:13', 3, 5),
(4, 5, '2025-11-04 22:27:13', 4, 1),
(5, 4.3, '2025-11-04 22:27:13', 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` int(11) NOT NULL,
  `nombrecompleto` varchar(200) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `asignatura` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `nombrecompleto`, `direccion`, `telefono`, `asignatura`) VALUES
(1, 'Sans U.', 'Cr 0 #00-00', 300000000, 'Inglés'),
(2, 'Steve M. ', 'Cr 1 #11-11', 311111111, 'Álgebra'),
(3, 'Carl J.', 'Cr 2 #22-22', 322222222, 'Geometría'),
(4, 'Martha R.', 'Cr 3 #33-33', 333333333, 'Filosofía'),
(5, 'Sabrina C.', 'Cr 4 #44-44', 344444444, 'Ciencias Sociales');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_grupo` (`id_grupo`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `imparticion`
--
ALTER TABLE `imparticion`
  ADD PRIMARY KEY (`id_grupo`,`id_curso`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_grupo` (`id_grupo`),
  ADD KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`);

--
-- Filtros para la tabla `imparticion`
--
ALTER TABLE `imparticion`
  ADD CONSTRAINT `imparticion_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `imparticion_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `imparticion_ibfk_3` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
