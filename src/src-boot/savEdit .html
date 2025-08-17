<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}
include 'db_connect.php';
$user_id = $_SESSION['user_id'];

$goal_id = isset($_GET['goal_id']) ? $_GET['goal_id'] : 0;
if (!$goal_id) {
    header("Location: saving.php?msg=Invalid saving goal.");
    exit();
}
$sql = "SELECT * FROM SAVING_GOAL WHERE GOAL_ID='$goal_id' AND USER_ID='$user_id'";
$res = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($res);
if (!$row) {
    header("Location: saving.php?msg=Saving goal not found.");
    exit();
}
?>
<html>
<head>
    <title>Edit Saving Goal</title>
    <link rel="stylesheet" href="saveStyle.css">
</head>
<body>
    <a href="saving.php" class="dashboard-btn-float">Back to Saving Goals</a>
    <div class="exp">
        <form action="savEditHandler.php" method="post">
            <fieldset>
                <legend>Edit Saving Target</legend>
                <input type="hidden" name="goal_id" value="<?php echo $row['GOAL_ID']; ?>">
                <label for="savename">Saving Name:</label>
                <input type="text" name="savename" required value="<?php echo htmlspecialchars($row['GOAL_NAME']); ?>"><br>
                <label for="saveamount">Amount: RM</label>
                <input type="number" min="1" name="saveamount" required value="<?php echo number_format((double)$row['GOAL_TARGET_AMOUNT'], 2, '.', ''); ?>"><br>
                <label for="freq">Select Frequency:</label>
                <select name="freq" id="freq" required>
                    <option value="">-- Select Frequency --</option>
                    <option value="Monthly" <?php if($row['GOAL_FREQUENCY']=="Monthly") echo "selected"; ?>>Monthly</option>
                    <option value="Weekly" <?php if($row['GOAL_FREQUENCY']=="Weekly") echo "selected"; ?>>Weekly</option>
                </select><br>
                <label for="savedeadline">Deadline:</label>
                <input type="date" name="savedeadline" required required min="<?php echo date('Y-m-d'); ?>" value="<?php echo $row['GOAL_DEADLINE'];?> "><br>
                <input type="submit" value="Update">
            </fieldset>
        </form>
    </div>
</body>
</html>