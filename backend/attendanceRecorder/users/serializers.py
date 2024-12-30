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

    def create(self, validated_data):
        # Extract nested user data
        user_data = validated_data.pop('user')

        # Create the User object
        user = User.objects.create(**user_data)

        # Create the Student object with the related User
        student = Student.objects.create(user=user, **validated_data)

        return student



class TeacherSerializer(serializers.ModelSerializer):
    user = UserSerializer()  # Nested User data

    class Meta:
        model = Teacher
        fields = ['id', 'user', 'subject']

    def create(self, validated_data):
        # Extract nested user data
        user_data = validated_data.pop('user')

        # Create the User object
        user = User.objects.create(**user_data)

        # Create the Teacher object with the related User
        teacher = Teacher.objects.create(user=user, **validated_data)

        return teacher
