<?php

include("getConnection.php");

$stmt = $conn ->prepare("SELECT * FROM libro LIMIT 40");
$stmt->execute();

$librosArray = $stmt->get_result();

?>