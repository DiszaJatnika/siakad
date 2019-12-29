 <?php
 $mysqli = new mysqli("localhost", "root", "", "akademik");
  if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: " . $mysqli->connect_error;
  }
 ?>
