from bottle import post, request
import re

@post('/home', method='post')
def my_form():
    mail = request.forms.get('ADRESS')
    text = request.forms.get('QUEST')
    if text:
       return "Thanks! The answer will be sent to the mail %s" % mail
    else:
       return "Error message"
    regex = re.compile(r"([-!#-'*+/-9=?A-Z^-~]+(\.[-!#-'*+/-9=?A-Z^-~]+)*|\"([]!#-[^-~ \t]|(\\[\t -~]))+\")@([-!#-'*+/-9=?A-Z^-~]+(\.[-!#-'*+/-9=?A-Z^-~]+)*|\[[\t -Z^-~]*])")
    if re.fullmatch(regex, mail):
        return "Thanks! The answer will be sent to the mail %s" % mail
    else:
         return "Error mail adress"
   
