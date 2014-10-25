<?php
include('include.php');
$smarty->assign('menu', 2);

if(!$_SESSION['connecte'])
{
    header('location: index.php');
    exit();
}

$id = intval($_GET['id']);
$requete = $bdd->query('SELECT titre, lien FROM framatout WHERE id = '.$id.' AND membre = "'.$_SESSION['courriel'].'"');
$donnees = $requete->fetch();
if(count($donnees) != 0)
    $bdd->query('DELETE FROM framatout WHERE id = '.$id);

header('location: index.php');
?>