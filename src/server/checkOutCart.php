<?php
include("getConnection.php");

session_start();

if (isset($_POST['do_compra']) && !empty($_SESSION['cart'])){ //Si el carro no esta vacio, realizamos la compra

} else {
    header('location: ../index.php'); //Si el carro esta vacio, nos devuelve a index.php
}