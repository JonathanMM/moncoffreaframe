<?php
include('include.php');
$smarty->assign('menu', 1);
$requete = $bdd->query('SELECT * FROM framatout WHERE membre = "'.$_SESSION['courriel'].'"');
$liste_liens = array();
while($donnees = $requete->fetch())
{
	$liste_liens[] = array( 'id' => $donnees['id'],
                            'titre' => $donnees['titre'],
                            'lien' => $donnees['lien'],
                            'type' => nom_type($donnees['type']),
                            'date_ajout' => formater_dateheure_fr($donnees['date_ajout']));
}
$smarty->assign('liste_liens', $liste_liens);

$smarty->display("tpl/index.tpl");
?>