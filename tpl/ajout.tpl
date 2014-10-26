{include file="tpl/haut.tpl"}
{include file="tpl/menu.tpl"}
<div class="container">
    <div class="starter-template">
        <form class="form-horizontal" role="form" method="post">
          <div class="form-group">
            <label for="title" class="col-sm-2 control-label">Titre</label>
            <div class="col-sm-10">
              <input class="form-control" name="title" id="title" placeholder="Titre" value="{$titre}" required />
            </div>
          </div>
          <div class="form-group">
            <label for="link" class="col-sm-2 control-label">Lien</label>
            <div class="col-sm-10">
              <input class="form-control" name="link" id="link" placeholder="Lien" value="{$lien}" required />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Dossier</label>
            <div class="col-sm-10">
                <select class="form-control" name="dossier">
                    {foreach from=$liste_dossiers item=dossier}
                        <option value="{$dossier.id}" {if $dossier.id = $id_dossier}selected{/if}>{$dossier.nom}</option>
                    {/foreach}
                </select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <input type="hidden" name="envoi" value="1" />
              <button type="submit" class="btn btn-default">Ajouter</button>
            </div>
          </div>
        </form>
    </div>
</div>
{include file="tpl/bas.tpl"}