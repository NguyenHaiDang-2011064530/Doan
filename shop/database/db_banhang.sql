-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 19, 2018 at 06:15 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(24, 29, '2018-11-18', 1400000, 'COD', 'awdasd', '2018-11-18 16:51:04', '2018-11-18 16:51:04'),
(21, 21, '2018-11-18', 2100000, 'COD', 'giao hàng nhanh nhất có thể', '2018-11-18 16:32:43', '2018-11-18 16:32:43'),
(20, 20, '2018-11-18', 1000000, 'COD', 'áđấ', '2018-11-18 16:23:10', '2018-11-18 16:23:10'),
(18, 18, '2018-11-18', 5150000, 'COD', 'aaaa', '2018-11-18 16:19:10', '2018-11-18 16:19:10'),
(27, 32, '2018-11-19', 2700000, 'COD', '1231231', '2018-11-18 17:02:09', '2018-11-18 17:02:09'),
(28, 33, '2018-11-19', 2700000, 'COD', 'jjjjj', '2018-11-18 17:19:57', '2018-11-18 17:19:57'),
(29, 34, '2018-11-19', 2700000, 'COD', 'giao hàng nhanh', '2018-11-19 03:43:01', '2018-11-19 03:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(33, 29, 65, 1, 2700000, '2018-11-19 03:43:01', '2018-11-19 03:43:01'),
(32, 28, 65, 1, 2700000, '2018-11-18 17:19:57', '2018-11-18 17:19:57'),
(31, 27, 65, 1, 2700000, '2018-11-18 17:02:09', '2018-11-18 17:02:09'),
(30, 26, 72, 1, 3200000, '2018-11-18 16:55:43', '2018-11-18 16:55:43'),
(29, 25, 81, 1, 3450000, '2018-11-18 16:52:53', '2018-11-18 16:52:53'),
(28, 24, 96, 1, 1400000, '2018-11-18 16:51:04', '2018-11-18 16:51:04'),
(23, 19, 65, 1, 2700000, '2018-11-18 16:20:45', '2018-11-18 16:20:45'),
(22, 18, 81, 1, 3450000, '2018-11-18 16:19:10', '2018-11-18 16:19:10'),
(24, 20, 92, 1, 1000000, '2018-11-18 16:23:10', '2018-11-18 16:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(24, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'nhanh nhất có thể', '2018-11-18 16:40:27', '2018-11-18 16:40:27'),
(23, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'giao hàng nhanh nhất có thể', '2018-11-18 16:33:51', '2018-11-18 16:33:51'),
(22, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'giao hàng nhanh nhất có thể', '2018-11-18 16:33:47', '2018-11-18 16:33:47'),
(21, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'giao hàng nhanh nhất có thể', '2018-11-18 16:32:43', '2018-11-18 16:32:43'),
(20, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'áđấ', '2018-11-18 16:23:10', '2018-11-18 16:23:10'),
(18, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'aaaa', '2018-11-18 16:19:10', '2018-11-18 16:19:10'),
(25, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'nhanh nhất có thể', '2018-11-18 16:45:45', '2018-11-18 16:45:45'),
(26, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'nhanh nhất có thể', '2018-11-18 16:46:01', '2018-11-18 16:46:01'),
(27, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'segs', '2018-11-18 16:47:54', '2018-11-18 16:47:54'),
(28, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'segs', '2018-11-18 16:50:33', '2018-11-18 16:50:33'),
(29, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'awdasd', '2018-11-18 16:51:04', '2018-11-18 16:51:04'),
(30, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'adawdwa', '2018-11-18 16:52:53', '2018-11-18 16:52:53'),
(31, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'asawf', '2018-11-18 16:55:43', '2018-11-18 16:55:43'),
(32, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', '1231231', '2018-11-18 17:02:09', '2018-11-18 17:02:09'),
(33, 'Nguyễn Tấn Hoài', 'nam', 'nguyentanhoai072@gmail.com', 'Quận 7', '0931329465', 'jjjjj', '2018-11-18 17:19:57', '2018-11-18 17:19:57'),
(34, 'Trần Tuấn Kiệt', 'nam', 'kiet@gmail.com', 'quan 12', '0123456789', 'giao hàng nhanh', '2018-11-19 03:43:01', '2018-11-19 03:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news`(
    `id` INT(10) NOT NULL,
    `title` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
    `content` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
    `image` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
    `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM DEFAULT CHARSET = utf8;


--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(64, 'PUREBOOST RBL SHOES', 8, 'Cảm thấy kết nối với mặt đất dưới chân bạn. Những đôi giày chạy bộ tự nhiên này được thiết kế cho thành phố thời tiết lạnh đang chạy với một chiếc áo đan len có khả năng chống giật gân, trên cao và một chiếc áo bảo vệ. Đệm đáp ứng mang lại năng lượng cho sải chân của bạn, và đế ngoài toàn địa hình cung cấp lực kéo tối ưu trên bề mặt ẩm ướt hoặc trơn trượt.', 7200000, 0, 'PUREBOOST-RBL-SHOES.jpg', 'đôi', 0, NULL, NULL),
(65, 'PUREBOOST X CLIMA SHOES', 8, 'Trải nghiệm khả năng thở đặc biệt trong những đôi giày Pureboost X Clima này. Với việc xây dựng Climacool, phần trên của những đôi giày chạy bộ này giúp làm mát allover để bàn chân của bạn được thông gió từ đầu đến cuối. Lớp phủ bảng điều khiển quý cung cấp hỗ trợ, trong khi vòm thích ứng cung cấp một phù hợp với phụ nữ cụ thể phù hợp với flex tự nhiên của bàn chân và splay của bạn. Tăng nhiên liệu cho chuyến đi bằng đệm tiết kiệm năng lượng trên mỗi lần đẩy và chạm xuống', 3200000, 2700000, 'PUREBOOST-X-CLIMA-SHOES.jpg', 'đôi', 1, NULL, NULL),
(66, 'ULTRABOOST SHOES', 8, 'Những đôi giày chạy bộ kết hợp sự thoải mái và công nghệ hiệu suất cao cho một cảm giác tốt nhất bao giờ hết. Họ có một chiếc áo đan len căng trên đó thích nghi với hình dạng thay đổi của bàn chân của bạn khi bạn chạy. Đệm midsole đáp ứng và một đế ngoài linh hoạt cung cấp một chuyến đi suôn sẻ và tràn đầy sinh lực', 4200000, NULL, 'ULTRABOOST-SHOES.jpg', 'đôi', 1, NULL, NULL),
(67, 'ADIZERO BOSTON 7 SHOES', 8, 'Cảm thấy nhẹ, nhanh và kết nối với con đường trong những đôi giày chạy bộ này. Làm bằng lưới khí rất thoáng khí, những đôi giày có một hệ thống Microfit mà khóa xuống gót chân và midfoot cho phù hợp với an toàn. Đệm đáp ứng và đế ngoài linh hoạt mang đến một chuyến đi êm ái và tràn đầy sinh lực.', 24000000, 21000000, 'ADIZERO-BOSTON-7-SHOES.jpg', 'đôi', 1, NULL, NULL),
(68, 'AEROBOUNCE 2 SHOES', 8, 'Được xây dựng để chạy đường dài, giày nam cân bằng sự thoải mái và hỗ trợ trong một bản xây dựng nhẹ. Lớp lót da lộn ở phần trên của lưới thoáng khí có cảm giác mềm mại đối với bàn chân của bạn. Một khung viền và dải băng giữa cung cấp một sự vừa vặn.', 5100000, 4800000, 'AEROBOUNCE-2-SHOES.jpg', 'đôi', 1, NULL, NULL),
(69, 'ADIZERO TEMPO 9 SHOES', 8, 'Làm cho sự ổn định, những đôi giày chạy được thiết kế với đệm vững chắc trên mặt trung gian để hướng dẫn bàn chân từ chân đến chân-off. Họ có một lưới trên nhẹ mà khóa xuống cho phù hợp tối ưu. Đệm đáp ứng và đế ngoài linh hoạt mang đến một chuyến đi êm ái và tràn đầy sinh lực.', 7700000, NULL, 'ADIZERO-TEMPO-9-SHOES.jpg', 'đôi', 1, NULL, NULL),
(70, 'SOLAR BOOST SHOES', 8, 'Những đôi giày chạy đa năng này được thiết kế để tạo sự thoải mái khi đi xa. Họ có một trên mà ôm chân của bạn trong hỗ trợ nén và một đế ngoài linh hoạt thích nghi với footstrike độc đáo của bạn', 2100000, 1700000, 'SOLAR-BOOST-SHOES.jpg', 'đôi', 0, NULL, NULL),
(71, 'PUREBOOST DPR SHOES', 8, 'Những đôi giày tối giản được xây dựng cho các Á hậu đô thị. Đệm xuống, một midsole thả thấp hơn và một nền tảng ngón chân cái rộng hơn cung cấp cho họ một cảm giác gần mặt đất trên đường phố thành phố. Các tính năng đan trên da lộn lót cho thoải mái mềm mại.', 3200000, 2950000, 'PUREBOOST-DPR-SHOES.jpg', 'đôi', 0, NULL, NULL),
(72, 'SOLAR DRIVE SHOES', 8, 'Những đôi giày chạy giúp bạn thêm dặm để đào tạo của bạn với đệm đáp ứng và phù hợp hỗ trợ. Họ có một lưới thoáng khí trên và một đế ngoài linh hoạt cho chuyển tiếp trơn tru từ hạ cánh để đẩy-off. Bộ đếm gót chân khóa khớp trong khi cho phép Achilles di chuyển tự do.', 5500000, 3200000, 'SOLAR-DRIVE-SHOES.jpg', 'đôi', 1, NULL, NULL),
(73, 'FORTARUN BEAT THE WINTER SHOES', 8, 'Những đôi giày được làm cho thời tiết mùa đông với một phía trên đan có nắp ngón chân và bảo vệ bùn. Lớp lót lông cừu ấm cúng giữ cho bàn chân ấm áp, và một chiếc midsole sang trọng mang lại sự thoải mái cho khách.', 11000000, 10500000, 'FORTARUN-BEAT-THE-WINTER-SHOES.jpg', 'đôi', 1, NULL, NULL),
(74, 'SOLAR GLIDE SHOES', 8, 'Một cặp đi-cho cho tất cả các hoạt động của bạn, những đôi giày này có năng lượng đệm hoạt động với một đế ngoài linh hoạt để cung cấp một chuyến đi suôn sẻ và thoải mái. Phần trên của lưới thoáng khí được thiết kế để hỗ trợ và kéo căng khi bạn di chuyển cho phù hợp tối ưu.', 8800000, NULL, 'SOLAR-GLIDE-SHOES.jpg', 'đôi', 0, NULL, NULL),
(81, 'Giay Nike Luna Racer3', 9, 'Hãng Nike vừa mới tung ra thị trường mẫu giày mang tên Luna Racer +3. Sản phẩm này nhanh chóng nhận được sự đón nhận tích cực của giới trẻ yêu giày. Bởi kiểu dáng mới mẻ, bắt mắt và sự êm ái mà nó mang lại.\r\n\r\nToàn bộ mẫu giày được thiết kế chủ yếu là các gam màu sáng như: đỏ, cam, xanh, xám,… cho bạn dễ dàng lựa chọn sắc màu yêu thích.\r\n\r\nChính kiểu dáng sang trọng, màu sắc bắt mắt mà cho đến bây giờ. Mẫu giày Luna Racer +3 này vẫn luôn giữ vững danh hiệu của mình trong giới yêu giày.', 3450000, NULL, 'Giay-Nike-Luna-Racer3.jpg', 'đôi', 1, NULL, NULL),
(82, 'Nike Air Jordan 1', 9, 'Bên cạnh các mẫu giày thể thao nhỏ gọn, thì hãng Nike còn cho ra đời những mẫu giày thể thao cổ cao đẹp mắt. Điển hình trong số đó là đôi giày “The Nike Air Jordan 1″.\r\n\r\nĐây là dòng sản phẩm được đánh giá cao nhất trong thị trường giày Sneaker. Do đó giá tiền của nó nằm trong hạng top.\r\n\r\nMang phong cách nam tính, mạnh mẽ kết hợp tinh tế trong cách phối màu mới với chất liệu cao cấp. Càng gây sự chú ý và sức thu hút mạnh đối với các bạn nam. Ngoài gam màu xanh đen thì mẫu giày này còn có thêm phối rất được các bạn trẻ yêu thích.', 7850000, NULL, 'Giay-Nike-Air-Jordan1.jpg', 'đôi', 1, NULL, NULL),
(83, 'Giay Nike Dual Fusion Run 3', 9, 'Một sản phẩm nổi bật của Nike không thể không kể đến đó chính là Dual Fusion Run 3. Với thiết kế đầy sáng tạo đến mức hoàn hảo đến từng chi tiết. Làm toát lên vẻ đẹp tinh tế, hiện đại. Chắc chắn, bạn sẽ yêu ngay Dual Fusion Run 3 từ cái nhìn đầu tiên.\r\n\r\nMẫu giày ra mắt với các màu sắc hấp dẫn được nhiều người ưa chuông như: màu đỏ, xanh, đen, xám,… Do đó, bạn thỏa thích lựa chọn các gam màu yêu thích, cũng như dễ dàng phối với các trang phục khác nhau.', 3700000, NULL, 'Giay-Nike-Dual-Fusion-Run3.jpg', 'đôi', 0, NULL, NULL),
(85, 'Nike Roshe Run', 9, 'Thuộc dòng giày chạy bộ, giày Nike Roshe Run được ưa dùng bởi những người chơi thể thao. Bởi nó mang lại cảm giác thoải mái, nhẹ nhàng cho người sử dụng khi luyện tập hay vận động mạnh.\r\n\r\nVới kiểu thiết kế phần trên được trang bị vải lưới thông thoáng giúp thoát khí và mồ hôi. Nên được rất nhiều người yêu thích. Kết hợp hệ thống đệm xốp êm ái bảo vệ và hỗ trợ gót chân. Cùng với thiết kế phần mũi tròn hơi vểnh giúp dễ dàng di chuyển và giữa vững cân bằng.', 1600000, NULL, 'giay-nike-roshe-run.jpg', 'đôi', 0, NULL, NULL),
(86, 'Nike W Air Relentless 4MSL', 9, 'Không chỉ phát triển các dòng giày Sneaker danh cho nam, mà hãng Nike còn thiết kế và cho ra đời những sản phẩm các giày thể thao nữ. Nổi bật trong số đó phải kể đến cái tên “Giày Nike W Air Relentless 4 MSL”.\r\nVới các gam màu sáng cùng kiểu dáng mới mẻ mang đến nét đẹp đặc trưng cho từng mẫu giày. Đế giày sử dụng chất liệu cao su đàn hồi cao cấp nên có độ bền cao, tăng khả năng chống trơn trượt, an toàn cho người dùng.\r\n\r\nCùng với kiểu thiết kế ôm sát chân, vừa vặn mang lại cảm giác êm ái, thoải mái khi di chuyển.', 9200000, 8200000, 'Giay-Nike-W-Air-Relentless-4MSL.jpg', 'đôi', 1, NULL, NULL),
(87, 'Nike Air Zoom Pegasus', 9, 'Đây được xem là một phiên bản mới của dòng giày Nike hot nhất trong thị trường giày ở Việt Nam. Với kiểu dáng thiết kế hiện đại, sử dụng chất liệu cao cấp.\r\n\r\nĐế giày Carbon làm thúc đẩy sự chuyển động với phần đệm lót là chất Lunarlon mềm mịn và vững chắc.', 3350000, 3000000, 'mau-giay-Nike-Air-Zoom-Pegasus.jpg', 'đôi', 1, NULL, NULL),
(88, 'Nike Mercurial Vortex III Turf Trainers', 9, 'Một trong những sản phẩm nổi tiếng trong danh sách giày thể thao của Nike không thể không kể đến Mercurial Vortex III Turf Trainers.\r\n\r\nLà sản phẩm chuyên dụng trong bóng đá với thiết kế độc đáo. Có phần mũi nhọn và tròn để dễ dàng sút bóng hơn, và phần đế giày chuyên dụng dành cho việc di chuyển trên sân bóng.', 4200000, 3200000, 'mau-giay-Nike-Mercurial-Vortex-III-Turf-Trainers.jpg', 'đôi', 1, NULL, NULL),
(89, 'Nike Zoom Vapor9.5 Tour Flyknit', 9, 'Năm vừa qua Nike đã cho ra mắt mẫu giày Tennis mang tên Zoom Vapor 9.5 Tour Flyknit. Đánh dấu một kiểu thiết kế độc đáo của hãng từ đường may đến từng chi tiết tạo nên điểm nhấn khác biệt cho mẫu giày này.\r\n\r\nSở hữu kiểu dáng thiết kế hiện đại, gọn nhẹ mang đến những trải nghiệm thú vị cho người sử dụng. Bởi sự mềm mại, êm ái và cảm giác thoải mái hơn bằng công nghệ Flywire.', 4700000, 4400000, 'mau-giay-Nike-Zoom-Vapor9.5-Tour-Flyknit.jpg', 'đôi', 1, NULL, NULL),
(90, 'Nike Air Max 1987', 9, 'Ra mắt giới điệu mộ từ năm 1987. những cho đến này mẫu sản phẩm vẫn luôn giữ vững vị trí trong top những đôi giày Nike được yêu thích nhất từ trước đến nay. Có lẽ không cần phải đề cập đến những ưu điểm tuyệt vời mà đôi giày mang lại cho chủ nhân của nó.\r\n\r\nChính thương hiệu nổi tiếng của dòng sản phẩm này đã nói lên tất cả. Từ đường may mũi chỉ được gia công cẩn thận. Đến chất liệu kiểu dáng thiết kế của nó đều khiến mỗi cô gái sỡ hữu ngay.\r\n\r\nĐặc biệt là đối với những cô nàng hay anh chàng có chiều cao khiêm tốn thì không có lý do gì để từ chối em nó cả.', 3250000, 3100000, 'mau-giay-Nike-Air-Max.jpg', 'đôi', 0, NULL, NULL),
(91, 'Nike Mag – Gây sốc với mức giá 2,2 tỷ đồng', 9, 'Phiên bản mới nhất của đôi giày Nike Mag ‘Back to the Future II’ được bán đấu giá tại Hồng Kông (ngày 12/10). Với mức giá lên tới 100.000USD (khoảng 2,2 tỷ đồng).\r\n\r\nPhiên bản này tiếp tục được bán đấu giá ở London với giá 46,230 bảng Anh (tương đương 1,2 tỷ đồng).', 2200000000, NULL, 'giay-nike-mag.jpg', 'đôi', 0, NULL, NULL),
(92, 'Chuck Taylor All Star Classic', 10, 'Các Chuck Taylor All Star cao hàng đầu là sneaker mang tính biểu tượng nhất trên thế giới, được công nhận cho hình bóng không thể nhầm lẫn của nó, sao mắt cá chân tập trung sao và tính xác thực văn hóa. Và giống như các mô hình tốt nhất, nó chỉ trở nên tốt hơn theo thời gian. Trong nhiều thế hệ, những màu sắc cổ điển và đế lưu hóa cao su chất lượng đã định nghĩa một biểu tượng. Sinh ra tại tòa án nhưng được thông qua bởi phiến quân, rocker, rapper, nghệ sĩ, mơ mộng, nhà tư tưởng và bản gốc, Chuck Taylor All Star tiếp tục kỷ niệm phong cách cá nhân và cá nhân tự thể hiện.', 11000000, 1000000, 'Chuck-Taylor-All-Star-Classic.jpg', 'đôi', 0, NULL, NULL),
(93, 'Chuck Taylor All Star Classic', 10, 'Các Chuck Taylor All Star cao hàng đầu là sneaker mang tính biểu tượng nhất trên thế giới, được công nhận cho hình bóng không thể nhầm lẫn của nó, sao mắt cá chân tập trung sao và tính xác thực văn hóa. Và giống như các mô hình tốt nhất, nó chỉ trở nên tốt hơn theo thời gian. Trong nhiều thế hệ, những màu sắc cổ điển và đế lưu hóa cao su chất lượng đã định nghĩa một biểu tượng. Sinh ra tại tòa án nhưng được thông qua bởi phiến quân, rocker, rapper, nghệ sĩ, mơ mộng, nhà tư tưởng và bản gốc, Chuck Taylor All Star tiếp tục kỷ niệm phong cách cá nhân và cá nhân tự thể hiện.', 1000000, NULL, 'Chuck-Taylor-All-Star-Classic1.jpg', 'đôi', 0, NULL, NULL),
(94, 'Converse Chuck 70 GORE TEX High Top', 10, 'The Converse Chuck 70 GORE-TEX® sets you up with water-repellent canvas and a cushioned insole along with the classic touches you expect from your Cons.', 1950000, 1900000, 'Converse-Chuck-70-GORE-TEX-High-Top.jpg', 'đôi', 0, NULL, NULL),
(95, 'Converse Chuck Taylor All Star WP Leather High Top', 10, 'Converse Chuck Taylor Tất cả các ngôi sao WP da đặt bạn lên với một cao cấp trên và một tay áo bên trong lưới giúp giữ cho bạn ấm áp và khô khi phải đối mặt với các yếu tố.', 2100000, NULL, 'Converse-Chuck-Taylor-All-Star-WP-Leather-High-Top.jpg', 'đôi', 1, NULL, NULL),
(96, 'Chuck 70 Classic High Top', 10, 'Converse All Star Chuck ’70 là chiếc sneaker tái chế của chúng tôi sử dụng các chi tiết hiện đại để kỷ niệm Chuck Taylor All Star nguyên bản từ những năm 1970. Nó có tính năng cao su hơi cao hơn một con cáo, một footbed đệm cung cấp sự thoải mái lâu dài và một cap toe cao su đáng kể hơn. Chi tiết cổ điển bổ sung bao gồm khâu trên hông và một lớp vải trên cao hơn cho thoải mái và độ bền. Họ tham gia các thuộc tính mang tính biểu tượng của Chuck Taylor như miếng dán mắt cá chân ở giữa có hình sao và đế ngoài cao su lưu hóa.', 1550000, 1400000, 'Chuck 70 Classic High Top.jpg', 'đôi', 1, NULL, NULL),
(97, 'Chuck 70 Classic Low Top', 10, 'Converse All Star Chuck ’70 là chiếc sneaker tái chế của chúng tôi sử dụng các chi tiết hiện đại để kỷ niệm Chuck Taylor All Star nguyên bản từ những năm 1970. Nó có tính năng cao su hơi cao hơn một con cáo, một footbed đệm cung cấp sự thoải mái lâu dài và một cap toe cao su đáng kể hơn. Chi tiết cổ điển bổ sung bao gồm khâu trên hông và một lớp vải trên cao hơn cho thoải mái và độ bền. Họ tham gia các thuộc tính mang tính biểu tượng của Chuck Taylor như miếng dán mắt cá chân ở giữa có hình sao và đế ngoài cao su lưu hóa.', 1700000, 1650000, 'Chuck 70 Classic Low Top.jpg', 'đôi', 1, NULL, NULL),
(98, 'Converse x GOLF le FLEUR* Chuck 70 High Top', 10, 'Converse x GOLF le FLEUR* Chuck 70 High Top', 1850000, NULL, 'Converse x GOLF le FLEUR* Chuck 70 High Top.jpg', 'đôi', 1, NULL, NULL),
(99, 'Converse x GOLF le FLEUR* One Star Low Top', 10, 'Check out the all-new, all-neutral collection by Tyler, the Creator. Tyler\'s back for Winter \'18 with a fresh take on apparel, the One Star and, for his first time, the Chuck 70.', 2300000, 21000000, 'Converse x GOLF le FLEUR* One Star Low Top.jpg', 'đôi', 1, NULL, NULL),
(101, 'Macbook pro 2017', 11, 'Macbook Pro MPXR2 là dòng sản phẩm cao cấp với thiết kế kim loại nguyên khối, chip i5 thế hệ thứ 7 và dùng ổ SSD dung lượng 128 GB mang đến sự bền bỉ và mạnh mẽ khi sử dụng.', 30500000, 30000000, 'mac.jpg', 'chiếc', 1, NULL, NULL),
(102, 'Macbook Air 2017', 11, 'Macbook là sản phẩm của Apple được sản xuất bằng nhôm nguyên khối, có một hệ điều hành ổn định và cũng rất mắc tiền nhưng được nhiều người dùng ưa thích. Vậy làm sao để chọn cho mình một máy Macbook ứng ý, hợp với túi tiền, phục vụ tốt cho công việc đó là điều mà rất nhiều người dùng quan tâm khi mua máy macbook. Đặc biệt là khi chọn mua macbook cũ. Sẽ rất dễ mua  nhầm phải hàng không chất lượng, đã bị  bung máy ', 15300000, 15000000, 'mac-air.jpg', 'chiếc', 1, NULL, NULL),
(130, 'Luna Racer +3', 8, 'Được đánh giá là một trong', 3500000, 3200000, '1542643586.jpg', 'đôi', 1, '2018-11-19 16:06:26', '2018-11-19 16:06:26');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', '1.jpg'),
(2, '', '2.jpg'),
(3, '', '3.jpg'),
(4, '', '4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(8, 'Adidas', 'Trong số các ông lớn trong làng giày thể thao, không thể không kể tên Adidas – Gã khổng lồ đến từ Đức và cũng là hãng giày thể thao đứng thứ hai thế giới về doanh thu.. Đã có thời điểm Adidas tỏ ra tụt hậu so với các hãng giày thể thao khác như Nike, Under Armour Inc… Nhưng hiện tại hãng đang có sự phục hồi với những mẫu giày mới được ra mắt như : NMD, Tubular, Ultraboost và Alphabounce.', '', NULL, NULL),
(9, 'Nike', 'Thương hiệu giày thể thao Nike được biết đến là thương hiệu giày thể thao được ưa chuộng hàng đầu thế giới và là một đại diện của nền văn hóa và phong cách Mỹ. Nhắc đến Nike, ta không thể không biết biết logo mang tính biểu tượng nhất thế giới và câu slogan kinh điển “just do it”. Mời các bạn cùng NG Store tìm hiểu sơ lược về thương hiệu thể thao lớn nhất thế giới này.', '', NULL, NULL),
(10, 'Converse', 'Converse', 'Chuck-Taylor-All-Star-Classic.jpg', NULL, NULL),
(11, 'Laptop', 'Macbook Pro MPXR2 là dòng sản phẩm cao cấp với thiết kế kim loại nguyên khối, chip i5 thế hệ thứ 7 và dùng ổ SSD dung lượng 128 GB mang đến sự bền bỉ và mạnh mẽ khi sử dụng.', 'mac.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Nguyễn Tấn Hoài', 'nguyentanhoai072@gmail.com', '$2y$10$7.Xd4i68e2PulZu.JBbjBur2oKInjez45QI/ehVLD6Noqs5hJ7zWq', '0931329465', 'Quận 7', '8NctZKgingiuFjNqcypsEvvEKE2bjmi8iYxaruM9fQaireAp8Kgxi0s7uy1b', '2018-11-18 07:50:29', '2018-11-18 07:50:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
