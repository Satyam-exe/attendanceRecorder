from rest_framework.routers import DefaultRouter

from users.views import UserViewSet, TeacherViewSet, StudentViewSet

router = DefaultRouter()
router.register('users', UserViewSet)
router.register(r'students', StudentViewSet)
router.register(r'teachers', TeacherViewSet)


urlpatterns = router.urls