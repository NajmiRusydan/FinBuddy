<?php
include 'db_connect.php';
$sql = "SELECT S.GOAL_ID, S.GOAL_NAME, S.GOAL_TARGET_AMOUNT, S.GOAL_CURRENT_AMOUNT, S.GOAL_FREQUENCY, S.GOAL_DEADLINE, S.GOAL_STATUS, U.USER_FULLNAME 
        FROM SAVING_GOAL S 
        JOIN USER U ON S.USER_ID = U.USER_ID 
        ORDER BY S.GOAL_DEADLINE DESC";
$result = mysqli_query($conn, $sql);
?>
<html>
<head>
    <title>All Savings</title>
    <link rel="stylesheet" href="allSavingStyle.css">
</head>
<body>
    <div class="container">
        <a href="adminDashboard.php" class="dashboard-btn-float">Back to Dashboard</a>
        <h2>All Users' Savings Goals</h2>
        <div class="table-container">
            <table>
                <tr>
                    <th>Name</th>
                    <th>Target Amount (RM)</th>
                    <th>Current Amount (RM)</th>
                    <th>Frequency</th>
                    <th>Deadline</th>
                    <th>Status</th>
                </tr>
                <?php while($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['GOAL_NAME']) ?></td>
                    <td><?= number_format($row['GOAL_TARGET_AMOUNT'], 2) ?></td>
                    <td><?= number_format($row['GOAL_CURRENT_AMOUNT'], 2) ?></td>
                    <td><?= htmlspecialchars($row['GOAL_FREQUENCY']) ?></td>
                    <td><?= htmlspecialchars($row['GOAL_DEADLINE']) ?></td>
                    <td><?= htmlspecialchars($row['GOAL_STATUS']) ?></td>
                </tr>
                <?php endwhile; ?>
            </table>
        </div>
    </div>
</body>
</html>