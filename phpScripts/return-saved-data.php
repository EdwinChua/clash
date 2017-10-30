<?php
header('Content-Type: application/json; charset=UTF-8');

$my_file = '../saved-data/clan-info.json';
echo file_get_contents($my_file);
?>