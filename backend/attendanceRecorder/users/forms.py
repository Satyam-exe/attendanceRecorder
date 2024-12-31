import uuid

from django import forms
from .models import User, Student, Teacher

class TeacherAdminForm(forms.ModelForm):
    email = forms.EmailField(required=True, label="User Email")
    full_name = forms.CharField(required=True, label="Full Name")
    phone_number = forms.CharField(required=False, label="Phone Number")
    password = forms.CharField(required=True, label="Password")

    class Meta:
        model = Teacher
        fields = ("subject",)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # If the instance exists (updating existing teacher)
        if self.instance and self.instance.pk:
            # Populate disabled fields with their current values
            self.fields["email"].initial = self.instance.user.email
            self.fields["full_name"].initial = self.instance.user.full_name
            self.fields["phone_number"].initial = self.instance.user.phone_number

            # Disable the fields to prevent editing
            self.fields["email"].disabled = True
            self.fields["full_name"].disabled = True

    def save(self, commit=True):
        instance = super().save(commit=False)

        if not instance.user_id:  # New teacher creation
            user = User.objects.create(
                username=uuid.uuid4().hex,
                email=self.cleaned_data["email"],
                full_name=self.cleaned_data["full_name"],
                phone_number=self.cleaned_data.get("phone_number", ""),
                role="teacher",
            )
            user.set_password(self.cleaned_data["password"])
            user.save()
            instance.user = user
        else:  # Updating existing teacher (only update password)
            if self.cleaned_data["password"]:
                instance.user.set_password(self.cleaned_data["password"])
            instance.user.phone_number = self.cleaned_data.get("phone_number", "")
            instance.user.save()

        if commit:
            instance.save()
        return instance



class StudentAdminForm(forms.ModelForm):
    email = forms.EmailField(required=True, label="User Email")
    full_name = forms.CharField(required=True, label="Full Name")
    phone_number = forms.CharField(required=False, label="Phone Number")
    password = forms.CharField(required=True, label="Password")

    class Meta:
        model = Student
        fields = ("admn_number", "enrolled_class")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # If the instance exists (updating existing student)
        if self.instance and self.instance.pk:
            # Populate disabled fields with their current values
            self.fields["email"].initial = self.instance.user.email
            self.fields["full_name"].initial = self.instance.user.full_name
            self.fields["phone_number"].initial = self.instance.user.phone_number

            # Disable the fields to prevent editing
            self.fields["email"].disabled = True
            self.fields["full_name"].disabled = True

    def save(self, commit=True):
        instance = super().save(commit=False)

        if not instance.user_id:  # New student creation
            user = User.objects.create(
                username=uuid.uuid4().hex,
                email=self.cleaned_data["email"],
                full_name=self.cleaned_data["full_name"],
                phone_number=self.cleaned_data.get("phone_number", ""),
                role="student",
            )
            user.set_password(self.cleaned_data["password"])
            user.save()
            instance.user = user
        else:  # Updating existing student (only update password)
            if self.cleaned_data["password"]:
                instance.user.set_password(self.cleaned_data["password"])
            instance.user.phone_number = self.cleaned_data.get("phone_number", "")
            instance.user.save()

        if commit:
            instance.save()
        return instance
