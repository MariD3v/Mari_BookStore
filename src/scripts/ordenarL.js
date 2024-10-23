const options2 = document.querySelectorAll('.optionOrdenarL');
const selectedLabel2 = document.getElementById('selectedOptionOrdenarL');
const dropdownToggle2 = document.getElementById('dropdownToggle2');
const dropdownMenu2 = document.querySelector('.dropdownmenu2');

options2.forEach(option => { //Poner el atributo seleccionado en la caja de arriba
    option.addEventListener('click', function(event) {
        selectedLabel2.textContent = this.getAttribute('data-value'); 
        dropdownToggle2.checked = false;
    });
});

document.addEventListener('click', function(event) { //Cerrar el menu al clickar fuera
    if (!dropdownMenu2.contains(event.target)) {
        dropdownToggle2.checked = false;
    }
});