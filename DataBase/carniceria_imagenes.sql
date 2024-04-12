-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-04-2024 a las 04:43:47
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carniceria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

DROP TABLE IF EXISTS `carrito`;
CREATE TABLE IF NOT EXISTS `carrito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_producto` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `id_producto`, `id_usuario`, `cantidad`) VALUES
(84, 1, 34, 1),
(85, 3, 34, 1),
(86, 6, 34, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

DROP TABLE IF EXISTS `oferta`;
CREATE TABLE IF NOT EXISTS `oferta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_inicio` text COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_fin` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oferta`
--

INSERT INTO `oferta` (`id`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Primera prueba', '06-04-2024', '07-04-2024'),
(2, 'Oferta pasada', '01-04-2024', '05-04-2024'),
(3, 'Oferta de exámenes', '03-04-2024', '10-04-2024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `animal` text COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` text COLLATE utf8mb4_general_ci NOT NULL,
  `precio` float NOT NULL,
  `cantidad` float NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci NOT NULL,
  `fotito` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `animal`, `nombre`, `precio`, `cantidad`, `descripcion`, `fotito`) VALUES
(1, 'cerdo', 'Chorizo', 145, 5, 'Chorizo hecho con carne de de cerdo', 1),
(2, 'Vaca', 'Tasajo', 120, 21, 'Tasajo hecho con carne de de Vaca', 1),
(3, 'Cerdo', 'Chuleta', 130, 9, 'Lomo del cerdo', 1),
(5, 'Vaca', 'Cecina', 130, 19, 'Carne enchilada', 1),
(6, 'Cerdo', 'Chicharrón', 130, 30, 'Chicharrón de cerdo', 1),
(7, 'Buey', 'Picaña', 170, 40, 'Picaña de res', 1),
(8, 'Vaca', 'New York', 300, 30, 'Corte New York o Strip Loin de vaca', 1),
(9, 'Cerdo', 'Longaniza', 120, 40, 'Longaniza de carne de cerdo', 1),
(10, 'Buey', 'Tomahawk', 500, 15, 'Corte extraído de las costillas delanteras de la res', 1),
(11, 'Vaca', 'Rib Eye', 700, 10, 'Filete extraído de la costilla de ternera Wagyū', 1),
(12, 'Cerdo', 'Pork Belly', 200, 15, 'Panza de cerdo cruda', 1),
(13, 'Vaca', 'Tuetano', 150, 20, 'Tuetano de vaca', 1),
(14, 'Buey', 'Arrachera', 300, 20, 'Arrachera de res', 1),
(15, 'Cerdo', 'Manteca', 500, 40, 'Manteca de cerdo premium', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_oferta`
--

DROP TABLE IF EXISTS `producto_oferta`;
CREATE TABLE IF NOT EXISTS `producto_oferta` (
  `id_producto` bigint NOT NULL,
  `id_oferta` bigint NOT NULL,
  `precio_orig` float NOT NULL,
  `porc_descuento` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_oferta`
--

INSERT INTO `producto_oferta` (`id_producto`, `id_oferta`, `precio_orig`, `porc_descuento`) VALUES
(1, 1, 98, 0),
(3, 1, 130, 20),
(5, 2, 130, 15),
(9, 2, 120, 15),
(6, 3, 130, 20),
(14, 3, 300, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `descripcion`) VALUES
(1, 'consumidor', 'Este usuario solo puedo hacer compras'),
(2, 'empleado', 'Este usuario puede hacer compras ademas de poder modificar directamente los productos.'),
(3, 'administrador', 'Este usuario tiene acceso a toda la informacion dentro de la base de datos excepto a las contraseñas de los demas usuarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_rol` bigint NOT NULL,
  `nombre` text COLLATE utf8mb4_general_ci NOT NULL,
  `correo` text COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` text COLLATE utf8mb4_general_ci NOT NULL,
  `contra` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `id_rol`, `nombre`, `correo`, `telefono`, `contra`) VALUES
(1, 2, 'Juan Perez Guzman', 'juan@@gmail.com', '9512313256', 'eqweqw'),
(5, 3, 'Manuel Ramirez', 'manu48@gmail.com', '9514585462', ' '),
(6, 3, 'Jennifer', 'Jeni@@gmail.com', '8247234', 'dfsd3423d'),
(24, 1, 'Omar', 'Barra', '31231231', 'rwerw'),
(25, 1, 'juanito alcachofa', 'juan@gmail.com', 'sadasdasd', 'sdasdasda'),
(30, 1, 'kevin Caballero', 'a', '1211', '123'),
(31, 1, 'Erik', 'erick@@gs.utm.mx', '12356788i', '1234'),
(34, 3, 'Kevin Caballerob Hernandez', 'kio@gmail.com', '9879812312', '$2a$10$Qhr6oAkQfEL3eO0xKMiXX.tDyQumF0MmTZjmXx4uhlJlNzRfl81iy'),
(35, 2, 'Juan Perez Guzman', 'juan@gmail.com', '9512313256', '$2a$10$bmYFJss1X7TzK8oqE/zkJ.HQNu/zgy586e7GbQEt0FVtiI1oGGu02'),
(36, 1, 'Erik', 'erick@gs.utm.mx', '12356788i', '$2a$10$7TXWnYLsRn7a7V50JODkvOBZjTj33G1m3xU/LSf1egs12T/lXx6du'),
(37, 1, 'Jennifer', 'Jeni@gmail.com', '8247234', '$2a$10$EDXIrwMIrxydRJAwdWlpLO6QdU2syGf99u9M.qGH/j0bPZLk91EYW'),
(38, 3, 'ha', 'sad', '125423652', '$2a$10$V6LZEqStQ70lbmNDIMLqQuyljU02XOlFroAPWeN/LEp07Zkf92.5O'),
(40, 1, 'kevin', 'gamemode948a@gmail.com', '42342342', '$2a$10$87BZIOc.KWjATdiyinRLa.2tL/afI48gcoL.a7rsp9Hl4dLQ9/mVy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_producto` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `fecha` text COLLATE utf8mb4_general_ci NOT NULL,
  `cantidad` float NOT NULL,
  `monto` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `id_producto`, `id_usuario`, `fecha`, `cantidad`, `monto`) VALUES
(1, 1, 6, '2023-04-23', 1.5, 130),
(2, 1, 6, '2023-12-05', 3, 294),
(3, 1, 6, '2023-12-05', 10, 980),
(5, 1, 5, '2023-12-05', 30, 2940),
(6, 1, 5, '2023-12-05', 30, 2940),
(7, 1, 5, '2023-10-05', 30, 2940),
(8, 1, 1, '2023-10-05', 30, 2940),
(9, 1, 1, '2023-10-05', 30, 2940),
(10, 1, 1, '2023-12-05', 30, 2940),
(11, 1, 6, '2023-12-06', 3, 294),
(12, 2, 6, '2023-12-06', 2, 240),
(13, 2, 6, '2024-01-31', 2, 240),
(14, 1, 6, '2024-01-31', 2, 196),
(15, 3, 6, '2024-01-31', 2, 260),
(16, 1, 6, '2024-01-31', 2, 196),
(17, 1, 6, '2024-01-31', 1, 98),
(18, 1, 6, '2024-01-31', 1, 98),
(19, 2, 6, '2024-01-31', 1, 120),
(20, 3, 6, '2024-01-31', 1, 130),
(21, 3, 6, '2024-01-31', 1, 130),
(22, 3, 6, '2024-01-31', 1, 130),
(23, 3, 6, '2024-01-31', 1, 130),
(28, 1, 30, '2024-03-05', 5, 490),
(29, 1, 1, '2024-03-10', 12, 1176),
(39, 1, 6, '2024-03-11', 4, 392),
(42, 1, 6, '2024-03-11', 4, 392),
(43, 1, 6, '2024-03-11', 2, 196),
(45, 1, 6, '2024-03-11', 8, 784),
(47, 1, 6, '2024-03-11', 5, 490),
(48, 1, 6, '2024-03-11', 3, 294),
(50, 1, 6, '2024-03-11', 4, 392),
(52, 1, 6, '2024-03-11', 4, 392),
(54, 1, 6, '2024-03-11', 4, 392),
(56, 1, 6, '2024-03-11', 4, 392),
(58, 1, 6, '2024-03-11', 5, 490),
(60, 1, 6, '2024-03-11', 4, 392),
(64, 1, 34, '2024-03-15', 10, 980),
(66, 1, 34, '2024-03-15', 11, 1078),
(68, 1, 34, '2024-03-15', 9, 882),
(70, 1, 34, '2024-03-15', 6, 588),
(71, 1, 34, '2024-03-19', 15, 1470),
(72, 1, 37, '2024-03-19', 7, 686),
(73, 1, 34, '2024-03-19', 8, 784),
(74, 1, 34, '2024-04-11', 1, 145),
(75, 3, 34, '2024-04-11', 1, 130),
(76, 5, 34, '2024-04-11', 1, 130);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
