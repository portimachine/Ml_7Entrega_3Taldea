<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $izena = $_POST["izena"];
    $mensajea = $_POST["mensajea"];
    $kurtsoa = isset($_POST["kurtsoa"]) ? $_POST["kurtsoa"] : 1;

    
    $xml = simplexml_load_file("iruzkinak.xml");

    
    $komentario_berria = $xml->addChild('komentarioa');
    $komentario_berria->addChild('izena', $izena);
    $komentario_berria->addChild('mensajea', $mensajea);
    $komentario_berria->addChild('kurtsoa', $kurtsoa);
    $komentario_berria->addChild('data', date("Y-m-d H:i:s"));

    
    $xml->asXML("iruzkinak.xml");

    
    echo "<div>";
    echo "<p><strong>Zuzen gorde da iruzkina, itzuli eta ikusi dena</strong></p>";
    echo "</div>";
} 
?>