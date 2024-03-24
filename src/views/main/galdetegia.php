<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $izena = $_POST["izena"];
    $mensajea = $_POST["mensajea"];
    $kurtsoa = isset($_POST["kurtsoa"]) ? $_POST["kurtsoa"] : 1;

    // Xml artxiboa kargatu
    $xml = simplexml_load_file("iruzkinak.xml");

    // Komentario berria gehitu
    $komentario_berria = $xml->addChild('komentarioa');
    $komentario_berria->addChild('izena', $izena);
    $komentario_berria->addChild('mensajea', $mensajea);
    $komentario_berria->addChild('kurtsoa', $kurtsoa);
    $komentario_berria->addChild('data', date("Y-m-d H:i:s"));

    // Gorde aktualizatutako XML artxiboa 
    $xml->asXML("iruzkinak.xml");

    
    echo "<div>";
    echo "<p><strong>Zuzen gorde da iruzkina, atzera joan denak ikusteko</strong></p>";
    echo "</div>";
}
?>