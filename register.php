<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  header('Location: register.html');
  exit;
}

$username = trim($_POST['username'] ?? '');
$email    = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if ($username === '' || $email === '' || $password === '') {
  header('Location: register.html?error=empty');
  exit;
}

$email = trim($_POST['email']);
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "<script>alert('Email không hợp lệ!');</script>";
    exit;
}

$stmt = $pdo->prepare('SELECT id FROM users WHERE username = ? OR email = ? LIMIT 1');
$stmt->execute([$username, $email]);
if ($stmt->fetch()) {
  header('Location: register.html?error=exists');
  exit;
}

$hash = password_hash($password, PASSWORD_DEFAULT);
$stmt = $pdo->prepare('INSERT INTO users (username, email, password) VALUES (?, ?, ?)');
$stmt->execute([$username, $email, $hash]);

header('Location: login.html?registered=1');
exit;
