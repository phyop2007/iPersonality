//Short for $(document).ready( function(){});

$(function() {

});

$("#reset").on('click',function () {
	  location.reload();
});
	
$("#cloneButton").on('click',function () {
  var $lastItem = $('.cloneBox').last(),
  	  $newItem = $lastItem.clone(true);

 $newItem
  	.find('input, :checkbox').val('')
  	.prop('checked',false)
	.end()
	.insertAfter($lastItem);
});

$('#save').on('click',function() {
	var $link = $(this).data('link');
	
	if($link == 'job_save') {
		$('form#job_cat_form').submit();
		/*
		var $form_data = $('#job_cat_form').serialize();
		$.ajax({ url : 'index.cfm?p_action=work',
			type: "post", data: $form_data, dataType : "text"});
		*/	
	}
	else if ($link == 'personality_save') {
		$('form#personality_cat_form').submit();
	}
	else if ($link == 'per_job_save') {
		$('form#per_job_form').submit();
	}
	
});
