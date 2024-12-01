<?php

if(isset($_POST['registrarse'])){ //Si pulsamos el boton registrarse

    // obtener los datos enviados en el form del registro
    $client_nombre = $_POST['nombre']; 
    $client_apellidos = $_POST['apellidos'];
    $client_email = $_POST['email'];
    $client_pass = $_POST['password'];
    $client_pass_conf = $_POST['password_conf'];

    //Validar los datos
    if (strlen($client_nombre) == 0){ //Comprobamos que el nombre no este vacio
        header('location: registro.php?error_nombre=Escribe tu nombre');
        exit();
    }

    if (strlen($client_apellidos) == 0){ //Comprobamos que los apellidos no esten vacios
        header('location: registro.php?error_apellidos=Escribe tu/s apellido/s');
        exit();
    }

    $regex = '/^[A-z0-9._-]+@[A-z0-9][A-z0-9-]*(\.[A-z0-9_-]+)*\.([A-z]{2,6})$/';
    if (strlen($client_email) == 0){ //Comprobamos que el email no este vacio
        header('location: registro.php?error_email=Escribe tu email');
        exit();
    } else if (!preg_match($regex, $client_email)) { //Comprobamos que el email sea valido
        header('Location: registro.php?error_email=Introduce una dirección de correo electrónico válida');
        exit();
    }

    if (strlen($client_pass) == 0){ //Comprobamos que la confirmada no este vacia
        header('location: registro.php?error_pass=Escribe la contraseña');
        exit();
    } else if (strlen($client_pass) < 6){ //Comprobamos que la contraseña sea almenos de 6 caracteres
        header('location: registro.php?error_pass=Contraseña no válida: Debe contener almenos 6 carácteres');
        exit();
    }

    if (strlen($client_pass_conf) == 0){ //Comprobamos que la confirmada no este vacia
        header('location: registro.php?error_pass_conf=Escribe la contraseña');
        exit();
    }else if ($client_pass!==$client_pass_conf){ //Comprobamos que la contraseña y la confirmada sean iguales
        header('location: registro.php?error_pass_conf=Las contraseñas no coinciden');
        exit();
    }

} else if (isset($_POST['iniciar_sesion'])){ //Si pulsamos el boton iniciar sesion

    // obtener los datos enviados en el form del inicio de sesión
    $client_email = $_POST['email'];
    $client_pass = $_POST['password'];

} else {

}