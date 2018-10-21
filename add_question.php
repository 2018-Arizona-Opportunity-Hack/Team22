<?php 
require_once"functions.php";
$conn=dbconnect();
$question=$_POST["question"];
$type=$_POST["type"];
$survey=$_POST["survey"];

/*if(isset($_POST["min"])&&isset($_POST["max"])){
    $min=$_POST["min"];
    $max=$_POST["max"];
}
else{
    
}*/
$sql="INSERT INTO questions (question,survey_id, type) VALUES ('".$question."','".$survey."',".$type.")";
$result=mysqli_query($conn,$sql);
        if($conn->error)
        {
            echo "Error: ".$sql."<br>";
        }
        else 
        {
			echo '<script> alert("question created") </script>';
			echo '<script> window.location="forms.html"</script>';
        }

?>
