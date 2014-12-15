$('#newFile').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget); // Button that triggered the modal
	var type = button.data('type'); // Extract info from data-* attributes
	var modal = $(this);
	$.ajax('api.php?u=getListInstance&p='+type,{
		success: function(link)
		{
			modal.find('.modal-body #newfile_link').val(link);
		}
	});
})