<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}
include 'db_connect.php';
$user_id = $_SESSION['user_id'];

$name = $_POST['savename'];
$amount = $_POST['saveamount'];
$freq = $_POST['freq'];
$deadline = $_POST['savedeadline'];

$current = 0;
$currentDateObj = new DateTime(date("Y-m-d"));
$targetDateObj = new DateTime($deadline);
$daysDiff = (int)$targetDateObj->format('U') - (int)$currentDateObj->format('U');
$totaldays = floor($daysDiff / 86400);

if ($targetDateObj < $currentDateObj) {
    header("Location: saving.php?msg=Deadline cannot be in the past.");
    exit();
}

$status = 'Ongoing';
$avgAmount = 0;

if ($current >= $amount) {
    $status = 'Complete';
    $avgAmount = 0;
} elseif ($current < $amount && $totaldays < 0) {
    $status = 'Past Due';
    $avgAmount = 0;
} else {
    if ($totaldays > 0) {
        if ($freq == "Monthly") {
            $avgAmount = $amount / (ceil($totaldays / 30));
        } elseif ($freq == "Weekly") {
            $avgAmount = $amount / (ceil($totaldays / 7));
        } else {
            $avgAmount = $amount / $totaldays;
        }
    } else {
        $avgAmount = 0;
    }
}

$sql_insertSav = "INSERT INTO SAVING_GOAL 
    (GOAL_NAME, GOAL_FREQUENCY, GOAL_TARGET_AMOUNT, GOAL_SAVE_AMOUNT, GOAL_CURRENT_AMOUNT, GOAL_DEADLINE, GOAL_STATUS, USER_ID)
    VALUES 
    ('$name', '$freq', '$amount', '$avgAmount', '$current', '$deadline', '$status', '$user_id')";

$resultSav = mysqli_query($conn, $sql_insertSav) or die("Saving insertion failed");

if ($resultSav) {
    header("Location: saving.php?msg=Saving goal saved.");
    exit();
}
?>