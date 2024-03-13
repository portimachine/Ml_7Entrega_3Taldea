<?php

$env = parse_ini_file(__DIR__ . '/../../../.env');

$APP_DIR = $env["APP_DIR"];

require_once($_SERVER["DOCUMENT_ROOT"] . $APP_DIR . '/src/views/parts/layouts/layoutTop.php'); //Aplikazioaren karpeta edozein lekutatik atzitzeko.

require_once(APP_DIR . '/src/views/parts/sidebar.php');

require_once(APP_DIR . '/src/views/parts/header.php');

// Procesar el formulario si se ha enviado
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['mainColor']) && isset($_POST['footerColor'])) {
    // Actualizar los valores de color en el XML
    $config = new SimpleXMLElement('<config></config>');
    $config->addChild('mainColor', $_POST['mainColor']);
    $config->addChild('footerColor', $_POST['footerColor']);
    $config->asXML(APP_DIR . '/conf.xml');
} else {
    $config = simplexml_load_file(APP_DIR . '/conf.xml');
}

?>
<div class="laburpenaDiv">
    <form action="<?= HREF_APP_DIR ?>/src/php/post.php" method="post">
        <input type="hidden" value="changeConfig" name="action" />
        <div>
            <div>
                <label for="mainColor">Kolore nagusia:</label>
            </div>
            <div>
                <input type="color" id="mainColor" name="mainColor" value="<?= $config->mainColor ?>" />
            </div>
        </div>
        <div>
            <div>
                <label for="footerColor">Footer kolorea:</label>
            </div>
            <div>
                <input type="color" id="footerColor" name="footerColor" value="<?= $config->footerColor ?>" />
            </div>
        </div>
        <button type="submit">Gorde</button>
    </form>
</div>

<style>
    body {
        background-color: <?= $config->mainColor ?>;
    }
    footer {
        background-color: <?= $config->footerColor ?>;
    }
</style>

<?php

require_once(APP_DIR . '/src//views/parts/layouts/layoutBottom.php');

?>
