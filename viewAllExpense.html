<?php
include 'db_connect.php';
$sql = "SELECT E.EXP_ID, E.EXP_AMOUNT, E.EXP_TYPE, E.EXP_DATE, U.USER_FULLNAME 
        FROM EXPENSE E 
        JOIN USER U ON E.USER_ID = U.USER_ID 
        ORDER BY E.EXP_DATE DESC";
$result = mysqli_query($conn, $sql);
?>
<html>
<head>
    <title>All Expenses</title>
    <link rel="stylesheet" href="allExpenseStyle.css">
</head>
<body>
    <div class="container">
        <a href="adminDashboard.php" class="dashboard-btn-float">Back to Dashboard</a>
        <h2>All Users' Expenses</h2>
        <div class="table-container">
            <table>
                <tr>
                  <th>Type</th>
                  <th>Amount (RM)</th>
                  <th>Date</th>
                </tr>
                <?php while($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                  <td><?= htmlspecialchars($row['EXP_TYPE']) ?></td>
                  <td><?= number_format($row['EXP_AMOUNT'], 2) ?></td>
                  <td><?= $row['EXP_DATE'] ?></td>
                </tr>
                <?php endwhile; ?>
            </table>
        </div>
    </div>
</body>
</html>