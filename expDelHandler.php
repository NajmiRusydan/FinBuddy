<html>
<head>
    <title>Delete Expense</title>
</head>
<body>
    <?php
        session_start();
        include 'db_connect.php';
        $user_id = $_SESSION['user_id'];

        $delete_id = $_GET['exp_id'];
        $sql_get = "SELECT EXP_AMOUNT, EXP_TYPE FROM EXPENSE WHERE EXP_ID='$delete_id'";
        $res_get = mysqli_query($conn, $sql_get);
        $row = mysqli_fetch_assoc($res_get);

        $exp_amount = $row['EXP_AMOUNT'];
        $exp_type = $row['EXP_TYPE'];

        $sql_goal = "SELECT GOAL_ID, GOAL_CURRENT_AMOUNT, GOAL_TARGET_AMOUNT, GOAL_DEADLINE, GOAL_FREQUENCY FROM SAVING_GOAL WHERE USER_ID = $user_id AND GOAL_NAME = '$exp_type'";
        $res_goal = mysqli_query($conn, $sql_goal);
        if (mysqli_num_rows($res_goal) > 0) {
            $goal = mysqli_fetch_assoc($res_goal);
            $goal_id = $goal['GOAL_ID'];
            $target = $goal['GOAL_TARGET_AMOUNT'];
            $deadline = $goal['GOAL_DEADLINE'];
            $freq = $goal['GOAL_FREQUENCY'];
            $new_current = $goal['GOAL_CURRENT_AMOUNT'] - $exp_amount;
            if ($new_current < 0) $new_current = 0;

            $currentDate = new DateTime(date("Y-m-d"));
            $targetDate = new DateTime($deadline);
            $interval = $currentDate->diff($targetDate);
            $totaldays = $interval->days;

            if ($new_current >= $target) {
                $sql_update_goal = "UPDATE SAVING_GOAL SET GOAL_CURRENT_AMOUNT = $new_current, GOAL_SAVE_AMOUNT = 0, GOAL_STATUS = 'Complete' WHERE GOAL_ID = $goal_id";
            } elseif ($new_current < $target && $totaldays <= 0) {
                $sql_update_goal = "UPDATE SAVING_GOAL SET GOAL_CURRENT_AMOUNT = $new_current, GOAL_SAVE_AMOUNT = 0, GOAL_STATUS = 'Past Due' WHERE GOAL_ID = $goal_id";
            } else {
                if ($freq == "Monthly") {
                    $period = ceil($totaldays / 30);
                } elseif ($freq == "Weekly") {
                    $period = ceil($totaldays / 7);
                } else {
                    $period = $totaldays;
                }
                $remain = $target - $new_current;
                $newAvg = ($period > 0) ? round($remain / $period, 2) : $remain;
                $sql_update_goal = "UPDATE SAVING_GOAL SET GOAL_CURRENT_AMOUNT = $new_current, GOAL_SAVE_AMOUNT = $newAvg, GOAL_STATUS = 'Ongoing' WHERE GOAL_ID = $goal_id";
            }
            mysqli_query($conn, $sql_update_goal);
        }

        $query = "DELETE FROM expense WHERE exp_id='$delete_id'";
        $result = mysqli_query($conn, $query);
        if ($result)
            header("Location: expense.php?msg=Expense deleted.");
        else
            echo "Problem occurred!";
        mysqli_close($conn);
    ?>
</body>
</html>