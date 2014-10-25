<?php
include('include.php');
$smarty->assign('menu', 2);

if(isset($_POST['envoi']) && $_POST['envoi'] == 1 && $_SESSION['connecte'])
{
    $titre = htmlspecialchars($_POST['title']);
    $lien = htmlspecialchars($_POST['link']);
    $bdd->query('INSERT INTO framatout (titre, type, date_ajout, lien, membre)
                 VALUES ("'.$titre.'", "'.type_lien($lien).'", NOW(), "'.$lien.'", "'.$_SESSION['courriel'].'")');
    header('location: index.php');
    exit();
}

if(isset($_GET['lien']))
    $smarty->assign('lien', urldecode($_GET['lien']));
else
    $smarty->assign('lien', '');

if(isset($_GET['titre']))
    $smarty->assign('titre', urldecode($_GET['titre']));
else
    $smarty->assign('titre', '');
    
$smarty->display("tpl/ajout.tpl");
?>