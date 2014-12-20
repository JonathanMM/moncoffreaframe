<?php
include('include.php');
$smarty->assign('menu', 2);

if(isset($_POST['envoi']) && $_POST['envoi'] == 1 && $_SESSION['connecte'])
{
    $titre = htmlspecialchars($_POST['title']);
    $lien = htmlspecialchars($_POST['link']);
    $dossier = intval($_POST['dossier']);
    if(strlen($titre) > 0 && strlen($lien) > 0)
        $bdd->query('INSERT INTO framatout (titre, type, date_ajout, lien, membre, dossier)
                     VALUES ("'.$titre.'", "'.type_lien($lien).'", NOW(), "'.$lien.'", "'.$_SESSION['courriel'].'", '.$dossier.')');
	if($dossier != 0)
		header('location: index.php?dossier='.$dossier);
	else
		header('location: index.php');
    exit();
}

$type_lien = 0;
$lien = NULL;
if(isset($_GET['lien']))
{
    $lien = urldecode($_GET['lien']);
    $smarty->assign('lien', $lien);
    $type_lien = type_lien($lien);
}
else
    $smarty->assign('lien', '');

if(isset($_GET['titre']))
{
    $titre = urldecode($_GET['titre']);
    if($type_lien != 0 && $lien != NULL)
    {
        $titre = traiter_titre($titre, $type_lien, $lien);
    }
    $smarty->assign('titre', $titre);
}
else
    $smarty->assign('titre', '');

if(isset($_GET['dossier']))
{
    $id_dossier = intval($_GET['dossier']);
    $smarty->assign('id_dossier', $id_dossier);
}
else
    $smarty->assign('id_dossier', 0);
   
$requete = $bdd->query('SELECT id, titre FROM framatout WHERE membre = "'.$_SESSION['courriel'].'" AND type = -1');
$liste_dossiers = array(array('id' => 0, 'nom' => '/'));
while($donnees = $requete->fetch())
{
	$liste_dossiers[] = array( 'id' => $donnees['id'],
                               'nom' => '/'.$donnees['titre']);
}
$smarty->assign('liste_dossiers', $liste_dossiers);

$smarty->display("tpl/ajout.tpl");
?>