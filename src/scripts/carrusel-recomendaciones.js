const contenedorLibros = document.getElementById('carruselcatalogo');
const prevBtn = document.getElementById('carruselnext');
const nextBtn = document.getElementById('carruselprev');

const scrollAmount = 255.9; //Pxs

nextBtn.addEventListener('click', () => {
    if (contenedorLibros.scrollLeft + contenedorLibros.clientWidth >= contenedorLibros.scrollWidth) {
        // Si estamos al final, volvemos al principio
        contenedorLibros.scrollTo({
            top: 0,
            left: 0,
            behavior: 'smooth'
        });
    } else {
        // Avanzar normalmente
        contenedorLibros.scrollBy({
            top: 0,
            left: scrollAmount,
            behavior: 'smooth'
        });
    }
});

prevBtn.addEventListener('click', () => {
    if (contenedorLibros.scrollLeft <= 0) {
        // Si estamos al principio, volvemos al final
        contenedorLibros.scrollTo({
            top: 0,
            left: contenedorLibros.scrollWidth,
            behavior: 'smooth'
        });
    } else {
        // Retroceder normalmente
        contenedorLibros.scrollBy({
            top: 0,
            left: -scrollAmount,
            behavior: 'smooth'
        });
    }
});
