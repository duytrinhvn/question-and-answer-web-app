<?php
    include "connect.php";
    $command = "SELECT * FROM question";
    $stmt = $dbh->prepare($command);
    $stmt->execute();
    $response = [];
    while($row = $stmt->fetch()){
        $id = $row["question_id"];
        $author = $row["question_author"];
        $title = $row["question_title"];
        $date = $row["question_date"];
        $content = $row["question_content"];

        $response[] = array(
            'id' => $id,
            'author' => $author, 
            'title' => $title,
            'date' => $date,
            'content' => $content
        );
    }
    echo json_encode($response);
?>