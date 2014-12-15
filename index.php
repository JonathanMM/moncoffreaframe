<?php
include('include.php');
$smarty->assign('menu', 1);

$id_dossier = 0;
if(isset($_GET['dossier']) && intval($_GET['dossier']) > 0)
{
    $id_dossier = intval($_GET['dossier']);
    $smarty->assign('racine', false);
} else {
    $smarty->assign('racine', true);
}

$smarty->assign('id_dossier', $id_dossier);
    
$requete = $bdd->query('SELECT * FROM framatout WHERE membre = "'.$_SESSION['courriel'].'" AND dossier = '.$id_dossier.' ORDER BY type = -1 DESC, date_ajout DESC');
$liste_liens = array();
while($donnees = $requete->fetch())
{
	$liste_liens[] = array( 'id' => $donnees['id'],
                            'titre' => $donnees['titre'],
                            'lien' => $donnees['lien'],
                            'type' => nom_type($donnees['type']),
						    'telecharger' => lien_type($donnees['lien'], $donnees['type']),
                            'dossier' => ($donnees['type'] == -1),
                            'date_ajout' => formater_dateheure_fr($donnees['date_ajout']));
}
$smarty->assign('liste_liens', $liste_liens);

if($_SESSION['connecte'])
    $smarty->display("tpl/index.tpl");
else
    $smarty->display("tpl/accueil.tpl");
?>