# Generated by Django 5.1.4 on 2024-12-29 20:02

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('attendance', '0001_initial'),
        ('classes', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='attendance',
            name='class_instance',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='attendance_records', to='classes.class'),
        ),
    ]
