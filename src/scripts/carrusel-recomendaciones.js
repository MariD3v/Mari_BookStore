const contenedoresLibros = document.querySelectorAll('.catalogo');
const nextBtons = document.querySelectorAll('.carruselnext');
const prevBtons = document.querySelectorAll('.carruselprev');

const scrollPercentage = 100;

contenedoresLibros.forEach((contenedorLibros, index) => {
    const nextBton = nextBtons[index];
    const prevBton = prevBtons[index];

    prevBton.addEventListener('click', () => {
        const scrollAmount = (contenedorLibros.clientWidth * scrollPercentage) / 100;

        if (contenedorLibros.scrollLeft + contenedorLibros.clientWidth >= contenedorLibros.scrollWidth) {
            contenedorLibros.scrollTo({
                top: 0,
                left: 0,
                behavior: 'smooth'
            });
        } else {
            contenedorLibros.scrollBy({
                top: 0,
                left: scrollAmount,
                behavior: 'smooth'
            });
        }
    });

    nextBton.addEventListener('click', () => {
        const scrollAmount = (contenedorLibros.clientWidth * scrollPercentage) / 100;

        if (contenedorLibros.scrollLeft <= 0) {
            contenedorLibros.scrollTo({
                top: 0,
                left: contenedorLibros.scrollWidth - contenedorLibros.clientWidth,
                behavior: 'smooth'
            });
        } else {
            contenedorLibros.scrollBy({
                top: 0,
                left: -scrollAmount,
                behavior: 'smooth'
            });
        }
    });
});
