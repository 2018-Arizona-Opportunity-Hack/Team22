<?php
function dbconnect(){
	// Credentials for accessing the database
$dbservername="localhost";
$dbusername="u425692621_root";
$dbpassword="YellowFinch";
$dbname="u425692621_table";

//create connection
$conn=new mysqli($dbservername,$dbusername,$dbpassword,$dbname);
mysqli_set_charset($conn, "utf8");
//check connection
if ($conn->connect_error){
	die ("Connection failed: ".$conn->connect_error);
}
return $conn;
}


function saveUserId($id)
{
	$_SESSION["USER_ID"]=$id;
}

function getUserId()
{
	//session_start();
	return $_SESSION["USER_ID"];
}

?>