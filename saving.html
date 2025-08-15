<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}
include 'db_connect.php';
$user_id = $_SESSION['user_id'];
?>
<html>
<head>
    <title>Saving Goal</title>
    <link rel="stylesheet" href="saveStyle.css">
</head>
<body>
    <a href="dashboard.php" class="dashboard-btn-float">Back to Dashboard</a>
    <?php if (isset($_GET['msg'])): ?>
        <div id="notif" class="notif"><?= htmlspecialchars($_GET['msg']) ?></div>
        <script>
            setTimeout(() => {
                document.getElementById('notif').style.display = 'none';
            }, 3000);
        </script>
    <?php endif; ?>
    <div class="exp">
        <form action="savingHandler.php" method="post">
            <fieldset>
                <legend>Create New Saving Target</legend>
                <label for="savename">Saving Name:</label>
                <input type="text" name="savename" required><br>
                <label for="saveamount">Amount: RM</label>
                <input type="number" min="1" name="saveamount" required><br>
                <label for="freq">Select Frequency:</label>
                <select name="freq" id="freq" required>
                    <option value="">-- Select Frequency --</option>
                    <option value="Monthly">Monthly</option>
                    <option value="Weekly">Weekly</option>
                </select><br>
                <label for="savedeadline">Deadline:</label>
                <input type="date" name="savedeadline" required min="<?php echo date('Y-m-d'); ?>"><br>
                <input type="submit" value="Submit">
            </fieldset>
        </form>
        <fieldset>
            <legend>Saving Goal History</legend>
            <?php
            $sql_retSav = "SELECT * FROM SAVING_GOAL WHERE USER_ID = $user_id";
            $resultRetSav = mysqli_query($conn,$sql_retSav) or die("Retrieve failed");
            echo "<table border='1'><tr><th>Name</th><th>Frequency</th><th>Target(RM)</th><th>Average Saving(RM)</th><th>Current(RM)</th><th>Deadline</th><th>Days</th><th>Status</th><th>Action</th></tr>";
            while($row = mysqli_fetch_array($resultRetSav)){
                $currentDate = new DateTime(date("Y-m-d"));
                $targetDate = new DateTime($row['GOAL_DEADLINE']);
                $interval = $currentDate->diff($targetDate);
                $daysDiff = (int)$targetDate->format('U') - (int)$currentDate->format('U');
                $totaldays = floor($daysDiff / 86400);
                if ($row['GOAL_CURRENT_AMOUNT'] >= $row['GOAL_TARGET_AMOUNT']) {
                    if ($row['GOAL_STATUS'] != 'Complete') {
                        $sql_upstats = "UPDATE SAVING_GOAL SET GOAL_STATUS = 'Complete' WHERE GOAL_ID = '{$row['GOAL_ID']}'";
                        mysqli_query($conn, $sql_upstats);
                    }
                } else if ($totaldays < 0) {
                    if ($row['GOAL_STATUS'] != 'Past Due') {
                        $sql_upstats = "UPDATE SAVING_GOAL SET GOAL_STATUS = 'Past Due' WHERE GOAL_ID = '{$row['GOAL_ID']}'";
                        mysqli_query($conn, $sql_upstats);
                    }
                }
                $sql_getStatus = "SELECT GOAL_STATUS FROM SAVING_GOAL WHERE GOAL_ID = '{$row['GOAL_ID']}'";
                $resStatus = mysqli_query($conn, $sql_getStatus);
                $latestStatus = mysqli_fetch_assoc($resStatus)['GOAL_STATUS'];
            ?>
            <tr>
                <td><?php echo $row['GOAL_NAME'];?></td>
                <td><?php echo $row['GOAL_FREQUENCY'];?></td>
                <td><?php echo number_format((double)$row['GOAL_TARGET_AMOUNT'], 2, '.', '');?></td>
                <td><?php echo number_format((double)$row['GOAL_SAVE_AMOUNT'], 2, '.', '');?></td>
                <td><?php echo number_format((double)$row['GOAL_CURRENT_AMOUNT'], 2, '.', '');?></td>
                <td><?php echo $row['GOAL_DEADLINE'];?></td>
                <td><?php echo $totaldays; ?></td>
                <td><?php echo $latestStatus;?></td>
                <td>
                    <a href="savEdit.php?goal_id=<?php echo $row['GOAL_ID']; ?>">Edit</a> | 
                    <a href="savDelHandler.php?goal_id=<?php echo $row['GOAL_ID']; ?>">Delete</a>
                </td>
            </tr>
            <?php
            }
            ?>
            </table>
        </fieldset>
    </div>
</body>
</html>