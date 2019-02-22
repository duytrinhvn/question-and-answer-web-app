<?php
include 'server/connect.php';
?>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/style_post.css">
	<script src="js/jquery-3.3.1.js"></script>
	<script src="js/addcomment.js"></script>
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
		<?php 
		if(isset($_GET['post_id'])){
			$id = $_GET['post_id'];

			$command_select_question = "SELECT * FROM question WHERE question_id = ?";
			$stmt = $dbh->prepare($command_select_question);
			$paramsArray = [$id];
			$stmt->execute($paramsArray);
			while($row = $stmt->fetch()){
				$question_id = $row['question_id'];	
				$question_title = $row['question_title'];	
				$question_author = $row['question_author'];	
				$question_date = $row['question_date'];	
				$question_content = $row['question_content'];	
				echo "<div class='question'>";
				echo "<h1 id='question_title'>" . $question_title . "</h1>";
				echo "<p>Author: <span id='question_author'>" . $question_author . "</span> <span id='question_date'>" . $question_date . "</span></p>";
				echo "<p id='question_content'>" . $question_content . "</p>";
				echo "</div>";
			}
			
			// $command_select_comment = "SELECT * FROM comment WHERE question_id = ?";
			// $stmt = $dbh->prepare($command_select_comment);
			// $paramsArray = [$id];
			// $stmt->execute($paramsArray);
			// while($row = $stmt->fetch()){
			// 	$comment_id = $row['comment_id'];	
			// 	$comment_author = $row['comment_author'];	
			// 	$comment_date = $row['comment_date'];	
			// 	$comment_content = $row['comment_content'];
			// 	echo "<div id='comment'>";
			// 	echo "<p id='comment_author'>" . $comment_author . " <span id='comment_date'>" . $comment_date . "</span></p>";
			// 	echo "<p id='comment_content'>" . $comment_content . "</p>";
			// 	echo "</div>";
			// }
		}
		?>

		<form id="comment_form" action="" method="post">
			<input type="text" id="comment_author_input" placeholder="Author">
			<textarea placeholder="Leave Comment" id="comment_textarea" rows="4" cols="50"></textarea>
			<input type="button" value="Submit" id="comment_button">
		</form>
	</div>

</body>
</html>