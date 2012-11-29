$(document).ready(function(){
	$( "#sortable" ).sortable({
		update: function(e){
			$.ajax({
				type: 'POST',
				url: '/tasks/sort',
				data: $(this).sortable('serialize')
			});
		}
	})
	$( "#sortable span" ).disableSelection();

	$(".editable").on("dblclick", replaceHTML);  

	function replaceHTML() {

		current_value = $(this).text();
		old_value = current_value;
		$(this).html('');
		$(this).html('<form><input type="text" id="edit_field" class="small_input" value="' + current_value +'"></form>');  
		
		$('#edit_field').focus();

		$('#edit_field').keyup(function(){
			current_value = $(this).val();
		});

		$(document).keypress(function(e) {
	    if(e.which == 13 && $("#edit_field").is(":focus")) {
	        sendAjax();
	    }
		});

		$(document).on("click", function(e){
			if(e.target.id != 'edit_field') {
				sendAjax();
			}
		});

		function sendAjax() {
			if(old_value != current_value) {
					id = parseInt($('#edit_field').closest('li').attr('id').replace("task_", ""));
					$.ajax({
						type: 'POST',
						url:  '/tasks/' + id,
						data: {
							_method:'PUT',
							content: current_value,
						}
					});
				}
				$('#edit_field').parent().html('<span class=>' + current_value + '</span>');
		}

	}
	
});

