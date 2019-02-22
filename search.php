
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
			<br>

			<?php include 'includes/search_result.php'; ?>	
		</div>
	</body>
</html>