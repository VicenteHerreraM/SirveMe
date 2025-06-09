from django.conf import settings
from django.conf.urls.static import static
from django.urls import path , include
from . import views
from django.urls import path, include
from .views import inventario_list, inventario_create, inventario_update, inventario_delete

urlpatterns = [
    path('inventario/', views.inventario_list, name='inventario_list'),
    path('inventario/nuevo/', views.inventario_create, name='inventario_create'),
    path('reservas/', views.reservas, name='reservas'),
    path('inventario/editar/<int:pk>/', views.inventario_update, name='inventario_update'),
    path('inventario/eliminar/<int:pk>/', views.inventario_delete, name='inventario_delete'),
    path('entradas/', views.entrada_list, name='entrada_list'),
    path('entradas/nueva/', views.entrada_create, name='entrada_create'),
    path('entradas/editar/<int:pk>/', views.entrada_update, name='entrada_update'),
    path('entradas/eliminar/<int:pk>/', views.entrada_delete, name='entrada_delete'),
    path('platodefondo/', views.platodefondo_list, name='fondo_list'),
    path('platodefondo/nueva/', views.platodefondo_create, name='fondo_create'),
    path('platodefondo/editar/<int:pk>/', views.platodefondo_update, name='fondo_update'),
    path('platodefondo/eliminar/<int:pk>/', views.platodefondo_delete, name='fondo_delete'),
    path('postres/', views.postre_list, name='postre_list'),
    path('postres/nueva/', views.postre_create, name='postre_create'),
    path('postres/editar/<int:pk>/', views.postre_update, name='postre_update'),
    path('postres/eliminar/<int:pk>/', views.postre_delete, name='postre_delete'),
    path('crear_pedido/', views.crear_pedido, name='crear_pedido'),
    path('KDS/',views.kds , name = 'kds'),   
    path('pedido_listo/<int:pedido_id>/', views.pedido_listo, name='pedido_listo'),
    path('visor-mesas/', views.visor_mesas, name='visor_mesas'),
    path('store/',views.store , name = 'store'),
    path('producto/<str:tipo>/<int:pk>/', views.producto_detalle, name='producto_detalle'),
    path('agregar_al_carro/<str:tipo>/<int:pk>/', views.agregar_al_carro, name='agregar_al_carro'),
    path('carro/', views.ver_carro, name='ver_carro'),
    path('carro/actualizar/<int:idx>/', views.actualizar_carro, name='actualizar_carro'),
    path('carro/eliminar/<int:idx>/', views.eliminar_del_carro, name='eliminar_del_carro'),
    path('checkout/', views.checkout, name='checkout'),
    path('atencion-mesas/', views.atencion_mesas, name='atencion_mesas'),
    path('finalizar-mesa/<int:mesa_id>/', views.finalizar_mesa, name='finalizar_mesa'),
    path('productos_vendidos/', views.productos_vendidos, name='productos_vendidos'),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)