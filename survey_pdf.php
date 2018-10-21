<?php
require_once"functions.php";
$su=$_POST["group"];
$conn=dbconnect();
$query="SELECT * FROM questions
    WHERE survey_id=".$su."";
$result=mysqli_query($conn,$query);
require("fpdf181/fpdf181/fpdf.php");
define('FPDF_FONTPATH','font/');
$pdf=new FPDF("P", "mm", "A4");
$count=1;

$num=$result->num_rows;

$set=0;
$pdf->AddPage();
    $pdf->AddFont('angsa','B','angsa.php');
    $pdf->AddFont('angsa','','angsa.php');
    $pdf->SetFont('angsa', 'B', 20);
    
while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
    $pdf->Cell(10, 10,$row["question"],0,1);
    if($row["type"]!=3){
        $pdf->Cell(180,10,"",1,1);
    }
    else{
        $pdf->Cell(5,5,"",1,0);
        $pdf->Cell(30,5,"yes",0,0);
        $pdf->Cell(5,5,"",1,0);
        $pdf->Cell(30,5,"no",0,1);
    }
}

$pdf->Output();

?>