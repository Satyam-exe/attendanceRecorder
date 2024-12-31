from django.contrib import admin

from attendance.models import Attendance


# Register your models here.

@admin.register(Attendance)
class AttendanceAdmin(admin.ModelAdmin):
    pass