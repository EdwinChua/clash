<?php

require_once '../src/config.php';

$context = stream_context_create(['http' => ['header' => 'Authorization: Bearer '.$token]]);
$json = file_get_contents("https://api.clashofclans.com/v1/locations", false, $context);


foreach (json_decode($json, true)["items"] as $location)
{
    $id = $location['id'];
    $name = $location['name'];

    $isCountry = (int)$location['isCountry'];

    $countryCode = null;
    if (isset($location['countryCode']))
    {
        $countryCode = $location['countryCode'];
    }
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) 
    {
        die("Connection failed: " . $conn->connect_error);
    } 

    $sql = "INSERT INTO `clashdash`.`location` (`id`, `name`, `isCountry`, `countryCode`) VALUES ('$id', '$name', '$isCountry', '$countryCode')
    ON DUPLICATE KEY UPDATE 
    `name`='$name',`isCountry`='$isCountry',`countryCode`='$countryCode';";

    if ($conn->query($sql) === TRUE) 
    {
        echo "New record created successfully <br>";
    } 
    else 
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}






