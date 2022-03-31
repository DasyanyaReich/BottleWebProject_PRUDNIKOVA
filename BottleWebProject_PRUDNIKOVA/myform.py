#Подключение методов для отправки HTTP запросов
import pdb
import json
from bottle import post, request


@post('/home', method='post')
def my_form():
    #присвоение переменной значение поля адреса
    #regex = re.compile(r'([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+')
    questions = {}
    pdb.set_trace()

    with open('D:\Mail.txt', 'r') as json_file:
        questions = json.load(json_file)
    mail = request.forms.get('ADRESS')
    text = request.forms.get('QUEST')
    if mail in questions:
        text+= '<&-*>|<*-&>' + questions[mail]
    questions[mail] = text
    with open('D:\Mail.txt', 'w') as outfile:
       json.dump(questions, outfile)
    return "Thanks! The answer will be sent to the mail %s " % mail
