<?php
//Add beginning code to
//1. Require the needed 3 files
require_once("session.php");
require_once("included_functions.php");
require_once("database.php");

new_header("Here is Who's Who!");
//2. Connect to your database
$mysqli = Database::dbConnect();
$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

//3. Output a message, if there is one
if (($output = message()) !== null) {
	echo $output;
}

	echo "<h3>Departments</h3>";
	echo "<div class='row'>";
	echo "<label for='left-label' class='left inline'>";

	if (isset($_POST["submit"])) {
		if( (isset($_POST["departmentName"]) && $_POST["departmentName"] !== "") && (isset($_POST["departmentType"]) && $_POST["departmentType"] !== "") &&(isset($_POST["departmentEmail"]) && $_POST["departmentEmail"] !== "")){
//////////////////////////////////////////////////////////////////////////////////////////////////
					//STEP 2.
					//Create and prepare query to insert information that has been posted
			$query = "INSERT INTO Departments(name, department_type, email) VALUES (?, ?, ?)";

					// Execute query
			$stmt = $mysqli -> prepare($query);
			$stmt -> execute([$_POST["departmentName"], $_POST["departmentType"], $_POST["departmentEmail"]]);

					//Verify $stmt executed - create a SESSION message
			if($stmt){
				$_SESSION["message"] =  $_POST['departmentName']." has been added!";
			}
					//Redirect back to readPeople.php
			redirect("readStaff.php");

//////////////////////////////////////////////////////////////////////////////////////////////////


		}
		else {
				$_SESSION["message"] = "Unable to add person. Fill in all information!";
				redirect("createDepartments.php");
		}
	}
	else {
//////////////////////////////////////////////////////////////////////////////////////////////////
		// STEP 1.  Create a form that will post to this page: createPeople.php
		echo '<form method="POST" action="createDepartments.php">';

		//Include <input> tags for each of the attributes in person:
		//First Name, Last Name, Birthdate, Birth City, Birth State, Region
		echo '<p>Department Name: <br><input type="text" name="departmentName"></p>';
		echo '<p>Department Type: <br><input type="text" name="departmentType"></p>';
		echo '<p>Department Email: <br><input type="text" name="departmentEmail"></p>';

		//Finally, add a submit button - include the class 'tiny round button'
		echo '<input type="submit" name="submit" class="button tiny round" value="Submit" />';
		echo '</form>';

//////////////////////////////////////////////////////////////////////////////////////////////////

	}
	echo "</label>";
	echo "</div>";
	echo "<br /><p>&laquo:<a href='readStaff.php'>Back to Main Page</a>";
	?>


<?php
//Define footer with the phrase "Who's Who"
	new_footer("David Rodriguez ");

//Release query results
	//$stmt -> close();
//Close database
	Database::dbDisconnect();


 ?>
