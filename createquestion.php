<?php 
include"header.php";
?>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Survey</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Create New Question in Survey
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <!---div class="col-lg-6"--->
                                    <form role="form" action="add_question.php" method="post">
                                        <div class="form-group" >
                                            <label>Question</label>
                                            <input name="question" class="form-control">
                                            <p class="help-block">Example: In a scale of 1-10 how well did do understand the concept? .</p>
                                        </div>
                                        
                                            <label>Type</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="type" id="optionsRadios1" value=1 checked>text
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="type" id="optionsRadios2" value=2 onclick="myFunction()">numbers
                                                </label>
                                                
                                                <!---div style="display:none" id="div1">Range from: <input type="number" name="min" class="form-control"> to: <input type="number" name="max" class="form-control"></div>
                                                <script>
    			                                    function myFunction(){
    				                                    var x=document.getElementById("div1");
    				                                        if(x.style.display==="none"){
    					                                    x.style.display="block";
    			                                            	}
    				                                        else{
    					                                        x.style.display="none";
    				                                        }
    		                                        	}
    			                                </script--->
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="type" id="optionsRadios3" value=3>true/false
                                                </label>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label>Survey group</label>
                                            <select multiple class="form-control" name="survey">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    </form>
                                
                                    
                                <!---/div--->
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                        
                                    
                    </div>
                    <!-- /.panel -->
                    
                </div>
                <!-- /.col-lg-12 -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                            Download Existing survey in PDF
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" target="blank" action="survey_pdf.php" method="post">
                                        <label>Survey group</label>
                                            <select multiple class="form-control" name="group">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        <button type="submit" class="btn btn-default">Generate PDF</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- /.row -->
            
        </div>
        <!-- /#page-wrapper -->

                 







    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
