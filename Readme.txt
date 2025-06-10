Sirveme es una aplicacion diseñada para la administracion de restaurantes desarrollada principalmente en python con el framework de django

Recomendable el uso de cmd en vsCode en vez del powershell

Preparando la pagina
Para hacer funcionar la pagina de SirveMe, se debe seguir los siguientes pasos

1. Crear el entorno virtual en carpeta raiz
python -m venv venv   

2. Activar entorno virtual
venv\Scripts\activate.bat

3. Instalar requirements
pip install -r requirements.txt

Librerias usadas:
pip install django
pip install celery
pip install django-bootstrap-v5
pip install mysqlclient
pip install pillow

4.1 Acceder a carpeta de sirveme
cd sirveme

5.Hacer migraciones
py manage.py makemigrations
py manage.py migrate

6.Cargar base de datos
Obtener sql de bd

7. Ejecutar pagina

py manage.py runserver