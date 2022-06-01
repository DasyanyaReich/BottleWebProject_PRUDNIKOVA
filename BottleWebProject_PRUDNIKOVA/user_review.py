from bottle import post, request, get, route, view
import json, datetime

# Обработчик отправки отзыва на сайт
@post('/user_review', method='post')
@view('user_review')
def review_form():
    Nickname = request.forms.get('Nickname')
    Date = request.forms.get('Date')
    review = request.forms.get('REVIEW')
    date = datetime.datetime.now()
    reviews = []
    try:
        with open('D:/reviews.txt',encoding='latin1') as json_file:
            reviews = json.load(json_file)
    except:
        pass

    # Проверка почты на наличие в текстовом файле JSON
    flag = 1
    # Если в текстовом файле уже имеются данные ->
    if len(reviews) != 0:
        # Иначе добавить к существующим словарям новый словарь с отзывом
        if flag == 1:
            reviews.append({'Nickname': Nickname, 'Date': Date, 'review': [review]})
    # Иначе сделать новый словарь с отзывом
    else:
        reviews.append({'Nickname': Nickname, 'Date': Date, 'review': [review]})
    
    # Записать в файл данные
    with open('D:/reviews.txt', 'w',encoding='latin1') as outfile:
        json.dump(reviews, outfile)

    # Отобразить страницу с отзывами
    return dict(
        title='Reviews',
        year=datetime.datetime.now().year
    )

