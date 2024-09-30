<?php include 'connection.php';
$uid=$_SESSION['user_id'];
extract($_GET);

?>

<script> 
		function printDiv() { 
			var divContents = document.getElementById("div_print").innerHTML; 
			var a = window.open('', '', 'height=500, width=500'); 
			a.document.write(divContents); 
			a.document.close(); 
			a.print(); 
		} 
	</script> 
<body onload="printDiv()">
	<div id="div_print" >
<center>
	
<h1 style="padding-top: 30px;font-size: 60px">Ticket</h1>


 <?php 
            $q="SELECT * FROM `booking_child` INNER JOIN `booking_master` USING (`booking_master_id`) INNER JOIN bus USING (bus_id)INNER JOIN route USING (route_id)  WHERE `user_id`='$uid' AND `status`='paid' and booking_master_id='$bmid'";
            $res=SELECT($q);
            foreach ($res as $row) {
              ?>
<div class="main-div">
	<div class="space">
		<label>route name</label>
		<label><?php echo $row['route_name'] ?></label>
	</div>
	<div class="space">
		<label>No of Seats</label>
		<label><?php echo $row['no_of_seat'] ?></label>
	</div>
	<div class="space">
		<label>Bus</label>
		<label><?php echo $row['bus_registration'] ?></label>
	</div>
	<div class="space">
		<label>Amount</label>
		<label><?php echo $row['amount'] ?></label>
	</div>
</div>
 <?php 
 }
 ?>

	 <style type="text/css">

	 	.main-div{
		 	width: 350px;
			border: 3px solid lightslategray;
		 	padding: 30px 20px;
		 }
		 	.space{
		 		display: flex;
		 		justify-content: space-between;
		 		align-items: center;
		 		padding: 12px 6px;
		 		border-bottom: 1px solid lightslategray;
		 	}

		 </style>

</center>