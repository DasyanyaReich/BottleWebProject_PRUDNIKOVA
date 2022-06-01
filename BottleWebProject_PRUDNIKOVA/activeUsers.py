import webbrowser
from bottle import post, request
import json
import checkPhone

@post('/activeUsers', method='post')
def active_user_page():
    #recive data froman address field value
    name = request.forms.get('nameUser')
    lastname = request.forms.get('lastnameUser')
    phone = request.forms.get('phone')
    user = request.forms.get('you')
    dataUser = {}#array of active user
    flag=0#flag for 
    if(checkPhone.check_phone(phone)):
        try:
            #loading a dictionary from file
            with open('activeUserFile.json', 'a') as jsonFile:
                dataUser=json.load(jsonFile)
        except:
            pass
        #finding phone in dictionary
        for i in dataUser:
            if phone in i:
                flag=1
        if flag:
            dataUser.pop(phone)
        dataUser[phone] = [name, lastname, user]
        #saving data to file
        with open('activeUserFile.json', 'w') as outfile:
            json.dump(dataUser, outfile)
    
    webbrowser.open("http://localhost:64468/activeUsers")


