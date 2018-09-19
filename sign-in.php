<?php echo file_get_contents("html/header.html");?>
<?php include 'includes/Config.php';
    session_start();
    
    if($_SERVER["REQUEST_METHOD"] == "POST") 
    
    $myusername = mysqli_real_escape_string($db,$_POST['username']);
    $mypassword = mysqli_real_escape_string($db,$_POST['password']);
    
    $sql = "SELECT username from user where username = '$myusername' and password = '$mypassword' ";
    $result = mysqli_query($db,$sql);
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
    $active = $row['active'];

    $count = mysqli_num_rows($result);

    if($count == 1){
        session_register("myusername");
        $_SESSION['login_user'] = $username;

        echo $username + " logged in";
    }
    else {
        $error = "your  name or password is invalid";
    }
    ?>
					<br>
                    <h3 align="center">Login</h3>
                    
					
                    <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
                    <br>
					<br>
					<br>
					<br>
					<br>
                    </div>
                    <div id="id01" class="modal">
  
							<form class="modal-content animate" action=""  method="post">
							  <div class="imgcontainer">
								<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
								<h2>BIT Services</h2>
							  </div>
						  
							  <div class="container">
								<label for="uname"><b>Username</b></label>
								<input id="myusername" type="text" placeholder="Enter Username" name="uname" required>
						  
								<label for="psw"><b>Password</b></label>
								<input id="mypassword" type="password" placeholder="Enter Password" name="psw" required>
								  
								<button id="submit" type="submit">Login</button>
								<label>
								  <input type="checkbox" checked="checked" name="remember"> Remember me
								</label>
							  </div>
						  
							  <div class="container" style="background-color:#f1f1f1">
								<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
								<span class="psw">Forgot <a href="#">password?</a></span>
							  </div>
							</form>
						  </div>


						  <script type="text/javascript" src="login.js"></script>
<?php echo file_get_contents("html/footer.html");?>