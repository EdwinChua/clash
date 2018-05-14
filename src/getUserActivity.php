<?php
header('Content-Type: application/json');

require_once 'config.php';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}
$player_id = $_GET['pid'];
$sql = "Call GetUserActivity('$player_id')";

$result = $conn->query($sql);
$response = [];

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        array_push($response,$row); 
    }
} else {
    echo "0 results";
}
$conn->close();

echo json_encode($response);