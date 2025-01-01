from rest_framework import viewsets, status
from rest_framework.response import Response

from attendance.models import Attendance
from attendance.serializers import AttendanceSerializer, AttendanceCreateSerializer


class AttendanceViewSet(viewsets.ModelViewSet):
    queryset = Attendance.objects.all()
    serializer_class = AttendanceSerializer

    def post(self, request, *args, **kwargs):
        serializer = AttendanceSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class AttendanceCreateViewSet(viewsets.ModelViewSet):
    serializer_class = AttendanceCreateSerializer

    def create(self, request, *args, **kwargs):
        # Check if the request data is a list
        if isinstance(request.data, list):
            # Many=True to handle multiple objects
            serializer = AttendanceCreateSerializer(data=request.data, many=True)
        else:
            # For a single object
            serializer = AttendanceCreateSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)