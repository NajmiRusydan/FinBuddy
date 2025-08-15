<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}
include 'db_connect.php';
$user_id = $_SESSION['user_id'];
$sql = "SELECT USER_EMAIL, USER_PHONE_NO, USERNAME FROM USER WHERE USER_ID = $user_id";
$result = mysqli_query($conn, $sql) or die("Query failed");
$row = mysqli_fetch_assoc($result);
$email = htmlspecialchars($row['USER_EMAIL']);
$phone = htmlspecialchars($row['USER_PHONE_NO']);
$username = htmlspecialchars($row['USERNAME']);

$bank_sql = "SELECT BANK_ID, BANK_NAME, BANK_BALANCE FROM bank WHERE USER_ID = $user_id";
$bank_result = mysqli_query($conn, $bank_sql) or die("Query failed");
$banks = [];
while ($bank_row = mysqli_fetch_assoc($bank_result)) {
    $banks[] = $bank_row;
}
?>
<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="editProfileStyle.css">
</head>
<body>
    <div class="edit-profile-container">
        <form action="updateProfile.php" method="post">
            <fieldset>
                <legend>Edit Profile</legend>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" required value="<?php echo $email; ?>">

                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" required value="<?php echo $phone; ?>">

                <label for="username">Username</label>
                <input type="text" id="username" name="username" required value="<?php echo $username; ?>">

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Leave blank to keep current password">

                <label for="bank_id">Bank</label>
                <select name="bank_id" id="bank_id">
                <?php foreach($banks as $b) { ?>
                    <option value="<?php echo $b['BANK_ID']; ?>"><?php echo $b['BANK_NAME']; ?></option>
                <?php } ?>
                </select>

                <label for="bank_balance">Bank Balance (RM)</label>
                <input type="number" step="0.01" id="bank_balance" name="bank_balance" required value="">

                <div class="button-row">
                    <button type="submit">Save</button>
                    <a class="cancel-link" href='dashboard.php'>Cancel</a>
                </div>
            </fieldset>
        </form>
    </div>
    <script>
        const bankData = <?php
            $bank_json = [];
            foreach($banks as $b) {
                $bank_json[$b['BANK_ID']] = $b['BANK_BALANCE'];
            }
            echo json_encode($bank_json);
        ?>;
        const bankSelect = document.getElementById('bank_id');
        const balanceInput = document.getElementById('bank_balance');
        function updateBalance() {
            const selectedBank = bankSelect.value;
            balanceInput.value = bankData[selectedBank] ?? '';
        }
        bankSelect.addEventListener('change', updateBalance);
        updateBalance();
    </script>
</body>
</html>