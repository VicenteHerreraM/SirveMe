// Buscador
const busqueda = document.getElementById('busqueda');
const buscar = document.getElementById('buscar');

buscar.addEventListener('click', () => {
  const termino = busqueda.value.trim().toLowerCase();
  const productos = document.querySelectorAll('.productos li');
  productos.forEach((producto) => {
    const nombre = producto.querySelector('h2').textContent.toLowerCase();
    if (nombre.includes(termino)) {
      producto.style.display = 'block';
    } else {
      producto.style.display = 'none';
    }
  });
});

// Filtrador
const categoria = document.getElementById('categoria');
const precio = document.getElementById('precio');

categoria.addEventListener('change', () => {
  const seleccionado = categoria.value;
  const productos = document.querySelectorAll('.productos li');
  productos.forEach((producto))
});

const regiones = {
    "Región Metropolitana": {
        "Santiago": ["Santiago", "Providencia", "Las Condes", "Ñuñoa"],
        "Puente Alto": ["Puente Alto"]
    },
    "Valparaíso": {
        "Valparaíso": ["Valparaíso", "Viña del Mar"],
        "Quilpué": ["Quilpué"]
    },
    // Agrega más regiones, comunas y ciudades según necesites
};

function cargarRegiones() {
    const regionSelect = document.getElementById('region');
    regionSelect.innerHTML = '<option value="">Seleccione región</option>';
    for (const region in regiones) {
        regionSelect.innerHTML += `<option value="${region}">${region}</option>`;
    }
}

function cargarComunas() {
    const region = document.getElementById('region').value;
    const comunaSelect = document.getElementById('comuna');
    comunaSelect.innerHTML = '<option value="">Seleccione comuna</option>';
    if (region && regiones[region]) {
        for (const comuna in regiones[region]) {
            comunaSelect.innerHTML += `<option value="${comuna}">${comuna}</option>`;
        }
    }
    cargarCiudades();
}

function cargarCiudades() {
    const region = document.getElementById('region').value;
    const comuna = document.getElementById('comuna').value;
    const ciudadSelect = document.getElementById('ciudad');
    ciudadSelect.innerHTML = '<option value="">Seleccione ciudad</option>';
    if (region && comuna && regiones[region][comuna]) {
        for (const ciudad of regiones[region][comuna]) {
            ciudadSelect.innerHTML += `<option value="${ciudad}">${ciudad}</option>`;
        }
    }
}

window.onload = function() {
    cargarRegiones();
    document.getElementById('region').onchange = cargarComunas;
    document.getElementById('comuna').onchange = cargarCiudades;
};