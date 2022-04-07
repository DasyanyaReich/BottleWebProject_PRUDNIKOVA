#Подключение методов для отправки HTTP запросов
import pdb
import json
from bottle import post, request


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
