{include file="tpl/haut.tpl"}
{include file="tpl/menu.tpl"}
<div class="container">
    <div class="starter-template">
        <p>Vous pouvez utiliser ce marque-page pour ajouter en un clic un document sur Framatout (non officiel).</p>
        <p><a href="javascript:(function(){$ag}open('http://framatout.nocle.fr/ajout.php?titre='+encodeURIComponent(document.title)+'&lien='+encodeURIComponent(document.location.href),'_blank').focus();{$ad})();">Ajouter sur Framatout (non officiel)</a></p>
        <p><i>Glisser-déposer ce lien dans votre barre de marque-page ou clic droit > Marquer ce lien comme marque-page.</i></p>
    </div>
</div>
{include file="tpl/bas.tpl"}