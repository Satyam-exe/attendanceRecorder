from django.db import models

from classes.models import Class
from users.models import Student, Teacher


class Attendance(models.Model):
    student = models.ForeignKey(
        Student,  # Reference to Student model
        on_delete=models.CASCADE,
        related_name='attendance_records'
    )
    teacher = models.ForeignKey(
        Teacher,  # Reference to Teacher model
        on_delete=models.CASCADE,
        related_name='attendance_records'
    )
    class_instance = models.ForeignKey(
        Class,  # Reference to Class model
        on_delete=models.CASCADE,
        related_name='attendance_records'
    )
    date_time = models.DateTimeField(auto_now_add=True)
    status = models.CharField(
        max_length=10,
        choices=[('present', 'Present'), ('absent', 'Absent'), ('late', 'Late')]
    )

    class Meta:
        unique_together = ('student', 'class_instance', 'date_time')  # Prevent duplicate entries
        indexes = [
            models.Index(fields=['student', 'date_time']),
            models.Index(fields=['class_instance', 'date_time']),
        ]
        verbose_name_plural = 'Attendance'

    def __str__(self):
        return f"{self.student.user.full_name} - {self.status} ({self.date_time})"
