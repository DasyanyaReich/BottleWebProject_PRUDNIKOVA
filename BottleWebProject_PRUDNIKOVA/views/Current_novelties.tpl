% rebase('layout.tpl', year=year)

<!--������� ��������� ��������--> 

<div class="col-md-10">
    <h2><strong><ddkHading>Current novelties</ddkHading></strong></h2>
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
% import json
<header_char>
    <!-- ��������� -->
	<head>
		<h1>������</h1>
        <meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="/static/content/site.css" />
	</head>
	<body id = back1>
		<!-- �������� ������� ����� � ����������� ������� -->
		<form id="Current_novelties">
			<h3> �������� ���� �����! </h3>
			<p><textarea input type="text" rows="3" cols="100" name="REVIEW" placeholder="����� �� ������ �������� ���� �����..." id="review"></textarea></p> 
			<p><input type="text" name="MAIL" placeholder="������� �����..." id="mail" 
			pattern="^[a-zA-Z0-9_.+-]+@[a-z]+.[a-z]{2,3}$" title="������� ����� � ��������� ������� - test@mail.ru"></p>
			<p><input type="text" name="PHONE" placeholder="������� ����� ��������..." id="phone" 
			pattern="^[+]\d[(]\d{3}[)]\d{3}[-]\d{2}[-]\d{2}$" title="������� ����� �������� � ��������� ������� - +#(###)###-##-##"></p>
			<p>���� � ������ ������� ��� ������� ���� ����������� �����, �� ����� �������� ����� ������� �� �����</p>
			<p><input type="submit" value="���������" class="btn btn-default" id="btn" onclick="rev_btn()"></p>
		</form>

		<!-- ����������� ����� ������� -->
		<br /><br /><br />
		<h3> ������ ������ �������������: </h3>
		<% reviews = [] %>
		<% try: %>
		<% with open('reviews.txt',encoding='latin1') as json_file: %>
			<% reviews = json.load(json_file) %>
		<% end %>
		<% except: %>
		<% pass %>
		<% end %>
		<% if len(reviews) > 0: %>
			<% for i in range(len(reviews)): %>
				<% c = len(reviews) - i -1 %>
				<% user_reviews = reviews[c]['review'] %>
				<% date_of_reviews = reviews[c]['date'] %>

				<form id="form_reviews_{{c+1}}">
					<h2>{{reviews[c]['mail']}}</h2>
					<h3>{{reviews[c]['phone']}}</h3>

						<ol>
							<% for j in range(len(user_reviews)): %>
								<p> {{user_reviews[j]}}</p>
								<p>{{date_of_reviews[j]}}</p>
							<% end %>
						</ol>
				</form>
			<% end %>
		<% end %>
	</body>

	<script>
		// ������� �������� ���������� �����
		function rev_btn() {
			document.getElementById("Current_novelties").action = "/Current_novelties";
			document.getElementById("Current_novelties").method = "post";	
		}
	</script>
</header_char>
