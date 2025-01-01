from rest_framework.routers import DefaultRouter

from attendance.views import AttendanceViewSet, AttendanceCreateViewSet

router = DefaultRouter()
router.register(r'attendance', AttendanceViewSet, basename='attendance')
router.register(r'add', AttendanceCreateViewSet, basename='add_attendance')

urlpatterns = router.urls