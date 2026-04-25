<?php
session_start();
require_once "db.php";
if (!isset($_SESSION["admin"])) {
    header("Location: admin-login.php");
    exit();
}

$id = $_GET["id"] ?? 0;
$sql = "SELECT * FROM dishes WHERE id = ?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$id]);
$dish = $stmt->fetch();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $desc = $_POST["description"];
    $price = $_POST["cost_per_person"];
    $type = $_POST["diet_type"];

    $update = "UPDATE dishes SET name=?, description=?, cost_per_person=?, diet_type=? WHERE id=?";
    $stmt = $pdo->prepare($update);
    $stmt->execute([$name, $desc, $price, $type, $id]);
    header("Location: admin-dishes.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Sửa món ăn</title>
</head>
<body>
  <h2>Chỉnh sửa món ăn</h2>
  <form method="post">
    <label>Tên món:</label><br>
    <input type="text" name="name" value="<?= htmlspecialchars($dish['name']) ?>" required><br><br>

    <label>Mô tả:</label><br>
    <textarea name="description" rows="3"><?= htmlspecialchars($dish['description']) ?></textarea><br><br>

    <label>Giá mỗi người:</label><br>
    <input type="number" name="cost_per_person" value="<?= $dish['cost_per_person'] ?>" step="0.01" required><br><br>

    <label>Loại chế độ ăn:</label><br>
    <select name="diet_type">
      <option value="TietKiem" <?= $dish['diet_type']=='TietKiem'?'selected':'' ?>>Tiết kiệm</option>
      <option value="Protein" <?= $dish['diet_type']=='Protein'?'selected':'' ?>>Giàu Protein</option>
      <option value="Chay" <?= $dish['diet_type']=='Chay'?'selected':'' ?>>Chay</option>
      <option value="ItDauMo" <?= $dish['diet_type']=='ItDauMo'?'selected':'' ?>>Ít dầu mỡ</option>
    </select><br><br>

    <button type="submit">Lưu thay đổi</button>
    <a href="admin-dishes.php">Hủy</a>
  </form>
</body>
</html>
