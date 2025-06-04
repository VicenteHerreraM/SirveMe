from django import forms
from .models import CustomUser
from django.contrib.auth.forms import UserCreationForm

class CustomUserForm(forms.ModelForm):
    password = forms.CharField(
        label='Contraseña',
        widget=forms.PasswordInput,
        required=False 
    )
    first_name = forms.CharField(
            label='Nombre',
            max_length=30,
            required=True
        )
    last_name = forms.CharField(
            label='Apellido',
            max_length=30,
            required=True
        )
    
    class Meta:
        model = CustomUser
        fields = ['rut','first_name', 'last_name', 'email', 'password', 'rol', 'direccion', 'comuna', 'ciudad']

    def save(self, commit=True):
        user = super().save(commit=False)
        password = self.cleaned_data.get('password')
        if password:
            user.set_password(password)
        if commit:
            user.save()
        return user
    
class ClienteRegistroForm(UserCreationForm):
    class Meta:
        model = CustomUser
        fields = ['first_name', 'last_name', 'email', 'password1', 'password2']

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("password")
        password2 = cleaned_data.get("password2")
        if password and password2 and password != password2:
            self.add_error('password2', "Las contraseñas no coinciden.")
        return cleaned_data