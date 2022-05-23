% rebase('layout.tpl', title='Evgenij Onegin', year=year)
<!--Вставка начальной картинки--> 
<div class="col-md-5">
    <img src="static\images\img_SummaryOfWork\i.png"> 
</div>
<div class="col-md-5">
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

<form action="/home" method="post2">
        <p><ddk><input type="text" size="50" name="Nik" placeholder="Your Nik" required></ddk></p>
        <p><ddk><input type="text" size="50" name="Name" placeholder="Your " required></ddk></p>
        <p><ddk><textarea rows="10" onkeyup="this.value = this.value.replace(/[|]/g,'');" cols="50" name="QUEST" placeholder="Your text"required></textarea></ddk></p> 
        <p><input type="submit" value="Send" class="btn btn-warning btn-lg" required></a></p>
        <input name="example_date" type="date" />

</form>