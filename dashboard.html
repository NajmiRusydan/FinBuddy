<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include 'db_connect.php';
$username = $_SESSION['username'];
$user_id = $_SESSION['user_id'];

$this_month = date('Y-m-01');
$edit_mode = isset($_GET['edit']) ? true : false;

if (isset($_POST['budget_amount'])) {
    $input_budget = (float)$_POST['budget_amount'];
    $check_sql = "SELECT * FROM Budget WHERE USER_ID = $user_id AND BUDGET_MONTH = '$this_month'";
    $check_res = mysqli_query($conn, $check_sql);
    if (mysqli_num_rows($check_res) == 0) {
        $add_sql = "INSERT INTO Budget (USER_ID, BUDGET_AMOUNT, BUDGET_MONTH) VALUES ($user_id, $input_budget, '$this_month')";
        mysqli_query($conn, $add_sql) or die("Budget insert failed");
    } else {
        $update_sql = "UPDATE Budget SET BUDGET_AMOUNT = $input_budget WHERE USER_ID = $user_id AND BUDGET_MONTH = '$this_month'";
        mysqli_query($conn, $update_sql) or die("Budget update failed");
    }
    header("Location: dashboard.php");
    exit();
}

$budget_sql = "SELECT BUDGET_AMOUNT FROM Budget WHERE USER_ID = $user_id AND BUDGET_MONTH = '$this_month'";
$budget_res = mysqli_query($conn, $budget_sql) or die("Budget retrieve failed");
$budget_row = mysqli_fetch_assoc($budget_res);
$budget_amount = $budget_row ? $budget_row['BUDGET_AMOUNT'] : 0;

$month = date('m');
$year = date('Y');
$sql1 = "SELECT EXP_TYPE, SUM(EXP_AMOUNT) AS total
            FROM Expense
            WHERE USER_ID = $user_id
            AND MONTH(EXP_DATE) = $month
            AND YEAR(EXP_DATE) = $year
            AND EXP_TYPE != 'Saving'
            GROUP BY EXP_TYPE";
$result = mysqli_query($conn, $sql1) or die("Retrieve failed");

$expense_types = array();
$expense_totals = array();
while ($row = mysqli_fetch_assoc($result)) {
    $expense_types[] = $row['EXP_TYPE'];
    $expense_totals[] = $row['total'];
}
$total_expense = 0;
for ($i = 0; $i < count($expense_totals); $i++) {
    $total_expense = $total_expense + $expense_totals[$i];
}
$today = date('d');
if ($today > 0) {
    $average_expense = $total_expense / $today;
} else {
    $average_expense = 0;
}

$sql2 = "SELECT GOAL_NAME, GOAL_CURRENT_AMOUNT, GOAL_TARGET_AMOUNT
            FROM Saving_Goal
            WHERE USER_ID = $user_id";
$result2 = mysqli_query($conn, $sql2) or die("Retrieve failed");

$saving_goals = array();
while ($row = mysqli_fetch_assoc($result2)) {
    $saving_goals[] = array(
        'name' => $row['GOAL_NAME'],
        'current' => $row['GOAL_CURRENT_AMOUNT'],
        'target' => $row['GOAL_TARGET_AMOUNT']
    );
}
?>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="dash.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div style="padding: 32px 0;">
        <div style="max-width: 1100px; margin: 0 auto;">
            <p style="font-size: 2em; text-align: center; margin-bottom: 0.4em; font-weight: bold; letter-spacing: 1px;">DASHBOARD</p>
            <p style="text-align: center;">Welcome, <?php echo htmlspecialchars($username); ?>!</p>
            <p id="datetime" style="text-align:center"></p>
            <div style="text-align:center;">
                <a href="editProfile.php"><button type="button">Edit Profile</button></a>
                <a href="login.php"><button type="logout-btn" style="margin-left:8px;">Log Out</button></a>
                <a href="bankDisplay.php"><button type="button" style="margin-left:8px;">Bank</button></a>
            </div>

            <fieldset>
                <legend><b>Budget for This Month</b></legend>
                <?php if ($budget_amount == 0 || $edit_mode) { ?>
                    <form method="post" action="">
                        <label>Enter your budget for this month (RM): </label>
                        <input type="number" name="budget_amount" min="1" required value="<?php echo $budget_amount > 0 ? $budget_amount : ''; ?>">
                        <button type="submit"><?php echo $budget_amount > 0 ? 'Update' : 'Save'; ?></button>
                        <?php if ($budget_amount > 0) { ?>
                            <a href="dashboard.php"><button type="button">Cancel</button></a>
                        <?php } ?>
                    </form>
                <?php } else { ?>
                    <p>Your budget for this month is: <b>RM<?php echo round($budget_amount,2); ?></b></p>
                    <p>Total expense for this month: RM<?php echo round($total_expense, 2); ?></p>
                    <p>Average expense per day: RM<?php echo round($average_expense, 2); ?></p>
                    <?php
                        if ($total_expense > $budget_amount) {
                            echo '<p style="color:red; font-weight:bold;">You are over your budget!</p>';
                        } else {
                            $left = $budget_amount - $total_expense;
                            echo '<p>You have RM' . round($left, 2) . ' left before reaching your budget.</p>';
                        }
                    ?>
                    <a href="dashboard.php?edit=1"><button type="button">Edit Budget</button></a>
                <?php } ?>
            </fieldset>

            <div style="display: flex; gap: 32px; justify-content: center;">
                <fieldset>
                    <legend><b>Monthly Expense Breakdown</b></legend>
                    <canvas id="expensePie" width="300" height="300"></canvas>
                </fieldset>

                <fieldset>
                    <legend><b>Saving Goal Progress</b></legend>
                    <div style="display:flex; flex-direction:column; align-items:center;">
                        <div>
                            <div id="goalTitle" style="text-align:center; font-weight:bold; margin-bottom: 5px;"></div>
                            <canvas id="savingPie" width="250" height="250"></canvas>
                        </div>
                        <div style="margin-top: 12px;">
                            <button id="prevGoal" style="margin-right:10px;">&#8592; Prev</button>
                            <button id="nextGoal">Next &#8594;</button>
                        </div>
                    </div>
                </fieldset>
            </div>

            <div style="margin-top: 35px; text-align:center;">
                <a href="expense.php"><button type="button">Expense Tracker</button></a>
                <a href="saving.php"><button type="button">Saving Goal</button></a>
            </div>
        </div>
    </div>
    <script src="datetime.js"></script>
    <script>
        const expenseLabels = <?php echo json_encode($expense_types); ?>;
        const expenseData = <?php echo json_encode($expense_totals); ?>;
        new Chart(document.getElementById('expensePie'), {
            type: 'pie',
            data: {
                labels: expenseLabels,
                datasets: [{
                    data: expenseData,
                    backgroundColor: [
                        '#4e73df','#1cc88a','#36b9cc','#f6c23e','#e74a3b','#858796','#5a5c69'
                    ]
                }]
            }
        });

        const goals = <?php echo json_encode($saving_goals); ?>;
        let currentGoalIdx = 0;
        const ctx = document.getElementById('savingPie').getContext('2d');
        let savingPieChart;

        function updateSavingPie(idx) {
            const goal = goals[idx];
            const saved = parseFloat(goal.current);
            const remain = Math.max(0, parseFloat(goal.target) - saved);
            document.getElementById('goalTitle').innerText = goal.name + ": RM" + saved + " / RM" + goal.target;
            const data = {
                labels: ['Saved', 'Not Yet Saved'],
                datasets: [{
                    data: [saved, remain],
                    backgroundColor: ['#1cc88a', '#e74a3b']
                }]
            };
            if (savingPieChart) {
                savingPieChart.data = data;
                savingPieChart.update();
            } else {
                savingPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: data,
                    options: {
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function(context) {
                                        return context.label + ': RM' + context.parsed;
                                    }
                                }
                            },
                            legend: { position: 'bottom' }
                        }
                    }
                });
            }
        }

        if (goals.length > 0) {
            updateSavingPie(0);
        } else {
            document.getElementById('goalTitle').innerText = "No Saving Goals";
        }

        document.getElementById('prevGoal').onclick = function() {
            if (goals.length === 0) return;
            currentGoalIdx = (currentGoalIdx - 1 + goals.length) % goals.length;
            updateSavingPie(currentGoalIdx);
        };
        document.getElementById('nextGoal').onclick = function() {
            if (goals.length === 0) return;
            currentGoalIdx = (currentGoalIdx + 1) % goals.length;
            updateSavingPie(currentGoalIdx);
        };
    </script>
</body>
</html>