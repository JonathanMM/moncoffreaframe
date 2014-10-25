<?php
require('include.php');

if(isset($_POST['assert']))
{
	$url = 'https://verifier.login.persona.org/verify';
	$assert = $_POST['assert'];
	//utiliser la superglobale $_POST pour PHP < 5.2 et écrire votre propre filtre 
	$params = 'assertion=' . urlencode($assert) . '&audience=' .
		  urlencode('http://framatout.nocle.fr:80');
	$ch = curl_init();
	$options = array(
	    CURLOPT_URL => $url,
	    CURLOPT_RETURNTRANSFER => TRUE,
	    CURLOPT_POST => 2,
	    CURLOPT_POSTFIELDS => $params
	);
	curl_setopt_array($ch, $options);
	$result = curl_exec($ch);
	curl_close($ch);
	$tab = json_decode($result, true);
	if($tab['status'] == 'okay')
	{
        $_SESSION['connecte'] = true;
		$_SESSION['courriel'] = $tab['email'];
	}
}
?>