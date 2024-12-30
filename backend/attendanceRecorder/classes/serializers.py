from rest_framework import serializers

from users.serializers import TeacherSerializer
from .models import Class


class ClassSerializer(serializers.ModelSerializer):
    class_teacher = TeacherSerializer()  # Nested Teacher data for class teacher
    subject_teachers = TeacherSerializer(many=True)  # Nested Teacher data for subject teachers

    class Meta:
        model = Class
        fields = ['id', 'grade', 'section', 'class_teacher', 'subject_teachers']