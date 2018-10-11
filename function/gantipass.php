<?php
// Panggil koneksi database
require_once "database/conn.php";
session_start();
$name = $_SESSION['username'];


if (isset($_POST['daftar'])) {

	//variabel update user
	$passlama		= $_POST['passlama'];
	$passbaru		= $_POST['passbaru'];
	$konfirpassbaru	= $_POST['konfirpassbaru'];


	//menampilkan data user login untuk mencari passwordlama
	$cocok = mysqli_query($mysqli, "Select * from login where username = '$name'");
	while($cari = mysqli_fetch_assoc($cocok)):
		$pass = $cari['password'];
	endwhile;

	if($pass == $passlama){
		if($passbaru == $konfirpassbaru)
		{
			$query = mysqli_query($db, "UPDATE login set password = '$passbaru' where username = '$name'");
			header('location: ../view/mhs/index.php?menu=gantipass&alert=a4wJ47s5');
		}
		else
		{
			header('location: ../view/mhs/index.php?menu=gantipass&eror=a4wJ47s5');
		}
	}
	else
	{
		header('location: ../view/mhs/index.php?menu=gantipass&error=a4wJ47s5');
	}

}					
?>