# Generated by Django 4.2.21 on 2025-06-03 01:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurant', '0008_agregadosalsa'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='agregadosalsa',
            name='tipo',
        ),
    ]
