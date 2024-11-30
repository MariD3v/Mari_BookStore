<?php
include("getConnection.php");

session_start();

if (isset($_POST['docompradefinitiva'])){
    
    // obtenemos los datos enviados en el form del cliente y meterlo en db
    $client_nombre = $_POST['client_nombre']; 
    $client_apellidos = $_POST['client_apellidos'];
    $client_email = $_POST['client_email'];
    $client_telefono = $_POST['client_telefono'];
    $client_dni = $_POST['client_dni'];
    $client_direccion= $_POST['client_direccion'];
    $client_direccion_adicional = $_POST['client_direccion_adicional'];
    $client_codigo_postal = $_POST['client_codigo_postal'];
    $client_poblacion = $_POST['client_poblacion'];
    $client_provincia = $_POST['client_provincia'];

    $conn ->prepare("INSERT INTO cliente (nombre,apellidos,email,telefono,dni,direccion,direccion_adicional,codigo_postal,poblacion,provincia) VALUES ();");

    /*
 
    */

    //obtener compra y meterla en db

    //obtener datos de compra y meterla en db

    //vaciar el carrito

    //Informar que la compra ha sido realizada con exito o ha habido un error
}