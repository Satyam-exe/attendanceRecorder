from rest_framework import viewsets

from classes.models import Class
from classes.serializers import ClassSerializer


class ClassViewSet(viewsets.ModelViewSet):
    queryset = Class.objects.all()
    serializer_class = ClassSerializer

