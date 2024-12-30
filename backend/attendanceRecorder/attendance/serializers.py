from rest_framework import serializers

from attendance.models import Attendance
from classes.models import Class
from classes.serializers import ClassSerializer
from users.models import Student, Teacher
from users.serializers import StudentSerializer, TeacherSerializer


class AttendanceSerializer(serializers.ModelSerializer):
    student = StudentSerializer()  # Nested Student data
    teacher = TeacherSerializer()  # Nested Teacher data
    class_instance = ClassSerializer()  # Nested Class data

    class Meta:
        model = Attendance
        fields = ['id', 'student', 'teacher', 'class_instance', 'date', 'time', 'status']

    def create(self, validated_data):
        student = Student.objects.get(id=validated_data['student']['id'])
        teacher = Teacher.objects.get(id=validated_data['teacher']['id'])
        class_instance = Class.objects.get(id=validated_data['class_instance']['id'])

        attendance = Attendance.objects.create(student=student, teacher=teacher, class_instance=class_instance)

        return attendance