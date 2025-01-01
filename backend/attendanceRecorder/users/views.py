from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.views import APIView

from users.models import Student, Teacher, User, LoginTracker
from users.serializers import StudentSerializer, TeacherSerializer, UserSerializer, LoginSerializer, LogoutSerializer


class StudentViewSet(viewsets.ModelViewSet):
    serializer_class = StudentSerializer
    lookup_field = 'admn_number'

    def get_queryset(self):
        queryset = Student.objects.all()
        admn_number = self.request.query_params.get('admn_number')
        user_id = self.request.query_params.get('id')
        if admn_number is not None:
            queryset = queryset.filter(admn_number=admn_number)
        if user_id is not None:
            queryset = queryset.filter(user__id=user_id)
        return queryset

    def post(self, request, *args, **kwargs):
        serializer = StudentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class TeacherViewSet(viewsets.ModelViewSet):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer
    def post(self, request, *args, **kwargs):
        serializer = TeacherSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    def post(self, request, *args, **kwargs):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class UserLoginView(APIView):
    serializer_class = LoginSerializer
    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        email = serializer.validated_data['email']
        password = serializer.validated_data['password']
        ip_address = serializer.validated_data['ip_address']
        try:
            user = User.objects.get(email=email)
            if not user.check_password(password):
                return Response({'error': 'Invalid password'}, status=status.HTTP_401_UNAUTHORIZED)
            if user.role == 'student':
                student = Student.objects.get(user=user)
                student_serializer = StudentSerializer(student)
                LoginTracker.objects.create(user=user, action='login', ip_address=ip_address)
                return Response(student_serializer.data, status=status.HTTP_200_OK)
            if user.role == 'teacher':
                teacher = Teacher.objects.get(user=user)
                teacher_serializer = TeacherSerializer(teacher)
                return Response(teacher_serializer.data, status=status.HTTP_200_OK)
            if user.role == 'admin':
                admin_serializer = UserSerializer(user)
                return Response(admin_serializer.data, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response({'error': 'User does not exist'}, status=status.HTTP_404_NOT_FOUND)

class UserLogoutView(APIView):
    serializer_class = LogoutSerializer
    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user_id = serializer.validated_data['user_id']
        ip_address = serializer.validated_data['ip_address']
        try:
            user = User.objects.get(id=user_id)
            LoginTracker.objects.create(user=user, action='logout', ip_address=ip_address)
            return Response({'success': 'User logged out successfully'}, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response({'error': 'User does not exist'}, status=status.HTTP_404_NOT_FOUND)