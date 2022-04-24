from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Topic(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name

class Room(models.Model):
    # be careful that you should put = not :
    host = models.ForeignKey(User, on_delete=models.SET_NULL , null=True)
    topic= models.ForeignKey(Topic , on_delete=models.SET_NULL ,null= True)
    name = models.CharField(max_length= 200)
    descripation = models.TextField(null= True , blank= True)
    participants = models.ManyToManyField(User , related_name='participants' , blank=True)
    update = models.DateTimeField(auto_now= True)
    created = models.DateTimeField(auto_now_add=True)
    #Meta is the inner calss model and it must be Meta
    class Meta:
        ordering = ['-update','-created']

    def __str__(self):
        return self.name

class Message(models.Model):
    user = models.ForeignKey(User , on_delete=models.CASCADE)
    room = models.ForeignKey(Room , on_delete=models.CASCADE)
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


