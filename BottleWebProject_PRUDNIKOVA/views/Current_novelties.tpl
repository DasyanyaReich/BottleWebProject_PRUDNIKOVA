% rebase('layout.tpl', title='Evgenij Onegin', year=year)
<!--Вставка начальной картинки--> 

<div class="col-md-10">
    <h2><strong><ddkHading>Current novelties</ddkHading></strong></h2>
    <p class="lead"><ddk>On this page you can read the latest news of our site, as well as write your information</ddk></p>

<div class="col-md-10">
    <!--Generating a table-->
        <form action="/Row" method="post">
        %filehandle = open("D:\Spisok.txt", "r")
        %a= 0
        %while True:  
            %line = filehandle.readline()
            %if not line:
                %break
            %else:
                <p><ddk>{{line}}</ddk></p>
        %filehandle.close()  

            
        </form>
    </div>
    
            


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
        <p><ddk><input type="text" size="50" name="Nik" placeholder="Your Nik" required></ddk></p>
        <p><ddk><input type="text" size="50" name="Name" placeholder="Your Text Name" required></ddk></p>
        <p><ddk><textarea rows="10" onkeyup="this.value = this.value.replace(/[|]/g,'');" cols="50" name="QUEST" placeholder="Your text"required></textarea></ddk></p> 
        <p class="lead"><ddk>On this page you can read the latest news of our site, as well as write your information</ddk></p>
        <div id="current_date_time_block2"></div>
        <p id="time" name="TIME"></p>
        <script type="text/javascript">
            var time = setInterval(function() {
                var date = new Date();
                document.getElementById("time").innerHTML = (date.getFullYear() + "-"+ date.getMonth() + "-"+ date.getDate() + " "+ date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds());
            }, 1000);
        </script>
        <p><input type="submit" value="Send" class="btn btn-warning btn-lg" required></a></p>
</form>