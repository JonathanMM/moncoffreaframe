{include file="tpl/haut.tpl"}
{include file="tpl/menu.tpl"}
<div class="container">
    <div class="starter-template">
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
                        <td></td>
                        <td><a href="{$lien.lien}">{$lien.titre}</a></td>
                        <td>{$lien.type}</td>
                        <td>{$lien.date_ajout}</td>
                        <td>
                            <a href="{$lien.lien}"><span class="glyphicon glyphicon-link"></span></a>
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