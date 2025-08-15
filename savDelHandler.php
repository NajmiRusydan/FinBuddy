<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}
include 'db_connect.php';

$user_id = $_SESSION['user_id'];

if (isset($_GET['goal_id'])) {
    $goal_id = intval($_GET['goal_id']);

    $sql_del = "DELETE FROM SAVING_GOAL WHERE GOAL_ID = $goal_id AND USER_ID = $user_id";
    $result = mysqli_query($conn, $sql_del);

    if ($result) {
        header("Location: saving.php?msg=Saving goal has been deleted.");
        exit();
    } else {
        header("Location: saving.php?msg=Failed to delete saving goal.");
        exit();
    }
} else {
    header("Location: saving.php");
    exit();
}
?>