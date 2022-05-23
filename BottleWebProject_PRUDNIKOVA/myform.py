#Подключение методов для отправки HTTP запросов
import pdb
import json
from bottle import post, request, template, route


@post('/home', method='post')
def my_form():
    #присвоение переменной значение поля адреса
    questions = {}
    text = []
    with open('D:\Mail.txt', 'r') as json_file:
        questions = json.load(json_file)
    mail = request.forms.get('ADRESS')
    tempText = request.forms.get('QUEST')
    if mail in questions:
        text.append(questions[mail])
    if(mail not in questions.keys()):
        questions[mail] = []
    questions[mail].append(tempText)
    with open('D:\Mail.txt', 'w') as outfile:
       json.dump(questions, outfile)
    return "Thanks! The answer will be sent to the mail %s " % mail

@post('/Current_novelties', method='post')
def my_form():
    list1 =[]
    #присвоение переменной значение поля адреса
    nik = request.forms.get('Nik')
    name = request.forms.get('Name')
    text = request.forms.get('QUEST')
    date = request.forms.get('example_date')
    list1.append(date)
    list1.append(nik)
    list1.append(name)
    list1.append(text)
    with open('D:\Spisok.txt', 'a') as outfile:
       json.dump(list1, outfile)
       outfile.write('\n')
    return "Thanks! The answer will be sent to the mail %s "