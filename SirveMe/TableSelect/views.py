from django.shortcuts import render
from .models import Mesa   
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
def select_table(request):
    mesas = Mesa.objects.all()  
    return render(request, 'selectTable.html', {'mesas': mesas})

