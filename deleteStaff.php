<?php

//Add beginning code to
//1. Require the needed 3 files
//2. Connect to your database
//3. Output a message, if there is one
require_once("session.php");
require_once("included_functions.php");
require_once("database.php");


new_header("");
$mysqli = Database::dbConnect();
$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (($output = message()) !== null) {
	echo $output;
}

  	if (isset($_GET['id']) && $_GET['id'] !== "") {
//////////////////////////////////////////////////////////////////////////////////////

    $ID = $_GET['id'];
		$query = "DELETE FROM Staff WHERE staff_id = ?";
		$stmt = $mysqli->prepare($query);
		$stmt->execute([$ID]);



		if ($stmt) {
			//Create SESSION message that Person successfully deleted

      $_SESSION["message"] = $_POST['FName']." ".$_POST['LName']." successfully deleted";
      header("Location: readStaff.php");

		}
		else {
			//Create SESSION message that Person could not be deleted
      $_SESSION["message"] = $_POST['FName']." ".$_POST['LName']." could not be deleted";


		}

		//************** Redirect to readPeople.php


//////////////////////////////////////////////////////////////////////////////////////
	}
	else {
		$_SESSION["message"] = "Person could not be found!";
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
new_footer("Who's Who");
//$stmt -> close();
/************       Uncomment Once Code Completed For This Section  ********************/

Database::dbDisconnect();


 ?>
