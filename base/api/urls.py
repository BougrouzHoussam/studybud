
from rest_framework.routers import DefaultRouter 
from django.urls import path
from . import views


urlpatterns = [
    path('', views.getrouts),
    path('rooms/',views.getrooms),
    path('room/<str:pk>/',views.getroom), 
    path('user/<str:pk>/',views.getuser),
    path('createroom/',views.createroom.as_view(), name = 'createroomapi'),
    path('updateroom/<str:pk>/',views.updateroom , name = 'updateroomapi'),
    path('deleteroom/<str:pk>/',views.deleteroom , name = 'deleteroomapi'),
    path('pictures/',views.getpicture , name = 'getpicturesapi'),
    path("putpicture/",views.putpicture.as_view() , name = 'putpicture'),
    # path('drooms/' , views.offerviweset , name='details')
    path('details/' , views.details.as_view() , name='details'),
    path('homepage/' , views.Homepage.as_view() , name='homepage'),
    path('updateoffer/<str:pk>/',views.updateroomapi , name = 'updateroomapi'),
    path("deleteoffer/<str:pk>/",views.deleteoffer , name = 'deleteoffer'),
]