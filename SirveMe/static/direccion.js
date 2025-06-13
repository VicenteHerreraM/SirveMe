
const regiones = {
    "Región Metropolitana": {
        "Santiago": ["Santiago", "Providencia", "Las Condes", "Ñuñoa"],
        "Puente Alto": ["Puente Alto"]
    },
    "Valparaíso": {
        "Valparaíso": ["Valparaíso", "Viña del Mar"],
        "Quilpué": ["Quilpué"]
    },
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
