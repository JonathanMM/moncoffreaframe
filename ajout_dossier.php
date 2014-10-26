<?php
include('include.php');
$smarty->assign('menu', 2);

if(isset($_POST['envoi']) && $_POST['envoi'] == 1 && $_SESSION['connecte'])
{
    $nom_dossier = htmlspecialchars($_POST['nom']);
    if(strlen($nom_dossier) > 0)
        $bdd->query('INSERT INTO framatout (titre, type, date_ajout, membre)
                     VALUES ("'.$nom_dossier.'", "-1", NOW(), "'.$_SESSION['courriel'].'")');
}
header('location: index.php');
?>