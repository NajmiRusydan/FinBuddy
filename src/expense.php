<html>
    <head>
        <title>Expense Tracker</title>
        <link rel="stylesheet" href="expStyle.css">
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
        ?>
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
            <form action="expenseHandler.php" method="post">
                <fieldset>
                    <legend>Record Expense</legend>

                    <label for="expamount">Amount: RM</label>
                    <input type="number" min="1" name="expamount" required><br>

                    <label for="bank">Select Your Bank:</label>
                    <select name="bank" id="bank" required>
                        <option value="">-- Select Bank --</option>

                        <?php
                            $sql = "SELECT BANK_ID, BANK_NAME, BANK_BALANCE FROM BANK WHERE USER_ID = $user_id ORDER BY BANK_NAME";
                            $result = mysqli_query($conn, $sql) or die("Query failed");

                            while ($row = mysqli_fetch_assoc($result)) {
                                $bank_id = $row['BANK_ID'];
                                $bank_name = $row['BANK_NAME'];
                                $bank_balance = $row['BANK_BALANCE'];
                                echo "<option value='$bank_id'>$bank_name - RM$bank_balance</option>";
                            }
                        ?>  
                    </select><br>

                    <label for="exp_type">Expense Category:</label>
                    <select name="expcateg" id="expcateg" required>
                        <option value="">-- Select Category --</option>
                        <option value="Food & Beverages">Food & Beverages</option>
                        <option value="Transport">Transport</option>
                        <option value="Utilities">Utilities</option>
                        <option value="Groceries">Groceries</option>
                        <option value="Shopping">Shopping</option>
                        <option value="Rent & Loan">Rent & Loan</option>
                        <option value="Mobile & Internet">Mobile & Internet</option>
                        <option value="Education">Education</option>
                        <option value="Health & Medical">Health & Medical</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Insurance">Insurance</option>
                        <option value="Donations & Zakat">Donations & Zakat</option>
                        <option value="Others">Others</option>
                    </select>
                    <select name="savinggoal" id="savinggoal" style="display:none;">
                        <option value="">-- Select Saving Goal --</option>
                        <?php
                            $sql_sav = "SELECT GOAL_ID, GOAL_NAME, GOAL_TARGET_AMOUNT, GOAL_CURRENT_AMOUNT FROM SAVING_GOAL WHERE USER_ID = $user_id AND GOAL_STATUS = 'Ongoing'";
                            $result_sav = mysqli_query($conn, $sql_sav) or die("Query failed");
                            while ($row_sav = mysqli_fetch_assoc($result_sav)) {
                                $goal_id = $row_sav['GOAL_ID'];
                                $goal_name = $row_sav['GOAL_NAME'];
                                $target = $row_sav['GOAL_TARGET_AMOUNT'];
                                $current = $row_sav['GOAL_CURRENT_AMOUNT'];
                                echo "<option value='$goal_id'>$goal_name (RM$current / RM$target)</option>";
                            }
                        ?>
                    </select>
                    <label style="display: inline-flex; align-items: center; gap: 7px;">
                        <input type="checkbox" id="savexp" name="savexp" value="savexp" onclick="checkSaving()">
                        Saving Goal
                    </label><br>
                    <input type="submit" value="Submit"> 
                </fieldset>
                                    
                <fieldset>
                    <legend>Expense History</legend>

                    <?php
                        if (isset($_GET['month']) && $_GET['month'] != '') {
                            $searchMonth = date('m', strtotime($_GET['month']));
                            $searchYear = date('Y', strtotime($_GET['month']));
                        } else {
                            $searchMonth = date('m');
                            $searchYear = date('Y');
                        }

                        $sql_retExp = "SELECT * FROM expense WHERE USER_ID = $user_id 
                            AND MONTH(EXP_DATE) = $searchMonth 
                            AND YEAR(EXP_DATE) = $searchYear";
                        $resultRetExp = mysqli_query($conn,$sql_retExp) or die("Query failed");

                        echo "<table border='1'><tr><th>Type</th><th>Amount (RM)</th><th>Date & Time</th><th colspan='2'>Action</th></tr>";
                        while($row_exp = mysqli_fetch_array($resultRetExp)){
                    ?>
                    <tr>
                        <td><?php echo $row_exp['EXP_TYPE'];?></td>
                        <td><?php echo number_format($row_exp['EXP_AMOUNT'], 2); ?></td>
                        <td><?php echo $row_exp['EXP_DATE'];?></td>
                        <td><div align="center"><a href="expDelHandler.php?exp_id=<?php print($row_exp['EXP_ID']);?>">delete </a></div></td>
                    </tr>
                    <?php
                        }
                        echo "</table>";
                    ?>
                </fieldset>
        </div>
        <script>
            function checkSaving() {
                var savingChecked = document.getElementById('savexp').checked;
                var expcateg = document.getElementById('expcateg');
                var savingGoal = document.getElementById('savinggoal');

                if (savingChecked) {
                    expcateg.disabled = true;
                    savingGoal.style.display = "inline";
                } else {
                    expcateg.disabled = false;
                    savingGoal.style.display = "none";
                }
            }
        </script>
    </body>
</html>