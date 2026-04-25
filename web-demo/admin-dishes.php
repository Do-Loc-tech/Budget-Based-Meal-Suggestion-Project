<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once "db.php";
if (!isset($_SESSION["admin"])) {
    header("Location: admin-login.php");
    exit();
}

$sql = "SELECT * FROM dishes";
$stmt = $pdo->query($sql);
$dishes = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quản lý món ăn</title>
  <style>
    body { font-family: Arial; background: #f7f9fa; margin:0; }
    header { background:#34495e; color:white; padding:15px 30px; display:flex; justify-content:space-between; align-items:center; }
    a { color:white; text-decoration:none; font-weight:bold; }
    main { padding:30px; }
    table { width:100%; border-collapse:collapse; background:white; box-shadow:0 0 10px rgba(0,0,0,0.1); }
    th,td { border-bottom:1px solid #ddd; text-align:center; padding:10px; }
    th { background:#2980b9; color:white; }
    tr:hover { background:#f2f2f2; }
    .btn { padding:6px 10px; border-radius:4px; text-decoration:none; color:white; font-weight:bold; margin:0 3px; }
    .add-btn { background:#27ae60; }
    .edit-btn { background:#e67e22; }
    .delete-btn { background:#e74c3c; }
  </style>
</head>
<body>
<header>
  <h1>Quản lý món ăn</h1>
  <nav>
    <ul style="list-style:none;display:flex;gap:20px;margin:0;padding:0;">
      <li><a href="admin-home.php">Trang tổng quan</a></li>
      <li><a href="admin-dashboard.php">Người dùng</a></li>
      <li><a href="logout-admin.php">Đăng xuất</a></li>
    </ul>
  </nav>
</header>

<main>
  <a href="admin-add-dish.php" class="btn add-btn">+ Thêm món ăn</a>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Tên món</th>
        <th>Loại</th>
        <th>Giá mỗi người</th>
        <!-- <th>Ngày thêm</th> -->
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($dishes as $dish): ?>
        <tr>
          <td><?= $dish['id'] ?></td>
          <td><?= htmlspecialchars($dish['name']) ?></td>
          <td><?= $dish['diet_type'] ?></td>
          <td><?= $dish['cost_per_person'] ?> đ</td>
          <!-- <td><?= $dish['created_at'] ?></td> -->
          <td>
            <a href="admin-edit-dish.php?id=<?= $dish['id'] ?>" class="btn edit-btn">Sửa</a>
            <a href="admin-delete-dish.php?id=<?= $dish['id'] ?>" class="btn delete-btn"
               onclick="return confirm('Bạn có chắc muốn xóa món này không?')">Xóa</a>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</main>
</body>
</html>
