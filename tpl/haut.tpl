<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="tpl/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="tpl/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" type="text/css" href="tpl/css/style.min.css" />
        <script type="text/javascript" src="tpl/js/persona.js"></script>
        <script type="text/javascript" src="tpl/js/script.js"></script>
        <title>Framatout (non officiel)</title>
        <script type="application/javascript">
            {nocache}var utilisateur = "{$session_courriel}";{/nocache}
            navigator.id.watch( {
            loggedInUser: utilisateur,
                onlogin: se_connecter,
                onlogout: se_deconnecter } );
        </script>
    </head>
    <body>