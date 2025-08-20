<?php
session_start();
include 'db_connect.php';

if (!isset($_GET['id']) || !isset($_GET['status'])) {
    header("Location: userList.php");
    exit();
}

$user_id = intval($_GET['id']);
$status = ($_GET['status'] === 'Active') ? 'Active' : 'Inactive';

$sql = "UPDATE USER SET USER_STATUS = '$status' WHERE USER_ID = $user_id";
mysqli_query($conn, $sql);

header("Location: userList.php?msg=Status updated successfully");
exit();
?>