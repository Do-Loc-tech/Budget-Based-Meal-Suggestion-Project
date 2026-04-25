<?php
session_start();
require_once "db.php";
if (!isset($_SESSION["admin"])) {
    header("Location: admin-login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Trang tổng quan</title>
  <style>
    body { font-family: Arial; background: #f7f9fa; margin: 0; }
    header { background: #34495e; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
    a { color: white; text-decoration: none; font-weight: bold; }
    main { padding: 40px; text-align: center; }
  </style>
</head>
<body>
<header>
    <h1>Trang quản trị chính</h1>
    <nav>
        <ul style="list-style:none;display:flex;gap:20px;margin:0;padding:0;">
            <li><a href="admin-home.php">Trang tổng quan</a></li>
            <li><a href="admin-dashboard.php">Quản lý người dùng</a></li>
            <li><a href="admin-dishes.php">Quản lý món ăn</a></li>
            <li><a href="logout-admin.php">Đăng xuất</a></li>
        </ul>
    </nav>
</header>

<main>
  <h2>Xin chào, <?= htmlspecialchars($_SESSION["admin"]) ?></h2>
  <p>Chào mừng bạn đến hệ thống quản trị 🎯</p>
  <p>Tại đây bạn có thể:</p>
  <ul style="list-style:none;">
    <!-- <li>📊 Xem tổng số người dùng</li> -->
    <!-- <li>🔒 Quản lý khóa/mở khóa tài khoản</li> -->
    <li>🔒 Quản lý tài khoản</li>
    <li>🍽️ Quản lý dữ liệu món ăn</li>
    <!-- <li>⚙️ Thêm các tính năng quản trị khác</li> -->
  </ul>
</main>
</body>
</html>
