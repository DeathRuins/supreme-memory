<?php 
    require "db_connect.php";
    $user_name = "timbo";
    $user_pass = "password";
    $mysqli_qry = "select * from users where username like '$user_name' and password like '$user_pass'";
    $result = mysqli_query($conn , $mysqli_qry);
    
    if(mysqli_num_rows($result) > 0) {
        echo "login success";
    }
    else{
        echo "login not successful";
    }
    ?>