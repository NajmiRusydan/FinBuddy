<html>
<head>
    <title>Create An Account</title>
</head>
<body>
    <?php
        include 'db_connect.php'; 

        $fullname = $_POST['txtFullName'];
        $email = $_POST['txtEmail'];
        $phoneNum = $_POST['txtPhone'];
        $username = $_POST['txtUser'];
        $password = $_POST['txtPass'];

        $banks = $_POST['bank'];
        $bank_balances = $_POST['bank_bal'];

        $sql_insertUser = "INSERT INTO USER (user_fullname, user_email, user_phone_no, username, password, user_type, user_status)
                            VALUES ('$fullname', '$email', '$phoneNum', '$username', '$password', 'customer', 'Active')";

        $resultUser = mysqli_query($conn,$sql_insertUser) or die("User insertion failed");

        if($resultUser){
            $user_id = $conn->insert_id;

            for ($i = 0; $i < count($banks); $i++) {
                $bankName = $banks[$i];
                $balance = $bank_balances[$i];

                $sql_bank = "INSERT INTO BANK (bank_name, bank_balance, User_ID)
                            VALUES ('$bankName', '$balance', '$user_id')";
                $resultBank = mysqli_query($conn,$sql_bank) or die("Bank insertion failed");
            }

            header("Location: login.php");
            exit();
        }
        
        $conn->close();
    ?>
</body>
</html>