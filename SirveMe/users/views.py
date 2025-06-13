from django.db.models import Q
from django.shortcuts import render, get_object_or_404, redirect
from .models import CustomUser, Mesas
from .forms import CustomUserForm,  ClienteRegistroForm

#Obtiene los usuarios que estan inscritos en la base de datos
def usuarios_list(request):
    query = request.GET.get('q', '')
    #Esta funcion permite buscar usuarios por email, rut, rol, direccion, comuna o ciudad
    if query:
        usuarios = CustomUser.objects.filter(
            Q(email__icontains=query) |
            Q(rut__icontains=query) |
            Q(rol__icontains=query) |
            Q(direccion__icontains=query) |
            Q(comuna__icontains=query) |
            Q(ciudad__icontains=query)
        )
    else:
        usuarios = CustomUser.objects.all()
    return render(request, 'usuarios_list.html', {'usuarios': usuarios})

#Permite crear 
def usuario_create(request):
    if request.method == 'POST':
        form = CustomUserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('usuarios_list')
    else:
        form = CustomUserForm()
    return render(request, 'usuario_form.html', {'form': form})#

#Permite actualizar datos de usuarios ya inscritos en la aplicacion
def usuario_update(request, pk):
    usuario = get_object_or_404(CustomUser, pk=pk)
    if request.method == 'POST':
        form = CustomUserForm(request.POST, instance=usuario)
        if form.is_valid():
            form.save()
            return redirect('usuarios_list')
    else:
        form = CustomUserForm(instance=usuario)
    return render(request, 'usuario_form.html', {'form': form})

#Elimina usuario de la base de datos
def usuario_delete(request, pk):
    usuario = get_object_or_404(CustomUser, pk=pk)
    if request.method == 'POST':
        usuario.delete()
        return redirect('usuarios_list')
    return render(request, 'usuario_confirm_delete.html', {'usuario': usuario})

#Permite registrar nuevos usuarios como clientes
def registrate(request):
    if request.method == 'POST':
        form = ClienteRegistroForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.rol = 'cliente' 
            user.save()
            return redirect('login')
    else:
        form = ClienteRegistroForm()
    return render(request, 'Registrate.html', {'form': form})

def reservas(request):
    mesas = Mesas.objects.all()  
    for mesa in mesas:
        mesa.disponible = mesa.estado  
    return render(request, 'reservas.html', {'mesas': mesas})