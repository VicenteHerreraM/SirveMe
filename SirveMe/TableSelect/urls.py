from django.urls import path
from . import views
from django.contrib import admin
from django.urls import path, include


urlpatterns = [
    path('select-table/', views.select_table, name='select_table'),
    path('admin/', admin.site.urls),
    path('tables/', include('TableSelect.urls')),  # Incluye las URLs de TableSelect
]