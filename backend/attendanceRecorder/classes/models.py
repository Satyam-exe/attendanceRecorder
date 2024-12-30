from django.db import models
from roman import toRoman


class Class(models.Model):
    grade = models.IntegerField()  # Grade like 1, 2, 3, etc.
    section = models.CharField(max_length=1)  # Single character section, e.g., 'A', 'B'
    class_teacher = models.ForeignKey(
        'users.Teacher',  # Use string reference to avoid circular import
        on_delete=models.SET_NULL,
        null=True,
        related_name='class_teacher_for'
    )
    subject_teachers = models.ManyToManyField(
        'users.Teacher',  # Use string reference to avoid circular import
        related_name='subject_classes'
    )

    def __str__(self):
        return f"{toRoman(self.grade)}-{self.section}"
