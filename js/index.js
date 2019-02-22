window.addEventListener("load", function(event){
	load();
	$("#refreshButton").click(function(event){
		
	});
});

function load(){
	$.ajax({
		url: "server/question.php",
		type: "get",
		dataType: "JSON",
		success: function(response){
			for(var i=0; i<response.length; i++){
				var id = response[i].id;
				var author = response[i].author;
				var title = response[i].title;
				var date = response[i].date;
				var content = response[i].content;
				
				var subStr = content.substring(0, 100) + "...(<a class='fullPostLink' href='post.php?post_id=" + id + "'>More</a>)";
				var contentDisplayed = (content.length>=100) ? subStr : content;

				var titleStr = "<a class='titleLink' href='post.php?post_id=" + id + "'><div id='content'><h1 id='question_title'>" + title + "</h1></a>";
				var authorStr = "<p id='question_author'>Author: " + author + " <span id='question_date'>" + date +"</span></p>";
				var contentStr = "<p id='question_content'>" + contentDisplayed + "</p></div>";
				var str = titleStr + authorStr + contentStr;
				$("#container").append(str);
			}
		}
	});
}