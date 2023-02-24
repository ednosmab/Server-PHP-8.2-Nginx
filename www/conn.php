<?php
$host = "db_nginx";
$dbname = "teste";
$username = "root";
$password = "root";
$port = "3306";
try {
  $conn = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conectado com sucesso";
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}
