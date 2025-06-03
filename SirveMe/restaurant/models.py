from django.db import models
from datetime import datetime

class Bebestibles(models.Model):  
    nombre = models.CharField(max_length=100)
    cantidad = models.IntegerField(null = True)
    precio = models.IntegerField(null = True)
    tipoBebestible = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre

class Postre(models.Model): 
    nombre = models.CharField(max_length=100)
    cantidad = models.IntegerField(null = True)


    def __str__(self):
        return self.nombre

class PlatoDeFondo(models.Model):  
    nombre = models.CharField(max_length=100)
    cantidad = models.IntegerField(null = True)


    def __str__(self):
        return self.nombre
    
class AgregadoSalsa(models.Model):  
    nombre = models.CharField(max_length=100)
    cantidad = models.IntegerField(null = True)
    def __str__(self):
        return self.nombre

class Entrada(models.Model):  
    nombre = models.CharField(max_length=100)
    cantidad = models.IntegerField(null = True)

    def __str__(self):
        return self.nombre
    
class Mesas(models.Model):
    idMesas = models.AutoField(primary_key=True)
    numeroMesa = models.IntegerField(null=True)
    estado = models.BooleanField()
    def __str__(self):
        return f"Mesa {self.numeroMesa}"

class Productos(models.Model):
    idProductos = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=100)
    agregados = models.CharField(max_length=100)
    tipoProducto = models.CharField(max_length=100)
    cantidad = models.IntegerField()

    def __str__(self):
        return self.nombre


class Pedidos(models.Model): 
    fk_mesa = models.ForeignKey('restaurant.Mesas', on_delete=models.CASCADE, null=True)
    fecha = models.DateTimeField(auto_now_add=True) 
    cantidad_menus = models.PositiveIntegerField(default=0)
    valor = models.IntegerField(null=True, blank=True)  
    valor_semana = models.IntegerField(default=12990)    
    valor_finsemana = models.IntegerField(default=15990)
    valor_total = models.IntegerField(default=0)
    estado = models.CharField(max_length=45)
    mesero = models.ForeignKey('users.CustomUser', on_delete=models.CASCADE)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)  
        if self.pk: 
            self.valor_total = self.calcular_total()
            super().save(update_fields=['valor_total'])

        
    def es_fin_de_semana(self):
        fecha = self.fecha or datetime.now()
        return fecha.weekday() in [5, 6]

    def calcular_total(self):
        precio_menu = self.valor_finsemana if self.es_fin_de_semana() else self.valor_semana
        total = self.cantidad_menus * precio_menu

        for detalle in self.detalles.all():
            if detalle.bebestible and detalle.bebestible.precio:
                total += detalle.bebestible.precio * detalle.cantidad

        return total

    def __str__(self):
        return f"Orden para mesa {self.fk_mesa.numeroMesa} - Estado: {self.estado}"

class DetallePedido(models.Model):
    pedido = models.ForeignKey(Pedidos, related_name='detalles', on_delete=models.CASCADE)
    entrada = models.ForeignKey(Entrada, null=True, blank=True, on_delete=models.SET_NULL)
    platoDeFondo = models.ForeignKey(PlatoDeFondo, null=True, blank=True, on_delete=models.SET_NULL)
    agregadoSalsa = models.ForeignKey(AgregadoSalsa, null=True, blank=True, on_delete=models.SET_NULL)
    postre = models.ForeignKey(Postre, null=True, blank=True, on_delete=models.SET_NULL)
    bebestible = models.ForeignKey(Bebestibles, null=True, blank=True, on_delete=models.SET_NULL)
    cantidad = models.PositiveIntegerField()
    tipo = models.CharField(max_length=20 , null = True , blank = True)  #Posiblemente haya que eliminar esta variable

    def __str__(self):
        return f"{self.producto} x{self.cantidad}"

class Inventario(models.Model):
    nombreProducto = models.CharField(max_length=100)
    marca = models.CharField(max_length=100)
    proovedor = models.CharField(max_length=100)
    cantidad = models.IntegerField()
    precio = models.IntegerField()
    valorPorPorcion = models.IntegerField()
    def __str__(self):
        return f"{self.nombreProducto} - Cantidad: {self.cantidad}"