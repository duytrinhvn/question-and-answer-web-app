<?php 
include 'server/connect.php';
if(isset($_POST['add_question_button'])){
	$question_author = $_POST['question_author'];
	$question_content = $_POST['question_content'];
	$question_title = $_POST['question_title'];
	if($question_author!=null and $question_content!=null and $question_title!=null){
		$question_author = filter_input(INPUT_POST, 'question_author', FILTER_SANITIZE_SPECIAL_CHARS);
		$question_content = filter_input(INPUT_POST, 'question_content', FILTER_SANITIZE_SPECIAL_CHARS);
		$question_title = filter_input(INPUT_POST, 'question_title', FILTER_SANITIZE_SPECIAL_CHARS);
		$command_add_question = "INSERT INTO question(question_author, question_content, question_title) VALUES (?, ?, ?)";
		$stmt = $dbh->prepare($command_add_question);
		$paramsArray = [$question_author, $question_content, $question_title];
		if($stmt->execute($paramsArray)){
			header('LOCATION: index.html');
		}
	}
	else{
		echo "Invalid input";
	}
}
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="js/jquery-3.3.1.js"></script>
</head>
<body>
	<div id="container">
		<div id="header">
			<ul id="nav">
				<a href="index.html"><li id="logo">Q&A</li></a>

				<li>
					<form action="search.php" method="post">
						<input placeholder="Search Question" name='search_input' type="text" id="searchbar">
						<input type="submit" name="search_button" value="Search" id="searchButton">
					</form>
				</li>

				<li>
					<a href="addpost.php">
						<input type="button" value="Add Question" id="addQuestionButton">
					</a>
					<input type="button" value="Refresh" id="refreshButton">
				</li>
			</ul>
		</div>

		<form action="addpost.php" method="post">
			<input type="text" name='question_title' id="question_title_input" placeholder="Title`">
			<input type="text" name='question_author' id="question_author_input" placeholder="Author">
			<textarea placeholder="Question" name='question_content' id="question_textarea" rows="8" cols="50"></textarea>
			<input type="submit" name='add_question_button' value="Submit" id="question_button">
		</form>
	</div>


</body>
</html>