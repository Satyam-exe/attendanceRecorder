# Generated by Django 5.1.4 on 2024-12-29 20:02

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('attendance', '0002_initial'),
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='attendance',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='attendance_records', to='users.student'),
        ),
        migrations.AddField(
            model_name='attendance',
            name='teacher',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='attendance_records', to='users.teacher'),
        ),
        migrations.AddIndex(
            model_name='attendance',
            index=models.Index(fields=['student', 'date'], name='attendance__student_76a8d7_idx'),
        ),
        migrations.AddIndex(
            model_name='attendance',
            index=models.Index(fields=['class_instance', 'date'], name='attendance__class_i_d3aaa7_idx'),
        ),
        migrations.AlterUniqueTogether(
            name='attendance',
            unique_together={('student', 'class_instance', 'date', 'time')},
        ),
    ]