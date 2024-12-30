from rest_framework.routers import DefaultRouter
from classes.views import ClassViewSet

router = DefaultRouter()
router.register(r'classes', ClassViewSet)

urlpatterns = router.urls