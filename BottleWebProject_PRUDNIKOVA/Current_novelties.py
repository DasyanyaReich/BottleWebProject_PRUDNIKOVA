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
    Name_article = request.forms.get('Name_article')
    nik = request.forms.get('NIK')
    phone = request.forms.get('PHONE')
    current_article = request.forms.get('Current_article')
    date = datetime.datetime.now()
    article = []
    try:
        with open('article.txt') as json_file:
            article = json.load(json_file)
    except:
        pass
    numbers =[]
    numbers.append(phone)
    #Закрытие номера телефона
    for item in numbers:
        covered = item[:-4] + '****'
        phone = covered
    # Проверка почты на наличие в текстовом файле JSON
    flag = 1
    # Если в текстовом файле уже имеются данные ->
    if len(article) != 0:
        # Если в одном из отывов почта совпадает, то записать новый отзыв в имеющийся список
        for rev in article:
            if nik == rev['nik'] and phone == rev['phone']:
                rev['Name_article'].append(Name_article)
                rev['current_article'].append(current_article)
                rev['date'].append(date.strftime("%x"))
                flag = 0
        # Иначе добавить к существующим словарям новый словарь с отзывом
        if flag == 1:
            article.append({'Name_article': [Name_article], 'nik': nik, 'phone': phone, 'date': [date.strftime("%x")], 'current_article': [current_article]})
    # Иначе сделать новый словарь с отзывом
    else:
        article.append({'Name_article': [Name_article], 'nik': nik,'phone': phone, 'date': [date.strftime("%x")], 'current_article': [current_article]})
    
    # Записать в файл данные
    with open('article.txt', 'w') as outfile:
        json.dump(article, outfile)

    # Отобразить страницу с отзывами
    return dict(
        title='Current_novelties',
        year=datetime.datetime.now().year
    )