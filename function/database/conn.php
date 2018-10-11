 <?php
 $mysqli = new mysqli("localhost", "catatanp_akademik", "kocaksekali123", "catatanp_akademik");
  if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: " . $mysqli->connect_error;
  }
 ?>