% rebase('layout.tpl', title='Evgenij Onegin', year=year)
% import json
<!--Вставка начальной картинки--> 

<div class="col-md-10">
    
</div>


<header_char>
    <!-- Заголовок -->
	<head>
		<h2><strong><ddkHading>Reviews</ddkHading></strong></h2>
		<p class="lead"><ddk>Here you can read and post a review about our website</ddk></p>
	</head>
	<body id = back1>
		<!-- Основная рабочая форма с заполнением отзывов -->
		<form id="form_user_review">
			<h3> Leave your feedback! </h3>
			<p><textarea input type="text" rows="3" cols="100" name="REVIEW" placeholder="Here you can leave your feedback..." id="review"></textarea></p> 
			<p><input type="text" name="Nickname" placeholder="Enter your nickname" id="Nickname" ></p>
			<p><input type="date" name="Date" placeholder="Enter the date when the review was sent..." id="Date"></p>
			<p><input type="submit" value="Send" class="btn btn-default" id="btn" onclick="rev_btn()"></p>
		</form>

		<!-- Отображение чужих отзывов -->
		<br /><br /><br />
		<h3> Reviews of other users: </h3>
		<% reviews = [] %>
		<% try: %>
		<% with open('D:/reviews.txt',encoding='latin1') as json_file: %>
			<% reviews = json.load(json_file) %>
		<% end %>
		<% except: %>
		<% pass %>
		<% end %>
		<% if len(reviews) > 0: %>
			<% for i in range(len(reviews)): %>
				<% c = len(reviews) - i -1 %>
				<% user_reviews = reviews[c]['review'] %>
				<% Date = reviews[c]['Date'] %>
				<form id="form_reviews_{{c+1}}">
					<h2>{{reviews[c]['Nickname']}}</h2>
					<h3>{{reviews[c]['Date']}}</h3>
						<ol>
							<% for j in range(len(user_reviews)): %>
								<p>{{user_reviews[j]}}</p>
							<% end %>
						</ol>
				</form>
			<% end %>
		<% end %>
	</body>

	<script>
		// Функция проверки заполнения формы
		function rev_btn() 
			if ((document.getElementById("review").value == "") && (document.getElementById("Nickname").value == "") && (document.getElementById("Date").value == "")) {
				alert("Enter the data!");
			} else if (document.getElementById("review").value == "") {
				alert("Enter your review!");
			} else if (document.getElementById("Nickname").value == "") {
				alert("Enter your Nickname!");
			} else if (document.getElementById("Date").value == "") {
				alert("Enter your Date!");
			} else {
				document.getElementById("form_user_review").action = "/user_review";
				document.getElementById("form_user_review").method = "post";
			}
		}
	</script>
</header_char>



