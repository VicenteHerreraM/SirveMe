from django.contrib import admin
from .models import Bebestibles, Entrada, PlatoDeFondo, Postre, Productos, Pedidos, Mesas, Inventario, AgregadoSalsa


admin.site.register(Entrada)
admin.site.register(PlatoDeFondo)
admin.site.register(Postre)
admin.site.register(Bebestibles)
admin.site.register(Productos)
admin.site.register(Pedidos)
admin.site.register(Mesas)
admin.site.register(Inventario)
admin.site.register(AgregadoSalsa)
