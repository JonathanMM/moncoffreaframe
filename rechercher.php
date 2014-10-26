<?php
include('include.php');
$smarty->assign('menu', 0);

if(isset($_POST['envoi']) && $_POST['envoi'] == 1 && $_SESSION['connecte'])
{

    $plus_sql = '';
    if(isset($_POST['dossier']) && intval($_POST['dossier']) > 0)
    {
        $plus_sql = ' AND dossier = '.intval($_POST['dossier']);
    }
    
    $tab_mots = array();
    $label = htmlspecialchars($_POST['label']);
    $smarty->assign('label', $label);
    $coupe = explode(' ', $label);
    foreach($coupe as $mot)
    {
        if(strlen($mot) > 3)
            $tab_mots[] = $mot;
    }
    $requete_txt = ' AND titre LIKE "%'.implode('%" AND titre LIKE "%', $tab_mots).'%"';

    $requete = $bdd->query('SELECT * FROM framatout WHERE membre = "'.$_SESSION['courriel'].'"'.$plus_sql.$requete_txt.' ORDER BY type = -1 DESC, date_ajout DESC');
    $liste_liens = array();
    while($donnees = $requete->fetch())
    {
        $liste_liens[] = array( 'id' => $donnees['id'],
                                'titre' => $donnees['titre'],
                                'lien' => $donnees['lien'],
                                'type' => nom_type($donnees['type']),
                                'dossier' => ($donnees['type'] == -1),
                                'date_ajout' => formater_dateheure_fr($donnees['date_ajout']));
    }
    $smarty->assign('liste_liens', $liste_liens);

    $smarty->display("tpl/rechercher.tpl");
}
?>