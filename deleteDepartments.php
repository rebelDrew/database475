<?php

//Add beginning code to
//1. Require the needed 3 files
//2. Connect to your database
//3. Output a message, if there is one
require_once("session.php");
require_once("included_functions.php");
require_once("database.php");


new_header("Delete");
$mysqli = Database::dbConnect();
$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (($output = message()) !== null) {
	echo $output;
}

  	if (isset($_GET['id']) && $_GET['id'] !== "") {
		echo "yeah";
    $ID = $_GET['id'];
		$query = "DELETE FROM Departments WHERE depart_id = ?";
		$stmt = $mysqli->prepare($query);
		$stmt->execute([$_GET['id']]);
		echo "buddy";



		if ($stmt) {
			//Create SESSION message that Person successfully deleted

      $_SESSION["message"] = $_POST['name']." successfully deleted";
      header("Location: readStaff.php");

		}
		else {
			//Create SESSION message that Person could not be deleted
      $_SESSION["message"] = $_POST['name']." could not be deleted";
			header("Location: readStaff.php");

		}

	
	}
	else {
		$_SESSION["message"] = "Department could not be found!";
		//header("Location: readPeople.php");
		//exit;
		header("Location: readStaff.php");
	}



//Define footer with the phrase "Who's Who"
//Release query results
//Close database

?>
<?php
//Define footer with the phrase "Who's Who"
//Release query results
//Close database
new_footer("Andrew Wallace");
//$stmt -> close();
/************       Uncomment Once Code Completed For This Section  ********************/

Database::dbDisconnect();


 ?>
