<?php
include("getConnection.php");

session_start();

if (isset($_POST['do_compra']) && !empty($_SESSION['cart'])){ //Si el carro no está vacio y pulsamos el botón realizar compra

} else {
    header('location: ../index.php'); //Si el carro esta vacio, nos devuelve a index.php
    exit();
}