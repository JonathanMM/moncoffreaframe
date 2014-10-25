<?php

//PDO
try{
  $dns = 'mysql:host=localhost;dbname=';
  $utilisateur = '';
  $motDePasse = '';
  $bdd = new PDO( $dns, $utilisateur, $motDePasse );
} catch ( Exception $e ) {
        echo "Connexion à MySQL impossible : ", $e->getMessage();
        die();
}
?>