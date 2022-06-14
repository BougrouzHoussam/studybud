from rest_framework.decorators import api_view, permission_classes
from rest_framework import generics, mixins, status , viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.views import APIView
from base.models import Offer, Pictures, User
from .serializers import Addpictureserializer, DetailsOfferserializer, Roomserializer, Userserializer, homepageserializer, pictureserializer 
from rest_framework.parsers import FormParser, MultiPartParser

from base.api import serializers


class createroom(mixins.CreateModelMixin,generics.GenericAPIView):
    permission_classes =[]
    authentication_classes = []
    serializer_class = Roomserializer
    queryset = Offer.objects.none()
    
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

class putpicture(APIView):
    parser_classes = (FormParser,MultiPartParser)
    permission_class =[]
    Authentication_class = []
    
    def post(self, request, format=None):
        serializer = Addpictureserializer(data=request.data)
        if serializer.is_valid():
            pic = request.data.get('pic')
            serializer.save(
                room = Offer.objects.get(pk=request.data.get('room')),
                pic = pic
            )
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
 
@api_view(['POST'])
def updateroomapi(request , pk):
    offer = Offer.objects.get(pk=pk)
    serializers = Roomserializer(instance = offer, data=request.data)
    if serializers.is_valid():
        serializers.save()
    return Response(serializers.data)                            	


@api_view(['DELETE'])
def deleteoffer(request , pk):
    offer = Offer.objects.get(pk=pk)
    offer.delete()
    return Response("item remove")      

@api_view(['GET'])
def getrouts(request):
    routs = [
        'GET /api'
    ]
    return Response(routs)

@api_view(['GET'])
def getrooms(request):
    rooms = Offer.objects.all()
    ser = Roomserializer(rooms , many=True)
    return Response(ser.data)

# class offerviweset(viewsets.ModelViewSet):
#     serializer_class = DetailsOfferserializer
#     permission_classes = []

#     def get_queryset(self):
#         offer = Offer.objects. all()
#         return offer


@api_view(['GET'])
def getroom(request , pk): 
    room = Offer.objects.get(id = pk)
    ser = Roomserializer(room , many = False)
    return Response(ser.data)


class details(mixins.ListModelMixin,generics.GenericAPIView):
    permission_classes =[]
    authentication_classes = []
    serializer_class = DetailsOfferserializer
    queryset = Offer.objects.all()
    
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

class Homepage(mixins.ListModelMixin,generics.GenericAPIView):
    permission_classes =[]
    authentication_classes = []
    serializer_class = homepageserializer
    queryset = Offer.objects.all()
    
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


@api_view(['POST'])
def updateroom(request , pk):
    room = Offer.objects.get(id = pk)
    if request.user.id == room.host.id:
        ser = Roomserializer(instance=room , data = request.data)
        if ser.is_valid():
            ser.save()
            return Response(ser.data)
        return Response(ser.errors)
    return Response({"error": "You are not the owner of this room"})

@api_view(['POST'])
def deleteroom(request , pk):
    room = Offer.objects.get(id = pk)
    if request.user.id == room.host.id:
        room.delete()
        return Response('room deleted')
    else :
        return Response({"error": "You are not the owner of this room"})


@api_view(['GET'])
def getuser(request , pk):
    user = User.objects.get(id = pk)
    usser = Userserializer(user , many = False)
    return Response(usser.data)

@api_view(['GET'])
def getusers(request):
    users = User.objects.all()
    usser = Userserializer(users , many = True)
    return Response(usser.data)

@api_view(['Get'])
def getpicture(request ):
    pic = Pictures.objects.all()
    ser = pictureserializer(pic , many = True)
    return Response(ser.data)