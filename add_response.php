<?php 
require_once"functions.php";
$conn=dbconnect();
$email=$_POST["email"];
$numrow=$_POST["numrow"];
$survey=$_POST["survey"];
$type=$_POST["type"];
for($i=0; $i<$numrow; $i++){
    $lp="response".$i;
    $response=$_POST["$lp"];
    $qi="question_id".$i;
    $question_id=$_POST[$qi];
    $tp="type".$i;
    $type=$_POST[$tp];
$sql="INSERT INTO response (user_email,question_id,".$type.", time) VALUES ('".$email."','".$question_id."','".$response."','".date("Y-m-d")."')";
$result=mysqli_query($conn,$sql);
        if($conn->error)
        {
            echo '<script> alert("Error: ".$sql."<br>") </script>';
        }
        else 
        {
			echo '<script> alert("response created") </script>';
			echo "successful";
		//	echo '<script> window.location="forms.html"</script>';
        }
}
?>
