# SirveMe

SirveMe es una aplicación diseñada para la administración de restaurantes, desarrollada principalmente en Python utilizando el framework Django.

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

¡Listo! Ahora puedes acceder a SirveMe desde tu navegador en [http://localhost:8000](http://localhost:8000).