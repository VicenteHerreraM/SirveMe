from django.db import models

class Reservas(models.Model):
    nombre = models.CharField(max_length=60)
    apellido = models.CharField(max_length=60)
    cantidadPersonas = models.IntegerField()
    fecha= models.DateField()

    def __str__(self):
        return f"Reservation for {self.nombre} {self.apellido}"

class Mesas(models.Model):
    mesa = models.IntegerField(primary_key=True)
    estado = models.CharField(max_length=20)

    def __str__(self):
        return f"Table {self.mesa}"

class Productos(models.Model):  
    nombre = models.CharField(max_length=45)
    descripcion = models.CharField(max_length=45)
    agregados = models.CharField(max_length=45)  
    tipoProducto = models.CharField(max_length=45)
    cantidad = models.IntegerField()

    def __str__(self):
        return self.name

class Pedidos(models.Model): 
    fk_table = models.ForeignKey(Mesas, on_delete=models.CASCADE)
    fecha = models.DateTimeField() 
    valor = models.IntegerField()  
    estado = models.CharField(max_length=45)
    fk_menuPedidos = models.ManyToManyField(Productos, through='DetallePedido')  
    #mesero = models.ForeignKey('accounts.Trabajador', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return f"Order for Table {self.table.table_number}"

class DetallePedido(models.Model): 
    fk_pedido = models.ForeignKey(Pedidos, on_delete=models.CASCADE)
    fk_producto = models.ForeignKey(Productos, on_delete=models.CASCADE)
    cantidad = models.IntegerField(default=1) 

    def __str__(self):
        return f"{self.cantidad} x {self.fk_producto.name} in Order {self.fk_pedido.id}"

class Bebestibles(models.Model):  
    nombre = models.CharField(max_length=100)
    tipoBebestible = models.CharField(max_length=45)

    def __str__(self):
        return self.name

class Postre(models.Model): 
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class PlatoDeFondo(models.Model):  
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Entrada(models.Model):  
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class KDS(models.Model): 
    fk_pedido = models.ForeignKey(Pedidos, on_delete=models.CASCADE)

    def __str__(self):
        return f"KDS for Order {self.order.id}"
    
class PedidosMesero(models.Model):
    idPedidosMesero = models.IntegerField(primary_key=True)
    Pedidos_IdPedido = models.ForeignKey(Pedidos, on_delete=models.CASCADE)

    def __str__(self):
        return f"Pedido Mesero {self.idPedidosMesero}"