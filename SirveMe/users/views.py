from django.shortcuts import render, get_object_or_404, redirect
from .models import CustomUser, Mesas
from .forms import CustomUserForm,  ClienteRegistroForm

def usuarios_list(request):
    usuarios = CustomUser.objects.all()
    return render(request, 'usuarios_list.html', {'usuarios': usuarios})

def usuario_create(request):
    if request.method == 'POST':
        form = CustomUserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('usuarios_list')
    else:
        form = CustomUserForm()
    return render(request, 'usuario_form.html', {'form': form})

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

def usuario_delete(request, pk):
    usuario = get_object_or_404(CustomUser, pk=pk)
    if request.method == 'POST':
        usuario.delete()
        return redirect('usuarios_list')
    return render(request, 'usuario_confirm_delete.html', {'usuario': usuario})

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