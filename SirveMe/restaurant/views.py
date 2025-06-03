from django.shortcuts import render, get_object_or_404, redirect
from django.views.decorators.http import require_POST
from django.forms import modelformset_factory
from .models import Inventario, Entrada, PlatoDeFondo, Pedidos, DetallePedido, Mesas , AgregadoSalsa , Postre , Bebestibles
from .forms import EntradaForm, PlatoDeFondoForm, PostreForm, InventarioForm , PedidoForm, DetallePedidoForm
from .decorators import role_required


def inventario_list(request):
    inventarios = Inventario.objects.all()
    return render(request, 'inventario_list.html', {'inventarios': inventarios})

def inventario_create(request):
    if request.method == 'POST':
        form = InventarioForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('inventario_list')
    else:
        form = InventarioForm()
    return render(request, 'inventario_form.html', {'form': form})

def inventario_update(request, pk):
    inventario = get_object_or_404(Inventario, pk=pk)
    if request.method == 'POST':
        form = InventarioForm(request.POST, instance=inventario)
        if form.is_valid():
            form.save()
            return redirect('inventario_list')
    else:
        form = InventarioForm(instance=inventario)
    return render(request, 'inventario_form.html', {'form': form})

def inventario_delete(request, pk):
    inventario = get_object_or_404(Inventario, pk=pk)
    if request.method == 'POST':
        inventario.delete()
        return redirect('inventario_list')
    return render(request, 'inventario_confirm_delete.html', {'inventario': inventario})



def entrada_list(request):
    entradas = Entrada.objects.all()
    return render(request, 'entrada_list.html', {'entradas': entradas})

def entrada_create(request):
    if request.method == 'POST':
        form = EntradaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('entrada_list')
    else:
        form = EntradaForm()
    return render(request, 'entrada_form.html', {'form': form})

def entrada_update(request, pk):
    entrada = get_object_or_404(Entrada, pk=pk)
    if request.method == 'POST':
        form = EntradaForm(request.POST, instance=entrada)
        if form.is_valid():
            form.save()
            return redirect('entrada_list')
    else:
        form = EntradaForm(instance=entrada)
    return render(request, 'entrada_form.html', {'form': form})

def entrada_delete(request, pk):
    entrada = get_object_or_404(Entrada, pk=pk)
    if request.method == 'POST':
        entrada.delete()
        return redirect('entrada_list')
    return render(request, 'entrada_delete.html', {'entrada': entrada})

def platodefondo_list(request):
    fondo = PlatoDeFondo.objects.all()
    return render(request, 'fondo_list.html', {'fondos': fondo})

def platodefondo_create(request):
    if request.method == 'POST':
        form = PlatoDeFondoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('fondo_list')
    else:
        form = PlatoDeFondoForm()
    return render(request, 'fondo_form.html', {'form': form})

def platodefondo_update(request, pk):
    fondo = get_object_or_404(PlatoDeFondo, pk=pk)
    if request.method == 'POST':
        form = PlatoDeFondoForm(request.POST, instance=fondo)
        if form.is_valid():
            form.save()
            return redirect('fondo_list')
    else:
        form = PlatoDeFondoForm(instance=fondo)
    return render(request, 'fondo_form.html', {'form': form})

def platodefondo_delete(request, pk):
    fondo = get_object_or_404(PlatoDeFondo, pk=pk)
    if request.method == 'POST':
        fondo.delete()
        return redirect('fondo_list')
    return render(request, 'fondo_delete.html', {'fondos': fondo})

def postre_list(request):
    postre = Postre.objects.all()
    return render(request, 'postre_list.html', {'postres': postre})

def postre_create(request):
    if request.method == 'POST':
        form = PostreForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('postre_list')
    else:
        form = PostreForm()
    return render(request, 'postre_form.html', {'form': form})

def postre_update(request, pk):
    postre = get_object_or_404(Postre, pk=pk)
    if request.method == 'POST':
        form = PostreForm(request.POST, instance=postre)
        if form.is_valid():
            form.save()
            return redirect('postre_list')
    else:
        form = PostreForm(instance=postre)
    return render(request, 'postre_form.html', {'form': form})

def postre_delete(request, pk):
    postre = get_object_or_404(Postre, pk=pk)
    if request.method == 'POST':
        postre.delete()
        return redirect('postre_list')
    return render(request, 'postre_delete.html', {'postres': postre})


def crear_pedido(request):
    DetallePedidoFormSet = modelformset_factory(DetallePedido, form=DetallePedidoForm, extra=1, can_delete=True)
    mesa_id = request.GET.get('mesa_id')
    if mesa_id:
        try:
            mesa_id = int(mesa_id)
        except ValueError:
            mesa_id = None
    if request.method == 'POST':
        pedido_form = PedidoForm(request.POST)
        formset = DetallePedidoFormSet(request.POST, queryset=DetallePedido.objects.none())
        if pedido_form.is_valid() and formset.is_valid():
            pedido = pedido_form.save(commit=False)
            pedido.mesero = request.user
            pedido.estado = 'pendiente'
            # La cantidad de menús puede ser la suma de las cantidades de los detalles
            pedido.cantidad_menus = sum([
                form.cleaned_data['cantidad']
                for form in formset
                if form.cleaned_data.get('cantidad')
            ])
            pedido.save()  # Guarda el pedido para obtener un ID

            # Marcar la mesa como ocupada
            mesa = pedido.fk_mesa
            mesa.estado = False
            mesa.save()

            # Guardar los detalles del pedido
            for form in formset:
                detalle = form.save(commit=False)
                if detalle.cantidad and (detalle.entrada or detalle.platoDeFondo or detalle.postre or detalle.bebestible):
                    detalle.pedido = pedido
                    detalle.save()

            # Ahora que existen los detalles, recalcula y guarda el total
            pedido.valor_total = pedido.calcular_total()
            pedido.save(update_fields=['valor_total'])

            return redirect('kds')
    else:
        initial_data = {'fk_mesa': mesa_id} if mesa_id else None
        pedido_form = PedidoForm(initial=initial_data)
        formset = DetallePedidoFormSet(queryset=DetallePedido.objects.none())
    return render(request, 'crear_pedido.html', {
        'pedido_form': pedido_form,
        'formset': formset
    })
@role_required(['cocinero'])
def kds(request):
    pedidos = Pedidos.objects.filter(estado='pendiente').prefetch_related('detalles')
    return render(request, 'KDS.html', {'pedidos': pedidos})
@require_POST
def pedido_listo(request, pedido_id):
    pedido = get_object_or_404(Pedidos, id=pedido_id)
    for detalle in pedido.detalles.all():
        if detalle.entrada:
            detalle.entrada.cantidad -= detalle.cantidad
            detalle.entrada.save()
        if detalle.platoDeFondo:
            detalle.platoDeFondo.cantidad -= detalle.cantidad
            detalle.platoDeFondo.save()
        if detalle.agregadoSalsa:
            detalle.agregadoSalsa.cantidad -= detalle.cantidad
            detalle.agregadoSalsa.save()
        if detalle.postre:
            detalle.postre.cantidad -= detalle.cantidad
            detalle.postre.save()
        if detalle.bebestible:
            detalle.bebestible.cantidad -= detalle.cantidad
            detalle.bebestible.save()
    pedido.estado = 'listo'
    pedido.save()
    return redirect('kds')


def visor_mesas(request):
    mesas = Mesas.objects.all()
    return render(request, 'selectTable.html', {'mesas': mesas})