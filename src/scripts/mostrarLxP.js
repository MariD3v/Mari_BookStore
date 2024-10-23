const options1 = document.querySelectorAll('.optionMostrarLxP');
const selectedLabel1 = document.getElementById('selectedOptionMostrarLxP');
const dropdownToggle1 = document.getElementById('dropdownToggle1');
const dropdownMenu1 = document.querySelector('.dropdownmenu1');

options1.forEach(option => { //Poner el atributo seleccionado en la caja de arriba
    option.addEventListener('click', function(event) {
        selectedLabel1.textContent = this.getAttribute('data-value'); 
        dropdownToggle1.checked = false;
    });
});

document.addEventListener('click', function(event) { //Cerrar el menu al clickar fuera
    if (!dropdownMenu1.contains(event.target)) {
        dropdownToggle1.checked = false;
    }
});
