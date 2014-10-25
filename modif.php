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
    $bdd->query('UPDATE framatout
                 SET titre = "'.$titre.'", lien = "'.$lien.'"
                 WHERE id = '.$id.' AND membre = "'.$_SESSION['courriel'].'"');
    header('location: index.php');
    exit();
}
$id = intval($_GET['id']);
$requete = $bdd->query('SELECT titre, lien FROM framatout WHERE id = '.$id.' AND membre = "'.$_SESSION['courriel'].'"');
$donnees = $requete->fetch();
if(count($donnees) == 0)
    header('location: index.php');
else
{
    $smarty->assign(array(
        'id' => $id,
        'titre' => $donnees['titre'],
        'lien' => $donnees['lien']
    ));
    $smarty->display("tpl/modif.tpl"); 
}
?>