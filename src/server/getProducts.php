<?php
include("getConnection.php");

$selectedGenres = isset($_GET['genero']) ? $_GET['genero'] : [];
$selectedLanguage = isset($_GET['idioma']) ? $_GET['idioma'] : [];
$selectedPriceMin = isset($_GET['valorpreciomin']) ? $_GET['valorpreciomin'] : '';
$selectedPriceMax = isset($_GET['valorpreciomax']) ? $_GET['valorpreciomax'] : '';
$selectedOrder = isset($_GET['valororden']) ? $_GET['valororden'] : 'Relevancia';
$selectedDisplay = isset($_GET['valorLxP']) ? $_GET['valorLxP'] : '10';

$sql = "SELECT * FROM libro  WHERE 1=1";


if (!empty($selectedGenres)) {
    $genresPlaceholder = implode(',', array_fill(0, count($selectedGenres), '?'));
    $sql .= " AND genero IN ($genresPlaceholder)";
}

if (!empty($selectedLanguage)) {
    $languagePlaceholder = implode(',', array_fill(0, count($selectedLanguage), '?'));
    $sql .= " AND idioma IN ($languagePlaceholder)";
}

if ($selectedPriceMin !== '') {
    $sql .= " AND precio >= ?";
}

if ($selectedPriceMax !== '') {
    $sql .= " AND precio <= ?";
}

if ($selectedOrder=='Precio ⭡') {
    $sql .= " ORDER BY precio ASC";
}
else if ($selectedOrder=='Precio ⭣'){
    $sql .= " ORDER BY precio DESC";
}
else if ($selectedOrder=='A-Z'){
    $sql .= " ORDER BY titulo ASC"; 
}
else if ($selectedOrder=='Z-A'){
    $sql .= " ORDER BY titulo DESC";
}

$sql .= " LIMIT ?";
$stmt = $conn ->prepare($sql);

$params = [];
$types ="";

foreach ($selectedGenres as $genre) {
    $params[] = $genre;
    $types .= 's'; 
}

foreach ($selectedLanguage as $language) {
    $params[] = $language;
    $types .= 's';
}


if ($selectedPriceMin !== '') {
    $params[] = $selectedPriceMin;
    $types .= 'd'; 
}

if ($selectedPriceMax !== '') {
    $params[] = $selectedPriceMax;
    $types .= 'd'; 
}

$params[] = $selectedDisplay; // Agregar el limit
$types .= 'i'; 
$stmt->bind_param($types, ...$params);
$stmt->execute();
$libros_consulta = $stmt->get_result();

$stmt->close();
$conn->close();
?>