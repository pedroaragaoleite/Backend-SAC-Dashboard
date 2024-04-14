-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-04-2024 a las 20:07:13
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
-- Base de datos: `sac`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id_brand` int(10) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id_brand`, `brand`, `created_at`, `updated_at`) VALUES
(1, 'Brand A', '2024-03-29 12:13:32', '2024-03-29 12:13:32'),
(2, 'Brand B', '2024-03-29 12:13:43', '2024-03-29 12:13:43'),
(3, 'Brand C', '2024-03-29 12:14:05', '2024-03-29 12:14:05'),
(4, 'Brand D', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(5, 'Brand E', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(6, 'Brand F', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(7, 'Brand G', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(8, 'Brand H', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(9, 'Brand I', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(10, 'Brand J', '2024-03-29 12:15:36', '2024-03-29 12:15:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campaignproducts`
--

CREATE TABLE `campaignproducts` (
  `id_campaign_product` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `productA_units` int(11) DEFAULT 0,
  `productB_units` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campaignproducts`
--

INSERT INTO `campaignproducts` (`id_campaign_product`, `campaign_id`, `brand_id`, `productA_units`, `productB_units`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 100, 50, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(2, 2, 2, 150, 60, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(3, 3, 3, 200, 70, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(4, 4, 4, 250, 80, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(5, 5, 5, 300, 90, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(6, 6, 6, 350, 100, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(7, 7, 7, 400, 110, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(8, 8, 8, 450, 120, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(9, 9, 9, 500, 130, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(10, 10, 10, 550, 140, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(11, 11, 1, 600, 150, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(12, 12, 2, 650, 160, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(13, 13, 3, 700, 170, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(14, 14, 4, 750, 180, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(15, 15, 5, 800, 190, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(16, 16, 6, 850, 200, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(17, 17, 7, 900, 210, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(18, 18, 8, 950, 220, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(19, 19, 9, 1000, 230, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(20, 20, 10, 1050, 240, '2024-04-09 19:15:40', '2024-04-09 19:15:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campaigns`
--

CREATE TABLE `campaigns` (
  `id_campaign` int(10) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('active','inactive','finished') NOT NULL DEFAULT 'active',
  `user_id` int(8) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campaigns`
--

INSERT INTO `campaigns` (`id_campaign`, `title`, `description`, `start_date`, `end_date`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Spring Sale', 'Discounts on spring collection', '2024-04-01 00:00:00', '2024-04-30 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(2, 'Summer Fest', 'Special offers on summer essentials', '2024-06-01 00:00:00', '2024-06-30 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(3, 'Back to School', 'Promotions on school supplies', '2024-08-01 00:00:00', '2024-08-31 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(4, 'Winter Wonderland', 'Deals on winter gear and clothing', '2024-11-01 00:00:00', '2024-12-31 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(5, 'Tech Tuesday', 'Technology and gadget sale', '2024-05-02 00:00:00', '2024-05-02 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(6, 'Home Makeover', 'Discounts on home decor and furniture', '2024-09-15 00:00:00', '2024-10-15 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(7, 'Fitness Frenzy', 'Sales on fitness equipment and wearables', '2024-01-10 00:00:00', '2024-01-31 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(8, 'Beauty Bash', 'Promotions on beauty products', '2024-03-08 00:00:00', '2024-03-08 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(9, 'Auto Accessories Sale', 'Deals on car accessories', '2024-07-20 00:00:00', '2024-08-20 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(10, 'Gourmet Week', 'Special offers on gourmet foods', '2024-10-10 00:00:00', '2024-10-17 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(11, 'Pet Care Discounts', 'Discounts on pet care supplies', '2024-02-01 00:00:00', '2024-02-28 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(12, 'Book Lover Days', 'Sales on literature and novels', '2024-04-23 00:00:00', '2024-04-30 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(13, 'Kids’ Corner', 'Promotions on kids’ toys and clothes', '2024-05-15 00:00:00', '2024-06-15 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(14, 'Gaming Marathon', 'Deals on video games and accessories', '2024-07-05 00:00:00', '2024-07-12 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(15, 'Outdoor Adventures', 'Sales on camping and outdoor gear', '2024-08-25 00:00:00', '2024-09-25 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(16, 'Fashion Forward', 'Discounts on the latest fashion trends', '2024-09-20 00:00:00', '2024-10-20 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(17, 'DIY Deals', 'Promotions on DIY tools and materials', '2024-03-01 00:00:00', '2024-03-31 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(18, 'Smart Home Sale', 'Deals on smart home devices', '2024-06-05 00:00:00', '2024-07-05 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(19, 'Luxury for Less', 'Luxury items at discounted prices', '2024-11-15 00:00:00', '2024-12-15 23:59:59', 'active', 3, '2024-04-09 19:15:40', '2024-04-09 19:15:40'),
(20, 'New Year, New Gear', 'Sales to kickstart the new year', '2025-01-01 00:00:00', '2025-01-31 23:59:59', 'active', 4, '2024-04-09 19:15:40', '2024-04-09 19:15:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(8) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(30) NOT NULL,
  `postal_code` int(6) NOT NULL,
  `phone` int(9) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id_customer`, `name`, `email`, `address`, `city`, `postal_code`, `phone`, `created_at`, `updated_at`) VALUES
(0, 'New user', 'newuser@newuser.com', 'newuser@newuser.com', 'Barcelona', 43850, 939393939, '2024-04-11 18:20:12', '2024-04-11 18:20:12'),
(1000, 'La Joya del Pan', 'contacto@lajoyadelpan.es', 'Calle Panaderos 45', 'Madrid', 28013, 910000001, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1001, 'Modas Sol', 'info@modassol.es', 'Avenida Libertad 32', 'Barcelona', 8005, 930000002, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1002, 'Librería del Saber', 'servicio@libreriadelsaber.es', 'Plaza de Cervantes 10', 'Salamanca', 37002, 923000003, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1003, 'ElectroHogar', 'contacto@electrohogar.es', 'Calle de los Electrodomésticos 22', 'Valencia', 46001, 960000004, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1004, 'Bicicletas Veloz', 'ventas@bicicletasveloz.es', 'Paseo de la Bicicleta 58', 'Sevilla', 41010, 955000005, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1005, 'Dulces Sueños', 'pedidos@dulcessuenos.es', 'Calle del Roscón 15', 'Zaragoza', 50001, 976000006, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1006, 'Regalos Originales', 'info@regalosoriginales.es', 'Avenida de la Fantasía 78', 'Málaga', 29018, 952000007, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1007, 'Todo Mascotas', 'contacto@todomascotas.es', 'Calle de los Animales 12', 'Bilbao', 48009, 944000008, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1008, 'El Rincón del Arte', 'servicio@elrincondelarte.es', 'Plaza de los Pintores 5', 'Granada', 18010, 958000009, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1009, 'Deportes Aventura', 'ventas@deportesaventura.es', 'Camino del Deporte 22', 'Gijón', 33203, 984000010, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1010, 'La Casa del Libro', 'info@lacasadelibro.es', 'Calle de la Lectura 33', 'Santander', 39001, 942000011, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1011, 'Joyería del Sol', 'contacto@joyeriadelsol.es', 'Avenida Brillante 44', 'Córdoba', 14010, 957000012, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1012, 'Papelería Moderna', 'ventas@papeleriamoderna.es', 'Plaza del Papel 28', 'Vigo', 36201, 986000013, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1013, 'Muebles y Diseño', 'info@mueblesydiseño.es', 'Calle de la Decoración 9', 'Palma', 7001, 971000014, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1014, 'Tecnología de Punta', 'contacto@tecnologiadepunta.es', 'Avenida del Futuro 76', 'Las Palmas', 35010, 928000015, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1015, 'El Armario de Moda', 'servicio@elarmariodemoda.es', 'Paseo de la Moda 12', 'Alicante', 3003, 965000016, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1016, 'Zapatería el Paso', 'ventas@zapateriaelpaso.es', 'Calle del Calzado 34', 'Murcia', 30004, 968000017, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1017, 'Perfumería Esencia', 'info@perfumeriaesencia.es', 'Plaza de los Aromas 7', 'Toledo', 45001, 925000018, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1018, 'Complementos Chic', 'contacto@complementoschic.es', 'Avenida de la Elegancia 82', 'Lleida', 25002, 973000019, '2024-04-09 18:41:20', '2024-04-09 18:41:20'),
(1019, 'Juguetes Fantasía', 'servicio@juguetesfantasia.es', 'Calle de la Imaginación 48', 'Oviedo', 33006, 985000020, '2024-04-09 18:41:20', '2024-04-09 18:41:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interactions`
--

CREATE TABLE `interactions` (
  `id_interaction` int(8) UNSIGNED NOT NULL,
  `name_interaction` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `interactions`
--

INSERT INTO `interactions` (`id_interaction`, `name_interaction`, `createdAt`, `updatedAt`) VALUES
(1, 'order', '2024-03-21 20:40:44', '2024-03-21 20:40:44'),
(2, 'consult', '2024-03-21 20:40:44', '2024-03-21 20:40:44'),
(3, 'warranty', '2024-03-21 20:41:33', '2024-03-21 20:41:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interaction_options`
--

CREATE TABLE `interaction_options` (
  `id_option` int(8) UNSIGNED NOT NULL,
  `interaction_id` int(10) UNSIGNED NOT NULL,
  `name_option` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `interaction_options`
--

INSERT INTO `interaction_options` (`id_option`, `interaction_id`, `name_option`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'create_order', '2024-03-22 09:45:11', '2024-03-22 09:45:11'),
(2, 1, 'update_order', '2024-03-22 09:45:11', '2024-03-22 09:45:11'),
(3, 1, 'cancel_order', '2024-03-22 09:45:11', '2024-03-22 09:45:11'),
(4, 2, 'schedule_consultation', '2024-03-22 09:45:11', '2024-03-22 09:45:11'),
(5, 2, 'reschedule_consultation', '2024-03-22 09:45:11', '2024-03-22 09:45:11'),
(6, 3, 'file_warranty_claim', '2024-03-22 09:45:11', '2024-03-22 09:45:11'),
(7, 3, 'check_warranty_status', '2024-03-22 09:45:11', '2024-03-22 09:45:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_role` int(8) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_role`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2024-03-21 16:30:27', '2024-03-21 16:30:27'),
(2, 'Supervisor', '2024-03-21 16:30:27', '2024-03-21 16:30:27'),
(3, 'Inbound', '2024-03-21 16:30:59', '2024-03-21 16:30:59'),
(4, 'Outbound', '2024-03-21 16:30:59', '2024-03-21 16:30:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todos`
--

CREATE TABLE `todos` (
  `id_todo` int(8) NOT NULL,
  `title` varchar(100) NOT NULL,
  `assigned_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `status` enum('new','pending','in progress','completed') NOT NULL DEFAULT 'new',
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'low',
  `user_id` int(8) UNSIGNED NOT NULL,
  `customer_id` int(8) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `todos`
--

INSERT INTO `todos` (`id_todo`, `title`, `assigned_date`, `due_date`, `status`, `priority`, `user_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'Email Regalos Originales discount codes', '2024-04-10 00:00:00', '2024-04-12 00:00:00', 'pending', 'high', 3, 1000, '2024-04-09 19:05:23', '2024-04-11 13:01:53'),
(2, 'Email Modas Sol about new collection', '2024-04-10 00:00:00', '2024-04-15 00:00:00', 'new', 'medium', 4, 1001, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(3, 'Schedule meeting with Librería del Saber', '2024-04-11 00:00:00', '2024-04-18 00:00:00', 'new', 'high', 3, 1002, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(4, 'Confirm shipment arrival to ElectroHogar', '2024-04-12 00:00:00', '2024-04-14 00:00:00', 'pending', 'medium', 4, 1003, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(5, 'Send promotional material to Bicicletas Veloz', '2024-04-13 00:00:00', '2024-04-20 00:00:00', 'in progress', 'low', 3, 1004, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(6, 'Call Dulces Sueños for payment confirmation', '2024-04-14 00:00:00', '2024-04-16 00:00:00', 'pending', 'high', 4, 1005, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(7, 'Email Regalos Originales discount codes', '2024-04-15 00:00:00', '2024-04-22 00:00:00', 'new', 'low', 3, 1006, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(8, 'Update Todo Mascotas on order status', '2024-04-16 00:00:00', '2024-04-18 00:00:00', 'in progress', 'medium', 4, 1007, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(9, 'Prepare annual review for El Rincón del Arte', '2024-04-17 00:00:00', '2024-04-25 00:00:00', 'pending', 'high', 3, 1008, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(10, 'Follow up on Deportes Aventura warranty claim', '2024-04-18 00:00:00', '2024-04-19 00:00:00', 'completed', 'medium', 43, 1009, '2024-04-09 19:05:23', '2024-04-11 06:23:55'),
(11, 'Renew contract with La Casa del Libro', '2024-04-19 00:00:00', '2024-04-26 00:00:00', 'new', 'high', 3, 1010, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(12, 'Check inventory levels at Joyería del Sol', '2024-04-20 00:00:00', '2024-04-23 00:00:00', 'pending', 'low', 43, 1011, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(13, 'Organize marketing event with Papelería Moderna', '2024-04-21 00:00:00', '2024-04-29 00:00:00', 'new', 'medium', 3, 1012, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(14, 'Update software for Muebles y Diseño', '2024-04-22 00:00:00', '2024-04-24 00:00:00', 'in progress', 'high', 4, 1013, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(15, 'Conduct training session for Tecnología de Punta staff', '2024-04-23 00:00:00', '2024-04-30 00:00:00', 'pending', 'low', 3, 1014, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(16, 'Review sales strategy with El Armario de Moda', '2024-04-24 00:00:00', '2024-04-27 00:00:00', 'new', 'medium', 43, 1015, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(17, 'Negotiate new lease terms with Zapatería el Paso', '2024-04-25 00:00:00', '2024-05-02 00:00:00', 'in progress', 'high', 3, 1016, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(18, 'Email Perfumería Esencia rebranding proposal', '2024-04-26 00:00:00', '2024-04-28 00:00:00', 'pending', 'medium', 4, 1017, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(19, 'Plan holiday season display for Complementos Chic', '2024-04-27 00:00:00', '2024-05-05 00:00:00', 'new', 'low', 3, 1018, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(20, 'Finalize annual order with Juguetes Fantasía', '2024-04-28 00:00:00', '2024-04-30 00:00:00', 'completed', 'high', 4, 1019, '2024-04-09 19:05:23', '2024-04-09 19:05:23'),
(99, 'Create user', '2024-04-11 18:08:00', '2024-04-26 18:08:00', 'in progress', 'high', 1, 0, '2024-04-11 18:08:26', '2024-04-12 05:36:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types`
--

CREATE TABLE `types` (
  `id_type` int(8) UNSIGNED NOT NULL,
  `name_type` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `types`
--

INSERT INTO `types` (`id_type`, `name_type`, `createdAt`, `updatedAt`) VALUES
(1, 'phone', '2024-03-21 20:28:20', '2024-03-21 20:28:20'),
(2, 'email', '2024-03-21 20:28:20', '2024-03-21 20:28:20'),
(3, 'chat', '2024-03-21 20:28:20', '2024-03-21 20:28:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(8) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `username`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', '$2b$10$R5b4KUQu7RRs.pwiO820S.HXABITBByS1TSryQFe1zm8ekVa4yuCu', 'Admin', 'Admin', '2024-04-09 16:25:57', '2024-04-09 16:25:57'),
(2, 'supervisor@supervisor.com', '$2b$10$FBpXVVS43IF.5/B88UmiceerclU1TZgLVdd/ER.HODRdMcB/eQMdi', 'Supervisor', 'Supervisor', '2024-04-09 16:27:27', '2024-04-09 16:27:27'),
(3, 'outbound@outbound.com', '$2b$10$4HDh8SnQuGtRweK/h6OHpOY9X7L.6e4A66Lpr5vXGen0BKNB.jace', 'Outbound', 'Outbound', '2024-04-09 16:27:56', '2024-04-09 16:27:56'),
(4, 'inbound@inbound.com', '$2b$10$H9diVFvVut7u/OFLo/qut.Lrm/iJOhNYhx0WwHrSET8ke6X13HQ8e', 'Inbound', 'Inbound', '2024-04-09 16:28:18', '2024-04-09 16:28:18'),
(43, 'outboundteste@teste.com', '$2b$10$LXtmouzgu5IXouKluvxB1ec/.aL3gQYKoDDYrOTt9B403JBXN/G..', 'Outbound teste', 'Outbound', '2024-04-10 16:35:56', '2024-04-10 16:35:56'),
(44, 'teste@teste.com', '$2b$10$jI0OPjWQrsyai/eVv9bafOt9Pbe24ethV1rWXoC60xCgMI.IbF44e', 'teste validator', 'Admin', '2024-04-12 17:05:09', '2024-04-12 17:05:09'),
(45, 'validatorpassword@teste.com', '$2b$10$cd0Jd5dCjA1UxvfclBRFFuNNv6FbOlM4HWMILoPrtZfSj66RXixfO', 'teste validator password', 'Inbound', '2024-04-12 17:13:27', '2024-04-12 17:13:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `id_user` int(8) UNSIGNED NOT NULL,
  `role_id` int(8) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_roles`
--

INSERT INTO `user_roles` (`id_user`, `role_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2024-04-09 16:25:57', '2024-04-09 16:25:57'),
(2, 2, '2024-04-09 16:27:27', '2024-04-09 16:27:27'),
(3, 4, '2024-04-09 16:27:56', '2024-04-09 16:27:56'),
(4, 3, '2024-04-09 16:28:18', '2024-04-09 16:28:18'),
(43, 4, '2024-04-10 16:35:56', '2024-04-10 16:35:56'),
(44, 1, '2024-04-12 17:05:09', '2024-04-12 17:05:09'),
(45, 3, '2024-04-12 17:13:27', '2024-04-12 17:13:27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indices de la tabla `campaignproducts`
--
ALTER TABLE `campaignproducts`
  ADD PRIMARY KEY (`id_campaign_product`),
  ADD KEY `id_campaign` (`campaign_id`),
  ADD KEY `id_brand` (`brand_id`);

--
-- Indices de la tabla `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id_campaign`),
  ADD KEY `id_user` (`user_id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`),
  ADD UNIQUE KEY `customers_email_phone` (`email`,`phone`);

--
-- Indices de la tabla `interactions`
--
ALTER TABLE `interactions`
  ADD PRIMARY KEY (`id_interaction`);

--
-- Indices de la tabla `interaction_options`
--
ALTER TABLE `interaction_options`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `id_interaction` (`interaction_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`),
  ADD UNIQUE KEY `roles_role_name` (`role_name`);

--
-- Indices de la tabla `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id_todo`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `id_customer` (`customer_id`);

--
-- Indices de la tabla `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id_user`,`role_id`),
  ADD UNIQUE KEY `user_roles_id_role_id_user_unique` (`id_user`,`role_id`),
  ADD KEY `id_role` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id_brand` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `campaignproducts`
--
ALTER TABLE `campaignproducts`
  MODIFY `id_campaign_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id_campaign` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1039;

--
-- AUTO_INCREMENT de la tabla `interactions`
--
ALTER TABLE `interactions`
  MODIFY `id_interaction` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `interaction_options`
--
ALTER TABLE `interaction_options`
  MODIFY `id_option` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `todos`
--
ALTER TABLE `todos`
  MODIFY `id_todo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campaignproducts`
--
ALTER TABLE `campaignproducts`
  ADD CONSTRAINT `campaignproducts_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id_campaign`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `campaignproducts_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id_brand`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `interaction_options`
--
ALTER TABLE `interaction_options`
  ADD CONSTRAINT `interaction_options_ibfk_1` FOREIGN KEY (`interaction_id`) REFERENCES `interactions` (`id_interaction`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `todos`
--
ALTER TABLE `todos`
  ADD CONSTRAINT `todos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `todos_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id_customer`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
