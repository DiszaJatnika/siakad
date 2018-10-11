<?php
	include_once "database/conn.php";
	$name = $_SESSION['username'];

	$matkul  = $_POST['matkul'];
	$nim 	 = $_POST['nim'];	
	$semester 	 = $_POST['semester'];


	if (isset($_POST['ajukan'])){
		
		for ($i=0; $i<sizeof($matkul); $i++)
        {
            $query="INSERT INTO tmp_krs (nim,kode_matkul,semester_krs) VALUES ('$nim','" . $matkul[$i] . "','$semester')";
            mysqli_query($mysqli,$query);
        }

        echo"<meta http-equiv='refresh'	content='0; url=index.php?menu=krs_notif'>";
	}
	else
	{
		echo"<meta http-equiv='refresh'	content='0; url=index.php?menu=krs_option'>";
	}
?>