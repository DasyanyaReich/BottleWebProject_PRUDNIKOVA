from bottle import post, request
import pdb
import json

@post('/Reviews', method='post')
def my_form():
# Присвоение переменной значение поля адреса

    questions = {}
    #pdb.set_trace()
    with open('data.txt', 'r') as json_file: # Открытие json файла
        questions = json.load(json_file)        # Загрузка json файла
    mail = request.forms.get('ADRESS')
    text = request.forms.get('QUEST')
    if mail in questions:
        text+= '<-->|<-->' + questions[mail]
    questions[mail] = text
        
    with open('data.txt', 'w') as outfile: # Условие для закрытия json файла
        json.dump(questions, outfile)       # Закрытие json файла
    return "Thanks! The answer will be sent to the mail %s " % mail
