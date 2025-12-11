-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2025 a las 00:14:37
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
-- Base de datos: `estacion_policia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arrestos`
--

CREATE TABLE `arrestos` (
  `id_reporte` int(11) NOT NULL,
  `id_criminal` int(11) NOT NULL,
  `id_policia` int(11) NOT NULL,
  `fechahora_arresto` timestamp NOT NULL DEFAULT current_timestamp(),
  `lugar_arresto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arrestos`
--

INSERT INTO `arrestos` (`id_reporte`, `id_criminal`, `id_policia`, `fechahora_arresto`, `lugar_arresto`) VALUES
(1, 1, 1, '2025-11-04 23:07:34', 'Centro Comercial'),
(2, 2, 2, '2025-11-04 23:07:34', 'Parque Central'),
(3, 3, 3, '2025-11-04 23:07:34', 'Banco'),
(4, 4, 4, '2025-11-04 23:07:34', 'Zona Industrial'),
(5, 5, 5, '2025-11-04 23:07:34', 'Barrio Grove street');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos`
--

CREATE TABLE `autos` (
  `id` int(11) NOT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `id_estacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autos`
--

INSERT INTO `autos` (`id`, `matricula`, `marca`, `modelo`, `estado`, `id_estacion`) VALUES
(1, 'AAA111', 'Renault', 'Logan', 'Activo', 1),
(2, 'BBB222', 'Chevrolet', 'Camaro', 'En mantenimiento', 2),
(3, 'CCC333', 'BMW', 'X1', 'Activo', 3),
(4, 'DDD444', 'Mazda', '3', 'Disponible', 4),
(5, 'EEE555', 'Nissan', 'SR', 'Revisión', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auto_policia`
--

CREATE TABLE `auto_policia` (
  `id_policia` int(11) NOT NULL,
  `id_auto` int(11) NOT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_desasignacion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auto_policia`
--

INSERT INTO `auto_policia` (`id_policia`, `id_auto`, `fecha_asignacion`, `fecha_desasignacion`) VALUES
(1, 1, '2025-11-04 23:07:34', NULL),
(2, 2, '2025-11-04 23:07:34', NULL),
(3, 3, '2025-11-04 23:07:34', NULL),
(4, 4, '2025-11-04 23:07:34', NULL),
(5, 5, '2025-11-04 23:07:34', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `gravedad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`, `descripcion`, `gravedad`) VALUES
(1, 'Robo', 'Hurto a mano armada en tienda', 3),
(2, 'Asalto', 'Agresión física con arma blanca', 4),
(3, 'Secuestro', 'Privación ilegal de la libertad', 5),
(4, 'Fraude', 'Falsificación de documentos públicos', 2),
(5, 'Homicidio', 'Asesinato con premeditación', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criminales`
--

CREATE TABLE `criminales` (
  `id` int(11) NOT NULL,
  `nombrecompleto` varchar(200) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `criminales`
--

INSERT INTO `criminales` (`id`, `nombrecompleto`, `fechanacimiento`, `direccion`, `telefono`) VALUES
(1, 'Franklin C.', '1988-03-23', 'Cr 5 #55-55', 320111111),
(2, 'Carl J.', '1968-04-19', 'Cr 6 #66-66', 320222222),
(3, 'Big Smoke', '1965-10-04', 'Cr 7 #77-77', 320333333),
(4, 'Cesar Vialpando', '1970-12-12', 'Cr 8 #88-88', 320444444),
(5, 'Martin Madrazo', '1962-04-24', 'Cr 9 #99-99', 320555555);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delito_criminal`
--

CREATE TABLE `delito_criminal` (
  `id_criminal` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_reporte` int(11) NOT NULL,
  `fecha_imputacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `sentencia` varchar(500) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `delito_criminal`
--

INSERT INTO `delito_criminal` (`id_criminal`, `id_cargo`, `id_reporte`, `fecha_imputacion`, `sentencia`, `estado`) VALUES
(1, 1, 1, '2025-11-04 23:07:34', '2 años de prisión', 'Cumpliendo'),
(2, 2, 2, '2025-11-04 23:07:34', '3 años de prisión', 'Cumpliendo'),
(3, 3, 3, '2025-11-04 23:07:34', '10 años de prisión', 'Cumplido'),
(4, 4, 4, '2025-11-04 23:07:34', '15 años de prisión', 'En proceso'),
(5, 5, 5, '2025-11-04 23:07:34', '100 años de prisión', 'En proceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE `estaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estaciones`
--

INSERT INTO `estaciones` (`id`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Estación Central', 'Cr 0 #00-00', 300000000),
(2, 'Estación Norte', 'Cr 1 #11-11', 311111111),
(3, 'Estación Sur', 'Cr 2 #22-22', 322222222),
(4, 'Estación Occidente', 'Cr 3 80 #33-33', 333333333),
(5, 'Estación Oriente', 'Cr 4 #44-44', 344444444);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `policias`
--

CREATE TABLE `policias` (
  `id` int(11) NOT NULL,
  `nombrecompleto` varchar(200) DEFAULT NULL,
  `fechacontrato` date DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_estacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `policias`
--

INSERT INTO `policias` (`id`, `nombrecompleto`, `fechacontrato`, `telefono`, `email`, `id_estacion`) VALUES
(1, 'Pablo Daza', '2025-12-09', 355555555, 'pablo@policia.gov', 1),
(2, 'Johan Castro', '2024-07-16', 366666666, 'jogan@policia.gov', 2),
(3, 'Pablo Mozuca', '2023-02-22', 377777777, 'pmozuca@policia.gov', 3),
(4, 'Santiago Beltran', '2022-01-03', 388888888, 'santiago@policia.gov', 4),
(5, 'David Perez', '2023-11-29', 399999999, 'dperez@policia.gov', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id` int(11) NOT NULL,
  `fecha_incidente` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lugar_incidente` varchar(255) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `id_policia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id`, `fecha_incidente`, `lugar_incidente`, `descripcion`, `tipo`, `estado`, `id_policia`) VALUES
(1, '2025-11-04 23:07:34', 'Centro Comercial', 'Intento de robo a mano armada', 'Robo', 'Abierto', 1),
(2, '2025-11-04 23:07:34', 'Parque Central', 'Asalto a un transeúnte', 'Asalto', 'Cerrado', 2),
(3, '2025-11-04 23:07:34', 'Banco', 'Falsificación de cheques', 'Fraude', 'Abierto', 3),
(4, '2025-11-04 23:07:34', 'Zona Industrial', 'Secuestro de un empresario', 'Secuestro', 'Investigación', 4),
(5, '2025-11-04 23:07:34', 'Barrio Grove street', 'Homicidio con arma de fuego', 'Homicidio', 'Cerrado', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arrestos`
--
ALTER TABLE `arrestos`
  ADD PRIMARY KEY (`id_reporte`,`id_criminal`),
  ADD KEY `id_criminal` (`id_criminal`),
  ADD KEY `id_policia` (`id_policia`);

--
-- Indices de la tabla `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estacion` (`id_estacion`);

--
-- Indices de la tabla `auto_policia`
--
ALTER TABLE `auto_policia`
  ADD PRIMARY KEY (`id_policia`,`id_auto`),
  ADD KEY `id_auto` (`id_auto`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `criminales`
--
ALTER TABLE `criminales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `delito_criminal`
--
ALTER TABLE `delito_criminal`
  ADD PRIMARY KEY (`id_criminal`,`id_cargo`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `id_reporte` (`id_reporte`);

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `policias`
--
ALTER TABLE `policias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estacion` (`id_estacion`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_policia` (`id_policia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autos`
--
ALTER TABLE `autos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `criminales`
--
ALTER TABLE `criminales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `policias`
--
ALTER TABLE `policias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arrestos`
--
ALTER TABLE `arrestos`
  ADD CONSTRAINT `arrestos_ibfk_1` FOREIGN KEY (`id_reporte`) REFERENCES `reportes` (`id`),
  ADD CONSTRAINT `arrestos_ibfk_2` FOREIGN KEY (`id_criminal`) REFERENCES `criminales` (`id`),
  ADD CONSTRAINT `arrestos_ibfk_3` FOREIGN KEY (`id_policia`) REFERENCES `policias` (`id`);

--
-- Filtros para la tabla `autos`
--
ALTER TABLE `autos`
  ADD CONSTRAINT `autos_ibfk_1` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones` (`id`);

--
-- Filtros para la tabla `auto_policia`
--
ALTER TABLE `auto_policia`
  ADD CONSTRAINT `auto_policia_ibfk_1` FOREIGN KEY (`id_policia`) REFERENCES `policias` (`id`),
  ADD CONSTRAINT `auto_policia_ibfk_2` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id`);

--
-- Filtros para la tabla `delito_criminal`
--
ALTER TABLE `delito_criminal`
  ADD CONSTRAINT `delito_criminal_ibfk_1` FOREIGN KEY (`id_criminal`) REFERENCES `criminales` (`id`),
  ADD CONSTRAINT `delito_criminal_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id`),
  ADD CONSTRAINT `delito_criminal_ibfk_3` FOREIGN KEY (`id_reporte`) REFERENCES `reportes` (`id`);

--
-- Filtros para la tabla `policias`
--
ALTER TABLE `policias`
  ADD CONSTRAINT `policias_ibfk_1` FOREIGN KEY (`id_estacion`) REFERENCES `estaciones` (`id`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`id_policia`) REFERENCES `policias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
