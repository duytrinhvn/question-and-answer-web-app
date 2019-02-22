<?php 
include 'connect.php';

// ADD COMMENT 
if(isset($_POST['comment_author']) and isset($_POST['comment_content']) and isset($_POST['question_title']) and isset($_POST['question_author'])){
	$comment_author = $_POST['comment_author'];
	$comment_content = $_POST['comment_content'];
	$comment_title = $_POST['question_title'];
	if($comment_author!=null and $comment_content!=null and $comment_title!=null){
		$comment_author = filter_input(INPUT_POST, 'comment_author', FILTER_SANITIZE_SPECIAL_CHARS);
		$comment_content = filter_input(INPUT_POST, 'comment_content', FILTER_SANITIZE_SPECIAL_CHARS);
		$question_title = filter_input(INPUT_POST, 'question_title', FILTER_SANITIZE_SPECIAL_CHARS);
		$question_author = filter_input(INPUT_POST, 'question_author', FILTER_SANITIZE_SPECIAL_CHARS);
		$question_id = find_current_post($question_title, $question_author);

		if($question_id!=0){
			$command_insert_comment = "INSERT INTO comment(comment_author, comment_content, question_id) VALUES (?, ?, ?)";
			$paramsArray = [$comment_author, $comment_content, $question_id];
			$stmt = $dbh->prepare($command_insert_comment);
			if($stmt->execute($paramsArray)){echo 'Hurayyyy';}
			else {
				$arr = $stmt->errorInfo();
				print_r($arr);
			}
		}
	}
	else{
		echo "Invalid input";
	}
}

// DISPLAY COMMENT
if( isset($_POST['request']) and isset($_POST['question_title']) and isset($_POST['question_author']) ){
	if($_POST['request']=='showcomment'){
		$question_id = find_current_post($_POST['question_title'], $_POST['question_author']);
		$result_array = array();
		$command_find_comments = "SELECT * FROM comment WHERE question_id = ?";
		$stmt = $dbh->prepare($command_find_comments);
		$paramsArray = [$question_id];
		$stmt->execute($paramsArray);
		while($row = $stmt->fetch()){
	        $author = $row["comment_author"];
	        $date = $row["comment_date"];
	        $content = $row["comment_content"];

	        $result_array[] = array(
	        	'author' => $author,
	        	'date' => $date,
	        	'content' => $content
	        );
		}
		echo json_encode($result_array);
	}
}

// FIND THE ID OF CURRENT POST
function find_current_post($question_title, $question_author){
	global $dbh;

	$question_id=0; 
	$command_find_questionid = "SELECT * FROM question WHERE question_title = ? AND question_author = ?";
	$stmt = $dbh->prepare($command_find_questionid);
	$paramsArray = [$question_title, $question_author];
	$stmt->execute($paramsArray);
	if($stmt->execute($paramsArray)){
		$row = $stmt->fetch();
		$question_id = $row['question_id'];
	}
	return $question_id;
}
?>