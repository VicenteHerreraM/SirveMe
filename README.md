# SirveMe

SirveMe es una aplicación diseñada para la administración de restaurantes, desarrollada principalmente en Python utilizando el framework Django.

## Integrantes
- Vicente Herrera

## Tecnologías usadas
Entre las tecnologias usadas para este proyecto se encuentran

- Python 3.12  
- MySQL Workbench
- MySQL Server
- Git
- VSCode

## Requerimientos funcionales y no funcionales

Los requerimientos funcionales y no funcionales mas importantes para este proyecto son los siguientes

- Inicio de secion diferenciado: Dependiendo del usuario que ingrese en el login, apareceran distintas pantallas dependiendo si es un trabajador, administrador o cliente
- Tienda en linea: Se podran realizar compras de productos de manera digital
- Atencion de mesas: Los meseros podran tomar pedidos de manera digital y monitorear las diversas mesas que esten atendiendo
- KDS: Los pedidos que se realizen por parte de los meseros, seran enviados a la pantalla de la cocina para ser preparados
- Gestion de dueño: El dueño del local podra administrar apartados como el inventario, usuarios y ver productos vendidos en el tiempo. 

> **Recomendación:**  
> Se recomienda el uso de CMD en VS Code en vez de PowerShell para evitar problemas de entorno.

---

## Preparación del entorno

Sigue estos pasos para poner en marcha la página de SirveMe:

### 1. Crear el entorno virtual en la carpeta raíz

```sh
python -m venv venv
```

### 2. Activar el entorno virtual

```sh
venv\Scripts\activate.bat
```

### 3. Instalar los requisitos

```sh
pip install -r requirements.txt
```

#### Librerías principales usadas

- django
- celery
- django-bootstrap-v5
- mysqlclient
- pillow

Si necesitas instalar alguna manualmente:

```sh
pip install django celery django-bootstrap-v5 mysqlclient pillow
```

### 4. Acceder a la carpeta del proyecto

```sh
cd sirveme
```

### 5. Realizar migraciones

```sh
py manage.py makemigrations
py manage.py migrate
```

### 6. Cargar la base de datos

Obtener el archivo SQL de la base de datos y restaurarlo según corresponda.

### 7. Ejecutar la aplicación

```sh
py manage.py runserver
```

---

Para acceder a la pagina, ingrese la siguiente direccion [http://127.0.0.1:8000/home/](http://127.0.0.1:8000/home/).

---

## Inicio de secion y perfiles

Para iniciar secion, he ingresado perfiles de prueba que contienen los siguientes correos y contraseñas

- aaa@gmail.com - 1q2w3e (Administrador)
- bbb@gmail.com - 1q2w3e (Mesero)
- ccc@gmail.com - 1q2w3e (Cocinero)
- ddd@gmail.com - 1q2w3e (Cliente)