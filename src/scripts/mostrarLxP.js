const options = document.querySelectorAll('.optionMostrarLxP');
const selectedLabel = document.getElementById('selectedOptionMostrarLxP');
const dropdownToggle = document.getElementById('dropdownToggle1');
const dropdownMenu = document.querySelector('.dropdownmenu1');

options.forEach(option => { //Poner el atributo seleccionado en la caja de arriba
    option.addEventListener('click', function(event) {
        selectedLabel.textContent = this.getAttribute('data-value'); 
        dropdownToggle.checked = false;
    });
});

document.addEventListener('click', function(event) { //Cerrar el menu al clickar fuera
    if (!dropdownMenu.contains(event.target)) {
        dropdownToggle.checked = false;
    }
});