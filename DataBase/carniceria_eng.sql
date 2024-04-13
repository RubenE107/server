-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-04-2024 a las 19:26:43
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

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
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` text COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_inicio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_fin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oferta`
--

INSERT INTO `oferta` (`id`, `nombre`, `name`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Primera prueba', 'First test', '06-04-2024', '07-04-2024'),
(2, 'Oferta pasada', 'Last offer', '01-04-2024', '05-04-2024'),
(3, 'Oferta de exámenes', 'Examination offer', '03-04-2024', '10-04-2024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `animal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `animal_eng` text COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` text COLLATE utf8mb4_general_ci NOT NULL,
  `precio` float NOT NULL,
  `cantidad` float NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `fotito` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `animal`, `animal_eng`, `nombre`, `name`, `precio`, `cantidad`, `descripcion`, `description`, `fotito`) VALUES
(1, 'Cerdo', 'Pig', 'Chorizo', 'Chorizo', 145, 5, 'Chorizo hecho con carne de de cerdo', 'Chorizo made with pork meat', 1),
(2, 'Vaca', 'Cow', 'Tasajo', 'Dried beef', 120, 21, 'Tasajo hecho con carne de de Vaca', 'Tasajo made with beef', 1),
(3, 'Cerdo', 'Pig', 'Chuleta', 'Pork Steak', 130, 9, 'Tradicional lomo del cerdo', 'Traditional pork loin', 1),
(5, 'Vaca', 'Cow', 'Cecina', 'Cured meat', 130, 19, 'Carne marinada en chiles guajillos', 'Meat marinated in guajillo chiles', 1),
(6, 'Cerdo', 'Pig', 'Chicharrón', 'Chicharron', 130, 30, 'Snack crujiente de piel de cerdo frita', 'Crunchy fried pork skin snack', 1),
(7, 'Buey', 'Beef', 'Picaña', 'Picanha', 170, 40, 'Corte jugoso y marmoleado de la grupa', 'Juicy and marbled cut of the rump', 1),
(8, 'Vaca', 'Cow', 'New York', 'York', 300, 30, 'Corte New York o Strip Loin de vaca', 'New York Cut or Strip Loin of beef', 1),
(9, 'Cerdo', 'Pig', 'Longaniza', 'Sausage', 120, 40, 'Embutido en salchicha con especias ', 'Sausage with spices', 1),
(10, 'Buey', 'Beef', 'Tomahawk', 'Tomahawk', 500, 15, 'Corte extraído de las costillas de la res', 'Cut extracted from the ribs of the beef', 1),
(11, 'Vaca', 'Cow', 'Rib Eye', 'Rib Eye', 700, 10, 'Filete de costilla de ternera Wagyū', 'Wagyū beef short rib steak', 1),
(12, 'Cerdo', 'Pig', 'Pork Belly', 'Pork Belly', 200, 15, 'Panza de cerdo cruda', 'Raw pork belly', 1),
(13, 'Vaca', 'Cow', 'Tuetano', 'Marrow', 150, 20, 'Extraído de los huesos de la vaca', 'Extracted from cow bones', 1),
(14, 'Buey', 'Beef', 'Arrachera', 'Skirt steak', 300, 20, 'Corte de carne de res sabroso y tierno', 'Tasty and tender cut of beef', 1),
(15, 'Cerdo', 'Pig', 'Manteca', 'Lard', 500, 40, 'Manteca de cerdo premium', 'Premium lard', 1);

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
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` text COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `name`, `descripcion`, `description`) VALUES
(1, 'consumidor', 'customer', 'Este usuario solo puedo hacer compras.', 'This user can only make purchases.'),
(2, 'empleado', 'employee', 'Este usuario puede hacer compras ademas de poder modificar directamente los productos.', 'This user can make purchases as well as modify products directly.'),
(3, 'administrador', 'manager', 'Este usuario tiene acceso a toda la informacion dentro de la base de datos excepto a las contraseñas de los de más usuarios.', 'This user has access to all information within the database except the passwords of the other users.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_rol` bigint NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
  `fecha` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
