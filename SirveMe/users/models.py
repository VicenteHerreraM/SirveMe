from django.db import models
from django.contrib.auth.models import User
from restaurant.models import Mesas, Productos, Pedidos
from django.contrib.auth.models import AbstractUser , BaseUserManager
from django.conf import settings
from django import forms

class Clientes(models.Model):
    idCliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    correo = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    telefono = models.CharField(max_length=12)
    region = models.CharField(max_length=100 , null=True, blank=True)
    comuna = models.CharField(max_length=100, null=True, blank=True)
    ciudad = models.CharField(max_length=100, null=True, blank=True)

    def __str__(self):
        
        return self.nombre

class CustomUserManager(BaseUserManager):
    use_in_migrations = True

    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('El email es obligatorio')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, password, **extra_fields)


class CustomUser(AbstractUser):
    username = models.CharField(max_length=150, unique=False, blank=True, null=True)
    email = models.EmailField('correo electrónico', unique=True)
    rut = models.CharField(max_length=12, unique=True , null=True, blank=True)
    ROL_CHOICES = [
        ('cocinero', 'Cocinero'),
        ('mesero', 'Mesero'),
        ('admin', 'Administrador'),
        ('cliente', 'Cliente'),
    ]
    rol = models.CharField(max_length=20, choices=ROL_CHOICES, null=True, blank=True)
    direccion = models.CharField(max_length=255, blank=True, null=True)
    comuna = models.CharField(max_length=100, blank=True, null=True)
    ciudad = models.CharField(max_length=100, blank=True, null=True)
    objects = CustomUserManager() 
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def __str__(self):
        return f"{self.first_name} {self.last_name} ({self.rol}) "



class Reservas(models.Model):
    idReservas = models.AutoField(primary_key=True)
    fk_mesa = models.ForeignKey('restaurant.Mesas', on_delete=models.CASCADE)
    fk_cliente = models.ForeignKey('Clientes', on_delete=models.CASCADE)
    fecha = models.DateTimeField()
    hora = models.TimeField()
    cantidadPersonas = models.IntegerField()

    def __str__(self):
        return f"Reservation for {self.fk_cliente.nombre} on {self.fecha} at {self.hora}"



class Trabajadores(models.Model):
    idTrabajador = models.AutoField(primary_key=True)
    fk_mesa = models.ForeignKey(Mesas, on_delete=models.CASCADE, null=True, blank=True)
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    correo = models.EmailField()
    telefono = models.CharField(max_length=12)
    rol = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre
    
class Permisos(models.Model):
    idPermisos = models.AutoField(primary_key=True)
    fk_trabajador = models.ForeignKey(Trabajadores, on_delete=models.CASCADE)
    fk_mesa = models.ForeignKey(Mesas, on_delete=models.CASCADE)
    fk_mesero = models.ForeignKey(Trabajadores, on_delete=models.CASCADE, related_name='fk_meso')  
    fk_cocinero = models.ForeignKey(Trabajadores, on_delete=models.CASCADE, related_name='fk_cocinero')
    def __str__(self):
        return f"Permissions for {self.fk_trabajador.nombre} on Order"    




