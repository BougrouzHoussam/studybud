from django.forms import ModelForm
from .models import Offer , Message , User
from django.contrib.auth.forms import UserCreationForm

class MyUserCreationForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username' , 'email' , 'password1','password2','type','phone_number']


class Roomform(ModelForm):
    class Meta:
        model = Offer
        fields ='__all__'
        exclude = ['host' ,'participants']

class Messageform(ModelForm):
    class Meta:
        model = Message
        fields = ('body',)

class Userform(ModelForm):
    class Meta:
        model = User
        fields = ['avater','username','email','bio']