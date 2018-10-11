<?php
	include_once "database/conn.php";
	$name = $_SESSION['username'];

	$id  = $_GET['id'];
	
	if (isset($_POST['ajukan'])){
		
        $query="delete * from tmp_krs where id = '$id' ";
        mysqli_query($mysqli,$query);

        echo"<meta http-equiv='refresh'	content='0; url=index.php?menu=krs_notif'>";
	}
?>