<?php
session_start();
require_once "db.php";

// Nếu admin đã đăng nhập thì chuyển luôn sang dashboard
if (isset($_SESSION["admin"])) {
    header("Location: admin_dashboard.php");
    exit();
}

$error = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST["username"]);
    $password = trim($_POST["password"]);

    // Lấy thông tin admin từ DB
    $sql = "SELECT * FROM users WHERE username = ? AND role = 'admin' LIMIT 1";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$username]);
    $admin = $stmt->fetch();

    // Kiểm tra tồn tại và mật khẩu hợp lệ
    if ($admin && password_verify($password, $admin["password"])) {
        $_SESSION["admin"] = $admin["username"];
        header("Location: admin_dashboard.php");
        exit();
    } else {
        $error = "Sai tài khoản hoặc mật khẩu, hoặc bạn không có quyền quản trị!";
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập Quản trị viên</title>
  <link rel="stylesheet" href="style.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #ecf0f1;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .login-container {
      background: white;
      padding: 30px 40px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      text-align: center;
      width: 360px;
    }
    h2 {
      margin-bottom: 20px;
      color: #2c3e50;
    }
    label {
      display: block;
      text-align: left;
      margin-top: 10px;
      font-weight: bold;
    }
    input {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    button {
      width: 100%;
      padding: 10px;
      margin-top: 20px;
      background-color: #2980b9;
      border: none;
      color: white;
      font-size: 16px;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #1f6390;
    }
    p {
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <main class="login-container">
    <h2>Đăng nhập hệ thống quản trị</h2>
    <form method="post" class="login-form">
      <label for="username">Tên đăng nhập:</label>
      <input type="text" id="username" name="username" required>

      <label for="password">Mật khẩu:</label>
      <input type="password" id="password" name="password" required>

      <button type="submit">Đăng nhập</button>

      <?php if ($error): ?>
        <p style="color:red;"><?= htmlspecialchars($error) ?></p>
      <?php endif; ?>
    </form>
  </main>
</body>
</html>
