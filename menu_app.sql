SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET NAMES utf8mb4;

CREATE TABLE `sample_menus` (
  `id` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `steps` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sample_menus` (`id`, `title`, `price`, `ingredients`, `steps`) VALUES
('Chay', 'Đậu phụ sốt cà + Rau củ xào', 30000, 'Đậu phụ: 10.000 VNĐ; Cà chua: 5.000 VNĐ; Rau củ hỗn hợp: 15.000 VNĐ', 'Rán đậu, sốt cà chua; Xào rau củ với dầu thực vật'),
('Protein', 'Ức gà nướng + Trứng luộc', 50000, 'Ức gà: 40.000 VNĐ; Trứng gà: 10.000 VNĐ', 'Ướp ức gà với gia vị, nướng vàng; Luộc trứng chín vừa'),
('TietKiem', 'Cơm chiên trứng + Rau luộc', 15000, 'Gạo: 5.000 VNĐ; Trứng: 5.000 VNĐ; Rau xanh: 5.000 VNĐ', 'Vo gạo và nấu cơm; Chiên cơm với trứng và gia vị; Luộc rau, chấm nước mắm');

CREATE TABLE `saved_menus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `diet` varchar(50) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `people` int(11) DEFAULT NULL,
  `items` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `sample_menus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `saved_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

ALTER TABLE `saved_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `saved_menus`
  ADD CONSTRAINT `saved_menus_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

COMMIT;
