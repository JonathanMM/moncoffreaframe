{include file="tpl/haut.tpl"}
{include file="tpl/menu.tpl"}
<div class="container">
    <div class="starter-template">
        <div class="row">
            <div class="col-md-2">
                {if $racine}
                    <div class="input-group">
                        <form method="post" role="form" action="ajout_dossier.php">
                              <input type="text" class="form-control" name="nom" placeholder="Nouveau dossier" />
                              <input type="hidden" name="envoi" value="1" />
                              <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                  <span class="glyphicon glyphicon-folder-close"></span>
                                </button>
                              </span>
                        </form>
                    </div>
                {/if}
            </div>
            <div class="col-md-2">
                <a href="ajout.php{if !$racine}?dossier={$id_dossier}{/if}">
                    <button type="button" class="btn btn-default">
                      <span class="glyphicon glyphicon-plus"></span> Ajouter un fichier
                    </button>
                </a>
            </div>
            <div class="col-md-8">
                <!--<div class="input-group">
                  <input type="text" class="form-control" placeholder="Rechercher" />
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                      <span class="glyphicon glyphicon-search"></span>
                    </button>
                  </span>
                </div>-->
            </div>
        </div>
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