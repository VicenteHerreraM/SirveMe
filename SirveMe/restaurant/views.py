from collections import defaultdict
from django.db.models import Q , Sum
from django.utils import timezone
from django.shortcuts import render, get_object_or_404, redirect
from django.views.decorators.http import require_POST
from django.forms import modelformset_factory
from .models import Inventario, Entrada, PlatoDeFondo, Pedidos, DetallePedido, Mesas , AgregadoSalsa , Postre , Bebestibles
from .models import Pedidos as Pedidos  
from .forms import EntradaForm, PlatoDeFondoForm, PostreForm, InventarioForm , PedidoForm, DetallePedidoForm , PedidoProductoForm, MetodoEntregaForm
from .decorators import role_required
from datetime import datetime, date , time
from users.models import CustomUser
from restaurant.models import Productos


@role_required(['mesero'])
def homeWaiter(request):
    return render(request, 'homeWaiter.html')

def reservas(request):
    mesas = Mesas.objects.all()
    if request.method == 'POST':
        pass
    return render(request, 'reservas.html', {'mesas': mesas})

def inventario_list(request):
    query = request.GET.get('q', '')
    if query:
        inventarios = Inventario.objects.filter(
            Q(nombre__icontains=query) |
            Q(descripcion__icontains=query)
        )
    else:
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
            pedido.save()  

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

            return redirect('homeWaiter')
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

def store(request):
    bebestibles = Bebestibles.objects.all()
    fondos = PlatoDeFondo.objects.all()
    return render(request, 'store.html', {
        'bebestibles': bebestibles,
        'fondos': fondos,
    })
    
def producto_detalle(request, tipo, pk):
    if tipo == "bebestible":
        producto = Bebestibles.objects.get(pk=pk)
    else:
        producto = PlatoDeFondo.objects.get(pk=pk)
    entradas = Entrada.objects.all()
    agregados = AgregadoSalsa.objects.all()
    hoy = datetime.now()
    es_fin_de_semana = hoy.weekday() in [5, 6]
    valor_semana = Pedidos._meta.get_field('valor_semana').default
    valor_finsemana = Pedidos._meta.get_field('valor_finsemana').default
    precio_menu = valor_finsemana if es_fin_de_semana else valor_semana

    return render(request, 'producto_detalle.html', {
        'producto': producto,
        'tipo': tipo,
        'entradas': entradas,
        'agregados': agregados,
        'precio_menu': precio_menu,
    })

def agregar_al_carro(request, tipo, pk):
    if request.method == 'POST':
        if tipo == "bebestible":
            producto = Bebestibles.objects.get(pk=pk)
        else:
            producto = PlatoDeFondo.objects.get(pk=pk)
        entrada_id = request.POST.get('entrada')
        agregado_id = request.POST.get('agregado')
        cantidad = int(request.POST.get('cantidad', 1))

        entrada_nombre = ""
        if entrada_id:
            from .models import Entrada
            entrada = Entrada.objects.filter(pk=entrada_id).first()
            entrada_nombre = entrada.nombre if entrada else ""
        agregado_nombre = ""
        if agregado_id:
            from .models import AgregadoSalsa
            agregado = AgregadoSalsa.objects.filter(pk=agregado_id).first()
            agregado_nombre = agregado.nombre if agregado else ""

        item = {
            'tipo': tipo,
            'producto_id': producto.id,
            'nombre': producto.nombre,
            'cantidad': cantidad,
            'entrada_id': entrada_id,
            'entrada_nombre': entrada_nombre,
            'agregado_id': agregado_id,
            'agregado_nombre': agregado_nombre,
            'imagen': producto.imagen.url if producto.imagen else '',
        }
        carro = request.session.get('carro', [])
        carro.append(item)
        request.session['carro'] = carro
        request.session.modified = True

        return redirect('ver_carro')
    return redirect('store')

def ver_carro(request):
    carro = request.session.get('carro', [])
    total = 0
    for item in carro:
        if item['tipo'] == 'bebestible':
            producto = Bebestibles.objects.filter(pk=item['producto_id']).first()
            precio = producto.precio if producto else 0
        else:
            hoy = datetime.now()
            es_fin_de_semana = hoy.weekday() in [5, 6]
            valor_semana = Pedidos._meta.get_field('valor_semana').default
            valor_finsemana = Pedidos._meta.get_field('valor_finsemana').default
            precio = valor_finsemana if es_fin_de_semana else valor_semana
        item['precio'] = precio
        item['subtotal'] = precio * int(item['cantidad'])
        total += item['subtotal']
    return render(request, 'carro.html', {'carro': carro, 'total': total})

def actualizar_carro(request, idx):
    if request.method == 'POST':
        carro = request.session.get('carro', [])
        nueva_cantidad = int(request.POST.get('cantidad', 1))
        if 0 <= idx < len(carro):
            carro[idx]['cantidad'] = nueva_cantidad
            request.session['carro'] = carro
            request.session.modified = True
    return redirect('ver_carro')

def eliminar_del_carro(request, idx):
    if request.method == 'POST':
        carro = request.session.get('carro', [])
        if 0 <= idx < len(carro):
            carro.pop(idx)
            request.session['carro'] = carro
            request.session.modified = True
    return redirect('ver_carro')

def checkout(request):
    usuario = None
    if request.user.is_authenticated:
        usuario = CustomUser.objects.filter(email=request.user.email).first()
    if request.method == 'POST':
        form = MetodoEntregaForm(request.POST)
        if form.is_valid():
            metodo = form.cleaned_data['metodo']
            if metodo == 'domicilio':
                return render(request, 'checkout_direccion.html', {'usuario': usuario})
            else:
                return render(request, 'checkout_confirmacion.html', {'metodo': 'retiro'})
    else:
        form = MetodoEntregaForm()
    return render(request, 'checkout_confirmacion.html', {'form': form, 'usuario': usuario})

def atencion_mesas(request):
    hoy = timezone.localdate()
    inicio = timezone.make_aware(datetime.combine(hoy, time.min))
    fin = timezone.make_aware(datetime.combine(hoy, time.max))
    mesas = Mesas.objects.all() 
    mesas_dict = {}
    for mesa in mesas:
        pedidos = mesa.pedidos_set.filter(estado='listo',fecha__range=(inicio, fin))
        detalles_agrupados = defaultdict(int)
        for pedido in pedidos:
            for detalle in pedido.detalles.all():
                if detalle.entrada:
                    nombre = detalle.entrada.nombre
                elif detalle.platoDeFondo:
                    nombre = detalle.platoDeFondo.nombre
                elif detalle.postre:
                    nombre = detalle.postre.nombre
                elif detalle.bebestible:
                    nombre = detalle.bebestible.nombre
                elif detalle.agregadoSalsa:
                    nombre = detalle.agregadoSalsa.nombre
                else:
                    continue
                detalles_agrupados[nombre] += detalle.cantidad
        mesas_dict[mesa] = {
            'pedidos': pedidos,
            'detalles_agrupados': detalles_agrupados,
        }
    pedidos_listos = Pedidos.objects.filter(
        estado='listo',
        fecha__range=(inicio, fin)
    ).select_related('fk_mesa')
    mesas = {}
    for pedido in pedidos_listos:
        mesa = pedido.fk_mesa
        if mesa not in mesas:
            mesas[mesa] = {'pedidos': [], 'total': 0}
        mesas[mesa]['pedidos'].append(pedido)
        mesas[mesa]['total'] += pedido.valor_total
    return render(request, 'atencion_mesas.html', {'mesas': mesas})

def finalizar_mesa(request, mesa_id):
    mesa = get_object_or_404(Mesas, idMesas=mesa_id)
    mesa.estado = True
    mesa.save()
    Pedidos.objects.filter(fk_mesa=mesa, estado='listo').update(estado='finalizado')
    return redirect('atencion_mesas')

from django.db.models import Sum
from .models import DetallePedido

def productos_vendidos(request):
    fecha_inicio = request.GET.get('fecha_inicio')
    fecha_fin = request.GET.get('fecha_fin')
    detalles = DetallePedido.objects.all()

    if fecha_inicio and fecha_fin:
        inicio = timezone.make_aware(datetime.combine(
            datetime.strptime(fecha_inicio, "%Y-%m-%d"), time.min))
        fin = timezone.make_aware(datetime.combine(
            datetime.strptime(fecha_fin, "%Y-%m-%d"), time.max))
        detalles = detalles.filter(
            pedido__fecha__range=(inicio, fin)
        )

    bebestibles = detalles.filter(bebestible__isnull=False).values(
        'bebestible__nombre'
    ).annotate(
        total_vendidos=Sum('cantidad')
    ).order_by('-total_vendidos')

    entradas = detalles.filter(entrada__isnull=False).values(
        'entrada__nombre'
    ).annotate(
        total_vendidos=Sum('cantidad')
    ).order_by('-total_vendidos')

    fondos = detalles.filter(platoDeFondo__isnull=False).values(
        'platoDeFondo__nombre'
    ).annotate(
        total_vendidos=Sum('cantidad')
    ).order_by('-total_vendidos')

    postres = detalles.filter(postre__isnull=False).values(
        'postre__nombre'
    ).annotate(
        total_vendidos=Sum('cantidad')
    ).order_by('-total_vendidos')

    agregados = detalles.filter(agregadoSalsa__isnull=False).values(
        'agregadoSalsa__nombre'
    ).annotate(
        total_vendidos=Sum('cantidad')
    ).order_by('-total_vendidos')

    return render(request, 'productos_vendidos.html', {
        'bebestibles': bebestibles,
        'entradas': entradas,
        'fondos': fondos,
        'postres': postres,
        'agregados': agregados,
        'fecha_inicio': fecha_inicio,
        'fecha_fin': fecha_fin,
    })