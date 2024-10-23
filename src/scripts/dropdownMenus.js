const allToggles = document.querySelectorAll('.dropdown-checkbox1, .dropdown-checkbox2, .dropdown-checkbox3, .dropdown-checkbox4, .dropdown-checkbox5'); //Todos los botones
const dropdowns = [ //
    {   //Mostrar libro/página
        options: document.querySelectorAll('.optionMostrarLxP'),
        selectedLabel: document.getElementById('selectedOptionMostrarLxP'),
        dropdownToggle: document.getElementById('dropdownToggle1'),
        dropdownMenu: document.querySelector('.dropdownmenu1')
    },
    {   //Ordenar por
        options: document.querySelectorAll('.optionOrdenarL'),
        selectedLabel: document.getElementById('selectedOptionOrdenarL'),
        dropdownToggle: document.getElementById('dropdownToggle2'),
        dropdownMenu: document.querySelector('.dropdownmenu2')
    }
];

// Cerrar los desplegables al hacer clic fuera (Todos los botones)
allToggles.forEach(toggle => {
    toggle.addEventListener('change', function(event) {
        allToggles.forEach(otherToggle => {
            if (otherToggle !== event.target) {
                otherToggle.checked = false;
            }
        });
    });
});
document.addEventListener('click', function(event) {
    allToggles.forEach(toggle => {
        const dropdownMenu = toggle.closest('.dropdownmenu');
        if (dropdownMenu && !dropdownMenu.contains(event.target)) {
            toggle.checked = false; 
        }
    });

    dropdowns.forEach(({ dropdownToggle, dropdownMenu }) => {
        if (!dropdownMenu.contains(event.target)) {
            dropdownToggle.checked = false;
        }
    });
});

// Mostrar las opciones al seleccionarlas ("ordenar por" y "Mostrar libro/página")
dropdowns.forEach(({ options, selectedLabel, dropdownToggle }) => {
    options.forEach(option => {
        option.addEventListener('click', function(event) {
            selectedLabel.textContent = this.getAttribute('data-value'); 
            dropdownToggle.checked = false;
        });
    });
});