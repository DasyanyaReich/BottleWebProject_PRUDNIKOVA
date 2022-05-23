#Подключение методов для отправки HTTP запросов
import pdb
import json
from bottle import post, request, template, route

@post('/home', method='post')
def my_form():
    list1 =[]
    #присвоение переменной значение поля адреса
    nik = request.forms.get('ADRESS')
    name = request.forms.get('ADRESS')
    text = request.forms.get('ADRESS')
    date = request.forms.get('example_date')
    list1.append(nik)
    list1.append(name)
    list1.append(text)
    with open('D:\Spisok.txt', 'a') as outfile:
       json.dump(list1, outfile)
    return template('Home')
