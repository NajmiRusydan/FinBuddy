<html>
<head>
    <title>Expense Tracker</title>
</head>
<body>
    <?php
        session_start();
        if (!isset($_SESSION['user_id'])) {
            header("Location: login.html");
            exit();
        }
        include 'db_connect.php';
        $user_id = $_SESSION['user_id'];

        $amount = $_POST['expamount'];
        $bankid = $_POST['bank'];
        $goalid = isset($_POST['savinggoal']) ? $_POST['savinggoal'] : 0;
        if (isset($_POST['savexp'])) {
            $isSaving = true;
            if ($goalid != 0 && $goalid != '') {
                $sql_goal = "SELECT GOAL_NAME FROM SAVING_GOAL WHERE USER_ID = $user_id AND GOAL_ID = $goalid";
                $res_goal = mysqli_query($conn, $sql_goal);
                $row_goal = mysqli_fetch_assoc($res_goal);
                $categ = $row_goal['GOAL_NAME'];
            } else {
                $categ = "Saving";
            }
        } else {
            $categ = $_POST['expcateg'];
            $isSaving = false;
        }
        $expdatetime = date("Y-m-d H:i:s");

        $sql_checkBal = "SELECT BANK_BALANCE FROM BANK WHERE USER_ID = $user_id AND BANK_ID = $bankid";
        $resultBal = mysqli_query($conn, $sql_checkBal);
        $rowBal = mysqli_fetch_assoc($resultBal);
        $currentBalance = $rowBal['BANK_BALANCE'];

        if ($amount > $currentBalance) {
            header("Location: expense.php?msg=Bank balance is not enough.");
            exit();
        } else {
            $sql_insertExp = "INSERT INTO EXPENSE (EXP_AMOUNT, EXP_TYPE, EXP_DATE, BANK_ID, USER_ID)
                            VALUES ('$amount', '$categ', '$expdatetime', '$bankid', '$user_id')";
            $resultExp = mysqli_query($conn,$sql_insertExp);

            if($resultExp){
                $sql_retBalance = "SELECT BANK_ID, BANK_BALANCE FROM BANK WHERE USER_ID = $user_id AND BANK_ID = $bankid ORDER BY BANK_ID";
                $resultRetBal = mysqli_query($conn, $sql_retBalance);
                if ($row = mysqli_fetch_assoc($resultRetBal)) {
                    $currentBalance = $row['BANK_BALANCE'];
                    $sql_deductBank = "UPDATE BANK SET BANK_BALANCE = $currentBalance - $amount WHERE USER_ID = $user_id AND BANK_ID = $bankid";
                    $resultDeduct = mysqli_query($conn, $sql_deductBank);
                }

                if ($isSaving && $goalid != 0 && $goalid != '') {
                    $sql_retSav = "SELECT GOAL_TARGET_AMOUNT, GOAL_CURRENT_AMOUNT, GOAL_DEADLINE, GOAL_FREQUENCY, GOAL_SAVE_AMOUNT
                                    FROM SAVING_GOAL WHERE USER_ID = $user_id AND GOAL_ID = $goalid";
                    $resultRetSav = mysqli_query($conn, $sql_retSav);
                    $row = mysqli_fetch_assoc($resultRetSav);

                    $target = $row['GOAL_TARGET_AMOUNT'];
                    $current = $row['GOAL_CURRENT_AMOUNT'];
                    $deadline = $row['GOAL_DEADLINE'];
                    $freq = $row['GOAL_FREQUENCY'];
                    $avg = $row['GOAL_SAVE_AMOUNT'];

                    $newCurrent = $current + $amount;
                    $remain = $target - $newCurrent;

                    $currentDate = new DateTime(date("Y-m-d"));
                    $targetDate = new DateTime($deadline);
                    $interval = $currentDate->diff($targetDate);
                    $totaldays = $interval->days;

                    if ($newCurrent >= $target) {
                        $sql_updSave = "UPDATE SAVING_GOAL SET GOAL_CURRENT_AMOUNT = $newCurrent, GOAL_SAVE_AMOUNT = 0, GOAL_STATUS = 'Complete'
                                        WHERE USER_ID = $user_id AND GOAL_ID = $goalid";
                    } else {
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
                        $sql_updSave = "UPDATE SAVING_GOAL SET GOAL_CURRENT_AMOUNT = $newCurrent, GOAL_SAVE_AMOUNT = $newAvg, GOAL_STATUS = 'Ongoing'
                                        WHERE USER_ID = $user_id AND GOAL_ID = $goalid";
                    }
                    mysqli_query($conn, $sql_updSave);
                }
                header("Location: expense.php?msg=Expense has been inserted.");
                exit();
            }
        }
    ?>
</body>
</html>