<?php
//Add beginning code to
//1. Require the needed 3 files
require_once("session.php");
require_once("included_functions.php");
require_once("database.php");
new_header("Add to Staff");

//2. Connect to your database
$mysqli = Database::dbConnect();
$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

//3. Output a message, if there is one
if (($output = message()) !== null) {
	echo $output;
}

	echo "<h3>Add an employee.</h3>";
	echo "<div class='row'>";
	echo "<label for='left-label' class='left inline'>";
if (isset($_GET["depart_id"]) && $_GET["depart_id"] !== "") {
	if (isset($_POST["submit"])) {
		if( (isset($_POST["FName"]) && $_POST["FName"] !== "") && (isset($_POST["LName"]) && $_POST["LName"] !== "") &&(isset($_POST["type"]) && $_POST["type"] !== "") &&(isset($_POST["email"]) && $_POST["email"] !== "") &&(isset($_POST["phone"]) && $_POST["BirthState"] !== "")){
//////////////////////////////////////////////////////////////////////////////////////////////////
					//STEP 2.
					//Create and prepare query to insert information that has been posted
			$query = "INSERT INTO Staff(FName, LName, staff_type, email, phone, Departments_depart_id) VALUES (?, ?, ?, ?, ?, ?)";

					// Execute query
			$stmt = $mysqli -> prepare($query);
			$stmt -> execute([$_POST["FName"], $_POST["LName"], $_POST["type"], $_POST["email"], $_POST["phone"], $_GET["depart_id"]]);

					//Verify $stmt executed - create a SESSION message
			if($stmt){
				$_SESSION["message"] =  $_POST['FName']. " ".$_POST['LName']. " has been added!";
			}
					//Redirect back to readPeople.php
			redirect("readStaff.php");

//////////////////////////////////////////////////////////////////////////////////////////////////


		}
		else {
				$_SESSION["message"] = "Unable to add staff. Fill in all information!";
				redirect("createStaff.php");
		}
	}
}
	else {
//////////////////////////////////////////////////////////////////////////////////////////////////
		// STEP 1.  Create a form that will post to this page: createPeople.php
		echo '<form method="POST" action="createStaff.php">';

		//Include <input> tags for each of the attributes in person:
		//First Name, Last Name, Birthdate, Birth City, Birth State, Region
		echo '<p>First Name: <br><input type="text" name="FName"></p>';
		echo '<p>Last Name: <br><input type="text" name="LName"></p>';
		echo '<p>Type: <br><input type="text" name="type"></p>';
		echo '<p>Email: <br><input type="text" name="email"></p>';
		echo '<p>Phone: <br><input type="text" name="phone"></p>';
//		echo '<p>Department <br><input type="text" name="Departments_depart_id"></p>';

		//Finally, add a submit button - include the class 'tiny round button'
		echo '<input type="submit" name="submit" class="button tiny round" value="Add a person" />';
		echo '</form>';

//////////////////////////////////////////////////////////////////////////////////////////////////

	}
	echo "</label>";
	echo "</div>";
	echo "<br /><p>&laquo:<a href='readDepartments.php'>Back to Main Page</a>";
	?>


<?php
//Define footer with the phrase "Who's Who"
	new_footer("Who's Who");

//Release query results
	//$stmt -> close();
//Close database
	Database::dbDisconnect();


 ?>