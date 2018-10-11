<?php
    session_start();
    error_reporting(0);

    $name = $_SESSION['username'];
    $level  = $_SESSION['level'];
    if (isset($_SESSION['username'])){

     if($level == 'dosen'){ 
      ?>
     <meta http-equiv="refresh" content="0;URL='view/dosen/index.php'" />    
      <?php
      }
      else if($level == 'mahasiswa'){
    ?>
      <meta http-equiv="refresh" content="0;URL='view/mhs/index.php'" />    
    <?php
      }
      else if($level == 'admin'){
    ?>
      <meta http-equiv="refresh" content="0;URL='view/admin/index.php'" />    
    <?php
      }
  }
  else
  {
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="description" content="SIAKAD YBSI - Sistem Informasi Akademik">
    <meta name="author" content="Disza Jatnika">
    <link rel="shortcut icon" href="model/img/stt.jpg" />
    <title>SIAKAD - YBSI</title>
    <!-- Main styles for this application-->
    <link href="model/css/style.css" rel="stylesheet">
    <style type="text/css">
      
    body { 
        background: url('model/img/bg.jpg');
        background-size: cover;
    }
}
    </style>

  </head>
  <body class="app flex-row align-items-center" >
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-5">
          <div class="card-group">
            <div class="card p-4">
              <div class="card-body">
                <h1>Login</h1>

              <form method="POST" action="function/proses.php">
                <p class="text-muted">Masukan Username Dan Password!</p>
                <hr>
                <div class="input-group mb-3">
                  <input class="form-control" required name="username" type="text" placeholder="Username">
                </div>
                <div class="input-group mb-4">
                  <input class="form-control"  required name="password" type="password" placeholder="Password">
                </div>
                <div class="row">
                  <div class="col-12">
                    <button type="submit" class="btn btn-primary btn-block" name="login" class="btn btn-primary">Login</button>
                  </div>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- CoreUI and necessary plugins-->
  </body>
</html>
<?php
  }
?>