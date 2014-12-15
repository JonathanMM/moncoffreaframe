<?php
function getListInstanceFramapad()
{
	$framapad = new DOMDocument();
	@$framapad->loadHTMLFile("http://framapad.org/");
	$node = $framapad->getElementById('expiration')->getElementsByTagName('option');
	$liste_instance = array();
	for($i = 0; $i < $node->length; $i++){
		$nom = $node->item($i)->nodeValue;
		$path = $node->item($i)->getAttribute('value');
		$liste_instance[] = array('nom' => $nom, 'path' => 'http://'.$path.'.framapad.org/p/');
	}
	return $liste_instance;
}
?>