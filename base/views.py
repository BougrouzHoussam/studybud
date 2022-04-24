from multiprocessing import context
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponse
from .forms import Roomform ,Messageform,Userform
from django.shortcuts import redirect, render
from .models import Room ,Topic , Message
from django.db.models import Q
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate , login , logout
from django.contrib.auth.decorators import login_required
# Create your views here.


# rooms =[
#     {'id': 1 , 'name':'learn django'},
#     {'id': 2 , 'name':'learn frontend'},
#     {'id': 3 , 'name':'learn backend'},
# ]
def loginregister(request):
    if request.user.is_authenticated:
        return redirect('home')

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        # here we add '' cause it's name in html
        try:
            user = User.objects.get(username = username)
        except:
            messages.error(request, 'no such user')
        user = authenticate(request , username=username ,password=password)
        if user is not None:
            login(request , user)
            return redirect( 'home')
        else:
            messages.error(request, 'username or password are wrong')
        
    context={}
    return render(request , 'base/login.html',context) 

def signuppage(request):
    form = UserCreationForm()
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit= False)
            user.save()
            login(request , user)
            return redirect('home')
        else:
            messages.error(request, 'an error while registration')

    context = {'form':form}
    return render(request , 'base/signup.html' , context)



def logoutuser(request):
    logout(request)
    return redirect('home')
 
@login_required(login_url='login')
def edituser(request):
    user = request.user
    form =Userform(instance=user)

    if request.method == 'POST':
        form = Userform(request.POST , instance=user)
        if form.is_valid():
            form.save()
            return redirect('profile', pk = user.id)
    
    context = {'form':form}
    return render(request, 'base/edit-user.html' , context)


def home(request):
    q = request.GET.get('q') if request.GET.get('q') !=None else ''
    rooms =  Room.objects.filter(
        #here we had add the name in topic cause it have other models
        #and the other model defin by his name
    Q(topic__name__icontains=q )|
    Q(descripation__icontains = q)|
    Q(name__icontains =q) 
    )
    messagefeed = Message.objects.filter(
    Q(room__topic__name__icontains=q )
    )

    allroom_count = Room.objects.count
    #there is another way by call rooms cause techniqly it's the Room object and faster 
    room__count = rooms.count
    topics = Topic.objects.all()
    #i had creat a varible it dosen't matter the name 
    context = {'room': rooms , 'topics':topics , 'room__count':room__count , 'messagefeed':messagefeed,'allroom_count':allroom_count}
    return render(request,'base/home.html' , context)


def room(request , pk):
    room = Room.objects.get(id = pk)
    roommessages = room.message_set.all()
    part = room.participants.all()
    room.participants.add(room.host)
    if request.method == 'POST':
        mes = Message.objects.create(
            user = request.user,
            room = room,
            #get mess cause i named the input in room mess
            body = request.POST.get('mess')
        )
        room.participants.add(request.user)
        return redirect('room' , pk=room.id)


    context = {'room' : room , 'conv':roommessages , 'part':part}
    #don't forget to pass the context here
    return render(request,'base/room.html' , context)
#those are the function that allow us to go to other url by add it to 
#urls go to urls and contine

def profileinfo(request , pk):
    user = User.objects.get(id = pk) 
    # if i want to make it appear only the
    # room that he had create it  


    # if i want to only get what the user do use user.method 
    # look the room 
    room = user.room_set.all()
    topics = Topic.objects.all()
    messagefeed = user.message_set.all()
    context={'user':user , 'room':room ,'topics':topics ,'messagefeed':messagefeed}
    return render(request , 'base/profile.html' , context)

@login_required(login_url='login')
def createroom(request):
    form = Roomform()
    topics = Topic.objects.all()
    if request.method == 'POST':
        #check using print(request.post)
        topic_name = request.POST.get('topic')
        topic , created = Topic.objects.get_or_create(name = topic_name)
        Room.objects.create(
            host = request.user, 
            topic = topic,
            name= request.POST.get('name'),
            descripation = request.POST.get('descripation'),
        )
        # form = Roomform(request.POST)
        # if form.is_valid():
        #     room = form.save(commit=False)
        #     room.host = request.user            
        #     room.save()
        return redirect('home')
    context = {'form': form ,'topics':topics}
    return render(request , 'base/home_form.html' , context)


# add a primarykey to know which romm you want edit
@login_required(login_url='login')
def updateroom(request, pk):
    # here we work with a romm cause we had pass the pk to it
    room = Room.objects.get(id=pk)
    form = Roomform(instance=room)
    topics = Topic.objects.all()

    if request.user != room.host:
        return HttpResponse('you are not allow here')

    if request.method == 'POST':
        #check using print(request.post)
        topic_name = request.POST.get('topic')
        topic , created = Topic.objects.get_or_create(name = topic_name)
        room.topic = topic
        room.name = request.POST.get('name')
        room.descripation = request.POST.get('descripation')
        room.save()
        # form = Roomform(request.POST, instance=room)
        # if form.is_valid():
        #     form.save()
        return redirect('home')

    context = {'form':form ,'topics':topics , 'room':room}
    return render(request , 'base/home_form.html' , context)
     
#alwys in any method remember the ()
@login_required(login_url='login')
def deleteroom(request , pk):
    room = Room.objects.get(id=pk)
    if request.user != room.host :
        return HttpResponse('you are not allow here')

    if request.method == 'POST':
        room.delete()
        return redirect('home')
    return render(request, 'base/delete.html' , {'obj':room})
    

@login_required(login_url='login')
def deletemessage(request , pk ):
    message = Message.objects.get(id=pk)
    if request.user != message.user :
        return HttpResponse('you are not allow here')
    
    if request.method == 'POST':
        message.delete()
        return redirect('home' )
    return render(request, 'base/delete.html' , {'obj':message})
    
@login_required(login_url='login')
def editmessage(request, pk):
    # here we work with a romm cause we had pass the pk to it
    mess = Message.objects.get(id=pk)
    form = Messageform(instance=mess)

    if request.user != mess.user:
        return HttpResponse('you are not allow here')

    if request.method == 'POST':
        #check using print(request.post)
        form = Messageform(request.POST , instance=mess)
        if form.is_valid():
            form.save()
            return redirect('home')

    context = {'form':form}
    return render(request , 'base/home_form.html' , context)


def topicpage(request):
    q = request.GET.get('q') if request.GET.get('q') !=None else ''
    topics = Topic.objects.filter(
        Q(name__icontains=q )
    )
    room__count = Room.objects.count
    context ={'topics':topics , 'room__count':room__count}
    return render(request , 'base/topics.html',context)