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

//****************  Add Query
//  Query people to select PersonID, FirstName, and LastName, sorting in ascending order by LastName
$query = "SELECT depart_id, Departments.name, GROUP_CONCAT(CONCAT(FName, ' ', LName) SEPARATOR ', ') AS fullName FROM Staff right outer join Departments on Staff.Departments_depart_id = Departments.depart_id GROUP BY Departments.name";

//  Prepare and execute query
$stmt = $mysqli -> prepare($query);
// $stmt -> execute([$_GET["depart_id"]]);
$stmt -> execute();
if ($stmt) {
    echo "<div class='row'>";
    echo "<center>";
    echo "<h2>Current Staff by Department</h2>";
    echo "<table>";
    echo "  <thead>";
    echo "    <tr><th>Department Name</th><th>Staff Name</th><th></th><th></th><th></th></tr>";
    echo "  </thead>";
    echo "  <tbody>";
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr>";
        //Output FirstName and LastName
        echo "<td>".$row["name"]."</td>";
        echo "<td>".$row["fullName"]."</td>";

        //Create an Edit and Delete link
        //Edit should direct to editPeople.php, sending PersonID in URL
        //Delete should direct to deletePeople.php, sending PersonID in URL - include onclick to confirm delete
        echo "<td><a href='editDepartments.php?id=".urlencode($row['depart_id'])."'>Edit Department</a></td>";
        echo "<td><a href='readEditStaff.php?id=".urlencode($row['depart_id'])."'>Edit Staff</a></td>";
        echo "<td><a href='deleteDepartments.php?id=".urlencode($row['depart_id'])."' onclick='return confirm('Are you sure you want to delete?');'>Delete department</a></td>";
        echo "</tr>";
    }
    echo "  </tbody>";
    echo "</table>";
    echo "<br /><br /><a href='createDepartments.php'>Add a department</a> | <a href='createStaff.php'>Add a person</a>";
    echo "</center>";
    echo "</div>";
}
new_footer("David Rodriguez");
// $stmt -> close();
Database::dbDisconnect();
?>
