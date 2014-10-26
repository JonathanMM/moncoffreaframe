<?php
include('include.php');
$smarty->assign('menu', 2);

if(!$_SESSION['connecte'])
{
    header('location: index.php');
    exit();
}

if(isset($_POST['envoi']) && $_POST['envoi'] == 1)
{
    $titre = htmlspecialchars($_POST['title']);
    $lien = htmlspecialchars($_POST['link']);
    $id = intval($_POST['id']);
    $dossier = intval($_POST['dossier']);
    if(strlen($titre) > 0 && strlen($lien) > 0 && $id > 0)
        $bdd->query('UPDATE framatout
                    SET titre = "'.$titre.'", lien = "'.$lien.'", dossier = "'.$dossier.'"
                    WHERE id = '.$id.' AND membre = "'.$_SESSION['courriel'].'"');
    header('location: index.php');
    exit();
}
$id = intval($_GET['id']);
$requete = $bdd->query('SELECT titre, lien, dossier, type FROM framatout WHERE id = '.$id.' AND membre = "'.$_SESSION['courriel'].'"');
$donnees = $requete->fetch();
if(count($donnees) == 0)
    header('location: index.php');
else
{
    $smarty->assign(array(
        'id' => $id,
        'titre' => $donnees['titre'],
        'lien' => $donnees['lien'],
        'type' => $donnees['type'],
        'id_dossier' => $donnees['dossier']
    ));
    $requete = $bdd->query('SELECT id, titre FROM framatout WHERE membre = "'.$_SESSION['courriel'].'" AND type = -1');
    $liste_dossiers = array(array('id' => 0, 'nom' => '/'));
    while($donnees = $requete->fetch())
    {
        $liste_dossiers[] = array( 'id' => $donnees['id'],
                                   'nom' => '/'.$donnees['titre']);
    }
    $smarty->assign('liste_dossiers', $liste_dossiers);
    $smarty->display("tpl/modif.tpl"); 
}
?>