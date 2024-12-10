<?php

include("getConnection.php");

session_start();

if(!isset($_SESSION['logged_in'])){
    header('location: iniciar-sesion.php');
    exit();
}

if(isset($_GET['cerrarsesion'])){ //Si hemos pulsado el boton de cerrar sesion
    if(isset($_SESSION['logged_in'])){
        unset($_SESSION['logged_in']);
        unset($_SESSION['user_email']);
        unset($_SESSION['user_name']);
        unset($_SESSION['user_surname']);

        header('location: iniciar-sesion.php');
        exit();
    }
}

if(isset($_POST['change_password'])){ //Si hemos pulsado el boton de cambiar contraseña

    $password = $_POST['password'];
    $passwordConf = $_POST['password_conf'];
    $email = $_SESSION['user_email'];

    if($password != $passwordConf){ //Si no son iguales las dos contraseñas
        header('Location: perfil.php?error=Las contraseñas no coinciden');
        exit();

    } else if (strlen($password) < 6){ //Comprobamos que la contraseña sea de almenos de 6 caracteres
        header('location: perfil.php?error=La contraseña debe contener 6 carácteres o más');
        exit();

    } else {
        $password = md5($password); //Ciframos
        $stmt = $conn->prepare("UPDATE cliente SET contraseña = ? WHERE email = ?");
        $stmt->bind_param('ss', $password, $email);
        
        if($stmt->execute()){
            header('location: perfil.php?mensaje=Contraseña cambiada con éxito');
        } else {
            header('location: perfil.php?error=No se ha podido cambiar la contraseña');
        }
    }
}