<?php
session_start();
    if (!isset($_SESSION['user_id'])) {
        header("Location: login.html");
        exit();
    }
    include 'db_connect.php';
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT * FROM BANK WHERE USER_ID = '$user_id'";
    $result = mysqli_query($conn, $sql);
?>
<html>
<head>
    <title>Bank Balance</title>
    <link rel="stylesheet" href="allExpenseStyle.css">
</head>
<body>
    <div class="container">
        <a href="Dashboard.php" class="dashboard-btn-float">Back to Dashboard</a>
        <h2>Bank Balance</h2>
        <div class="table-container">
            <table>
                <tr>
                  <th>Bank Name</th>
                  <th>Amount (RM)</th>
                </tr>
                <?php while($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                  <td><?= $row['BANK_NAME'] ?></td>
                  <td><?= number_format($row['BANK_BALANCE'], 2) ?></td>
                </tr>
                <?php endwhile; ?>
            </table>
        </div>
    </div>
</body>
</html>