<?php
require('libs/fonctions.php');
if(isset($_GET['u']) && $_GET['u'] == 'getListInstance' && isset($_GET['p']))
{
	$array;
	if($_GET['p'] == 'framapad')
	{
		$array = getListInstanceFramapad();
	}
	elseif($_GET['p'] == 'framacalc')
	{
		$array = getListInstanceFramacalc();
	}
	echo $array[0]['path'].genererCodeAleatoire(12);
}
?>