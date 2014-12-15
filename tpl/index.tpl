{include file="tpl/haut.tpl"}
{include file="tpl/menu.tpl"}
<div class="container">
	<div class="starter-template">
		<div class="row">
			<div class="col-md-{if $racine}6{else}3{/if}" style="text-align: left;">
				<!--                <a href="ajout.php{if !$racine}?dossier={$id_dossier}{/if}">
<button type="button" class="btn btn-default">
<span class="glyphicon glyphicon-plus"></span> Ajouter un fichier
</button>
</a>-->
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span class="glyphicon glyphicon-plus"></span> Ajouter <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="ajout.php{if !$racine}?dossier={$id_dossier}{/if}"><span class="glyphicon glyphicon-link"></span> Lien</a></li>
						<li><a href="#" data-toggle="modal" data-target="#newFile" data-type="framapad"><span class="glyphicon glyphicon-file"></span> Framapad</a></li>
						<li><a href="#" data-toggle="modal" data-target="#newFile" data-type="framacalc"><span class="glyphicon glyphicon-th"></span> Framacalc</a></li>
						{if $racine}
						<li class="divider"></li>
						<li><a href="#" data-toggle="modal" data-target="#newFolder"><span class="glyphicon glyphicon-folder-close"></span> Dossier</a></li>
						{/if}
						<!--					<li><a href="#">Another action</a></li>
<li><a href="#">Something else here</a></li>
<li><a href="#">Separated link</a></li>-->
					</ul>
				</div>
			</div> 
			{if !$racine}
			<div class="col-md-3" style="text-align: left;">
				<a href="/">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-eject"></span> Retour à l'accueil
					</button>
				</a>
			</div>
			{/if}
			<div class="col-md-6">
				<div class="input-group">
					<form method="post" role="form" action="rechercher.php">
						<input type="text" class="form-control" name="label" placeholder="Rechercher{if !$racine} dans ce dossier{/if}" required />
						<input type="hidden" name="envoi" value="1" />
						{if !$racine}<input type="hidden" name="dossier" value="{$id_dossier}" />{/if}
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
			</div>
		</div>
		{if $racine}
		<div class="modal fade" id="newFolder" tabindex="-1" role="dialog" aria-labelledby="Nouveau dossier" aria-hidden="false">
			<div class="modal-dialog" style="z-index: 1042;">
				<div class="modal-content">
					<form method="post" role="form" action="ajout_dossier.php">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title" id="myModalLabel">Nouveau dossier</h4>
						</div>
						<div class="modal-body">
							<input type="text" class="form-control" name="nom" placeholder="Nouveau dossier" required />
							<input type="hidden" name="envoi" value="1" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
							<button class="btn btn-primary" type="submit">Créer</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		{/if}
		<div class="modal fade" id="newFile" tabindex="-1" role="dialog" aria-labelledby="Nouveau fichier" aria-hidden="false">
			<div class="modal-dialog" style="z-index: 1042;">
				<div class="modal-content">
					<form class="form-horizontal" role="form" method="post" action="ajout.php">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title" id="myModalLabel">Nouveau fichier</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">Titre</label>
								<div class="col-sm-10">
									<input class="form-control" name="title" id="newfile_title" placeholder="Titre" required />
								</div>
							</div>
							<div class="form-group">
								<label for="link" class="col-sm-2 control-label">Lien</label>
								<div class="col-sm-10">
									<input class="form-control" name="link" id="newfile_link" placeholder="Lien" required />
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<input type="hidden" name="envoi" value="1" />
							<input type="hidden" name="dossier" value="{$id_dossier}" />
							<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
							<button class="btn btn-primary" type="submit">Créer</button>
						</div>
					</form>
				</div>
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
							{if $lien.telecharger}
							<a href="{$lien.telecharger}"><span class="glyphicon glyphicon-download-alt"></span></a>
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
<script type="application/javascript" src="tpl/js/ajout_button.min.js"></script>
{include file="tpl/bas.tpl"}