<?PHP
    include 'includes/Config.php';

if(isset($_GET['type']) && isset($_GET['location']) && 
   isset($_GET['phone']) && isset($_GET['clientID'])){
  
  	$finishDate = NULL;
  	$completeDate = NULL;
  	$contractorID = NULL;
  	$status = NULL;
    $type = $_GET['type'];
    $location = $_GET['location'];
    $phone = $_GET['phone'];
    
  	$clientID = $_GET['clientID'];

    $query = "INSERT INTO job( type, location, finishDate, completeDate, clientID, contractorID, Status, Phone) 
    VALUES 					(		'$type', '$location', $finishDate,		$completeDate,			'$clientID', $contractorID,			$status,    '$phone');"; 
  

    
     mysqli_query($db, $query);

   
}


echo "success";
?>