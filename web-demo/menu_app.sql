-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2025 at 03:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `diet` enum('TietKiem','Protein','Chay','ItDauMo','Healthy') NOT NULL,
  `price_total` int(11) NOT NULL,
  `people` int(11) DEFAULT 1,
  `ingredients` text DEFAULT NULL,
  `steps` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `menus` (`id`, `title`, `diet`, `price_total`, `people`, `ingredients`, `steps`) VALUES
(1, 'Cơm chiên trứng + Rau luộc', 'TietKiem', 15000, 1, '["Gạo: 5.000 VNĐ", "Trứng: 5.000 VNĐ", "Rau: 5.000 VNĐ"]', '["Vo gạo và nấu cơm", "Chiên cơm với trứng", "Luộc rau, chấm nước mắm"]'),
(2, 'Mì xào rau củ', 'TietKiem', 20000, 1, '["Mì gói: 5.000 VNĐ", "Rau củ: 10.000 VNĐ", "Gia vị: 5.000 VNĐ"]', '["Luộc mì", "Xào rau củ với mì", "Nêm nếm vừa ăn"]'),
(3, 'Cơm rang dưa bò', 'TietKiem', 25000, 1, '["Cơm nguội: 5.000 VNĐ", "Dưa muối: 5.000 VNĐ", "Thịt bò: 15.000 VNĐ"]', '["Xào bò với dưa muối", "Cho cơm vào rang", "Nêm gia vị"]'),
(4, 'Ức gà nướng + Trứng luộc', 'Protein', 50000, 1, '["Ức gà: 40.000 VNĐ", "Trứng gà: 10.000 VNĐ"]', '["Ướp ức gà", "Nướng ức gà vàng đều", "Luộc trứng vừa chín tới"]'),
(5, 'Cá hồi áp chảo + Salad rau củ', 'Protein', 80000, 1, '["Cá hồi: 60.000 VNĐ", "Rau củ: 20.000 VNĐ"]', '["Áp chảo cá hồi", "Trộn salad rau củ với dầu ô liu"]'),
(6, 'Thịt bò xào súp lơ + Cơm trắng', 'Protein', 55000, 1, '["Thịt bò: 40.000 VNĐ", "Súp lơ: 10.000 VNĐ", "Gạo: 5.000 VNĐ"]', '["Luộc cơm", "Xào bò với súp lơ", "Nêm nếm vừa ăn"]'),
(7, 'Đậu phụ sốt cà + Rau củ xào', 'Chay', 30000, 1, '["Đậu phụ: 10.000 VNĐ", "Cà chua: 5.000 VNĐ", "Rau củ: 15.000 VNĐ"]', '["Rán đậu vàng", "Sốt cà chua", "Xào rau củ"]'),
(8, 'Bún xào chay', 'Chay', 27000, 1, '["Bún gạo: 10.000 VNĐ", "Nấm: 10.000 VNĐ", "Rau củ: 7.000 VNĐ"]', '["Luộc bún", "Xào nấm và rau củ", "Trộn chung với bún"]'),
(9, 'Cơm gạo lứt + Đậu hũ hấp', 'Chay', 35000, 1, '["Gạo lứt: 10.000 VNĐ", "Đậu hũ: 10.000 VNĐ", "Rau củ: 15.000 VNĐ"]', '["Nấu cơm gạo lứt", "Hấp đậu hũ", "Dọn cùng rau củ"]'),
(10, 'Canh rau cải + Cá hấp', 'ItDauMo', 40000, 1, '["Cá: 25.000 VNĐ", "Rau cải: 10.000 VNĐ", "Gia vị: 5.000 VNĐ"]', '["Hấp cá với gừng", "Nấu canh rau cải", "Dọn cùng cơm"]'),
(11, 'Salad cá ngừ + Trứng luộc', 'ItDauMo', 38000, 1, '["Cá ngừ hộp: 20.000 VNĐ", "Trứng: 10.000 VNĐ", "Rau xà lách: 8.000 VNĐ"]', '["Luộc trứng", "Trộn salad với cá ngừ và dầu ô liu"]'),
(12, 'Canh bí đỏ + Thịt nạc hấp', 'ItDauMo', 42000, 1, '["Bí đỏ: 10.000 VNĐ", "Thịt nạc: 25.000 VNĐ", "Gia vị: 7.000 VNĐ"]', '["Nấu canh bí đỏ", "Hấp thịt nạc", "Dọn cùng cơm"]'),
(13, 'Mì xào trứng', 'TietKiem', 19933, 1, '["Mì gói: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Rau cải: 8,000 VNĐ"]', '["Luộc mì", "Xào trứng và rau", "Nêm nếm"]'),
(14, 'Trứng luộc + Thịt nạc hấp', 'Protein', 39221, 2, '["Trứng: 10,000 VNĐ", "Thịt nạc: 30,000 VNĐ"]', '["Luộc trứng", "Hấp thịt nạc", "Dọn ra đĩa"]'),
(15, 'Mì xào trứng', 'TietKiem', 21142, 4, '["Mì gói: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Rau cải: 8,000 VNĐ"]', '["Luộc mì", "Xào trứng và rau", "Nêm nếm"]'),
(16, 'Ức gà áp chảo + Salad', 'Protein', 56926, 4, '["Ức gà: 40,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Ướp gà", "Áp chảo vàng đều", "Trộn salad rau củ"]'),
(17, 'Cơm trứng chiên', 'TietKiem', 17093, 2, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(18, 'Đậu hũ kho nấm', 'Chay', 28172, 3, '["Đậu hũ: 10,000 VNĐ", "Nấm: 15,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Chiên đậu hũ", "Kho với nấm", "Nêm vừa ăn"]'),
(19, 'Bánh mì trứng', 'TietKiem', 13951, 4, '["Bánh mì: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Tương ớt: 3,000 VNĐ"]', '["Chiên trứng", "Phết tương ớt", "Kẹp trứng vào bánh mì"]'),
(20, 'Trứng luộc + Thịt nạc hấp', 'Protein', 42610, 1, '["Trứng: 10,000 VNĐ", "Thịt nạc: 30,000 VNĐ"]', '["Luộc trứng", "Hấp thịt nạc", "Dọn ra đĩa"]'),
(21, 'Thịt bò xào rau củ', 'Protein', 52941, 3, '["Thịt bò: 35,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Xào thịt bò", "Thêm rau củ", "Nêm vừa ăn"]'),
(22, 'Cơm trứng chiên (phiên bản đặc biệt)', 'TietKiem', 14232, 3, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(23, 'Salad ức gà', 'ItDauMo', 49570, 4, '["Ức gà: 30,000 VNĐ", "Xà lách: 15,000 VNĐ", "Dầu ô liu: 5,000 VNĐ"]', '["Luộc ức gà", "Trộn salad", "Thêm dầu ô liu"]'),
(24, 'Cơm cá basa hấp + Rau củ (phiên bản đặc biệt)', 'ItDauMo', 38675, 3, '["Cá basa: 20,000 VNĐ", "Rau củ: 15,000 VNĐ", "Gạo: 5,000 VNĐ"]', '["Nấu cơm", "Hấp cá basa", "Luộc rau"]'),
(25, 'Bánh mì trứng', 'TietKiem', 13589, 2, '["Bánh mì: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Tương ớt: 3,000 VNĐ"]', '["Chiên trứng", "Phết tương ớt", "Kẹp trứng vào bánh mì"]'),
(26, 'Trứng luộc + Thịt nạc hấp', 'Protein', 38398, 4, '["Trứng: 10,000 VNĐ", "Thịt nạc: 30,000 VNĐ"]', '["Luộc trứng", "Hấp thịt nạc", "Dọn ra đĩa"]'),
(27, 'Đậu hũ kho nấm', 'Chay', 32344, 4, '["Đậu hũ: 10,000 VNĐ", "Nấm: 15,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Chiên đậu hũ", "Kho với nấm", "Nêm vừa ăn"]'),
(28, 'Cơm trứng chiên', 'TietKiem', 15965, 4, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(29, 'Salad ức gà', 'ItDauMo', 50123, 3, '["Ức gà: 30,000 VNĐ", "Xà lách: 15,000 VNĐ", "Dầu ô liu: 5,000 VNĐ"]', '["Luộc ức gà", "Trộn salad", "Thêm dầu ô liu"]'),
(30, 'Cơm cá khô + Dưa leo', 'TietKiem', 17305, 2, '["Cơm: 5,000 VNĐ", "Cá khô: 7,000 VNĐ", "Dưa leo: 3,000 VNĐ"]', '["Chiên cá khô", "Thái dưa leo", "Ăn cùng cơm"]'),
(31, 'Cơm trứng chiên', 'TietKiem', 14919, 1, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(32, 'Canh bí đỏ + Tôm hấp', 'ItDauMo', 40512, 4, '["Bí đỏ: 10,000 VNĐ", "Tôm: 25,000 VNĐ", "Gia vị: 7,000 VNĐ"]', '["Nấu canh", "Hấp tôm", "Dọn cùng cơm"]'),
(33, 'Miến xào chay', 'Chay', 28593, 3, '["Miến: 10,000 VNĐ", "Nấm: 10,000 VNĐ", "Rau củ: 10,000 VNĐ"]', '["Luộc miến", "Xào nấm và rau", "Trộn đều"]'),
(34, 'Cơm cá khô + Dưa leo', 'TietKiem', 13036, 1, '["Cơm: 5,000 VNĐ", "Cá khô: 7,000 VNĐ", "Dưa leo: 3,000 VNĐ"]', '["Chiên cá khô", "Thái dưa leo", "Ăn cùng cơm"]'),
(35, 'Cơm cá khô + Dưa leo (phiên bản đặc biệt)', 'TietKiem', 15130, 2, '["Cơm: 5,000 VNĐ", "Cá khô: 7,000 VNĐ", "Dưa leo: 3,000 VNĐ"]', '["Chiên cá khô", "Thái dưa leo", "Ăn cùng cơm"]'),
(36, 'Cá hấp gừng + Canh rau cải', 'ItDauMo', 40304, 2, '["Cá: 25,000 VNĐ", "Rau cải: 10,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Hấp cá", "Nấu canh", "Dọn ra bữa"]'),
(37, 'Đậu hũ kho nấm', 'Chay', 28150, 4, '["Đậu hũ: 10,000 VNĐ", "Nấm: 15,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Chiên đậu hũ", "Kho với nấm", "Nêm vừa ăn"]'),
(38, 'Thịt bò xào rau củ', 'Protein', 52802, 4, '["Thịt bò: 35,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Xào thịt bò", "Thêm rau củ", "Nêm vừa ăn"]'),
(39, 'Cơm trứng chiên (phiên bản đặc biệt)', 'TietKiem', 14787, 2, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(40, 'Salad ức gà', 'ItDauMo', 51889, 2, '["Ức gà: 30,000 VNĐ", "Xà lách: 15,000 VNĐ", "Dầu ô liu: 5,000 VNĐ"]', '["Luộc ức gà", "Trộn salad", "Thêm dầu ô liu"]'),
(41, 'Cơm gạo lứt + Rau luộc', 'Chay', 27465, 3, '["Gạo lứt: 10,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Nấu cơm gạo lứt", "Luộc rau", "Dọn ra đĩa"]'),
(42, 'Canh rau củ + Đậu phụ sốt cà (phiên bản đặc biệt)', 'Chay', 32863, 3, '["Rau củ: 15,000 VNĐ", "Đậu phụ: 10,000 VNĐ", "Cà chua: 5,000 VNĐ"]', '["Nấu canh", "Sốt cà chua", "Rán đậu phụ"]'),
(43, 'Cơm trứng chiên', 'TietKiem', 13141, 1, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(44, 'Trứng luộc + Thịt nạc hấp (phiên bản đặc biệt)', 'Protein', 41937, 2, '["Trứng: 10,000 VNĐ", "Thịt nạc: 30,000 VNĐ"]', '["Luộc trứng", "Hấp thịt nạc", "Dọn ra đĩa"]'),
(45, 'Cơm cá basa hấp + Rau củ', 'ItDauMo', 39742, 2, '["Cá basa: 20,000 VNĐ", "Rau củ: 15,000 VNĐ", "Gạo: 5,000 VNĐ"]', '["Nấu cơm", "Hấp cá basa", "Luộc rau"]'),
(46, 'Cơm trứng chiên', 'TietKiem', 15501, 2, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(47, 'Ức gà áp chảo + Salad', 'Protein', 56625, 3, '["Ức gà: 40,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Ướp gà", "Áp chảo vàng đều", "Trộn salad rau củ"]'),
(48, 'Ức gà áp chảo + Salad', 'Protein', 53604, 3, '["Ức gà: 40,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Ướp gà", "Áp chảo vàng đều", "Trộn salad rau củ"]'),
(49, 'Ức gà áp chảo + Salad', 'Protein', 56826, 3, '["Ức gà: 40,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Ướp gà", "Áp chảo vàng đều", "Trộn salad rau củ"]'),
(50, 'Canh bí đỏ + Tôm hấp (phiên bản đặc biệt)', 'ItDauMo', 44364, 2, '["Bí đỏ: 10,000 VNĐ", "Tôm: 25,000 VNĐ", "Gia vị: 7,000 VNĐ"]', '["Nấu canh", "Hấp tôm", "Dọn cùng cơm"]'),
(51, 'Bánh mì trứng', 'TietKiem', 13201, 2, '["Bánh mì: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Tương ớt: 3,000 VNĐ"]', '["Chiên trứng", "Phết tương ớt", "Kẹp trứng vào bánh mì"]'),
(52, 'Cơm cá khô + Dưa leo', 'TietKiem', 13422, 2, '["Cơm: 5,000 VNĐ", "Cá khô: 7,000 VNĐ", "Dưa leo: 3,000 VNĐ"]', '["Chiên cá khô", "Thái dưa leo", "Ăn cùng cơm"]'),
(53, 'Miến xào chay', 'Chay', 31706, 1, '["Miến: 10,000 VNĐ", "Nấm: 10,000 VNĐ", "Rau củ: 10,000 VNĐ"]', '["Luộc miến", "Xào nấm và rau", "Trộn đều"]'),
(54, 'Mì xào trứng', 'TietKiem', 22783, 2, '["Mì gói: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Rau cải: 8,000 VNĐ"]', '["Luộc mì", "Xào trứng và rau", "Nêm nếm"]'),
(55, 'Ức gà áp chảo + Salad', 'Protein', 53897, 4, '["Ức gà: 40,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Ướp gà", "Áp chảo vàng đều", "Trộn salad rau củ"]'),
(56, 'Cơm trứng chiên (phiên bản đặc biệt)', 'TietKiem', 16198, 2, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(57, 'Bánh mì trứng', 'TietKiem', 16464, 1, '["Bánh mì: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Tương ớt: 3,000 VNĐ"]', '["Chiên trứng", "Phết tương ớt", "Kẹp trứng vào bánh mì"]'),
(58, 'Cá hồi nướng bơ tỏi', 'Protein', 78532, 1, '["Cá hồi: 60,000 VNĐ", "Bơ tỏi: 20,000 VNĐ"]', '["Ướp cá hồi", "Nướng chín vàng", "Rưới bơ tỏi lên trên"]'),
(59, 'Miến xào chay (phiên bản đặc biệt)', 'Chay', 29447, 2, '["Miến: 10,000 VNĐ", "Nấm: 10,000 VNĐ", "Rau củ: 10,000 VNĐ"]', '["Luộc miến", "Xào nấm và rau", "Trộn đều"]'),
(60, 'Mì xào trứng', 'TietKiem', 20604, 2, '["Mì gói: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Rau cải: 8,000 VNĐ"]', '["Luộc mì", "Xào trứng và rau", "Nêm nếm"]'),
(61, 'Salad ức gà', 'ItDauMo', 49724, 2, '["Ức gà: 30,000 VNĐ", "Xà lách: 15,000 VNĐ", "Dầu ô liu: 5,000 VNĐ"]', '["Luộc ức gà", "Trộn salad", "Thêm dầu ô liu"]'),
(62, 'Ức gà áp chảo + Salad (phiên bản đặc biệt)', 'Protein', 57875, 4, '["Ức gà: 40,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Ướp gà", "Áp chảo vàng đều", "Trộn salad rau củ"]'),
(63, 'Cơm trứng chiên (phiên bản đặc biệt)', 'TietKiem', 16115, 1, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(64, 'Cơm trứng chiên', 'TietKiem', 13660, 2, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(65, 'Đậu hũ kho nấm (phiên bản đặc biệt)', 'Chay', 31120, 2, '["Đậu hũ: 10,000 VNĐ", "Nấm: 15,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Chiên đậu hũ", "Kho với nấm", "Nêm vừa ăn"]'),
(66, 'Salad ức gà', 'ItDauMo', 49640, 2, '["Ức gà: 30,000 VNĐ", "Xà lách: 15,000 VNĐ", "Dầu ô liu: 5,000 VNĐ"]', '["Luộc ức gà", "Trộn salad", "Thêm dầu ô liu"]'),
(67, 'Cơm trứng chiên', 'TietKiem', 17197, 4, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(68, 'Cơm trứng chiên (phiên bản đặc biệt)', 'TietKiem', 15582, 4, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(69, 'Cá hồi nướng bơ tỏi (phiên bản đặc biệt)', 'Protein', 82261, 3, '["Cá hồi: 60,000 VNĐ", "Bơ tỏi: 20,000 VNĐ"]', '["Ướp cá hồi", "Nướng chín vàng", "Rưới bơ tỏi lên trên"]'),
(70, 'Cá hồi nướng bơ tỏi', 'Protein', 79040, 3, '["Cá hồi: 60,000 VNĐ", "Bơ tỏi: 20,000 VNĐ"]', '["Ướp cá hồi", "Nướng chín vàng", "Rưới bơ tỏi lên trên"]'),
(71, 'Cơm cá basa hấp + Rau củ (phiên bản đặc biệt)', 'ItDauMo', 41441, 4, '["Cá basa: 20,000 VNĐ", "Rau củ: 15,000 VNĐ", "Gạo: 5,000 VNĐ"]', '["Nấu cơm", "Hấp cá basa", "Luộc rau"]'),
(72, 'Đậu hũ kho nấm', 'Chay', 28534, 3, '["Đậu hũ: 10,000 VNĐ", "Nấm: 15,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Chiên đậu hũ", "Kho với nấm", "Nêm vừa ăn"]'),
(73, 'Thịt bò xào rau củ (phiên bản đặc biệt)', 'Protein', 48914, 2, '["Thịt bò: 35,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Xào thịt bò", "Thêm rau củ", "Nêm vừa ăn"]'),
(74, 'Canh rau củ + Đậu phụ sốt cà', 'Chay', 28207, 1, '["Rau củ: 15,000 VNĐ", "Đậu phụ: 10,000 VNĐ", "Cà chua: 5,000 VNĐ"]', '["Nấu canh", "Sốt cà chua", "Rán đậu phụ"]'),
(75, 'Cơm cá basa hấp + Rau củ (phiên bản đặc biệt)', 'ItDauMo', 39733, 1, '["Cá basa: 20,000 VNĐ", "Rau củ: 15,000 VNĐ", "Gạo: 5,000 VNĐ"]', '["Nấu cơm", "Hấp cá basa", "Luộc rau"]'),
(76, 'Mì xào trứng', 'TietKiem', 20222, 1, '["Mì gói: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Rau cải: 8,000 VNĐ"]', '["Luộc mì", "Xào trứng và rau", "Nêm nếm"]'),
(77, 'Thịt bò xào rau củ', 'Protein', 50281, 4, '["Thịt bò: 35,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Xào thịt bò", "Thêm rau củ", "Nêm vừa ăn"]'),
(78, 'Mì xào trứng (phiên bản đặc biệt)', 'TietKiem', 19734, 3, '["Mì gói: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Rau cải: 8,000 VNĐ"]', '["Luộc mì", "Xào trứng và rau", "Nêm nếm"]'),
(79, 'Mì xào trứng', 'TietKiem', 22690, 2, '["Mì gói: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Rau cải: 8,000 VNĐ"]', '["Luộc mì", "Xào trứng và rau", "Nêm nếm"]'),
(80, 'Thịt bò xào rau củ (phiên bản đặc biệt)', 'Protein', 48549, 1, '["Thịt bò: 35,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Xào thịt bò", "Thêm rau củ", "Nêm vừa ăn"]'),
(81, 'Cá hấp gừng + Canh rau cải', 'ItDauMo', 39845, 4, '["Cá: 25,000 VNĐ", "Rau cải: 10,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Hấp cá", "Nấu canh", "Dọn ra bữa"]'),
(82, 'Cơm gạo lứt + Rau luộc', 'Chay', 23938, 2, '["Gạo lứt: 10,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Nấu cơm gạo lứt", "Luộc rau", "Dọn ra đĩa"]'),
(83, 'Đậu hũ kho nấm (phiên bản đặc biệt)', 'Chay', 30237, 1, '["Đậu hũ: 10,000 VNĐ", "Nấm: 15,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Chiên đậu hũ", "Kho với nấm", "Nêm vừa ăn"]'),
(84, 'Ức gà áp chảo + Salad', 'Protein', 54628, 2, '["Ức gà: 40,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Ướp gà", "Áp chảo vàng đều", "Trộn salad rau củ"]'),
(85, 'Trứng luộc + Thịt nạc hấp', 'Protein', 39318, 1, '["Trứng: 10,000 VNĐ", "Thịt nạc: 30,000 VNĐ"]', '["Luộc trứng", "Hấp thịt nạc", "Dọn ra đĩa"]'),
(86, 'Thịt bò xào rau củ (phiên bản đặc biệt)', 'Protein', 52349, 3, '["Thịt bò: 35,000 VNĐ", "Rau củ: 15,000 VNĐ"]', '["Xào thịt bò", "Thêm rau củ", "Nêm vừa ăn"]'),
(87, 'Canh bí đỏ + Tôm hấp (phiên bản đặc biệt)', 'ItDauMo', 42040, 4, '["Bí đỏ: 10,000 VNĐ", "Tôm: 25,000 VNĐ", "Gia vị: 7,000 VNĐ"]', '["Nấu canh", "Hấp tôm", "Dọn cùng cơm"]'),
(88, 'Salad ức gà', 'ItDauMo', 48321, 3, '["Ức gà: 30,000 VNĐ", "Xà lách: 15,000 VNĐ", "Dầu ô liu: 5,000 VNĐ"]', '["Luộc ức gà", "Trộn salad", "Thêm dầu ô liu"]'),
(89, 'Cá hấp gừng + Canh rau cải', 'ItDauMo', 39300, 3, '["Cá: 25,000 VNĐ", "Rau cải: 10,000 VNĐ", "Gia vị: 5,000 VNĐ"]', '["Hấp cá", "Nấu canh", "Dọn ra bữa"]'),
(90, 'Miến xào chay (phiên bản đặc biệt)', 'Chay', 28614, 3, '["Miến: 10,000 VNĐ", "Nấm: 10,000 VNĐ", "Rau củ: 10,000 VNĐ"]', '["Luộc miến", "Xào nấm và rau", "Trộn đều"]'),
(91, 'Cá hồi nướng bơ tỏi', 'Protein', 78666, 1, '["Cá hồi: 60,000 VNĐ", "Bơ tỏi: 20,000 VNĐ"]', '["Ướp cá hồi", "Nướng chín vàng", "Rưới bơ tỏi lên trên"]'),
(92, 'Cơm cá basa hấp + Rau củ', 'ItDauMo', 41719, 2, '["Cá basa: 20,000 VNĐ", "Rau củ: 15,000 VNĐ", "Gạo: 5,000 VNĐ"]', '["Nấu cơm", "Hấp cá basa", "Luộc rau"]'),
(93, 'Bánh mì trứng', 'TietKiem', 14538, 1, '["Bánh mì: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Tương ớt: 3,000 VNĐ"]', '["Chiên trứng", "Phết tương ớt", "Kẹp trứng vào bánh mì"]'),
(94, 'Miến xào chay', 'Chay', 29853, 3, '["Miến: 10,000 VNĐ", "Nấm: 10,000 VNĐ", "Rau củ: 10,000 VNĐ"]', '["Luộc miến", "Xào nấm và rau", "Trộn đều"]'),
(95, 'Bánh mì trứng', 'TietKiem', 15040, 2, '["Bánh mì: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Tương ớt: 3,000 VNĐ"]', '["Chiên trứng", "Phết tương ớt", "Kẹp trứng vào bánh mì"]'),
(96, 'Mì xào trứng', 'TietKiem', 18983, 4, '["Mì gói: 5,000 VNĐ", "Trứng: 7,000 VNĐ", "Rau cải: 8,000 VNĐ"]', '["Luộc mì", "Xào trứng và rau", "Nêm nếm"]'),
(97, 'Trứng luộc + Thịt nạc hấp', 'Protein', 39203, 3, '["Trứng: 10,000 VNĐ", "Thịt nạc: 30,000 VNĐ"]', '["Luộc trứng", "Hấp thịt nạc", "Dọn ra đĩa"]'),
(98, 'Cơm trứng chiên', 'TietKiem', 13468, 4, '["Gạo: 5,000 VNĐ", "Trứng: 5,000 VNĐ", "Dầu ăn: 5,000 VNĐ"]', '["Nấu cơm", "Chiên trứng", "Dọn ra đĩa"]'),
(99, 'Canh rau củ + Đậu phụ sốt cà (phiên bản đặc biệt)', 'Chay', 28711, 4, '["Rau củ: 15,000 VNĐ", "Đậu phụ: 10,000 VNĐ", "Cà chua: 5,000 VNĐ"]', '["Nấu canh", "Sốt cà chua", "Rán đậu phụ"]'),
(100, 'Canh rau củ + Đậu phụ sốt cà (phiên bản đặc biệt)', 'Chay', 31351, 2, '["Rau củ: 15,000 VNĐ", "Đậu phụ: 10,000 VNĐ", "Cà chua: 5,000 VNĐ"]', '["Nấu canh", "Sốt cà chua", "Rán đậu phụ"]')



DELIMITER $$
CREATE TRIGGER `trg_update_stats_after_menu_insert` AFTER INSERT ON `menus` FOR EACH ROW BEGIN
    UPDATE stats SET total_menus = total_menus + 1;
END
$$
DELIMITER ;




CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DELIMITER $$
CREATE TRIGGER `trg_update_stats_after_review_insert` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
    UPDATE stats SET total_reviews = total_reviews + 1;
END
$$
DELIMITER ;



CREATE TABLE `saved_menus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DELIMITER $$
CREATE TRIGGER `trg_update_stats_after_saved_insert` AFTER INSERT ON `saved_menus` FOR EACH ROW BEGIN
    UPDATE stats SET total_saved = total_saved + 1;
END
$$
DELIMITER ;



CREATE TABLE `stats` (
  `id` int(11) NOT NULL,
  `total_users` int(11) DEFAULT 0,
  `total_menus` int(11) DEFAULT 0,
  `total_saved` int(11) DEFAULT 0,
  `total_reviews` int(11) DEFAULT 0,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `stats` (`id`, `total_users`, `total_menus`, `total_saved`, `total_reviews`, `last_update`) VALUES
(1, 0, 15, 0, 0, '2025-10-11 13:42:05');



CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DELIMITER $$
CREATE TRIGGER `trg_update_stats_after_user_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    UPDATE stats SET total_users = total_users + 1;
END
$$
DELIMITER ;


ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`);


ALTER TABLE `saved_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`);


ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);



ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;



ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `saved_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;



ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;



ALTER TABLE `saved_menus`
  ADD CONSTRAINT `saved_menus_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_menus_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;
COMMIT;

