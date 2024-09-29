const contenedorLibros = document.getElementById('carruselcatalogo');
const prevBtn = document.getElementById('carruselnext');
const nextBtn = document.getElementById('carruselprev');

const scrollAmount = 300; // Ajusta este valor según lo que desees desplazar

nextBtn.addEventListener('click', () => {
    contenedorLibros.scrollBy({
        top: 0,
        left: scrollAmount,
        behavior: 'smooth' // Desplazamiento suave
    });
});

prevBtn.addEventListener('click', () => {
    contenedorLibros.scrollBy({
        top: 0,
        left: -scrollAmount,
        behavior: 'smooth' // Desplazamiento suave
    });
});