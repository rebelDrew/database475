<?php
require_once("session.php");
require_once("included_functions.php");
require_once("database.php");
new_header("Staff");

$mysqli = Database::dbConnect();
$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (($output = message()) !== null) {
    echo $output;
}

if (isset($_GET["id"]) && $_GET["id"] !== "") {
  //****************  Add Query
  //  Query people to select PersonID, FirstName, and LastName, sorting in ascending order by LastName
  $query = "SELECT * FROM Staff left outer join Departments on Staff.Departments_depart_id = Departments.depart_id where depart_id=?";

  //  Prepare and execute query
  $stmt = $mysqli -> prepare($query);
  // $stmt -> execute([$_GET["depart_id"]]);
  $stmt -> execute([$_GET['id']]);
  
  if ($stmt) {
      echo "<div class='row'>";
      echo "<center>";
      echo "<table>";
      echo "  <thead>";
      echo "    <tr><th>Staff Name</th><th></th><th></th><th></th></tr>";
      echo "  </thead>";
      echo "  <tbody>";
      while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
          echo "<tr>";
          //Output FirstName and LastName
          echo "<td>".$row["FName"]." ".$row["LName"]."</td>";


          //Create an Edit and Delete link
          //Edit should direct to editPeople.php, sending PersonID in URL
          //Delete should direct to deletePeople.php, sending PersonID in URL - include onclick to confirm delete
          echo "<td><a href='editStaff.php?id=".urlencode($row['staff_id'])."&depart=".urlencode($_GET["id"])."'>Edit Staff</a></td>";
          echo "<td><a href='deleteStaff.php?id=".urlencode($row['staff_id'])."&depart=".urlencode($_GET["id"])."' onclick='return confirm('Are you sure you want to delete?');'>Delete staff</a></td>";
          echo "</tr>";
      }
      echo "  </tbody>";
      echo "</table>";
      echo "<br /><br /> <a href='createStaff.php'>Add a person</a>";
      echo "</center>";
      echo "</div>";
            echo "<br /><p>&laquo:<a href='readStaff.php'>Back to Main Page</a>";
  }

  else {
    $_SESSION["message"] = "Department could not be found!";
    redirect("readStaff.php");
  }
}
new_footer("David Rodriguez");
// $stmt -> close();
Database::dbDisconnect();
?>
