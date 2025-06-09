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
from django.contrib.auth import views as auth_views
from django.urls import path , include
from . import views
from .views import login_view
from .views import adminview



urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/',views.home),
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
    path('password_reset/', auth_views.PasswordResetView.as_view(template_name='password_reset.html'), name='password_reset'),
    path('password_reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='password_reset_done.html'), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='password_reset_confirm.html'), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(template_name='password_reset_complete.html'), name='password_reset_complete'),
]
