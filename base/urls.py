from unicodedata import name
from django.urls import path
from . import views

urlpatterns = [
    path('login_page/',views.loginregister, name='login'),
    path('logout_user/',views.logoutuser, name='logout'),
    path('register/',views.signuppage, name='signup'),
    path('edit/',views.edituser, name ='edituser' ),
    #the penfites of the name is that if i ever want to change the url 
    #all i need is use the name of the url so that can acces the url pattern
    path('', views.home , name ='home'),
    #str:pk it mean that in this room there is a lot of page but with a defferent url that
    #are the /pk primary key

    #!here the path first what i named it then enter the function and the 
    #!where to find it in this case in views.py function createroom
    #!the name is optional but it have some benffets
    path('room/<str:pk>/',views.room ,name = 'room'),
    path('profile/<str:pk>/',views.profileinfo , name = 'profile'),
    path('create-room/' , views.createroom , name='create-room'),
    path('edit-room/<str:pk>/' , views.updateroom , name='update-room'),
    path('edit-mess/<str:pk>/' , views.editmessage , name='edit-message'),
    path('delete-room/<str:pk>/' , views.deleteroom ,name = 'delete-room'),
    path('delete-message/<str:pk>/' , views.deletemessage ,name = 'delete-message'),
    path('topics/', views.topicpage , name='topic'),
]