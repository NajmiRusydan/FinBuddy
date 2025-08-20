<html>
<head>
    <title>Login</title>
</head>
<body>
    <?php
        session_start();
        include 'db_connect.php'; 

        $username = $_POST['txtUsername'];
        $password = $_POST['txtPassword'];
        $curdate = date("Y-m-d H:i:s");
        
        $sql = "SELECT * FROM USER WHERE USERNAME = '$username'";
        $result = mysqli_query($conn, $sql);

        if(mysqli_num_rows($result) == 1){
            $row = mysqli_fetch_assoc($result);
            if($row['USER_STATUS'] == 'Inactive'){
                header("Location: login.php?msg=Your account is inactive. Please contact admin.");
                exit();
            }
            if($password == $row['PASSWORD']){
                $_SESSION['user_id'] = $row['USER_ID'];
                $_SESSION['username'] = $row['USERNAME'];
                $_SESSION['user_fullname'] = $row['USER_FULLNAME'];
                $sql_updLog = "INSERT INTO USER_LOG (LOG_DATE, USER_ID)
                                VALUES ('$curdate', '{$_SESSION['user_id']}')";
                $resultUpdLog = mysqli_query($conn, $sql_updLog);
                if($row['USER_TYPE'] == "customer")
                    header("Location: dashboard.php");
                elseif($row['USER_TYPE'] == "admin")
                    header("Location: adminDashboard.php");
                else
                    echo "Unknown User. Please contact support!";

                exit();
            }
            else{
                header("Location: login.php?msg=Invalid password!");
            }
        }
        else{
            header("Location: login.php?msg=Account not found!");
        }
        
    ?>
</body>
</html>