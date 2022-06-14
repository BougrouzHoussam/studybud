from email.policy import default
from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

TYPE_SECTION = [
    ("Agency","Agency"),
    ("Client","Client"),
]

class User(AbstractUser):
    email = models.EmailField(unique=True , null=False )
    avater = models.ImageField(null = True , default = "avatar.svg"  )
    bio = models.TextField( null= True)
    type = models.CharField(max_length=25,choices=TYPE_SECTION,default='Client' )
    phone_number = models.CharField(max_length=20,null=True)
    
    USERNAME_FIELD= 'email'
    REQUIRED_FIELDS = []


class Category(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name


class Offer(models.Model):
    # be careful that you should put = not :
    host = models.ForeignKey(User, on_delete=models.SET_NULL , null=True)
    area = models.FloatField(null=True , blank=True)
    long = models.FloatField(null = True , blank= True)
    lat = models.FloatField(null = True , blank= True)
    topic= models.ForeignKey(Category , on_delete=models.SET_NULL ,null= True)
    name = models.CharField(max_length= 200)
    mainpic = models.ImageField(null = True )
    price = models.IntegerField(null = True ,blank=True)
    descripation = models.CharField(max_length= 500,null= True , blank= True)
    participants = models.ManyToManyField(User , related_name='participants' , blank=True)
    update = models.DateTimeField(auto_now= True)
    created = models.DateTimeField(auto_now_add=True)
    #Meta is the inner calss model and it must be Meta
    class Meta:
        ordering = ['-update','-created']

    def __str__(self):
        return self.name

class Pictures(models.Model):
    room = models.ForeignKey(Offer , on_delete=models.CASCADE )
    pic = models.ImageField(null = True)
    created = models.DateTimeField(auto_now_add=True)
    update = models.DateTimeField(auto_now= True)
    class Meta:
        ordering = ['-update','-created']
    def __str__(self):
        return self.room.name

class Message(models.Model):
    user = models.ForeignKey(User , on_delete=models.CASCADE)
    room = models.ForeignKey(Offer , on_delete=models.CASCADE)
    update = models.DateTimeField(auto_now= True)
    created = models.DateTimeField(auto_now_add=True)
    body = models.TextField()

    class Meta:
        ordering = ['-update','-created']
    
    # when you call just message not message.body
    # or somthing else it will give you the body with the only 50
    # carcter 
    def __str__ (self):
        return self.body[0:50]

