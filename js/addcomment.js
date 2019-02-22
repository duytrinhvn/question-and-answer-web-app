window.addEventListener('load', function(event){
	showcomment();
	$("#comment_button").click(function(event){
		$(".comment").remove();
		addComment();
	});
});

function addComment(){
	$.post(
		"server/comment.php",
		{
			comment_author: $("#comment_author_input").val(),
			comment_content: $("#comment_textarea").val(),
			question_title: $("#question_title").html(),
			question_author: $("#question_author").html()
		},
		function(response){
			console.log(response);
			$( '#comment_form' ).each(function(){
			    this.reset();
			});
			showcomment();
		}
	)
}

function showcomment(){
	$.ajax({
		url: "server/comment.php",
		type: "post",
		dataType: "json",
		data: {
			request: 'showcomment',
			question_title: $("#question_title").html(),
			question_author: $("#question_author").html()

		},
		success: function(response){
			for(var i=0; i<response.length; i++){
				var author = response[i].author;
				var date = response[i].date;
				var content = response[i].content;

				var str1 = "<div class='comment'>";
				var str2 =  "<p id='comment_author'>" + author + " <span id='comment_date'>" + date + "</span></p>";
				var str3 =  "<p id='comment_content'>" + content + "</p>";
				var str4 =  "</div>";
				var str = str1 + str2 + str3 + str4;
				$(".question").after(str);
			}
		}
	});
}