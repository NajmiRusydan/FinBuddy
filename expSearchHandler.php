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
?>