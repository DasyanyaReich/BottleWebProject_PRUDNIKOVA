import re

def check_phone(phone):#finction of check phone
    compil=re.compile(r'(\+7)(\([0-9]{3}\)\s([0-9]{3}))(-[0-9]{2})(-[0-9]{2})$', re.X)#создаем регулярное выражение
    result=compil.search(phone)#cheking enetering phone number
    if result:#if phone number is correct
        return 1
    else:#if phone number isnot correct
        return 0

