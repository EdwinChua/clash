<?php

require_once 'config.php';

$url_clan = 'https://api.clashofclans.com/v1/clans/'.urlencode($clantag);

$context = stream_context_create(['http' => ['header' => 'Authorization: Bearer '.$token]]);
$json = file_get_contents($url_clan, false, $context);
$clanData = json_decode($json,true);
$playerData = [];

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
} 


$tag = mysqli_real_escape_string($conn,$clanData['tag']);
$name = mysqli_real_escape_string($conn,$clanData['name']);
$location = mysqli_real_escape_string($conn,$clanData['location']['id']);
$badgeUrls_small = mysqli_real_escape_string($conn,$clanData['badgeUrls']['small']);
$badgeUrls_large = mysqli_real_escape_string($conn,$clanData['badgeUrls']['large']);
$badgeUrls_medium = mysqli_real_escape_string($conn,$clanData['badgeUrls']['medium']);
$type = mysqli_real_escape_string($conn,$clanData['type']);
$requiredTrophies = mysqli_real_escape_string($conn,$clanData['requiredTrophies']);
$warFrequency = mysqli_real_escape_string($conn,$clanData['warFrequency']);
$isWarLogPublic = (int)$clanData['isWarLogPublic'];
$description = mysqli_real_escape_string($conn,$clanData['description']);

$clanLevel = (int)mysqli_real_escape_string($conn,$clanData['clanLevel']);
$clanPoints = (int)mysqli_real_escape_string($conn,$clanData['clanPoints']);
$clanVersusPoints = (int)mysqli_real_escape_string($conn,$clanData['clanVersusPoints']);
$members = (int)mysqli_real_escape_string($conn,$clanData['members']);
$warWinStreak = (int)mysqli_real_escape_string($conn,$clanData['warWinStreak']);
$warWins = (int)mysqli_real_escape_string($conn,$clanData['warWins']);
$warTies = (int)mysqli_real_escape_string($conn,$clanData['warTies']);
$warLosses = (int)mysqli_real_escape_string($conn,$clanData['warLosses']);

$sql = "INSERT INTO `$dbname`.`clan_static` (`tag`, `name`, `location`, `badgeUrls_small`, `badgeUrls_large`, `badgeUrls_medium`, `type`, `requiredTrophies`, `warFrequency`, `isWarLogPublic`, `description`) 
VALUES ('$tag', '$name', '$location', '$badgeUrls_small', '$badgeUrls_large', '$badgeUrls_medium', '$type', '$requiredTrophies', '$warFrequency', '$isWarLogPublic', '$description')
ON DUPLICATE KEY UPDATE 
`name`='$name',`location`='$location',`badgeUrls_small`='$badgeUrls_small',`badgeUrls_large`='$badgeUrls_large',`badgeUrls_medium`='$badgeUrls_medium',`type`='$type',`requiredTrophies`='$requiredTrophies',`warFrequency`='$warFrequency',`isWarLogPublic`='$isWarLogPublic',`description`='$description';";

if ($conn->query($sql) === TRUE) 
{
    echo "New record created successfully <br>";
} 
else 
{
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$last_insert_id;
$sql = "INSERT INTO `$dbname`.`clan_non_static` (`tag`, `clanLevel`, `clanPoints`, `clanVersusPoints`, `members`, `warWinStreak`, `warWins`, `warTies`, `warLosses`) 
VALUES ('$tag', '$clanLevel', '$clanPoints', '$clanVersusPoints', '$members', '$warWinStreak', '$warWins', '$warTies', '$warLosses');";
if ($conn->query($sql) === TRUE) 
{
    $last_insert_id = $conn->insert_id;
    echo "New record created successfully <br>";
    //var_dump($conn);
} 
else 
{
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();




/*
* player update
*/
foreach ($clanData['memberList'] as $member) {
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) 
    {
        die("Connection failed: " . $conn->connect_error);
    } 

    $url_player = 'https://api.clashofclans.com/v1/players/'.urlencode($member['tag']);
    $json_player = file_get_contents($url_player, false, $context);
    $player = json_decode($json_player,true);

    $clan_nonStaticId = $last_insert_id;
    $tag = mysqli_real_escape_string($conn,$player['tag']);
    $name = mysqli_real_escape_string($conn,$player['name']);
    $expLevel = (int)mysqli_real_escape_string($conn,$player['expLevel']);
    $league = (int)mysqli_real_escape_string($conn,$player['league']['id']);
    if($league == 0){
        $league = 29000000;
    }
    $trophies = (int)mysqli_real_escape_string($conn,$player['trophies']);
    $versusTrophies = (int)mysqli_real_escape_string($conn,$player['versusTrophies']);
    $attackWins = (int)mysqli_real_escape_string($conn,$player['attackWins']);
    $defenseWins = (int)mysqli_real_escape_string($conn,$player['defenseWins']);
    $bestTrophies = (int)mysqli_real_escape_string($conn,$player['bestTrophies']);
    $donations = (int)mysqli_real_escape_string($conn,$player['donations']);
    $donationsReceived = (int)mysqli_real_escape_string($conn,$player['donationsReceived']);
    $warStars = (int)mysqli_real_escape_string($conn,$player['warStars']);
    $townHallLevel = (int)mysqli_real_escape_string($conn,$player['townHallLevel']);
    $builderHallLevel = (int)mysqli_real_escape_string($conn,$player['builderHallLevel']);
    $bestVersusTrophies = (int)mysqli_real_escape_string($conn,$player['bestVersusTrophies']);
    $versusBattleWins = (int)mysqli_real_escape_string($conn,$player['versusBattleWins']);
    $role = mysqli_real_escape_string($conn,$player['role']);
    $clanRank = (int)mysqli_real_escape_string($conn,$player['clanRank']);
    $previousClanRank = (int)mysqli_real_escape_string($conn,$player['previousClanRank']);


    $sql = "INSERT INTO `$dbname`.`players` 
    (`clan_nonStaticId`, `tag`, `name`, `expLevel`, 
    `league`, `trophies`, `versusTrophies`, `attackWins`, `defenseWins`, 
    `bestTrophies`, `donations`, `donationsReceived`, `warStars`, 
    `townHallLevel`, `builderHallLevel`, `bestVersusTrophies`, 
    `versusBattleWins`, `role`, `clanRank`, `previousClanRank`) 
    VALUES ('$clan_nonStaticId', '$tag', '$name', '$expLevel', '$league', '$trophies', '$versusTrophies',
    '$attackWins', '$defenseWins', '$bestTrophies', '$donations', '$donationsReceived', '$warStars', '$townHallLevel', '$builderHallLevel', 
    '$bestVersusTrophies', '$versusBattleWins', '$role', '$clanRank', '$previousClanRank');";
    if ($conn->query($sql) === TRUE) 
    {
        echo "New record created successfully <br>";
    } 
    else 
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    /*
    * Player Achievements
    */
    foreach ($player['achievements'] as $achievement)
    {
        $name = mysqli_real_escape_string($conn,$achievement['name']);
        $stars = (int)mysqli_real_escape_string($conn,$achievement['stars']);
        $value = (int)mysqli_real_escape_string($conn,$achievement['value']);
        $target = (int)mysqli_real_escape_string($conn,$achievement['target']);
        $info = mysqli_real_escape_string($conn,$achievement['info']);
        $completionInfo = mysqli_real_escape_string($conn,$achievement['completionInfo']);
        $village = mysqli_real_escape_string($conn,$achievement['village']);


        $sql = "INSERT INTO `$dbname`.`achievements` (`player_tag`, `name`, `stars`, `value`, `target`, `info`,`completionInfo`, `village`) 
        VALUES ('$tag','$name', '$stars', '$value', '$target', '$info', '$completionInfo', '$village')
        ON DUPLICATE KEY UPDATE 
        `stars`='$stars', `value`='$value', `target`='$target', `info`='$info',`completionInfo`='$completionInfo', `village`='$village'";
        if ($conn->query($sql) === TRUE) 
        {
            echo "New record created successfully <br>";
        } 
        else 
        {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }

    /*
    * Player Heroes
    */
    foreach ($player['heroes'] as $hero)
    {
        $name = mysqli_real_escape_string($conn,$hero['name']);
        $level = (int)mysqli_real_escape_string($conn,$hero['level']);
        $maxLevel = (int)mysqli_real_escape_string($conn,$hero['maxLevel']);
        $village = mysqli_real_escape_string($conn,$hero['village']);

        $sql = "INSERT INTO `$dbname`.`heroes` (`player_tag`, `name`, `level`, `maxLevel`, `village`)
        VALUES ('$tag', '$name', '$level', '$maxLevel', '$village')
        ON DUPLICATE KEY UPDATE 
        `level`='$level', `maxLevel`='$maxLevel', `village`='$village'";
        if ($conn->query($sql) === TRUE) 
        {
            echo "New record created successfully <br>";
        } 
        else 
        {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }

    /*
    * Player Troops
    */
    foreach ($player['troops'] as $troop)
    {
        $name = mysqli_real_escape_string($conn,$troop['name']);
        $level = (int)mysqli_real_escape_string($conn,$troop['level']);
        $maxLevel = (int)mysqli_real_escape_string($conn,$troop['maxLevel']);
        $village = mysqli_real_escape_string($conn,$troop['village']);

        $sql = "INSERT INTO `$dbname`.`troops` (`player_tag`, `name`, `level`, `maxLevel`, `village`)
        VALUES ('$tag', '$name', '$level', '$maxLevel', '$village')
        ON DUPLICATE KEY UPDATE 
        `level`='$level', `maxLevel`='$maxLevel', `village`='$village'";
        if ($conn->query($sql) === TRUE) 
        {
            echo "New record created successfully <br>";
        } 
        else 
        {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }

    /*
    * Player Troops
    */
    foreach ($player['spells'] as $spell)
    {
        $name = mysqli_real_escape_string($conn,$spell['name']);
        $level = (int)mysqli_real_escape_string($conn,$spell['level']);
        $maxLevel = (int)mysqli_real_escape_string($conn,$spell['maxLevel']);
        $village = mysqli_real_escape_string($conn,$spell['village']);

        $sql = "INSERT INTO `$dbname`.`spells` (`player_tag`, `name`, `level`, `maxLevel`, `village`)
        VALUES ('$tag', '$name', '$level', '$maxLevel', '$village')
        ON DUPLICATE KEY UPDATE 
        `level`='$level', `maxLevel`='$maxLevel', `village`='$village'";
        if ($conn->query($sql) === TRUE) 
        {
            echo "New record created successfully <br>";
        } 
        else 
        {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    $conn->close();
}

// $result = array(
//     'updatedOn' => time(),
//     'clan' => $clanData,
//     'players' => $playerData
// );

//file_put_contents('../data/clan-info.json', json_encode($result));
//echo $json;
