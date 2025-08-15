<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}
include 'db_connect.php';
$user_id = $_SESSION['user_id'];

$goal_id = isset($_POST['goal_id']) ? $_POST['goal_id'] : 0;
$savename = isset($_POST['savename']) ? trim($_POST['savename']) : '';
$saveamount = isset($_POST['saveamount']) ? floatval($_POST['saveamount']) : 0;
$freq = isset($_POST['freq']) ? $_POST['freq'] : '';
$savedeadline = isset($_POST['savedeadline']) ? $_POST['savedeadline'] : '';

if (!$goal_id || !$savename || !$saveamount || !$freq || !$savedeadline) {
    header("Location: saving.php?msg=Incomplete update info.");
    exit();
}

$sql_get = "SELECT GOAL_CURRENT_AMOUNT FROM SAVING_GOAL WHERE GOAL_ID='$goal_id' AND USER_ID='$user_id'";
$res = mysqli_query($conn, $sql_get);
$row = mysqli_fetch_assoc($res);

if (!$row) {
    header("Location: saving.php?msg=Saving goal not found.");
    exit();
}

$current = $row['GOAL_CURRENT_AMOUNT'];
$target = $saveamount;
$deadline = $savedeadline;

$currentDate = new DateTime(date("Y-m-d"));
$targetDate = new DateTime($deadline);
$interval = $currentDate->diff($targetDate);
$totaldays = $interval->days;

$status = 'Ongoing';
$avg = 0;

if ($current >= $target) {
    $status = 'Complete';
    $avg = 0;
} elseif ($current < $target && $totaldays <= 0) {
    $status = 'Past Due';
    $avg = 0;
} else {
    if ($freq == "Monthly") {
        $period = ceil($totaldays / 30);
    } elseif ($freq == "Weekly") {
        $period = ceil($totaldays / 7);
    } else {
        $period = $totaldays;
    }
    $remain = $target - $current;
    $avg = ($period > 0) ? round($remain / $period, 2) : $remain;
}

$sql_update = "UPDATE SAVING_GOAL 
    SET GOAL_NAME = '".mysqli_real_escape_string($conn, $savename)."',
        GOAL_FREQUENCY = '$freq',
        GOAL_TARGET_AMOUNT = $target,
        GOAL_SAVE_AMOUNT = $avg,
        GOAL_DEADLINE = '$deadline',
        GOAL_STATUS = '$status'
    WHERE GOAL_ID = '$goal_id' AND USER_ID = '$user_id'";

$result = mysqli_query($conn, $sql_update);

if ($result) {
    header("Location: saving.php?msg=Saving goal updated.");
    exit();
} else {
    header("Location: saving.php?msg=Update failed.");
    exit();
}
?>