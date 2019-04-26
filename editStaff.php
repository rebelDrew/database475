<?php

//Add beginning code to
//1. Require the needed 3 files
//2. Connect to your database
//3. Output a message, if there is one

require_once("session.php");
require_once("included_functions.php");
require_once("database.php");
new_header("Staff");
$mysqli = Database::dbConnect();
$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	echo "<h3>Update Staff Member</h3>";
	echo "<div class='row'>";
	echo "<label for='left-label' class='left inline'>";

	if (isset($_POST["submit"])) {
///////////////////////////////////////////////////////////////////////////////////////////
		//Step 2.
		//Create an UPDATE query using anonymous parameters and the criterion WHERE PersonID = ?
		$query = "UPDATE Staff SET FName = ?, LName = ?, staff_type = ?, email = ?, phone = ? WHERE staff_id = ?";
		$stmt = $mysqli->prepare($query);
		$stmt->execute([$_POST['FName'],$_POST['LName'],$_POST['staff_type'],$_POST['email'],$_POST['phone']]);



		if($stmt) {
			$_SESSION["message"] = $_POST["FName"]." ".$_POST["LName"]." has been changed";
			echo $_POST['FName']." ".$_POST['LName']." has been changed<br />";
		}
		else {
			$_SESSION["message"] = "Error! Could not change ".$_POST["FName"]." ".$_POST["LName"];
			echo "Error! Could not change ".$_POST['FName']." ".$_POST['LName']."<br />";
		}
		redirect("readStaff.php");

	}
	else {
///////////////////////////////////////////////////////////////////////////////////////////
	  //Step 1.
	  if (isset($_GET["id"]) && $_GET["id"] !== "") {
	  //Prepare and execute a query to SELECT * using GET id in criterion - WHERE PersonID = ?
		$query = "SELECT * FROM Staff WHERE staff_id = ?";
		$stmt = $mysqli->prepare($query);
		$stmt->execute($_GET['id']);



		//Verify statement successfully executed - I assume that results are returned to variable $stmt
		if ($stmt)  {
			//Fetch associative array from executed prepared statement
			while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
			//Output whose profile we are updating
			//UNCOMMENT ONCE YOU'VE COMPLETED THE FILE
			echo "<h3>".$row["FirstName"]." ".$row["LastName"]."'s Profile</h3>";
			echo "<form method='POST' action='./editStaff.php'>";
			echo "<input type='hidden' name='staff_id' value='{$ID}' method='POST'/>";
			echo "<label>First Name</label><input type='text' value='{$row['FName']}' name='FName' method='POST'>";
			echo "<label>Last Name</label><input type='text' value='{$row['LName']}' name='LName' method='POST'>";
			echo "<label>Type</label><input type='text' value='{$row['staff_type']}' name='staff_type' method='POST'>";
			echo "<label>Email</label><input type='text' value='{$row['email']}' name='email' method='POST'>";
			echo "<label>Phone</label><input type='text' value='{$row['phone']}' name='phone' method='POST'>";
			echo "<button type='submit' name='submit'>Submit</button>";
			echo "</form>";

	

			echo "<br /><p>&laquo:<a href='readStaff.php'>Back to Main Page</a>";
			echo "</label>";
			echo "</div>";


		}
	}
		//Query failed. Return to readPeople.php and output error
		else {
			$_SESSION["message"] = "Person could not be found!";
			redirect("readStaff.php");
		}

    }

//Define footer with the phrase "Who's Who"
//Release query results
//Close database
new_footer("Andrew Wallace");
$stmt -> close();
Database::dbDisconnect();
?>