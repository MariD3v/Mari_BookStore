<?php

include("getConnection.php");

session_start();

if(!isset($_SESSION['logged_in'])){ //Si no se ha iniciado sesión
    header('location: iniciar-sesion.php');
    exit();
}

//Mostrar libros

$codigo_compra = $_GET["codigo_compra"];

$stmt = $conn->prepare("SELECT libro.codigo_libro, libro.titulo, autor.nombre, libro.precio, detalle_compra.cantidad FROM detalle_compra JOIN libro ON detalle_compra.codigo_libro = libro.codigo_libro JOIN autor ON libro.codigo_autor = autor.codigo_autor WHERE detalle_compra.codigo_compra = ?");
$stmt->bind_param("i", $codigo_compra);
$stmt->execute();
$compra_consulta = $stmt->get_result();
