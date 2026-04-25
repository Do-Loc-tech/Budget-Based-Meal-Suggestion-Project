<?php
session_start();
require_once "db.php";

// Kiểm tra đăng nhập
if (!isset($_SESSION["admin"])) {
    header("Location: admin-login.php");
    exit();
}

// Lấy danh sách người dùng (chỉ lấy user, không lấy admin)
$sql = "SELECT id, username, email, role, created_at, status FROM users WHERE role = 'user'";
$stmt = $pdo->query($sql);
$users = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Bảng điều khiển Quản trị viên</title>
  <link rel="stylesheet" href="style.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f9fa;
      margin: 0;
      padding: 0;
    }
    header {
      background: #34495e;
      color: white;
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    header ul {
      list-style: none;
      display: flex;
      gap: 20px;
      margin: 0;
      padding: 0;
    }
    header a {
      color: white;
      text-decoration: none;
      font-weight: bold;
    }
    main {
      padding: 30px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    th, td {
      text-align: center;
      padding: 12px;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #2980b9;
      color: white;
    }
    tr:hover {
      background-color: #f2f2f2;
    }
    .lock-btn, .unlock-btn, .delete-btn {
      padding: 6px 10px;
      border-radius: 4px;
      text-decoration: none;
      color: white;
      font-weight: bold;
      margin: 0 4px;
    }
    .lock-btn { background-color: #e67e22; }
    .unlock-btn { background-color: #27ae60; }
    .delete-btn { background-color: #e74c3c; }
    .lock-btn:hover { background-color: #d35400; }
    .unlock-btn:hover { background-color: #1e8449; }
    .delete-btn:hover { background-color: #c0392b; }
  </style>
  <script>
    function confirmAction(url, message) {
      if (confirm(message)) {
        window.location.href = url;
      }
    }
  </script>
</head>
<body>
<header>
  <h1>Khu vực Quản trị viên</h1>
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
  <section class="user-list">
    <h2>Danh sách người dùng</h2>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Tên đăng nhập</th>
          <th>Email</th>
          <th>Trạng thái</th>
          <th>Ngày tạo</th>
          <th>Hành động</th>
        </tr>
      </thead>
      <tbody>
        <?php if ($users): ?>
          <?php foreach ($users as $row): ?>
            <tr>
              <td><?= $row['id'] ?></td>
              <td><?= htmlspecialchars($row['username']) ?></td>
              <td><?= htmlspecialchars($row['email']) ?></td>
              <td><?= $row['status'] ?></td>
              <td><?= $row['created_at'] ?></td>
              <td>
                <?php if ($row['status'] === 'Active'): ?>
                  <a href="javascript:void(0)" class="lock-btn"
                     onclick="confirmAction('locker-user.php?id=<?= $row['id'] ?>&action=lock', 'Bạn có chắc muốn khóa tài khoản này không?')">Khóa</a>
                <?php else: ?>
                  <a href="javascript:void(0)" class="unlock-btn"
                     onclick="confirmAction('locker-user.php?id=<?= $row['id'] ?>&action=unlock', 'Mở khóa tài khoản này?')">Mở khóa</a>
                <?php endif; ?>
                <a href="javascript:void(0)" class="delete-btn"
                   onclick="confirmAction('locker-user.php?id=<?= $row['id'] ?>&action=delete', 'Xóa tài khoản này?')">Xóa</a>
              </td>
            </tr>
          <?php endforeach; ?>
        <?php else: ?>
          <tr><td colspan="6">Chưa có người dùng nào.</td></tr>
        <?php endif; ?>
      </tbody>
    </table>
  </section>
</main>
</body>
</html>
