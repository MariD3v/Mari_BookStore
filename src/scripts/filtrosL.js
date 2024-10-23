const dropdownToggles = document.querySelectorAll('.dropdown-checkbox5, .dropdown-checkbox4, .dropdown-checkbox3');
const dropdownMenus = document.querySelectorAll('.dropdownmenu');


dropdownMenus.forEach((dropdownMenu) => { // Evitar el cierre cuando se hace clic dentro del menú
    dropdownMenu.addEventListener('click', function(event) {
        event.stopPropagation();
    });
});


function handleClickOutside(event) { // Función para cerrar el menú si haces clic fuera de él
    dropdownMenus.forEach((dropdown, index) => {
        const toggle = dropdownToggles[index]; 
        if (!dropdown.contains(event.target) && toggle.checked) { 
            toggle.checked = false; 
        }
    });
}
document.addEventListener('click', handleClickOutside);