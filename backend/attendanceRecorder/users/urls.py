from django.urls import path
from rest_framework.routers import DefaultRouter

from users.views import UserViewSet, TeacherViewSet, StudentViewSet, UserLoginView

router = DefaultRouter()
router.register(r'users', UserViewSet, basename='users')
router.register(r'students', StudentViewSet)
router.register(r'teachers', TeacherViewSet)

urlpatterns = router.urls

urlpatterns += [
    path('login/', UserLoginView.as_view(), name='login'),
]