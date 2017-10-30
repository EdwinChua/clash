<?php
header('Content-Type: application/json; charset=UTF-8');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$my_file = '../saved-data/clan-info.json';

$clantag = "#2PCCRLYP";

$token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImI5MzRmZTQxLTc5YjUtNDNmYi04YjJiLTA4ZGRkYjBlNzQzNyIsImlhdCI6MTUwOTA5MTQyNSwic3ViIjoiZGV2ZWxvcGVyL2UwMTcwNDEzLWZlNjQtYTg5OC03OTMwLWZlYTA4MjRmOTk5YyIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjM1LjE4Ni4xODkuMTc4Il0sInR5cGUiOiJjbGllbnQifV19.bm6Mi3JED8QNwrNMMQ74Bog2CUfFMm5LFXqj5BHO4_vEsXOKJ46g7pJN-8mR8oAWBUosX9pwczGQw2AJcwHWKQ";

$url_clan = "https://api.clashofclans.com/v1/clans/" . urlencode($clantag);

$ch = curl_init($url_clan);

$headr = array();
$headr[] = "Accept: application/json";
$headr[] = "Authorization: Bearer ".$token;

curl_setopt($ch, CURLOPT_HTTPHEADER, $headr);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 

$res = curl_exec($ch);
$clan_data_arr = json_decode($res, true);
curl_close($ch);
//echo $res;

$clan_player_data_arr = array();

$count = count($clan_data_arr["memberList"]);
//echo $count;
for ($i = 0; $i < $count; $i++)
{
	$url_player = "https://api.clashofclans.com/v1/players/" . urlencode($clan_data_arr["memberList"][$i]["tag"]);
	$ch2 = curl_init($url_player);
	curl_setopt($ch2, CURLOPT_HTTPHEADER, $headr);
	curl_setopt($ch2, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch2, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch2, CURLOPT_RETURNTRANSFER, 1); 

	$res_player = curl_exec($ch2);
	array_push($clan_player_data_arr, json_decode($res_player));

}

include './currentdate.php';

$reponse_arr = array("updatedOn"=>$date, "clan" => $clan_data_arr,"players" => $clan_player_data_arr);

$reponse_arr = json_encode($reponse_arr);

$handle = fopen($my_file, 'w') or die('Cannot open file:  '.$my_file);
file_put_contents($my_file, $reponse_arr);

echo $reponse_arr;


?>
