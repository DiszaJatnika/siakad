<?php
  include_once('database/conn.php');
  $username=mysqli_real_escape_string($mysqli,$_POST['username']);
  $password=mysqli_real_escape_string($mysqli,md5($_POST['password']));
  $login=mysqli_real_escape_string($mysqli,$_POST['login']);

if(isset($login)){
  include"database/conn.php";
  $res = $mysqli->query("SELECT * FROM login where username='$username' and password='$password'");
  $row = $res->fetch_assoc();
  $name = $row['name_login'];
  $user = $row['username'];
  $pass = $row['password'];
  $type = $row['type_login'];
  
  if($user==$username && $pass=$password){
    session_start();
    if($type=="admin"){
      $_SESSION['username']=$row['username'];
      $_SESSION['id']=$row['id_login'];
      $_SESSION['level']=$row['type_login'];
      echo "<script>window.location.assign('../view/admin/index.php')</script>";
    } else if($type=="mahasiswa"){
      $_SESSION['username']=$row['username'];
      $_SESSION['id']=$row['id_login'];
      $_SESSION['level']=$row['type_login'];
      echo "<script>window.location.assign('../view/mhs/index.php')</script>";
    }else if($type=="dosen"){
      $_SESSION['username']=$row['username'];
      $_SESSION['id']=$row['id_login'];
      $_SESSION['level']=$row['type_login'];
      echo "<script>window.location.assign('../view/dosen/index.php')</script>";
    }
  } else{
      //jika username atau password salah
      echo "<script>window.location.assign('../index.php')</script>";
  }
}
?>