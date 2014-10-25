<?php
session_start();
include('configuration.php');
require("libs/Smarty.class.php");
include('libs/fonctions.php');

//Smarty
$smarty = new Smarty();
//$smarty->caching = 2;
//$smarty->cache_lifetime = 300;
$smarty->compile_check = true;

if(!isset($_SESSION['connecte']) || !$_SESSION['connecte'])
{
    $_SESSION['connecte'] = false;
    $_SESSION['courriel'] = '';
}

$smarty->assign(array(
    'session_connecte' => $_SESSION['connecte'],
    'session_courriel' => $_SESSION['courriel']
));

//Accolades
$smarty->assign(array(
	'ag' => '{',
	'ad' => '}'));
?>