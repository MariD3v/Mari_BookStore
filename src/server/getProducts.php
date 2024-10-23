<?php

include("getConnection.php");

$stmt = $conn ->prepare("SELECT * FROM libro LIMIT 40");
$stmt->execute();

$libros_consulta = $stmt->get_result();
?>