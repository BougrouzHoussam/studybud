from django.contrib import admin
from .models import Offer , Category,Message,User , Pictures
# Register your models here.
admin.site.register(User)
admin.site.register(Offer)
admin.site.register(Category)
admin.site.register(Message)
admin.site.register(Pictures)
