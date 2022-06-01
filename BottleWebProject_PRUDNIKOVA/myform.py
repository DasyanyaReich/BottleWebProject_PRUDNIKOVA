#Подключение методов для отправки HTTP запросов
import pdb
import json, datetime
from bottle import post, request, template, route, view


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
@view('Current_novelties')
def review_form():
    mail = request.forms.get('MAIL')
    phone = request.forms.get('PHONE')
    review = request.forms.get('REVIEW')
    date = datetime.datetime.now()
    reviews = []
    try:
        with open('reviews.txt',encoding='latin1') as json_file:
            reviews = json.load(json_file)
    except:
        pass

    # Проверка почты на наличие в текстовом файле JSON
    flag = 1
    # Если в текстовом файле уже имеются данные ->
    if len(reviews) != 0:
        # Если в одном из отывов почта совпадает, то записать новый отзыв в имеющийся список
        for rev in reviews:
            if mail == rev['mail']:
                rev['phone'] = phone
                rev['date'].append(date.strftime("%x"))
                flag = 0
        # Иначе добавить к существующим словарям новый словарь с отзывом
        if flag == 1:
            reviews.append({'mail': mail, 'phone': phone, 'date': [date.strftime("%x")], 'review': [review]})
    # Иначе сделать новый словарь с отзывом
    else:
        reviews.append({'mail': mail, 'phone': phone, 'date': [date.strftime("%x")], 'review': [review]})
    
    # Записать в файл данные
    with open('reviews.txt', 'w',encoding='latin1') as outfile:
        json.dump(reviews, outfile)

    # Отобразить страницу с отзывами
    return dict(
        title='Current_novelties',
        year=datetime.datetime.now().year
    )