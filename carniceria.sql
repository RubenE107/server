-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-03-2024 a las 01:45:10
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `id_producto`, `id_usuario`, `cantidad`) VALUES
(1, 0, 1, 30),
(25, 1, 6, 1),
(26, 2, 6, 1),
(27, 3, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `animal` text NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` float NOT NULL,
  `cantidad` float NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `animal`, `nombre`, `precio`, `cantidad`, `descripcion`) VALUES
(1, 'cerdo', 'Chorizo', 98, 15, 'Chorizo hecho con carne de de cerdo'),
(2, 'vaca', 'Tasajo', 120, 21, 'Tasajo hecho con carne de de Vaca'),
(3, 'cerdo', 'Chuleta', 130, 10, 'Lomo del cerdo'),
(5, 'Vaca', 'Cesina', 130, 20, 'Carne enchilada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `nombre` text NOT NULL,
  `correo` text NOT NULL,
  `telefono` text NOT NULL,
  `contra` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `id_rol`, `nombre`, `correo`, `telefono`, `contra`) VALUES
(1, 1, 'Juan Perez Guzman', 'juan@gmail.com', '9512313256', 'eqweqw'),
(5, 3, 'Manuel Ramirez', 'manu48@gmail.com', '9514585462', ' '),
(6, 3, 'Jennifer', 'Jeni@gmail.com', '8247234', 'dfsd3423d'),
(13, 2, 'Ricardo', 'richi@gmail.com', '1234567890', '1234'),
(17, 3, 'Kevin Caballerob Hernandez', 'kio@gmail.com', '9879812312', 'asdf'),
(24, 1, 'Omar', 'Barra', '31231231', 'rwerw'),
(25, 1, 'juanito alcachofa', 'juan@gmail.com', 'sadasdasd', 'sdasdasda'),
(30, 1, 'kevin Caballero', 'a', '1211', '123'),
(31, 1, 'Erik', 'erick@gs.utm.mx', '12356788i', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_producto` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `fecha` text NOT NULL,
  `cantidad` float NOT NULL,
  `monto` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(24, 1, 17, '2024-03-03', 1, 98),
(25, 1, 17, '2024-03-05', 3, 294),
(26, 5, 17, '2024-03-05', 19, 2470),
(27, 5, 17, '2024-03-05', 1.5, 195),
(28, 1, 30, '2024-03-05', 5, 490);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
