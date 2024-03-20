<?php
$env = parse_ini_file(__DIR__ . '/../../../.env');
$APP_DIR = $env["APP_DIR"];

require_once($_SERVER["DOCUMENT_ROOT"] . $APP_DIR . '/src/views/parts/layouts/layoutTop.php');
$conf = simplexml_load_file(APP_DIR . "/conf.xml");

require_once(APP_DIR . '/src/views/parts/sidebar.php');
require_once(APP_DIR . '/src/views/parts/header.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mainColor = $_POST['mainColor'];
    $footerColor = $_POST['footerColor'];

    // Modificar los nodos correspondientes
    $conf->mainColor = $mainColor;
    $conf->footerColor = $footerColor;

    // Guardar los cambios en el archivo XML
    $conf->asXML(APP_DIR . "/conf.xml");
    
}

$mainColor = $conf->mainColor;
$footerColor = $conf->footerColor;
?>

<?php
$env = parse_ini_file(__DIR__ . '/../../../.env');
$APP_DIR = $env["APP_DIR"];


?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Colores</title>
</head>
<body>
    <div class="laburpenaDiv">
        <form action="" method="post">
            <input type="hidden" value="changeConfig" name="action" />
            <div>
                <div>
                    <label for="mainColor">Kolore nagusia:</label>
                </div>
                <div>
                    <input type="color" id="mainColor" name="mainColor" value="<?= $mainColor ?>" />
                </div>
            </div>
            <div>
                <div>
                    <label for="footerColor">Footer kolorea:</label>
                </div>
                <div>
                    <input type="color" id="footerColor" name="footerColor" value="<?= $footerColor ?>" />
                </div>
            </div>
            <button type="submit">Gorde</button>
        </form>
       
    </div>
</body>
</html>

<?php
require_once(APP_DIR . '/src/views/parts/layouts/layoutBottom.php');
?>