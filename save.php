<?php
require 'db.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    die("❌ Vui lòng đăng nhập để sử dụng tính năng này!");
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die("Phương thức không hợp lệ!");
}

$username = $_SESSION['username'];
$budget = intval($_POST['budget'] ?? 0);
$people = intval($_POST['people'] ?? 0);
$diet = trim($_POST['diet'] ?? '');

$errors = [];
if ($budget < 10000) {
    $errors[] = "Ngân sách phải ≥ 10.000 VNĐ";
}
if ($people < 1) {
    $errors[] = "Số người phải ≥ 1";
}
if (empty($diet)) {
    $errors[] = "Vui lòng chọn chế độ ăn";
}

if (!empty($errors)) {
    echo "<div class='container mt-4'>";
    foreach ($errors as $error) {
        echo "<div class='alert alert-danger'>$error</div>";
    }
    echo "<a href='dashboard.php' class='btn btn-primary'>Quay lại</a>";
    echo "</div>";
    exit;
}

try {
    $sql = "INSERT INTO meals (username, budget, people, diet) VALUES (?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$username, $budget, $people, $diet]);
    
    echo "<div class='container mt-4'>";
    echo "<div class='alert alert-success'>";
    echo "✅ <strong>Thêm dữ liệu thành công!</strong><br>";
    echo "👤 Tên: $username <br>";
    echo "💰 Ngân sách: " . number_format($budget) . " VNĐ <br>";
    echo "👥 Số người: $people <br>";
    echo "🍽️ Chế độ: $diet <br><br>";
    echo "<a href='dashboard.php' class='btn btn-primary'>Quay lại Dashboard</a> | ";
    echo "<a href='index.html' class='btn btn-secondary'>Về trang chủ</a>";
    echo "</div>";
    echo "</div>";
    
} catch (PDOException $e) {
    error_log("Lỗi database: " . $e->getMessage());
    echo "<div class='alert alert-danger'>❌ Có lỗi xảy ra khi lưu dữ liệu, vui lòng thử lại!</div>";
}
