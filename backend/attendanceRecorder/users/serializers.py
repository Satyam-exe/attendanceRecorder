from rest_framework import serializers

from classes.models import Class
from users.models import User, Student, Teacher


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'role', 'full_name', 'phone_number']


class StudentSerializer(serializers.ModelSerializer):
    user = UserSerializer()  # Nested User data
    enrolled_class = serializers.PrimaryKeyRelatedField(
        queryset=Class.objects.all(),
    )  # Displays class name as string

    class Meta:
        model = Student
        fields = ['id', 'user', 'admn_number', 'enrolled_class']



class TeacherSerializer(serializers.ModelSerializer):
    user = UserSerializer()  # Nested User data

    class Meta:
        model = Teacher
        fields = ['id', 'user', 'subject']

class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)
    password = serializers.CharField(required=True)