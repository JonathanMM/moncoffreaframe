<?php
include('include.php');
$smarty->assign('menu', 2);

if(!$_SESSION['connecte'])
{
    header('location: index.php');
    exit();
}

$id = intval($_GET['id']);
$requete = $bdd->query('SELECT id, type FROM framatout WHERE id = '.$id.' AND membre = "'.$_SESSION['courriel'].'"');
$donnees = $requete->fetch();
if(count($donnees) != 0)
{
    $bdd->query('DELETE FROM framatout WHERE id = '.$id);
    //Si c'était un dossier, tout son contenu passe dans la racine
    if($donnees['type'] == -1)
    {
        $bdd->query('UPDATE framatout SET dossier = 0 WHERE membre = "'.$_SESSION['courriel'].'" AND dossier = '.$id);
    }
}

header('location: index.php');
?>