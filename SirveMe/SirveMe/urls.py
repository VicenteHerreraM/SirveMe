"""
URL configuration for SirveMe project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path , include
from . import views
from .views import login_view
from .views import adminview



urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/',views.home),
    path('reservas/',views.reservas),
    path('product/',views.product),
    path('login/', login_view, name='login'),
    path('homeWaiter/',views.homeWaiter , name = 'homeWaiter'),
    path('selectTable/',views.select_table , name= 'select_table'),
    path('admin-dashboard/', adminview, name='admin_dashboard'),
    path('', include('restaurant.urls')),
    path('', include('users.urls')),
    path('login/', login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('denied/', views.denied, name='denied'),

]
