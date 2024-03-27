-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2024 a las 13:28:07
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
-- Base de datos: `turnero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `ID` bigint(20) NOT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`ID`, `APELLIDO`, `DNI`, `NOMBRE`) VALUES
(1, 'Arrabe', '70818300N', 'Ivan'),
(2, 'Fernandez', '70845271K', 'Pedro'),
(3, 'Domínguez', '70258963L', 'Adrián'),
(4, 'Martín', '71489635P', 'Raúl'),
(5, 'Moro', '72589471V', 'Raquel'),
(6, 'Fuentes', '70258974H', 'Manuel'),
(7, 'Barbudo', '71587478T', 'Ana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano_turno`
--

CREATE TABLE `ciudadano_turno` (
  `Ciudadano_ID` bigint(20) NOT NULL,
  `listaTurnos_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ciudadano_turno`
--

INSERT INTO `ciudadano_turno` (`Ciudadano_ID`, `listaTurnos_ID`) VALUES
(1, 1),
(1, 2),
(1, 9),
(2, 3),
(2, 4),
(3, 6),
(3, 10),
(4, 5),
(4, 11),
(5, 7),
(5, 8),
(6, 12),
(7, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `ID` bigint(20) NOT NULL,
  `ESTADO` varchar(255) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `TRAMITE` varchar(255) DEFAULT NULL,
  `CIUDADANO_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`ID`, `ESTADO`, `FECHA`, `TRAMITE`, `CIUDADANO_ID`) VALUES
(1, 'Atendido', '2024-03-22', 'Solicitud de certificado electronico', 1),
(2, 'Atendido', '2024-03-17', 'Solicitud de vida laboral', 1),
(3, 'Atendido', '2024-03-12', 'Solicitud de beca de estudios', 2),
(4, 'En espera', '2024-03-22', 'Solicitud de hora para renovar DNI', 2),
(5, 'Atendido', '2024-03-22', 'Solicitud de certificado electronico', 4),
(6, 'En espera', '2024-03-17', 'Solicitud de vida laboral', 3),
(7, 'Atendido', '2024-03-17', 'Solicitud de beca de estudios', 5),
(8, 'En espera', '2024-03-22', 'Solicitud de vida laboral', 5),
(9, 'Atendido', '2024-03-22', 'Solicitud de historial medico', 1),
(10, 'En espera', '2024-03-22', 'Solicitud de beca de estudios', 3),
(11, 'En espera', '2024-03-17', 'Solicitud de certificado electronico', 4),
(12, 'En espera', '2024-03-17', 'Solicitud de beca de estudios', 6),
(13, 'En espera', '2024-03-22', 'Solicitud de vida laboral', 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ciudadano_turno`
--
ALTER TABLE `ciudadano_turno`
  ADD PRIMARY KEY (`Ciudadano_ID`,`listaTurnos_ID`),
  ADD KEY `FK_CIUDADANO_TURNO_listaTurnos_ID` (`listaTurnos_ID`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_TURNO_CIUDADANO_ID` (`CIUDADANO_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudadano_turno`
--
ALTER TABLE `ciudadano_turno`
  ADD CONSTRAINT `FK_CIUDADANO_TURNO_Ciudadano_ID` FOREIGN KEY (`Ciudadano_ID`) REFERENCES `ciudadano` (`ID`),
  ADD CONSTRAINT `FK_CIUDADANO_TURNO_listaTurnos_ID` FOREIGN KEY (`listaTurnos_ID`) REFERENCES `turno` (`ID`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `FK_TURNO_CIUDADANO_ID` FOREIGN KEY (`CIUDADANO_ID`) REFERENCES `ciudadano` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
