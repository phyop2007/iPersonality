//Short for $(document).ready( function(){});

$(function() {
	$('.per_result').hide();
});

$('#show_per_result').on('click', function (event,state) {
	var $form_data = $('#frm_per_job_result').serialize();
	$.ajax({ 
		url : 'fe_ajax.cfm?p_action=show_per_result',
		type: "post", 
		data: $form_data, 
		dataType : "text",
		success : function(string_data) {
			var return_html = '<ul>';
			$.each(string_data.split('|'), function(){
			  return_html = return_html + '<li>'+ this + '</li>';
			});
			
			return_html = return_html + '</ul>';
			//console.log(return_html);
			$('.per_result').html(return_html);
			$('.per_result').show();
		}
	});
	//$('.per_result').toggle();
});
