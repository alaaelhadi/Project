<?php
	include_once("admin/includes/conn.php");
    try{
        $sql = "SELECT * FROM news ORDER BY newsDate desc limit 4";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
    }catch(PDOException $e){
        echo "Connection failed: " . $e->getMessage();
    }
?>

<div class="col-lg-6">
    <?php
        foreach($stmt->fetchAll() as $row){
            $newsDate = $row["newsDate"];
            $title = $row["title"];
            $content = $row["content"];
            $image = $row["image"];
            $id = $row["id"];
            $catID=$row["category_id"];       
            $sql="SELECT `Categoryname` FROM `categories` WHERE `id`=?" ;
            $stmtCat = $conn->prepare($sql);
            $stmtCat->execute([$catID]);
            if($stmtCat->rowcount() > 0){
                $res = $stmtCat->fetch();
                $CategoryName = $res["Categoryname"];
            }
    ?>
    <div class="d-flex align-items-center bg-white mb-3" style="height: 110px;">
        <img class="img-fluid" src="img/<?php echo $image ?>" style="width: 150px;" alt="<?php echo $title ?>">
        <div class="w-100 h-100 px-3 d-flex flex-column justify-content-center border border-left-0">
            <div class="mb-2">
                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" href="single.php?id=<?php echo $id ?>"><?php echo $CategoryName ?></a>
                <a class="text-body" href="single.php?id=<?php echo $id ?>"><small><?php echo $newsDate ?></small></a>
            </div>
            <a class="h6 m-0 text-secondary text-uppercase font-weight-bold" href="single.php?id=<?php echo $id ?>"><?php echo $title ?></a>
        </div>
    </div>    
</div> 

<div class="col-lg-6">
    <?php
        }
    ?>
</div>