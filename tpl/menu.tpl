<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.php">Mon coffre à frame</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li {if $menu == 1} class="active" {/if}><a href="index.php">Accueil</a></li>
                {if $session_connecte}
                <li {if $menu == 2} class="active" {/if}><a href="ajout.php">Ajouter</a></li>
                <li {if $menu == 3} class="active" {/if}><a href="marque-page.php">Marque page</a></li>
                <li><a href="#" id="nav_deconnexion" onclick="navigator.id.logout();">Deconnexion</a></li>
                {else}
                <li><a href="#" id="nav_connexion" onclick="navigator.id.request();">Connexion (Persona)</a></li>
                {/if}
            </ul>
        </div>
    </div>
</div>