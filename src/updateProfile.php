<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}
include 'db_connect.php';

$user_id = $_SESSION['user_id'];
$email = isset($_POST['email']) ? trim($_POST['email']) : '';
$phone = isset($_POST['phone']) ? trim($_POST['phone']) : '';
$username = isset($_POST['username']) ? trim($_POST['username']) : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';
$bank_id = isset($_POST['bank_id']) ? intval($_POST['bank_id']) : 0;
$bank_balance = isset($_POST['bank_balance']) ? floatval($_POST['bank_balance']) : null;

if ($email == '' || $phone == '' || $username == '' || !$bank_id || $bank_balance === null) {
    echo "All fields are required.";
    exit();
}

if ($password != '') {
    $sql_user = "UPDATE USER SET USER_EMAIL='$email', USER_PHONE_NO='$phone', USERNAME='$username', PASSWORD='$password' WHERE USER_ID=$user_id";
} else {
    $sql_user = "UPDATE USER SET USER_EMAIL='$email', USER_PHONE_NO='$phone', USERNAME='$username' WHERE USER_ID=$user_id";
}
mysqli_query($conn, $sql_user) or die("User update failed");

$sql_bank = "UPDATE bank SET BANK_BALANCE=$bank_balance WHERE BANK_ID=$bank_id AND USER_ID=$user_id";
mysqli_query($conn, $sql_bank) or die("Bank balance update failed");

header("Location: dashboard.php?profile=updated");
exit();
?>