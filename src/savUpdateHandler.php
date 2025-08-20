<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}
include 'db_connect.php';
$user_id = $_SESSION['user_id'];

if (isset($_POST['goal_id'])) {
    $goal_id = intval($_POST['goal_id']);
    $name = mysqli_real_escape_string($conn, $_POST['savename']);
    $amount = floatval($_POST['saveamount']);
    $freq = mysqli_real_escape_string($conn, $_POST['freq']);
    $deadline = mysqli_real_escape_string($conn, $_POST['savedeadline']);

    $sql_current = "SELECT GOAL_CURRENT_AMOUNT FROM SAVING_GOAL WHERE GOAL_ID = $goal_id AND USER_ID = $user_id";
    $res_current = mysqli_query($conn, $sql_current);
    $row = mysqli_fetch_assoc($res_current);
    $current = isset($row['GOAL_CURRENT_AMOUNT']) ? floatval($row['GOAL_CURRENT_AMOUNT']) : 0;

    $remain = $amount - $current;
    $currentDate = new DateTime(date("Y-m-d"));
    $targetDate = new DateTime($deadline);
    $interval = $currentDate->diff($targetDate);
    $totaldays = $interval->days;
    if ($freq == "Monthly") {
        $period = ceil($totaldays / 30);
    } elseif ($freq == "Weekly") {
        $period = ceil($totaldays / 7);
    } else {
        $period = $totaldays;
    }
    if ($period > 0) {
        $newAvg = round($remain / $period, 2);
    } else {
        $newAvg = $remain;
    }

    $sql = "UPDATE SAVING_GOAL SET 
                GOAL_NAME = '$name',
                GOAL_TARGET_AMOUNT = '$amount',
                GOAL_FREQUENCY = '$freq',
                GOAL_DEADLINE = '$deadline',
                GOAL_SAVE_AMOUNT = '$newAvg'
            WHERE GOAL_ID = $goal_id AND USER_ID = $user_id";
    if (mysqli_query($conn, $sql)) {
        header("Location: saving.php?msg=Saving goal updated!");
        exit();
    } else {
        header("Location: saving.php?msg=Failed to update saving goal!");
        exit();
    }
} else {
    header("Location: saving.php?msg=Invalid update request!");
    exit();
}
?>