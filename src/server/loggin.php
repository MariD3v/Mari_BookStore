<?php

include("getConnection.php");

session_start();

if (isset($_POST['iniciar_sesion'])){ //Si pulsamos el boton iniciar sesion

// obtener los datos enviados en el form del inicio de sesión
$client_email = $_POST['email'];
$client_pass = $_POST['password'];

} else if(isset($_SESSION['logged_in'])){ //Si ya estamos logeados en nuestra sesion
    header('location: perfil.php');
    exit();
}