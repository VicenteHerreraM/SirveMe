# Generated by Django 4.2.21 on 2025-06-03 01:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurant', '0007_alter_pedidos_valor'),
    ]

    operations = [
        migrations.CreateModel(
            name='AgregadoSalsa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('tipo', models.CharField(max_length=100)),
                ('cantidad', models.IntegerField(null=True)),
            ],
        ),
    ]
