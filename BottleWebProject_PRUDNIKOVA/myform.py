#Подключение методов для отправки HTTP запросов
import pdb
from bottle import post, request


@post('/home', method='post')
def my_form():
    #присвоение переменной значение поля адреса
    mail = request.forms.get('ADRESS')
    text = request.forms.get('QUEST')
    #regex = re.compile(r'([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+')
    questions = {mail: text}
    pdb.set_trace()

    return "Thanks! The answer will be sent to the mail %s " % mail