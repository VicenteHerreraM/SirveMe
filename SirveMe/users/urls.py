from django.urls import path
from . import views

urlpatterns = [
    path('usuarios/', views.usuarios_list, name='usuarios_list'),
    path('usuarios/nuevo/', views.usuario_create, name='usuario_create'),
    path('usuarios/editar/<int:pk>/', views.usuario_update, name='usuario_update'),
    path('usuarios/eliminar/<int:pk>/', views.usuario_delete, name='usuario_delete'),
    path('registrate/', views.registrate, name='registrate'),
]