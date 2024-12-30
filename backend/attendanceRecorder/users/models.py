from django.contrib.auth.models import AbstractUser
from django.db import models

from classes.models import Class


# Create your models here.
# User model to handle authentication and roles
from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    ROLE_CHOICES = [
        ('teacher', 'Teacher'),
        ('admin', 'Admin'),
        ('student', 'Student'),
    ]
    role = models.CharField(max_length=10, choices=ROLE_CHOICES)
    email = models.EmailField(unique=True)  # Ensure email is unique
    phone_number = models.CharField(max_length=10, blank=True, null=True)  # Optional field
    full_name = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.full_name} ({self.get_role_display()})"

class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="student")
    admn_number = models.CharField(max_length=20, unique=True, null=False, blank=False)
    enrolled_class = models.ForeignKey(
        'classes.Class',  # Use string reference to avoid circular import
        on_delete=models.RESTRICT,
        related_name="enrolled_class",
        null=False,
        blank=False
    )
    def __str__(self):
        return f"Student: {self.user.full_name} ({self.admn_number})"

class Teacher(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="teacher")
    subject = models.CharField(max_length=100, null=False, blank=False)

    def __str__(self):
        return f"Teacher: {self.user.full_name} ({self.subject})"