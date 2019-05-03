<?php

require_once("session.php");
require_once("included_functions.php");
require_once("database.php");
new_header("Department");
$mysqli = Database::dbConnect();
$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	echo "<h3>Update Department info</h3>";
	echo "<div class='row'>";
	echo "<label for='left-label' class='left inline'>";

	if (isset($_POST["submit"])) {

		$query = "UPDATE Departments SET name = ?, department_type = ?, email = ? WHERE depart_id = ?";
		$stmt = $mysqli->prepare($query);
		$stmt->execute([$_POST['name'],$_POST['department_type'],$_POST['email'],$_POST['id']]);


		if($stmt) {
			$_SESSION["message"] = $_POST["name"]." has been changed";
			echo $_POST['name']." has been changed<br />";
		}
		else {
			$_SESSION["message"] = "Error! Could not change ".$_POST["name"]."";
			echo "Error! Could not change ".$_POST['name']."<br />";
		}
		header("Location: readStaff.php");

	}
	else {

	  if (isset($_GET["id"]) && $_GET["id"] !== "") {
		//Prepare and execute a query to SELECT * using GET id in criterion - WHERE PersonID = ?
		
		$ID = $_GET["id"];
		$query = "SELECT * FROM Departments WHERE depart_id = ?";
		$stmt = $mysqli->prepare($query);
		$stmt->execute([$_GET['id']]);

		//echo "buddy";


		//mnew

		//Verify statement successfully executed - I assume that results are returned to variable $stmt
		if ($stmt)  {
			//Fetch associative array from executed prepared statement
			//echo "yeah";
			while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
			//Output whose profile we are updating
			//UNCOMMENT ONCE YOU'VE COMPLETED THE FILE
			echo "<h3>".$row["name"]."'s Profile</h3>";
			echo "<form method='POST' action='./editDepartments.php'>";
			echo "<input type='hidden' name='id' value='{$ID}' method='POST'/>";
			echo "<label>Name</label><input type='text' value='{$row['name']}' name='name' method='POST'>";
			echo "<label>Department Type</label><input type='text' value='{$row['department_type']}' name='department_type' method='POST'>";
			echo "<label>Email</label><input type='text' value='{$row['email']}' name='email' method='POST'>";
			echo "<button type='submit' name='submit'>Submit</button>";
			echo "</form>";

		
			echo "<br /><p>&laquo:<a href='readStaff.php'>Back to Main Page</a>";
			echo "</label>";
			echo "</div>";


		}
	}
		//Query failed. Return to readPeople.php and output error
		else {
			$_SESSION["message"] = "Department could not be found!";
			redirect("readStaff.php");
		}

    }
	}
//Define footer with the phrase "Who's Who"
//Release query results
//Close database
new_footer("Andrew Wallace");
//$stmt -> close();
Database::dbDisconnect();
?>
