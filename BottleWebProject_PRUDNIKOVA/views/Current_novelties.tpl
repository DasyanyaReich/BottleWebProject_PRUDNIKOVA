% rebase('layout.tpl', year=year)
% import json, datetime

<!--Вставка начальной картинки--> 

<div class="col-md-10">
    <h2 align="center"><strong><ddkHading>Current novelties</ddkHading></strong></h2>
    <p class="lead"><ddk>On this page you can read the latest news of our site, as well as write your information</ddk></p>





<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Name</title>
    <style>
      #window {
        width: 300px;
        height: 150px;
        text-align: center;
        padding: 15px;
        border: 3px solid #3d2b1f;
        border-radius: 10px;
        color: #cc7722;
        display: none;
      }
      #window:target {display: block;}
    </style>
  </head>
 

  <body>
   
    <div id="window">
     You can write your article here, which we will post on our website. To do this, you need to write your Nickname, the title of the article, the text of the article and the date of creation </div>
     
    <a href="#window"> <ddk>More detailed</ddk></a>
 
  </body>
</html>

<form action="/Current_novelties" method="post">
    <!-- Заголовок -->
	<body id = back1>
		<!-- Основная рабочая форма с заполнением отзывов -->
		<form id="Current_novelties">
			<h3><ddkHading> Write your current article </ddkHading></h3>
			<p><ddk><input type="text" name="NIK" placeholder="Enter your nik" id="nik" pattern="([A-Za-z0-9]{7,})+" title="The nickname must consist of at least 7 characters" required></ddk></p>
			<p><ddk><input type="text" name="PHONE" placeholder="Enter the phone number" id="phone" 
			pattern="^[+]\d[(]\d{3}[)]\d{3}[-]\d{2}[-]\d{2}$" title="Enter the phone number in the specified format - +#(###)###-##-##" required></ddk></p>
			<p><ddk><input type="text" rows="3" cols="100" name="Name_article" placeholder="Name current article" id="Name_article" pattern="([A-Za-z0-9]{7,})+" title="The Name current article must consist of at least 7 characters" required></ddk></p> 
			<p><ddk><textarea input type="text" rows="10" cols="100" name="Current_article" placeholder="The text of the article" id="review" required></textarea></ddk></p> 
			<p><input type="submit" value="Send" class="btn btn-warning btn-lg" required></a></p>
		</form>

		<!-- Отображение чужих отзывов -->
		<br /><br /><br />
		<h3><ddkHading> Articles by other users:</ddkHading> </h3>
		<% article = [] %>
		<% try: %>
		<% with open('article.txt') as json_file: %>
			<% article = json.load(json_file) %>
		<% end %>
		<% except: %>
		<% pass %>
		<% end %>
		<% if len(article) > 0: %>
			<% for i in range(len(article)): %>
				<% c = len(article) - i -1 %>
				<% Name_article = article[c]['Name_article'] %>
				<% user_reviews = article[c]['current_article'] %>
				<% date_of_reviews = article[c]['date'] %>

					<h2><ddk2>Autor: {{article[c]['nik']}}</ddk2></h2>
					<h3><ddk2>Tel: {{article[c]['phone']}}</ddk2></h3>
						<ol>
							<% for j in range(len(Name_article)): %>
								<p><ddk2>{{Name_article[j]}}<ddk2></p>
								<p><ddk>{{user_reviews[j]}}<ddk></p>
								<p align ="left"><ddk> Date publication: {{date_of_reviews[j]}}<ddk></left>
							<% end %>
							<h3><ddkHading> ***** </ddkHading></h3>
						</ol>
			<% end %>
		<% end %>
	</body>
</form>
