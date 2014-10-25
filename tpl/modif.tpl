{include file="tpl/haut.tpl"}
{include file="tpl/menu.tpl"}
<div class="container">
    <div class="starter-template">
        <form class="form-horizontal" role="form" method="post">
          <div class="form-group">
            <label for="title" class="col-sm-2 control-label">Titre</label>
            <div class="col-sm-10">
              <input class="form-control" name="title" id="title" placeholder="Titre" value="{$titre}">
            </div>
          </div>
          <div class="form-group">
            <label for="link" class="col-sm-2 control-label">Lien</label>
            <div class="col-sm-10">
              <input class="form-control" name="link" id="link" placeholder="Lien" value="{$lien}">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <input type="hidden" name="envoi" value="1" />
              <input type="hidden" name="id" value="{$id}" />
              <button type="submit" class="btn btn-default">Ajouter</button>
            </div>
          </div>
        </form>
    </div>
</div>
{include file="tpl/bas.tpl"}