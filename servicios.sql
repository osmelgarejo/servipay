-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2022 a las 14:38:56
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `servicios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `cedula`, `correo`) VALUES
(1, 'oscar', '4655925', 'od.melgarejo@gmail.com'),
(2, 'luis meza', '123456', 'luismeza@gmail.com'),
(3, '3', '3', 'luismeza3@gmail.com'),
(4, 'jose cazal', '12345', 'jcazal@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `concepto_id` int(11) NOT NULL,
  `concepto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `conceptos`
--

INSERT INTO `conceptos` (`concepto_id`, `concepto`, `monto`) VALUES
(1, 'ANDE', 50000),
(2, 'ESSAP', 60000),
(3, 'PERSONAL INTERNET', 160000),
(4, 'SEGURO MAPFRE', 150000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `parametro_id` int(11) NOT NULL,
  `api_key` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `api_url` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`parametro_id`, `api_key`, `api_url`) VALUES
(1, 'ap-5eaeae7e8efc2f58701f0d51', 'https://staging.adamspay.com/api/v1/debts');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `servicio_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `monto` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `concepto_id` int(11) NOT NULL,
  `url_pago` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`servicio_id`, `fecha`, `estado`, `monto`, `cliente_id`, `concepto_id`, `url_pago`) VALUES
(8, '2022-05-08', 'PENDIENTE', 160000, 1, 3, NULL),
(9, '2022-05-09', 'PENDIENTE', 60000, 1, 2, NULL),
(10, '2022-05-09', 'PENDIENTE', 50000, 1, 1, NULL),
(11, '2022-05-09', 'PENDIENTE', 50000, 1, 1, NULL),
(12, '2022-05-09', 'PENDIENTE', 50000, 1, 1, NULL),
(13, '2022-05-09', 'PENDIENTE', 60000, 1, 2, NULL),
(14, '2022-05-09', 'PENDIENTE', 150000, 4, 4, NULL),
(15, '2022-05-09', 'PENDIENTE', 60000, 4, 2, NULL),
(16, '2022-05-09', 'PENDIENTE', 60000, 1, 2, NULL),
(17, '2022-05-09', 'PENDIENTE', 50000, 1, 1, NULL),
(18, '2022-05-09', 'PENDIENTE', 60000, 1, 2, NULL),
(19, '2022-05-09', 'PENDIENTE', 60000, 1, 2, NULL),
(20, '2022-05-09', 'PENDIENTE', 60000, 1, 2, NULL),
(21, '2022-05-09', 'PENDIENTE', 60000, 1, 2, NULL),
(22, '2022-05-09', 'PENDIENTE', 60000, 1, 2, 'https://staging.adamspay.com/pay/denuncias897/debt/22'),
(23, '2022-05-09', 'PENDIENTE', 60000, 1, 2, NULL),
(24, '2022-05-09', 'PENDIENTE', 160000, 1, 3, NULL),
(25, '2022-05-09', 'PENDIENTE', 50000, 1, 1, 'https://staging.adamspay.com/pay/denuncias897/debt/25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`concepto_id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`parametro_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`servicio_id`),
  ADD KEY `conceptos_servicios_fk` (`concepto_id`),
  ADD KEY `clientes_servicios_fk` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `concepto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `servicio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `clientes_servicios_fk` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `conceptos_servicios_fk` FOREIGN KEY (`concepto_id`) REFERENCES `conceptos` (`concepto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
