from django.contrib import admin
from .models import User, Student, Teacher
from .forms import StudentAdminForm, TeacherAdminForm

class StudentAdmin(admin.ModelAdmin):
    form = StudentAdminForm
    list_display = ("user", "admn_number", "enrolled_class")
    search_fields = ("user__full_name", "admn_number")

admin.site.register(Student, StudentAdmin)

class TeacherAdmin(admin.ModelAdmin):
    form = TeacherAdminForm
    list_display = ("user", "subject", "user__email")
    search_fields = ("user__full_name", "subject")

admin.site.register(Teacher, TeacherAdmin)
