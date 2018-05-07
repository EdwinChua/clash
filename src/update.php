<?php

require_once 'config.php';

$url_clan = 'https://api.clashofclans.com/v1/clans/'.urlencode($clantag);

$context = stream_context_create(['http' => ['header' => 'Authorization: Bearer '.$token]]);
$json = file_get_contents($url_clan, false, $context);
$clanData = json_decode($json);
$playerData = [];

foreach ($clanData->memberList as $member) {
    $url_player = 'https://api.clashofclans.com/v1/players/'.urlencode($member->tag);
    $json = file_get_contents($url_player, false, $context);
    $playerData[] = json_decode($json);
}

$result = array(
    'updatedOn' => time(),
    'clan' => $clanData,
    'players' => $playerData
);

file_put_contents('../data/clan-info.json', json_encode($result));
echo 'done';
