<?php

require_once '../src/config.php';

$context = stream_context_create(['http' => ['header' => 'Authorization: Bearer '.$token]]);
$json = file_get_contents("https://api.clashofclans.com/v1/leagues", false, $context);


foreach (json_decode($json, true)["items"] as $league)
{
    $id = $league['id'];
    $name = $league['name'];
    $ico_sm = $league['iconUrls']['small'];
    $ico_md = null;
    if (isset($league['iconUrls']['medium']))
    {
        //unranked medium img is undefined
        $ico_md = $league['iconUrls']['medium'];
    }
    $ico_tiny = $league['iconUrls']['tiny'];
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) 
    {
        die("Connection failed: " . $conn->connect_error);
    } 

    $sql = "INSERT INTO `clashdash`.`league` (`id`, `name`, `iconUrl_small`, `iconUrl_medium`, `iconUrl_tiny`) VALUES ('$id', '$name', '$ico_sm', '$ico_md', '$ico_tiny') 
    ON DUPLICATE KEY UPDATE 
    `name`='$name',`iconUrl_small`='$ico_sm',`iconUrl_medium`='$ico_md',`iconUrl_tiny`='$ico_tiny';";

    if ($conn->query($sql) === TRUE) 
    {
        echo "New record created successfully";
    } 
    else 
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
