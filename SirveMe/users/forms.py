from django import forms
from .models import CustomUser

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