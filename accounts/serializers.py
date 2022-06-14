from django.db import transaction
from rest_framework import serializers
from dj_rest_auth.registration.serializers import RegisterSerializer
from base.models import User
from base.models import TYPE_SECTION


class CustomRegisterSerializer(RegisterSerializer):
    type = serializers.ChoiceField(choices=TYPE_SECTION )
    phone_number = serializers.CharField(max_length=30)

    # Define transaction.atomic to rollback the save operation in case of error
    @transaction.atomic
    def save(self, request):
        user = super().save(request)
        user.type = self.data.get('type')
        user.phone_number = self.data.get('phone_number')
        user.save()
        return user

# serializers.py in the users Django app
...


...

class CustomUserDetailsSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = (
            'pk',
            'username',
            'email',
            'phone_number',
            'type',
            'avater',
        )
        read_only_fields = ('pk', 'email', 'phone_number',)