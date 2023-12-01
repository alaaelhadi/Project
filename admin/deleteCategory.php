<?php
  include_once("includes/logged.php");
  if(isset($_GET["id"])){
    include_once("includes/conn.php");
    try{
        $id = $_GET["id"];
        $sql = "DELETE FROM `categories` WHERE id =?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id]);
        header("Location: categories.php");
    }catch(PDOException $e){
        echo "Connection failed: " . $e->getMessage();
    }
  }else{
    echo "Invalid request";
  }
?>