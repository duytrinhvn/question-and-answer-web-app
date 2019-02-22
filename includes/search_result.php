<?php 
include 'server/connect.php';
if(isset($_POST['search_button'])){
	$search_input = $_POST['search_input'];
	if($search_input!=null){
		$search_input = filter_input(INPUT_POST, 'search_input', FILTER_SANITIZE_SPECIAL_CHARS);

		$command_search_question = "SELECT * FROM question WHERE question_title LIKE ? OR question_content LIKE ?";
		$stmt = $dbh->prepare($command_search_question);
		$param = '%' . $search_input . '%';
		$paramsArray=[$param, $param];
		$stmt->execute($paramsArray);
		while($row = $stmt->fetch()){
			$id = $row["question_id"];
	        $author = $row["question_author"];
	        $title = $row["question_title"];
	        $date = $row["question_date"];
	        $content = $row["question_content"];

			$subStr = substr($content,0, 100) . "...(<a class='fullPostLink' href='post.php?post_id=" . $id . "'>More</a>)";
			$contentDisplayed = (strlen($content)>=100) ? $subStr : $content;

			echo "<a class='titleLink' href='post.php?post_id=" . $id . "'><div id='content'><h1 id='question_title'>" . $title . "</h1></a>";
			echo "<p id='question_author'>Author: " . $author . " <span id='question_date'>" . $date ."</span></p>";
			echo "<p id='question_content'>" . $contentDisplayed . "</p></div>";
		}
	}
	else {
		echo "<h1>No Result</h1>";
	}
}
?>