<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include 'db_connect.php';
$username = $_SESSION['username'];

$user_count = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM USER"))['c'];
$expense_sum = mysqli_fetch_assoc(mysqli_query($conn, "SELECT SUM(EXP_AMOUNT) AS s FROM EXPENSE"))['s'];
$saving_goal_count = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM SAVING_GOAL"))['c'];

$sql = "SELECT DATE_FORMAT(LOG_DATE, '%Y-%m') AS log_month, COUNT(*) AS num FROM USER_LOG GROUP BY log_month ORDER BY log_month";
$result = mysqli_query($conn, $sql);

$months = [];
$login_counts = [];
while ($row = mysqli_fetch_assoc($result)) {
    $months[] = $row['log_month'];
    $login_counts[] = $row['num'];
}

$this_month = date('Y-m');
$user_this_month = 0;
foreach ($months as $i => $m) {
    if ($m === $this_month) {
        $user_this_month = $login_counts[$i];
        break;
    }
}
$average_user_month = count($login_counts) > 0 ? array_sum($login_counts) / count($login_counts) : 0;

$exp_sql = "SELECT DATE_FORMAT(EXP_DATE, '%Y-%m') AS exp_month, SUM(EXP_AMOUNT) AS total FROM EXPENSE GROUP BY exp_month ORDER BY exp_month";
$exp_result = mysqli_query($conn, $exp_sql);

$exp_months = [];
$exp_totals = [];
while ($row = mysqli_fetch_assoc($exp_result)) {
    $exp_months[] = $row['exp_month'];
    $exp_totals[] = $row['total'];
}

$this_month_expense = 0;
foreach ($exp_months as $i => $m) {
    if ($m === $this_month) {
        $this_month_expense = $exp_totals[$i];
        break;
    }
}
$average_exp_month = count($exp_totals) > 0 ? array_sum($exp_totals) / count($exp_totals) : 0;

$status_sql = "SELECT GOAL_STATUS, COUNT(*) AS cnt FROM SAVING_GOAL GROUP BY GOAL_STATUS";
$status_result = mysqli_query($conn, $status_sql);
$status_labels = [];
$status_counts = [];
while ($row = mysqli_fetch_assoc($status_result)) {
    $status_labels[] = $row['GOAL_STATUS'];
    $status_counts[] = $row['cnt'];
}

$completed_goal_count = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM SAVING_GOAL WHERE GOAL_STATUS = 'Complete'"))['c'];
$total_money_saved = mysqli_fetch_assoc(mysqli_query($conn, "SELECT SUM(GOAL_CURRENT_AMOUNT) AS s FROM SAVING_GOAL"))['s'];
?>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="adminDash.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container">
        <p class="title">DASHBOARD</p>
        <p style="text-align: center;">Welcome, <?php echo htmlspecialchars($username); ?>!</p>
        <p id="datetime" style="text-align:center"></p>
        <div style="text-align:center; margin-bottom: 20px;">
            <a href="login.php"><button class="logout-btn">Log Out</button></a>
        </div>
        <fieldset>
            <legend><b>User Logins, Expenses & Saving Goals</b></legend>
            <div style="display:flex;justify-content:center;align-items:stretch;gap:34px;">
                <div style="display:flex;flex-direction:column;align-items:center;">
                    <canvas id="userPie" width="300" height="300"></canvas>
                    <div style="min-width:160px;">
                        <p style="font-weight:bold;color:#258d35;font-size:1.12em;margin-bottom:14px;">User Logins</p>
                        <p>Total logins this month: <b><?= $user_this_month ?></b></p>
                        <p>Average logins per month: <b><?= number_format($average_user_month,1) ?></b></p>
                    </div>
                </div>
                <div style="display:flex;flex-direction:column;align-items:center;">
                    <canvas id="expPie" width="300" height="300"></canvas>
                    <div style="min-width:160px;">
                        <p style="font-weight:bold;color:#258d35;font-size:1.12em;margin-bottom:14px;">Expenses</p>
                        <p>Total expenses this month: <b>RM<?= number_format($this_month_expense,2) ?></b></p>
                        <p>Average expenses per month: <b>RM<?= number_format($average_exp_month,2) ?></b></p>
                    </div>
                </div>
                <div style="display:flex;flex-direction:column;align-items:center;">
                    <canvas id="goalPie" width="300" height="300"></canvas>
                    <div style="min-width:180px;">
                        <p style="font-weight:bold;color:#258d35;font-size:1.12em;margin-bottom:14px;">Saving Goals</p>
                        <p>Total completed: <b><?= $completed_goal_count ?></b></p>
                        <p>Total money saved: <b>RM<?= number_format($total_money_saved,2) ?></b></p>
                    </div>
                </div>
            </div>
        </fieldset>
        <div class="admin-links">
            <a href="userList.php"><button>Manage Users</button></a>
            <a href="ViewAllExpense.php"><button>View All Expenses</button></a>
            <a href="ViewAllSaving.php"><button>View All Savings</button></a>
            <a href="viewAllLogs.php"><button>View Logs</button></a>
        </div>
    </div>
    <script src="datetime.js"></script>
    <script>
        const months = <?php echo json_encode($months); ?>;
        const loginCounts = <?php echo json_encode($login_counts); ?>;
        new Chart(document.getElementById('userPie'), {
            type: 'pie',
            data: {
                labels: months,
                datasets: [{
                    data: loginCounts,
                    backgroundColor: [
                        '#4e73df','#1cc88a','#36b9cc','#f6c23e','#e74a3b','#858796','#5a5c69',
                        '#18ad6b','#22843d','#dfd74e','#9c59b6','#2c3e50','#f39c12'
                    ]
                }]
            },
            options: {
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });
        const expMonths = <?php echo json_encode($exp_months); ?>;
        const expTotals = <?php echo json_encode($exp_totals); ?>;
        new Chart(document.getElementById('expPie'), {
            type: 'pie',
            data: {
                labels: expMonths,
                datasets: [{
                    data: expTotals,
                    backgroundColor: [
                        '#36b9cc','#f6c23e','#4e73df','#e74a3b','#858796','#1cc88a','#5a5c69',
                        '#18ad6b','#22843d','#dfd74e','#9c59b6','#2c3e50','#f39c12'
                    ]
                }]
            },
            options: {
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });
        const statusLabels = <?php echo json_encode($status_labels); ?>;
        const statusCounts = <?php echo json_encode($status_counts); ?>;
        new Chart(document.getElementById('goalPie'), {
            type: 'pie',
            data: {
                labels: statusLabels,
                datasets: [{
                    data: statusCounts,
                    backgroundColor: [
                        '#1cc88a','#f6c23e','#e74a3b','#4e73df','#858796','#5a5c69'
                    ]
                }]
            },
            options: {
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });
    </script>
</body>
</html>