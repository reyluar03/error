
<?php
error_reporting(E_ERROR | E_PARSE);
ini_set('display_errors', '1');
//include('config.php');


$DB_host = '185.61.137.171';
$DB_user = 'ffastvpn_rey';
$DB_pass = 'ffastvpn_rey';
$DB_name = 'ffastvpn_db';

$mysqli = new MySQLi($DB_host,$DB_user,$DB_pass,$DB_name);
if ($mysqli->connect_error) {
    die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
}

$data = '';
#Active Accounts
$premium_active = "is_validated=1 AND frozen=0 AND duration > 0";
$vip_active = "is_validated=1 AND frozen=0 AND vip_duration > 0";
$private_active = "is_validated=1 AND frozen=0 AND private_duration > 0";
$query = $mysqli->query("SELECT * FROM users WHERE ".$premium_active." OR ".$vip_active." OR ".$private_active." ORDER by user_id DESC");
if($query->num_rows > 0)
{
	while($row = $query->fetch_assoc())
	{
		$data .= '';
		$username = $row['user_name'];
		$password = $row['user_pass'];
		$data .= 'yes | sh l2tp_add.sh '.$username.' '.$password.''.PHP_EOL;
	}
}
$location = '/root/rey/l2tp-active.sh';
$fp = fopen($location, 'w');
fwrite($fp, $data) or die("Unable to open file!");
fclose($fp);

#In-Active and Invalid Accounts
$data2 = '';
$premium_deactived = "duration <= 0";
$vip_deactived = "vip_duration <= 0";
$private_deactived = "private_duration <= 0";
$is_validated = "is_validated=0";
$is_activate = "is_active=0";
$freeze = "frozen=1";

$query2 = $mysqli->query("SELECT * FROM users WHERE ".$is_validated." OR ".$freeze." OR  ".$premium_deactived ." OR ".$vip_deactived." OR ".$private_deactived."
");
if($query2->num_rows > 0)
{
	while($row2 = $query2->fetch_assoc())
	{
		$data2 .= '';
		$toadd = $row2['user_name'];	
		$data2 .= 'yes | sh l2tp_delete.sh '.$username.''.PHP_EOL;
	}
}
$location2 = '/root/rey/l2tp-not-active.sh';
$fp = fopen($location2, 'w');
fwrite($fp, $data2) or die("Unable to open file!");
fclose($fp);

$mysqli->close();
?>
1