{include file="tpl/haut.tpl"}
{include file="tpl/menu.tpl"}
<div class="container">
    <div class="starter-template">
        <h2>Résultat de recherche pour « {$label} »</h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th></th>
                        <th>Titre</th>
                        <th>Type</th>
                        <th>Date d'ajout</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$liste_liens item=lien}
                    <tr>
                        <td>
                            {if $lien.dossier}
                                <span class="glyphicon glyphicon-folder-open"></span>
                            {/if}
                        </td>
                        <td>
                            {if !$lien.dossier}
                                <a href="{$lien.lien}">{$lien.titre}</a>
                            {else}
                                <a href="?dossier={$lien.id}">{$lien.titre}</a>
                            {/if}
                        </td>
                        <td>{$lien.type}</td>
                        <td>{$lien.date_ajout}</td>
                        <td>
                            {if !$lien.dossier}
                                <a href="{$lien.lien}"><span class="glyphicon glyphicon-link"></span></a>
                            {/if}
                            <a href="modif.php?id={$lien.id}"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="supp.php?id={$lien.id}"><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>
{include file="tpl/bas.tpl"}