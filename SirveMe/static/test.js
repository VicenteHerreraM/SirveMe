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