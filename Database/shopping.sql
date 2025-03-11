-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2025 at 11:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2024-12-31 19:21:18', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Seeds & Seedlings', 'Begin your crops with our extensive selection of high-quality seeds and young plants.', '2025-01-01 07:17:37', '03-03-2025 09:31:54 AM'),
(4, 'Fertilizers', 'Nourish your soil and maximize yields with our range of fertilizers and soil enhancement products.', '2025-01-01 07:17:37', '03-03-2025 11:29:33 AM'),
(5, 'Livestock & Poultry', 'Provide the best care for your animals with our range of livestock and poultry supplies.', '2025-01-01 07:17:37', '03-03-2025 11:30:18 AM'),
(6, 'Fresh Produce', 'Directly purchase fresh, locally grown produce.', '2025-01-01 07:17:37', '03-03-2025 11:37:32 AM'),
(8, 'Tools', 'Find reliable and durable equipment to streamline your farming operations.', '2025-03-03 06:04:07', '03-03-2025 11:37:48 AM');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 5, '20', 1, '2025-01-02 09:11:34', 'COD', 'Delivered'),
(2, 4, '3', 1, '2025-01-02 09:18:17', 'Debit / Credit card', 'Delivered'),
(4, 4, '15', 1, '2025-03-03 06:26:14', 'COD', 'Delivered'),
(5, 6, '15', 1, '2025-03-03 07:41:51', 'COD', 'Delivered'),
(6, 6, '22', 1, '2025-03-04 09:28:21', 'Internet Banking', 'Delivered'),
(7, 11, '15', 2, '2025-03-11 08:28:06', 'COD', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 1, 'in Process', 'Project is packed and ready for shipping', '2025-01-02 09:12:41'),
(2, 1, 'in Process', 'Product is in transit', '2025-01-02 09:12:56'),
(3, 1, 'Delivered', 'Delivered to the customer', '2025-01-02 09:13:07'),
(4, 2, 'in Process', 'Product is packed and shipped.', '2025-01-02 09:18:50'),
(5, 2, 'Delivered', 'Delivered to to customer', '2025-01-02 09:19:07'),
(6, 4, 'Delivered', 'Delivered', '2025-03-11 09:10:32'),
(7, 5, 'Delivered', 'q', '2025-03-11 09:11:12'),
(8, 7, 'Delivered', 'q', '2025-03-11 09:11:29'),
(9, 6, 'Delivered', 'de', '2025-03-11 09:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `user_id`) VALUES
(15, 3, 8, 'SeedCo seeds', 'seedCo', 1000, 1100, '<div class=\"product-variety\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(33, 37, 41);\"><p style=\"box-sizing: border-box; margin-bottom: 1rem; padding: 0px; line-height: 1.5;\"><font face=\"georgia\" style=\"\" size=\"3\">SC Sila is a white sorghum variety with good disease tolerance and a short growing period.</font></p></div><div class=\"product-details\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(33, 37, 41);\"><p style=\"box-sizing: border-box; margin-bottom: 1rem; padding: 0px; line-height: 1.5;\"></p><ul style=\"box-sizing: border-box; margin-bottom: 1rem; margin-left: 0px; line-height: 1.5;\"><li style=\"box-sizing: border-box; margin: 0px 0px 0px 25px; padding: 0px; position: relative;\"><font face=\"georgia\" size=\"3\">White sorghum with sweet taste</font></li><li style=\"box-sizing: border-box; margin: 0px 0px 0px 25px; padding: 0px; position: relative;\"><font face=\"georgia\" size=\"3\">High yielding with high malting content</font></li><li style=\"box-sizing: border-box; margin: 0px 0px 0px 25px; padding: 0px; position: relative;\"><font face=\"georgia\" size=\"3\">12 to 18 bags per acre</font></li><li style=\"box-sizing: border-box; margin: 0px 0px 0px 25px; padding: 0px; position: relative;\"><font face=\"georgia\" size=\"3\">Good tolerance to rust</font></li><li style=\"box-sizing: border-box; margin: 0px 0px 0px 25px; padding: 0px; position: relative;\"><font face=\"georgia\" size=\"3\">Maturity period of 3 to 3.5 months</font></li><li style=\"box-sizing: border-box; margin: 0px 0px 0px 25px; padding: 0px; position: relative;\"><font face=\"georgia\" size=\"3\">Seeding rate of 4 to 6 kgs per acre</font></li><li style=\"box-sizing: border-box; margin: 0px 0px 0px 25px; padding: 0px; position: relative;\"><font face=\"georgia\" size=\"3\">Basal planting fertiliser: 50kgs recommended for one acre</font></li><li style=\"box-sizing: border-box; margin: 0px 0px 0px 25px; padding: 0px; position: relative;\"><font face=\"georgia\" style=\"\" size=\"3\">Spray effective insecticide to control aphids at 2 to 3 weeks after germination</font></li></ul></div>', 'seedco.jpeg', 'seedco.jpeg', 'seedco.jpeg', 50, 'In Stock', '2025-01-01 01:54:35', '', NULL),
(22, 5, 15, 'Broiler Eggs', 'Kasee', 380, 400, 'Fresh Farm&nbsp; picked eggs High in Protein<div><br></div>', 'eggs-basket.jpg', 'eggs-basket.jpg', 'eggs-basket.jpg', 0, 'In Stock', '2025-03-03 07:14:57', NULL, NULL),
(30, 3, 19, 'Rose apple seedling', 'Mkulima  Phone  0712345678', 450, 500, '<span style=\"color: rgb(0, 0, 0); font-family: Lato-Regular, sans-serif; font-size: 13px; letter-spacing: 0.7px;\">Rose Apple farming is a rare yet lucrative opportunity for Kenyan farmers. With the rising demand for exotic fruits in both local and export markets, early adopters of this crop stand to gain significantly. Its adaptability to diverse climates, relatively low maintenance requirements, and high yields per acre make it an excellent option for diversification.</span>', 'Rose apple seedlings.jpg', 'Rose apple seedlings.jpg', 'Rose apple seedlings.jpg', 0, 'In Stock', '2025-03-11 09:32:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(8, 3, 'Seeds', '2025-01-01 07:24:52', '03-03-2025 09:36:11 AM'),
(15, 5, 'Poultry', '2025-03-03 07:10:07', NULL),
(16, 5, 'Livestock', '2025-03-03 07:10:17', NULL),
(17, 4, 'Organic Fertilizers', '2025-03-11 09:08:11', NULL),
(18, 4, 'Synthetic Fertilizers', '2025-03-11 09:08:25', NULL),
(19, 3, 'Seedlings', '2025-03-11 09:08:57', NULL),
(20, 6, 'Vegetables', '2025-03-11 09:09:20', NULL),
(21, 6, 'Fruits', '2025-03-11 09:53:32', NULL),
(22, 8, 'Farm Tools', '2025-03-11 09:53:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'amit12@gmail.com', 0x3132372e302e302e3100000000000000, '2025-01-02 09:11:28', '02-01-2025 02:43:43 PM', 1),
(2, 'johndeo@gmail.com', 0x3132372e302e302e3100000000000000, '2025-01-02 09:15:08', NULL, 1),
(3, 'johndeo@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-02 22:19:45', NULL, 1),
(4, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-03 05:30:45', NULL, 0),
(5, 'johndeo@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-03 06:21:13', '03-03-2025 12:49:17 PM', 1),
(6, 'vin@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-03 07:20:22', '03-03-2025 12:59:33 PM', 1),
(7, 'vin@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-03 07:29:48', NULL, 1),
(8, 'vin@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-03 07:50:07', NULL, 1),
(9, 'vin@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 09:53:00', NULL, 0),
(10, 'vin@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 09:53:16', '10-03-2025 03:28:05 PM', 0),
(11, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 10:03:59', '10-03-2025 11:40:55 PM', 1),
(12, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:11:12', '10-03-2025 11:47:29 PM', 1),
(13, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:18:15', NULL, 1),
(14, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:46:35', '11-03-2025 12:17:53 AM', 1),
(15, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:48:10', '11-03-2025 12:21:22 AM', 1),
(16, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:51:35', '11-03-2025 12:24:01 AM', 1),
(17, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:54:12', '11-03-2025 12:25:42 AM', 1),
(18, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:55:49', '11-03-2025 12:26:48 AM', 1),
(19, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:56:56', NULL, 1),
(20, 'mkulima3@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-10 18:57:39', '11-03-2025 01:08:14 PM', 1),
(21, 'mkulima4@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-11 07:39:24', '11-03-2025 01:42:39 PM', 1),
(22, 'mkulima4@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-11 08:12:57', NULL, 1),
(23, 'mkulima2@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-11 09:29:28', '11-03-2025 02:59:32 PM', 1),
(24, 'mkulima2@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-11 09:30:43', NULL, 1),
(25, 'mkulima2@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-11 09:46:50', NULL, 1),
(26, 'mkulima2@mail.com', 0x3a3a3100000000000000000000000000, '2025-03-11 09:49:07', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'John Doe', 'johndeo@gmail.com', 4564566554, 'f925916e2754e5e03f75dd58a5733251', 'A 12323 XYZ Apartment ', 'kisumu', 'kisumu', 110092, 'A 12323 XYZ Apartment ', 'kisumu', 'kisumu', 110092, '2025-01-01 07:30:50', NULL),
(6, 'Vincent', 'vin@mail.com', 712345678, 'cc03e747a6afbbcbf8be7668acfebee5', 'kisumu', 'kisumu', 'kisumu', 1, 'kisumu', 'kisumu', 'kisumu', 1, '2025-03-03 07:20:10', NULL),
(7, 'mkulima', 'mkulima@mail.com', 712345678, 'f925916e2754e5e03f75dd58a5733251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 09:53:57', NULL),
(8, 'mkulima', 'mkulima@mail.com', 712345678, 'f925916e2754e5e03f75dd58a5733251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 09:56:53', NULL),
(9, 'mkulima 2', 'mkulima2@mail.com', 712345678, 'f925916e2754e5e03f75dd58a5733251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 10:01:26', NULL),
(10, 'mkulima3', 'mkulima3@mail.com', 712345678, 'f925916e2754e5e03f75dd58a5733251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-10 10:03:44', NULL),
(11, 'mkulima4', 'mkulima4@mail.com', 0, 'f925916e2754e5e03f75dd58a5733251', 'kisumu', 'kisumu', 'kisumu', 1, 'kisumu', 'kisumu', 'kisumu', 1, '2025-03-11 07:39:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(3, 10, 23, '2025-03-10 18:18:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
