from pyexpat import model
from django.forms import ModelForm
from .models import Room , Message
from django.contrib.auth.models import User

class Roomform(ModelForm):
    class Meta:
        model = Room
        fields ='__all__'
        exclude = ['host' ,'participants']

class Messageform(ModelForm):
    class Meta:
        model = Message
        fields = ('body',)

class Userform(ModelForm):
    class Meta:
        model = User
        fields = ['username','email']