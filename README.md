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

Los requerimientos funcionales más importantes para este proyecto son los siguientes

- Inicio de secion diferenciado: Dependiendo del usuario que ingrese en el login, apareceran distintas pantallas dependiendo si es un trabajador, administrador o cliente
- Tienda en linea: Se podran realizar compras de productos de manera digital
- Atencion de mesas: Los meseros podran tomar pedidos de manera digital y monitorear las diversas mesas que esten atendiendo
- KDS: Los pedidos que se realizen por parte de los meseros, seran enviados a la pantalla de la cocina para ser preparados
- Gestion de dueño: El dueño del local podra administrar apartados como el inventario, usuarios y ver productos vendidos en el tiempo. 

Y los no funcionales más importantes serian

- Integridad del sistema: Realize las transacciones de manera precisa y consistente
- Interfaz de usuario dinamica: Sea adaptable tanto en dispositivos móviles como en computadoras de escritorio
- Seguridad del sistema: Encriptacion de datos como contraseñas


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

En caso de no haber un administrador en la base de datos, se tiene que crear con el siguiente comando

```sh
py manage.py createsuperuser
```

Después, hay que dirigirse al administrador de base de datos de Django [http://127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/), ingresar los datos previamente registrados, acceder al apartado de "Users" y en el perfil creado, se debe acceder y cambiar el rol a "Administrador".
Con lo anteriormente mencionado, ya podra ingresar desde la pagina web