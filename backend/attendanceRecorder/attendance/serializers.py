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
        fields = ['id', 'student', 'teacher', 'class_instance', 'date_time_client', 'date_time_db', 'status']

    def create(self, validated_data):
        student = Student.objects.get(id=validated_data['student']['id'])
        teacher = Teacher.objects.get(id=validated_data['teacher']['id'])
        class_instance = Class.objects.get(id=validated_data['class_instance']['id'])
        date_time_client = validated_data['date_time_client']

        attendance = Attendance.objects.create(
            student=student,
            teacher=teacher,
            class_instance=class_instance,
            date_time_client=date_time_client
        )

        return attendance

class AttendanceCreateSerializer(serializers.ModelSerializer):
    student_admn_number = serializers.IntegerField()
    teacher_id = serializers.IntegerField()
    class_instance_id = serializers.IntegerField()
    status = serializers.CharField(max_length=10)
    date_time_client = serializers.DateTimeField(default_timezone='Asia/Kolkata')

    class Meta:
        model = Attendance
        fields = ['id', 'student_admn_number', 'teacher_id', 'class_instance_id', 'date_time_client', 'status']

    def create(self, validated_data):
        student = Student.objects.get(admn_number=validated_data['student_admn_number'])
        teacher = Teacher.objects.get(id=validated_data['teacher_id'])
        class_instance = Class.objects.get(id=validated_data['class_instance_id'])
        date_time_client = validated_data['date_time_client']
        status = validated_data['status']

        attendance = Attendance.objects.create(
            student=student,
            teacher=teacher,
            class_instance=class_instance,
            date_time_client=date_time_client,
            status=status
        )

        return attendance