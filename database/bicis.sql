-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2024 a las 13:50:30
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bicis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicycles`
--

CREATE TABLE `bicycles` (
  `id_bici` char(36) NOT NULL,
  `codigo_bici` varchar(50) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `estado_actual` varchar(100) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `ubicacion_actual` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicycle_locations`
--

CREATE TABLE `bicycle_locations` (
  `id_ubicacion` char(36) NOT NULL,
  `id_bici` char(36) DEFAULT NULL,
  `latitud` decimal(9,6) DEFAULT NULL,
  `longitud` decimal(9,6) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicycle_photos`
--

CREATE TABLE `bicycle_photos` (
  `id_foto` char(36) NOT NULL,
  `id_bici` char(36) DEFAULT NULL,
  `id_usuario` char(36) DEFAULT NULL,
  `url_foto` varchar(255) NOT NULL,
  `fecha_subida` timestamp NOT NULL DEFAULT current_timestamp(),
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicycle_reports`
--

CREATE TABLE `bicycle_reports` (
  `id_reporte` char(36) NOT NULL,
  `id_bici` char(36) DEFAULT NULL,
  `id_usuario` char(36) DEFAULT NULL,
  `tipo_reporte` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_reporte` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicycle_status_history`
--

CREATE TABLE `bicycle_status_history` (
  `id_historial` char(36) NOT NULL,
  `id_bici` char(36) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicycle_zones`
--

CREATE TABLE `bicycle_zones` (
  `id_zona` char(36) NOT NULL,
  `nombre_zona` varchar(255) DEFAULT NULL,
  `latitud_inicial` decimal(9,6) DEFAULT NULL,
  `longitud_inicial` decimal(9,6) DEFAULT NULL,
  `latitud_final` decimal(9,6) DEFAULT NULL,
  `longitud_final` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_usuario` char(36) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `password_hash` varchar(255) NOT NULL,
  `saldo` decimal(10,2) DEFAULT 0.00,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_payments`
--

CREATE TABLE `user_payments` (
  `id_pago` char(36) NOT NULL,
  `id_usuario` char(36) DEFAULT NULL,
  `id_foto` char(36) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado_pago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `id_rol` char(36) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verification_tasks`
--

CREATE TABLE `verification_tasks` (
  `id_tarea` char(36) NOT NULL,
  `id_bici` char(36) DEFAULT NULL,
  `id_usuario` char(36) DEFAULT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado_tarea` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bicycles`
--
ALTER TABLE `bicycles`
  ADD PRIMARY KEY (`id_bici`);

--
-- Indices de la tabla `bicycle_locations`
--
ALTER TABLE `bicycle_locations`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD KEY `id_bici` (`id_bici`);

--
-- Indices de la tabla `bicycle_photos`
--
ALTER TABLE `bicycle_photos`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `id_bici` (`id_bici`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `bicycle_reports`
--
ALTER TABLE `bicycle_reports`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `id_bici` (`id_bici`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `bicycle_status_history`
--
ALTER TABLE `bicycle_status_history`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_bici` (`id_bici`);

--
-- Indices de la tabla `bicycle_zones`
--
ALTER TABLE `bicycle_zones`
  ADD PRIMARY KEY (`id_zona`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_foto` (`id_foto`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `verification_tasks`
--
ALTER TABLE `verification_tasks`
  ADD PRIMARY KEY (`id_tarea`),
  ADD KEY `id_bici` (`id_bici`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bicycle_locations`
--
ALTER TABLE `bicycle_locations`
  ADD CONSTRAINT `bicycle_locations_ibfk_1` FOREIGN KEY (`id_bici`) REFERENCES `bicycles` (`id_bici`);

--
-- Filtros para la tabla `bicycle_photos`
--
ALTER TABLE `bicycle_photos`
  ADD CONSTRAINT `bicycle_photos_ibfk_1` FOREIGN KEY (`id_bici`) REFERENCES `bicycles` (`id_bici`),
  ADD CONSTRAINT `bicycle_photos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id_usuario`);

--
-- Filtros para la tabla `bicycle_reports`
--
ALTER TABLE `bicycle_reports`
  ADD CONSTRAINT `bicycle_reports_ibfk_1` FOREIGN KEY (`id_bici`) REFERENCES `bicycles` (`id_bici`),
  ADD CONSTRAINT `bicycle_reports_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id_usuario`);

--
-- Filtros para la tabla `bicycle_status_history`
--
ALTER TABLE `bicycle_status_history`
  ADD CONSTRAINT `bicycle_status_history_ibfk_1` FOREIGN KEY (`id_bici`) REFERENCES `bicycles` (`id_bici`);

--
-- Filtros para la tabla `user_payments`
--
ALTER TABLE `user_payments`
  ADD CONSTRAINT `user_payments_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id_usuario`),
  ADD CONSTRAINT `user_payments_ibfk_2` FOREIGN KEY (`id_foto`) REFERENCES `bicycle_photos` (`id_foto`);

--
-- Filtros para la tabla `verification_tasks`
--
ALTER TABLE `verification_tasks`
  ADD CONSTRAINT `verification_tasks_ibfk_1` FOREIGN KEY (`id_bici`) REFERENCES `bicycles` (`id_bici`),
  ADD CONSTRAINT `verification_tasks_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
