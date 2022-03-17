from bottle import post, request

@post('/home', method='post')
def my_form():
    mail = request.forms.get('ADRESS')
    return "Thanks! The answer will be sent to the mail %s" % mail