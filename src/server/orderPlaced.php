<?php
include("getConnection.php");

session_start();

if (isset($_POST['docompradefinitiva'])){
    
    // obtener los datos enviados en el form del cliente y meterlo en db
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

    $stmt = $conn ->prepare("INSERT INTO cliente (nombre,apellidos,email,telefono,dni,direccion,direccion_adicional,codigo_postal,poblacion,provincia) VALUES (?,?,?,?,?,?,?,?,?,?);");
    $stmt->bind_param('sssisssiss',$client_nombre,$client_apellidos,$client_email,$client_telefono,$client_dni,$client_direccion,$client_direccion_adicional,$client_codigo_postal,$client_poblacion,$client_provincia);
    $stmt->execute();

    //obtener datos de compra y meterla en db
    $order_date = date('Y-m-d H:i:s');
    $client_id = $stmt->insert_id;

    $stmt = $conn ->prepare("INSERT INTO compra (fecha,codigo_cliente) VALUES (?,?);");
    $stmt->bind_param('si',$order_date,$client_id);
    $stmt->execute();

    //obtener detalles de la compra y meterla en db
    $order_id = $stmt->insert_id;
    foreach($_SESSION['cart'] as $key => $value){
        $product = $_SESSION['cart'][$key];
        $product_id = $product['product_id'];
        $product_quantity = $product['product_quantity'];

        $stmt = $conn ->prepare("INSERT INTO detalle_compra (codigo_compra,codigo_libro,unidades) VALUES (?,?,?);");
        $stmt->bind_param('iii',$order_id,$product_id,$product_quantity);
        $stmt->execute();
    }
    //Informar que la compra ha sido realizada con exito o ha habido un error
    header('location: compra-realizada.php?order_status=Compra realizada con exito');

    //vaciar el carrito
    unset($_SESSION['cart']);   
}