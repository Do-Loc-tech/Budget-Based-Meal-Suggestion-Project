<?php
require_once "db.php";

$id = $_GET['id'] ?? 0;
$action = $_GET['action'] ?? '';

if ($id && in_array($action, ['lock', 'unlock', 'delete'])) {
    if ($action === 'lock') {
        $sql = "UPDATE users SET status = 'Locked' WHERE id = ?";
    } elseif ($action === 'unlock') {
        $sql = "UPDATE users SET status = 'Active' WHERE id = ?";
    } else { // delete
        $sql = "DELETE FROM users WHERE id = ?";
    }

    $stmt = $pdo->prepare($sql);
    $stmt->execute([$id]);
}

// Quay lại trang quản trị sau khi thao tác
header("Location: admin_dashboard.php");
exit();

