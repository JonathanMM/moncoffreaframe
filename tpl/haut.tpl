<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="tpl/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="tpl/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" type="text/css" href="tpl/css/style.min.css" />
        <script type="text/javascript" src="tpl/js/jquery.min.js"></script>
        <script type="text/javascript" src="tpl/js/bootstrap.min.js"></script>
		<script type="application/javascript" src="tpl/js/jszip.min.js"></script>
		<script type="application/javascript" src="tpl/js/FileSaver.js"></script>
        <script type="text/javascript" src="tpl/js/persona.js"></script>
	    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
        <script type="text/javascript" src="tpl/js/script.js"></script>
        <title>Mon coffre à frame</title>
        <script type="application/javascript">
            {nocache}var utilisateur = "{$session_courriel}";{/nocache}
            navigator.id.watch( {
            loggedInUser: utilisateur,
                onlogin: se_connecter,
                onlogout: se_deconnecter } );
        </script>
    </head>
    <body>