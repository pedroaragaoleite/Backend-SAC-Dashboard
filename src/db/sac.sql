-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2024 a las 21:32:26
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
(1, 'Ray-Ban', '2024-03-29 12:13:32', '2024-03-29 12:13:32'),
(2, 'Oakley', '2024-03-29 12:13:43', '2024-03-29 12:13:43'),
(3, 'Prada', '2024-03-29 12:14:05', '2024-03-29 12:14:05'),
(4, 'Gucci', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(5, 'Versace', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(6, 'Armani', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(7, 'Burberry', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(8, 'Dolce & Gabbana', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(9, 'Arnette', '2024-03-29 12:15:36', '2024-03-29 12:15:36'),
(10, 'Channel', '2024-03-29 12:15:36', '2024-03-29 12:15:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campaignproducts`
--

CREATE TABLE `campaignproducts` (
  `id_campaign_product` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `sunglass_units` int(11) DEFAULT 0,
  `eyewear_units` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campaignproducts`
--

INSERT INTO `campaignproducts` (`id_campaign_product`, `campaign_id`, `brand_id`, `sunglass_units`, `eyewear_units`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 150, 50, '2024-03-29 12:22:24', '2024-04-05 05:35:40'),
(2, 2, 2, 200, 100, '2024-03-29 12:22:24', '2024-03-29 12:22:24'),
(3, 3, 3, 150, 75, '2024-03-29 12:22:24', '2024-03-29 12:22:24'),
(6, 6, 6, 100, 50, '2024-03-29 12:22:24', '2024-04-04 04:58:02'),
(7, 7, 7, 200, 100, '2024-03-29 12:22:24', '2024-03-29 12:22:24'),
(8, 8, 8, 150, 75, '2024-03-29 12:22:24', '2024-03-29 12:22:24'),
(9, 9, 9, 100, 25, '2024-03-29 12:22:24', '2024-03-29 12:22:24'),
(10, 10, 10, 80, 40, '2024-03-29 12:22:24', '2024-04-04 05:06:03'),
(14, 29, 1, 50, 50, '2024-03-30 16:38:09', '2024-03-30 16:38:09'),
(20, 38, 1, 100, 50, '2024-04-05 05:29:07', '2024-04-05 05:29:07');

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
(1, 'Campaña Verano 2024', 'Promoción de verano para gafas de sol y de vista.', '2024-01-01 00:00:00', '2024-04-04 06:57:00', 'active', 5, '2024-03-29 12:19:43', '2024-04-05 05:35:40'),
(2, 'Lanzamiento Otoño 2024', 'Nueva colección de otoño para gafas de sol y de vista.', '2024-02-01 00:00:00', '2024-03-30 00:00:00', 'active', 7, '2024-03-29 12:19:43', '2024-03-29 12:19:43'),
(3, 'Promoción Primavera 2024', 'Descuentos especiales en gafas de vista para la primavera.', '2024-03-01 00:00:00', '2024-05-31 00:00:00', 'active', 8, '2024-03-29 12:19:43', '2024-03-29 12:19:43'),
(6, 'Campaña Verano 2024', 'Promoción de verano para gafas de sol y de vista.', '2024-04-01 00:00:00', '2024-05-20 04:57:00', 'active', 5, '2024-03-29 12:19:43', '2024-04-04 04:58:02'),
(7, 'Lanzamiento Otoño 2024', 'Nueva colección de otoño para gafas de sol y de vista.', '2024-05-01 00:00:00', '2024-08-30 00:00:00', 'finished', 7, '2024-03-29 12:19:43', '2024-03-29 12:19:43'),
(8, 'Promoción Primavera 2024', 'Descuentos especiales en gafas de vista para la primavera.', '2024-06-01 00:00:00', '2024-08-31 00:00:00', 'active', 8, '2024-03-29 12:19:43', '2024-03-29 12:19:43'),
(9, 'Exclusiva Arnette', 'Lanzamiento exclusivo de modelos de Arnette.', '2024-07-15 00:00:00', '2024-09-15 00:00:00', 'inactive', 9, '2024-03-29 12:19:43', '2024-03-29 12:19:43'),
(10, 'Ofertas Summer 2024', 'Ofertas únicas para Black Friday en todas las marcas.', '2024-08-24 00:00:00', '2024-07-25 00:00:00', 'inactive', 27, '2024-03-29 12:19:43', '2024-04-04 05:06:03'),
(29, 'teste', 'testetestetesteteste', '2024-03-31 15:30:00', '2024-04-07 15:30:00', 'active', 11, '2024-03-30 16:38:09', '2024-03-30 16:38:09'),
(38, 'Campaña Verano 2025', 'Promoción de verano para gafas de sol y de vista.', '2024-01-01 00:00:00', '2024-04-04 06:57:00', 'active', 6, '2024-04-05 05:29:07', '2024-04-05 05:29:07');

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
(1001, 'Óptica Luminar', 'opticaluminar@teste.com', 'Calle Sol, 22', 'Madrid', 28001, 912345678, '2024-03-28 16:01:23', '2024-04-04 05:20:58'),
(1002, 'Visión Clara', 'visionclara@teste.com', 'Avenida Luna, 33', 'Barcelona', 8002, 932345679, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1003, 'Mirada Perfecta', 'miradaperfecta@teste.com', 'Plaza Mayor, 44', 'Valencia', 46001, 962345670, '2024-03-28 16:01:23', '2024-04-04 05:35:26'),
(1004, 'VistaVal', 'vistaval@teste.com', 'Calle Jardín, 55', 'Sevilla', 41001, 952345671, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1005, 'Óptica Sol', 'opticasol@teste.com', 'Gran Vía, 66', 'Zaragoza', 50001, 976345672, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1006, 'Luces del Día', 'lucesdeldia@teste.com', 'Calle Estrella, 77', 'Málaga', 29001, 952345673, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1007, 'Óptica Mar', 'opticamar@teste.com', 'Calle Océano, 88', 'Murcia', 30001, 968345674, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1008, 'Claridad', 'claridad@teste.com', 'Calle Río, 99', 'Palma de Mallorca', 7001, 971345675, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1009, 'Foco Visual', 'focovisual@teste.com', 'Avenida Montaña, 101', 'Las Palmas', 35001, 928345676, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1010, 'Visión de Águila', 'visiondeaguila@teste.com', 'Plaza del Sol, 112', 'Bilbao', 48001, 944345677, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1011, 'Perspectiva', 'perspectiva@teste.com', 'Calle Nueva, 123', 'Alicante', 3001, 965345678, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1012, 'Óptica Prisma', 'opticaprisma@teste.com', 'Avenida del Mar, 134', 'Córdoba', 14001, 957345679, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1013, 'Espejismo', 'espejismo@teste.com', 'Calle Real, 145', 'Valladolid', 47001, 983345680, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1014, 'Luz y Visión', 'luzvision@teste.com', 'Plaza de la Luz, 156', 'Vitoria', 1001, 945345681, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1015, 'Óptica del Norte', 'opticadelnorte@teste.com', 'Avenida de la Estrella, 167', 'Oviedo', 33001, 985345682, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1016, 'Visión Futura', 'visionfutura@teste.com', 'Calle del Futuro, 178', 'Santander', 39001, 942345683, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1017, 'Mirada Profunda', 'miradaprofunda@teste.com', 'Calle Profunda, 189', 'Toledo', 45001, 925345684, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1018, 'Óptica del Sol', 'opticadelsol@teste.com', 'Plaza Solar, 200', 'León', 24001, 987345685, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1019, 'Gran Visión', 'granvision@teste.com', 'Avenida Grande, 211', 'Tarragona', 43001, 977345686, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1020, 'Visión Perfecta', 'visionperfecta@teste.com', 'Calle Vista, 222', 'Lleida', 25001, 973345687, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1021, 'Punto de Vista', 'puntodevista@teste.com', 'Avenida Punto, 233', 'Girona', 17001, 972345688, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1022, 'Óptica Luz', 'opticaluz@teste.com', 'Calle Luminosa, 244', 'Huesca', 22001, 974345689, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1023, 'Espectro Visual', 'espectrovisual@teste.com', 'Plaza Espectro, 255', 'Pamplona', 31001, 948345690, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1024, 'Clarividencia', 'clarividencia@teste.com', 'Avenida Claridad, 266', 'Logroño', 26001, 941345691, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1025, 'Lentes del Futuro', 'lentesdelfuturo@teste.com', 'Calle del Mañana, 277', 'Santiago de Compostela', 15701, 981345692, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1026, 'Mirada del Águila', 'miradadelaguila@teste.com', 'Plaza de la Visión, 288', 'Segovia', 40001, 921345693, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1027, 'Óptica del Pueblo', 'opticadelpueblo@teste.com', 'Avenida del Campo, 299', 'Salamanca', 37001, 923345694, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1028, 'Visionarios', 'visionarios@teste.com', 'Calle de los Sueños, 310', 'Cádiz', 11001, 956345695, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1029, 'Óptica Centenario', 'opticacentenario@teste.com', 'Plaza Centenaria, 321', 'Badajoz', 6001, 924345696, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1030, 'La Mirada Clara', 'lamiradaclara@teste.com', 'Calle Clara, 332', 'Melilla', 52001, 952345697, '2024-03-28 16:01:23', '2024-03-28 16:01:23'),
(1031, 'teste', 'customer1@teste.com', 'calle bla blasasdsdsaddsadasdsadsad', 'Salou', 55555, 939393939, '2024-03-28 15:52:42', '2024-03-28 18:40:48'),
(1035, 'Pedro blaaa', 'pedro@teste.com', 'calle bla bla bla bla', 'CAMBRILS', 43850, 664711380, '2024-04-04 05:26:56', '2024-04-04 05:33:33');

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
  `id_interaction` int(10) UNSIGNED NOT NULL,
  `name_option` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `interaction_options`
--

INSERT INTO `interaction_options` (`id_option`, `id_interaction`, `name_option`, `createdAt`, `updatedAt`) VALUES
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
(1, 'admin', '2024-03-21 16:30:27', '2024-03-21 16:30:27'),
(2, 'supervisor', '2024-03-21 16:30:27', '2024-03-21 16:30:27'),
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
  `customer_id` int(8) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `todos`
--

INSERT INTO `todos` (`id_todo`, `title`, `assigned_date`, `due_date`, `status`, `priority`, `user_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(39, 'Inquiry on latest eyewear collection 2024', '2024-03-22 00:00:00', '2024-03-29 00:00:00', 'completed', 'high', 1, 1010, '2024-04-02 18:04:00', '2024-04-04 16:00:13'),
(40, 'Warranty claim for defective lenses', '2024-03-23 00:00:00', '2024-04-02 00:00:00', 'completed', 'high', 2, 1001, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(41, 'Restock request for popular sunglasses model', '2024-03-24 00:00:00', '2024-03-31 00:00:00', 'completed', 'high', 5, 1002, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(42, 'Technical support for online catalog', '2024-03-25 00:00:00', '2024-03-30 00:00:00', 'completed', 'medium', 6, 1003, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(43, 'Follow-up on delayed shipment', '2024-03-26 00:00:00', '2024-04-05 00:00:00', 'in progress', 'medium', 7, 1004, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(44, 'Bulk order inquiry from optician shop', '2024-03-27 00:00:00', '2024-04-03 00:00:00', 'in progress', 'high', 8, 1005, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(45, 'Customer complaint: Incorrect prescription', '2024-03-28 00:00:00', '2024-04-04 00:00:00', 'in progress', 'high', 9, 1006, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(46, 'Feedback request for service improvement', '2024-03-29 00:00:00', '2024-04-06 00:00:00', 'in progress', 'low', 11, 1007, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(47, 'Urgent: Defective frame replacement', '2024-03-30 00:00:00', '2024-04-07 00:00:00', 'pending', 'high', 21, 1008, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(48, 'Inquiry on UV protection range', '2024-03-31 00:00:00', '2024-04-08 00:00:00', 'pending', 'medium', 22, 1009, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(49, 'Complaint: Late delivery', '2024-04-01 00:00:00', '2024-04-09 00:00:00', 'pending', 'medium', 23, 1010, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(50, 'Update request on warranty claim status', '2024-04-02 00:00:00', '2024-04-10 00:00:00', 'new', 'medium', 24, 1011, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(51, 'Restock of limited edition frames', '2024-04-03 00:00:00', '2024-04-11 00:00:00', 'new', 'high', 25, 1012, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(52, 'Query on eco-friendly eyewear options', '2024-04-04 00:00:00', '2024-04-12 00:00:00', 'new', 'low', 5, 1013, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(53, 'Setup assistance for new eyewear display', '2024-04-05 00:00:00', '2024-04-13 00:00:00', 'new', 'low', 5, 1014, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(54, 'Product training request for staff', '2024-04-06 00:00:00', '2024-04-14 00:00:00', 'new', 'medium', 5, 1015, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(55, 'Order adjustment for special offer', '2024-04-07 00:00:00', '2024-04-15 00:00:00', 'new', 'medium', 5, 1016, '2024-04-02 18:04:00', '2024-04-02 18:04:00'),
(56, 'Feedback on recent purchase', '2024-04-08 00:00:00', '2024-04-16 00:00:00', 'new', 'low', 5, 1017, '2024-04-02 18:04:00', '2024-04-02 18:04:00');

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
(1, 'teste@teste.com', '$2b$10$eZF9iOKmItVrWIY37rR6a..E7lHFljuis.4mlaHr9AD15Iuw1w4eS', 'Pedro', 'admin', '2024-03-21 18:11:10', '2024-04-05 09:26:32'),
(2, 'teste1@teste.com', '$2b$10$5/C6N36HGUNdB9KNZJn78ehZg0LeT.yT3/wEV2V6FFy441bCrzC9m', 'Eneida', 'admin', '2024-03-21 18:12:19', '2024-04-04 04:06:52'),
(5, 'user@teste.com', '$2b$10$2eQ.EXoUAnydUu38fB7cOeY6Ya9t0N5b09x4X2egH4eM46fBoBO7O', 'user', 'Outbound', '2024-03-22 09:59:09', '2024-03-27 16:38:18'),
(6, 'user1@teste.com', '$2b$10$6iUofp0fmTTbdiWGHku7euNAt1b8vvQRJfx2i0hREzerObx.pv1uq', 'user14', 'supervisor', '2024-03-22 09:59:40', '2024-03-28 10:43:42'),
(7, 'teste2@teste.com', '$2b$10$jmeiXGc5kFk2qRSreWGUqehrk0goPFrAlB1rkc8hU1eLVAWhUr.JC', 'teste2', 'Outbound', '2024-03-27 11:09:43', '2024-03-27 16:38:54'),
(8, 'teste3@teste.com', '$2b$10$dMrwyPB1KkXJnz6JV84aa.slmv1m2PI5RNgon12pJMmEh6GYEsAYi', 'teste3', 'Outbound', '2024-03-27 11:10:43', '2024-03-27 16:39:51'),
(9, 'teste@teste.coms', '$2b$10$aZ5xsVzcidiDGWQCBBNUm.aBFjgenqzXG.daEHFMtQaQ1iNULBwrS', 'joana', 'Outbound', '2024-03-27 13:47:58', '2024-03-27 16:40:02'),
(11, 'test5@teste.com', '$2b$10$vSnoel1LKKjbBfGtX63FUeNZZxnk7z95Wm8vMV40qY3XmwjfCjN9u', 'teste5', 'Inbound', '2024-03-27 14:43:19', '2024-03-27 16:38:40'),
(21, 'supervisor@teste.com', '$2b$10$TmGbnho3uVcDQJIdU5zrZub69WdqSTqNh0XeSTms/qvB.SoEsIpBG', 'supervisor', 'supervisor', '2024-03-28 17:53:26', '2024-03-28 17:53:26'),
(22, 'inbound1@inboud.com', '$2b$10$LNAFzU1yrP3uctbn2c0T..wGVRfUSKiAI1v7ia9c7QgsP0DKvgaBm', 'inbound1', 'Inbound', '2024-03-31 19:57:38', '2024-04-05 09:32:46'),
(23, 'inbound2@inboud.com', '$2b$10$vyMoN/3MaGyexkzSuhefRuccAeCouUklQXZ6QBoABJe1vK//Ij3I2', 'inbound2', 'Inbound', '2024-03-31 19:57:56', '2024-03-31 19:57:56'),
(24, 'inbound3@inboud.com', '$2b$10$41mWt0Cl.HIwha6abe43..qVWiGesUYGFOa9sqUXJoEQ9Hwb0IirC', 'inbound3', 'Inbound', '2023-03-31 19:58:18', '2023-03-31 19:58:18'),
(25, 'inbound4@inboud.com', '$2b$10$aEDY/UkWbxzgpBavASMtZePC/nmCUIud4SbtR.rnCi6Xo3RCYGSDC', 'inbound4@inboud.com', 'Inbound', '2023-03-31 19:58:55', '2023-03-31 19:58:55'),
(26, 'inbound5@inboud.com', '$2b$10$gXRQSP4N3ZsIwfE9SX0UY.QxYegHOKB5SMVvh8vgRwJv3AI0FnWnm', 'inbound5@inboud.com', 'Inbound', '2023-03-31 19:59:16', '2023-03-31 19:59:16'),
(27, 'outbound@outbound.com', '$2b$10$FO2fx5dlAf4a.T2yCKtWLO9Y7.2M43IUBq5IRR4K9Q9VLsoqJepQK', 'Outbound', 'Outbound', '2024-03-31 20:00:00', '2024-03-31 20:00:00'),
(28, 'outbound1@outbound.com', '$2b$10$NUyqG3WfTVscP1eSKpUa7uqy7fjX0bwVZk2nYTAb6Yq94EQMKmmES', 'outbound1@outbound.com', 'Outbound', '2024-03-31 20:00:11', '2024-03-31 20:00:11'),
(29, 'outbound2@outbound.com', '$2b$10$QuWUwA/VIX/k2hL.oO4DreIO.3Uv/TAYPl48f2bh9F.DR2EHr1WC.', 'outbound2@outbound.com', 'Outbound', '2023-03-31 20:00:22', '2023-03-31 20:00:22'),
(30, 'outbound3@outbound.com', '$2b$10$KG3LEbyllQH0gM1Nok7XpOjSJ.o3qkhQAeCty7eAbA5Yr5Ng88kuy', 'outbound3@outbound.com', 'Outbound', '2023-03-31 20:00:33', '2023-03-31 20:00:33'),
(35, 'tulip@yulip.com', '$2b$10$RafqpYshZRr/YdfdGWaaGO4VzMSzQmLRyA3LR8E68D8SmKMRrbXpS', 'Tulip', 'supervisor', '2024-04-04 16:28:10', '2024-04-04 16:28:10'),
(36, 'teste@validator.com', '$2b$10$uoR1kToFSZXSou1ylF6Gf.ZPPge86A.MBy1XzmIRb.2bNVB9fs7dK', 'pedro', 'admin', '2024-04-05 09:29:26', '2024-04-05 09:29:26');

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
(1, 1, '2024-03-21 18:11:10', '2024-04-05 09:26:32'),
(1, 2, '2024-03-28 09:35:45', '2024-04-05 09:25:36'),
(2, 1, '2024-03-27 16:36:13', '2024-04-04 04:06:52'),
(2, 2, '2024-03-21 18:12:19', '2024-04-04 04:06:32'),
(2, 3, '2024-03-27 16:34:16', '2024-03-27 16:34:16'),
(2, 4, '2024-03-27 16:32:54', '2024-03-27 16:32:54'),
(5, 3, '2024-03-22 09:59:09', '2024-03-22 09:59:09'),
(5, 4, '2024-03-27 16:38:18', '2024-03-27 16:38:18'),
(6, 2, '2024-03-27 16:42:14', '2024-03-28 10:43:42'),
(6, 4, '2024-03-22 09:59:40', '2024-03-27 16:39:34'),
(7, 2, '2024-03-27 11:09:43', '2024-03-27 11:09:43'),
(7, 3, '2024-03-27 16:37:41', '2024-03-27 16:37:41'),
(7, 4, '2024-03-27 16:38:54', '2024-03-27 16:38:54'),
(8, 3, '2024-03-27 11:10:43', '2024-03-27 11:10:43'),
(8, 4, '2024-03-27 16:39:51', '2024-03-27 16:39:51'),
(9, 1, '2024-03-27 13:47:58', '2024-03-27 13:47:58'),
(9, 2, '2024-03-27 16:37:07', '2024-03-27 16:37:07'),
(9, 4, '2024-03-27 16:40:02', '2024-03-27 16:40:02'),
(11, 3, '2024-03-27 14:43:19', '2024-03-27 14:43:19'),
(11, 4, '2024-03-27 16:38:30', '2024-03-27 16:38:40'),
(21, 2, '2024-03-28 17:53:26', '2024-03-28 17:53:26'),
(22, 3, '2024-03-31 19:57:38', '2024-04-05 09:32:46'),
(22, 4, '2024-04-05 09:32:36', '2024-04-05 09:32:36'),
(23, 3, '2024-03-31 19:57:56', '2024-03-31 19:57:56'),
(24, 3, '2024-03-31 19:58:18', '2024-03-31 19:58:18'),
(25, 3, '2024-03-31 19:58:55', '2024-03-31 19:58:55'),
(26, 3, '2024-03-31 19:59:16', '2024-03-31 19:59:16'),
(27, 4, '2024-03-31 20:00:00', '2024-03-31 20:00:00'),
(28, 4, '2024-03-31 20:00:11', '2024-03-31 20:00:11'),
(29, 4, '2024-03-31 20:00:22', '2024-03-31 20:00:22'),
(30, 4, '2024-03-31 20:00:33', '2024-03-31 20:00:33'),
(35, 2, '2024-04-04 16:28:10', '2024-04-04 16:28:10');

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
  ADD KEY `id_interaction` (`id_interaction`);

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
  MODIFY `id_customer` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1038;

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
  MODIFY `id_todo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
  ADD CONSTRAINT `interaction_options_ibfk_1` FOREIGN KEY (`id_interaction`) REFERENCES `interactions` (`id_interaction`) ON DELETE CASCADE ON UPDATE CASCADE;

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
