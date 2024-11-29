<?php
include("getConnection.php");

session_start();

if (isset($_POST['addButton'])){ //comprobamos si hemos pulsado el boton
    if(isset($_SESSION['cart'])){ //comprobamos si ya habian mas libros en el carro en nuestra sesion
        
        $products_array_ids = array_column($_SESSION['cart'],"product_id"); // array con todos los ids de los productos que habian en el carro
        $product_id = $_POST['product_id'];
        if (!in_array($product_id,$products_array_ids)){ //Si el producto no estaba en el carro todavia
            //obtenemos los datos del form y lo metemos en el array
            $product_array = array('product_id'=>$_POST['product_id'],'product_name'=>$_POST['product_name'],'product_price'=>$_POST['product_price'],'product_quantity'=>$_POST['product_quantity'], 'product_author' => $_POST['product_author']);

            $_SESSION['cart'][$product_id] = $product_array; //metemos el producto en nuestra sesion cart. $product_id] = $product_array significa = (1 => '1','Trono de cristal',20.00,1)

        } else { //Si el producto ya estaba en el carro

        }

    } else { //si es el primer producto en nuestra sesion

        $product_id = $_POST['product_id']; // obtenemos los datos enviados en el form
        $product_name = $_POST['product_name'];
        $product_price = $_POST['product_price'];
        $product_quantity = $_POST['product_quantity'];
        $product_author = $_POST['product_author'];

        $product_array = array('product_id'=>$product_id,'product_name'=>$product_name,'product_price'=>$product_price,'product_quantity'=>$product_quantity,'product_author'=>$product_author);

        $_SESSION['cart'][$product_id] = $product_array; //metemos el producto en nuestra sesion cart. $product_id] = $product_array significa = (1 => '1','Trono de cristal',20.00,1)
    }

} else {
    header('location: ../index.php');
}