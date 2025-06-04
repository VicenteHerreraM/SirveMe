from django.http import HttpResponse
from django.shortcuts import render, redirect
from TableSelect.models import Mesa
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from .decorators import role_required

def logout_view(request):
    logout(request)
    return redirect('login')  
def home(request):
    return render(request,'home.html')

def denied(request):
    return render(request,'denied.html')

def reservas(request):
    return render(request, 'reservas.html')

def product(request):
    return render(request,'product.html')


def login_view(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        user = authenticate(request, email=email, password=password)
        if user is not None:
            login(request, user)
            if user.is_superuser:
                return redirect('admin_dashboard')
            elif hasattr(user, 'rol'):
                if user.rol == 'mesero':
                    return redirect('homeWaiter')
                elif user.rol == 'cocinero':
                    return redirect('kds')
                elif user.rol == 'cliente':
                    return redirect('store')
            return redirect('home')
        else:
            return render(request, 'login.html', {'error': 'Usuario o contraseña incorrectos'})
    return render(request, 'login.html')



def select_table(request):
    mesas = Mesa.objects.all()  # Obtiene todas las mesas de la base de datos
    return render(request, 'selectTable.html', {'mesas': mesas})


@role_required(['mesero'])
def homeWaiter(request):
    return render(request, 'homeWaiter.html')

@role_required(['cocinero'])
def kds(request):
    return render(request, 'KDS.html')

@role_required(['admin'])
def adminview(request):
    return render(request, 'adminview.html')
