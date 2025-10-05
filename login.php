<?php
require 'db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  header('Location: login.html');
  exit;
}

$username = trim($_POST['username'] ?? '');
$password = $_POST['password'] ?? '';

if ($username === '' || $password === '') {
  header('Location: login.html?error=empty');
  exit;
}

$stmt = $pdo->prepare('SELECT id, username, password, role FROM users WHERE username = ? OR email = ? LIMIT 1');
$stmt->execute([$username, $username]);
$user = $stmt->fetch();

if ($user && password_verify($password, $user['password'])) {
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['username'] = $user['username'];
    header('Location: dashboard.php');
    exit;
} else {
  header('Location: login.html?error=invalid');
  exit;
}
