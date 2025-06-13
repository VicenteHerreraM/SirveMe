from django import forms
from .models import Inventario ,Entrada, PlatoDeFondo, Postre, Pedidos,DetallePedido , Bebestibles , AgregadoSalsa
# from django.forms 

class InventarioForm(forms.ModelForm):
    class Meta:
        model = Inventario
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super(InventarioForm, self).__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'

class EntradaForm(forms.ModelForm):
    class Meta:
        model = Entrada
        fields = ['nombre' , 'cantidad']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'cantidad': forms.NumberInput(attrs={'class': 'form-control'}),

        }

class PlatoDeFondoForm(forms.ModelForm):
    class Meta:
        model = PlatoDeFondo
        fields = ['nombre' , 'cantidad' , 'imagen']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'cantidad': forms.NumberInput(attrs={'class': 'form-control'}),
        }

class PostreForm(forms.ModelForm):
    class Meta:
        model = Postre
        fields = ['nombre' , 'cantidad']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'cantidad': forms.NumberInput(attrs={'class': 'form-control'}),
        }
class AgregadoSalsaForm(forms.ModelForm):
    class Meta:
        model = AgregadoSalsa
        fields = ['nombre' , 'cantidad']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'cantidad': forms.NumberInput(attrs={'class': 'form-control'}),
        }

class BebestiblesForm(forms.ModelForm):
    class Meta:
        model = Bebestibles
        fields = ['nombre', 'cantidad', 'precio' , 'imagen']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'cantidad': forms.NumberInput(attrs={'class': 'form-control'}),
            'precio': forms.NumberInput(attrs={'class': 'form-control'}),
        }
class PedidoForm(forms.ModelForm):
    class Meta:
        model = Pedidos
        fields = ['fk_mesa']

class DetallePedidoForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['entrada'].queryset = Entrada.objects.filter(cantidad__gt=0)
        self.fields['platoDeFondo'].queryset = PlatoDeFondo.objects.filter(cantidad__gt=0)
        self.fields['agregadoSalsa'].queryset = AgregadoSalsa.objects.filter(cantidad__gt=0)        
        self.fields['postre'].queryset = Postre.objects.filter(cantidad__gt=0)
        self.fields['bebestible'].queryset = Bebestibles.objects.filter(cantidad__gt=0)
        
    class Meta:
        model = DetallePedido
        fields = ['entrada', 'platoDeFondo','agregadoSalsa' ,'postre', 'bebestible', 'cantidad', 'tipo']
        widgets = {
            'entrada': forms.Select(attrs={'class': 'form-control'}),
            'platoDeFondo': forms.Select(attrs={'class': 'form-control'}),
            'agregadoSalsa': forms.Select(attrs={'class': 'form-control'}),
            'postre': forms.Select(attrs={'class': 'form-control'}),
            'bebestible': forms.Select(attrs={'class': 'form-control'}),
            'cantidad': forms.NumberInput(attrs={'class': 'form-control'}),
        }
    
        def clean(self):
            cleaned_data = super().clean()
            cantidad = cleaned_data.get('cantidad')

            for field_name, model in [
                ('entrada', Entrada),
                ('platoDeFondo', PlatoDeFondo),
                ('agregadoSalsa', AgregadoSalsa),
                ('postre', Postre),
                ('bebestible', Bebestibles),
            ]:
                producto = cleaned_data.get(field_name)
                if producto and cantidad:
                    if producto.cantidad < cantidad:
                        self.add_error(field_name, f"El producto '{producto.nombre}' no tiene suficiente stock.")
            return cleaned_data

class PedidoProductoForm(forms.Form):
    entrada = forms.ModelChoiceField(queryset=Entrada.objects.filter(cantidad__gt=0), required=False, label="Entrada")
    agregadoSalsa = forms.ModelChoiceField(queryset=AgregadoSalsa.objects.filter(cantidad__gt=0), required=False, label="Agregado/Salsa")
    cantidad = forms.IntegerField(min_value=1, initial=1, widget=forms.NumberInput(attrs={'class': 'form-control'}))

class MetodoEntregaForm(forms.Form):
    METODOS = [
        ('retiro', 'Retiro en tienda'),
        ('domicilio', 'Entrega a domicilio'),
    ]
    metodo = forms.ChoiceField(choices=METODOS, widget=forms.RadioSelect, label="Método de entrega")