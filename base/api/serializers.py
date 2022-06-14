from django.db.models import Q
from django.conf import settings
from rest_framework.serializers import ModelSerializer
from base.models import Offer, Pictures, User , Message
from rest_framework import serializers

class Roomserializer(ModelSerializer):
    class Meta:
        model = Offer
        fields = '__all__'


class pictureserializer(serializers.ModelSerializer):
    pic = serializers.SerializerMethodField('image_url')

    class Meta:
        model = Pictures
        fields = ['id','pic']
    
    def image_url(self , obj):
        return  obj.pic.url

class commentserializer(serializers.ModelSerializer):
    user = serializers.CharField(source='user.username', read_only = True)

    class Meta:
        model = Message
        fields = '__all__'

class homepageserializer(serializers.ModelSerializer):
    host_name = serializers.CharField(source='host.username', read_only = True)
    images = serializers.SerializerMethodField('Offer_pictures')
    class Meta:
        model = Offer
        fields = ['id','host_name','images', 'name','price','created']
    
    def Offer_pictures(self , instanse):
        images = Pictures.objects.filter(room__id=instanse.id)
        return pictureserializer(images , many=True).data

    


class DetailsOfferserializer(serializers.ModelSerializer):
    host_name = serializers.CharField(source='host.username', read_only = True)
    images = serializers.SerializerMethodField('Offer_pictures')
    comments = serializers.SerializerMethodField('get_comments')
    
    class Meta:
        model = Offer
        fields = ['id','host_name','area','long','lat','topic','images' ,'name','price','descripation','participants','update','created',"comments"]
        
    def Offer_pictures(self , instance):
        pictures = Pictures.objects.filter(room__id =instance.id)
        return pictureserializer(pictures , many = True).data
    
    def get_comments(self , instanse):
        comment = Message.objects.filter(room__id = instanse.id)
        return commentserializer(comment , many=True).data
    
class Addpictureserializer(serializers.ModelSerializer):

    class Meta:
        model = Pictures
        fields = ['room','pic']

    def create(self, validated_data):
        return Pictures.objects.create(**validated_data)  




class ApiRoomserializer(ModelSerializer):
    
    class Meta:
        model = Offer
        fields = '__all__'

class Userserializer(ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class commentserializer(ModelSerializer):
    class Meta:
        model = Message
        fields = '__all__'