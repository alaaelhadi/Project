<?php
  session_start();
  if(isset($_SESSION["logged"]) and $_SESSION["logged"]){ 
    header("Location: News.php");
    die();
  }
  if($_SERVER["REQUEST_METHOD"] === "POST"){
    include_once("includes/conn.php");
    if(isset($_POST["regForm"])){
      try{
        $sql = "INSERT INTO `users`(`fullname`, `username`, `email`, `password`) VALUES (?, ?, ?, ?)";
        $fullname = $_POST["fullname"];
        $username = $_POST["username"];
        $email = $_POST["email"];
        $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
        $stmt = $conn->prepare($sql);
        $stmt->execute([$fullname, $username, $email, $password]);
      }catch(PDOException $e){
          echo "Connection failed: " . $e->getMessage();
      }
    }elseif(isset($_POST["logForm"])) {
      try{
        $sql = "SELECT `fullname`, `password`, `image`, `active` FROM `users` WHERE `username` = ?";
        $username = $_POST["username"];
        $password = $_POST["password"];
        $stmt = $conn->prepare($sql);
        $stmt->execute([$username]);
        if($stmt->rowcount() > 0){
          $result = $stmt->fetch();
          $hash = $result["password"];
          $fullname = $result["fullname"];
          $image = $result["image"];
          $active = $result["active"];
          $verify = password_verify($password, $hash);
          if($verify){
            if($active){
              $_SESSION["logged"] = true;
              $_SESSION['FullName'] = $fullname;
              $_SESSION['UserImage'] = $image;
              header("Location: News.php");
              die();
            }else{
              $error = '<div class="alert alert-danger">Sorry you cannot login</div>';
            }
            
          }else{
            $error = '<div class="alert alert-danger">Password is not correct!</div>';
          }
        }else{
          $error = '<div class="alert alert-danger">Email is not correct!</div>';
        }
      }catch(PDOException $e){
          echo "Connection failed: " . $e->getMessage();
      }
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>News Admin | Login/Register</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
              <h1>Login Form</h1>
              <?php
              if(isset($_POST["logForm"])){
                  echo $error;
              }
              ?>
              <div>
                <input type="text" class="form-control" placeholder="Username" name="username" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" name="password" required="" />
              </div>
              <div>
                <!-- <a class="btn btn-default submit" href="index.html">Log in</a> -->
                <input type="submit" class="btn btn-default" value="Log in" name="logForm"/>
                <a class="reset_pass" href="#">Lost your password?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-newspaper-o"></i></i> News Admin</h1>
                  <p>©2016 All Rights Reserved. News Admin is a Bootstrap 4 template. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form action="" method="POST">
              <h1>Create Account</h1>
              <div>
                <input type="text" class="form-control" placeholder="Fullname" name="fullname" required="" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Username" name="username" required="" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Email" name="email" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" name="password" required="" />
              </div>
              <div>
                <!-- <a class="btn btn-default submit" href="index.html">Submit</a> -->
                <input type="submit" class="btn btn-default" style="margin-left: 130px;" name="regForm"/>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-newspaper-o"></i></i> News Admin</h1>
                  <p>©2016 All Rights Reserved. News Admin is a Bootstrap 4 template. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>