from pickle import TRUE
from rest_framework.decorators import api_view
from rest_framework.response import Response
from base.models import Room
from .serializers import Roomserializer
@api_view(['GET'])
def getrouts(request):
    routs = [
        'GET /api'
    ]
    return Response(routs)

@api_view(['GET'])
def getrooms(request):
    rooms = Room.objects.all()
    ser = Roomserializer(rooms , many = TRUE)
    return Response(ser.data)


@api_view(['GET'])
def getroom(request , pk):
    room = Room.objects.get(id = pk)
    ser = Roomserializer(room , many = False)
    return Response(ser.data)