$(document).ready(function() {
	$('#boc_form input').focus(function(){
		$(this).parent().removeClass('has-error');
	});
    $('#boc_form').submit(function(event) {
		event.preventDefault ? event.preventDefault() : (event.returnValue = false);
		if(!formValidation(event.target)){return false;}
		var sendingForm = $(this);
		var submit_btn = $(this).find('button[type=submit]');
		var value_text = $(submit_btn).text();
		var waiting_text = 'SENDING';
		$.ajax({
			url: 'index.php?route=checkout/buyoneclick/submit',
			type: 'post',
			data: $('#boc_form input[type=\'hidden\'], #boc_form input[type=\'text\'], #boc_form input[type=\'tel\'], #boc_form input[type=\'email\'], #boc_form textarea'),
			dataType: 'json',
			beforeSend: function() {
				$(submit_btn).prop( 'disabled', true );
				$(submit_btn).addClass('waiting').text(waiting_text);
			},
			complete: function() {
				$(submit_btn).button('reset');
			},
			success: function(json) {
				if (json['error']) {
					if (json['error']['telephone']) {
						$('.breadcrumb').after('<div class="alert alert-danger text-danger">' + json['error']['telephone'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}
					if (json['error']['product']) {
						$('.breadcrumb').after('<div class="alert alert-danger text-danger">' + json['error']['product'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}
					if (json['error']['order']) {
						$('.breadcrumb').after('<div class="alert alert-danger text-danger">' + json['error']['order'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}
				}

				if (json['success']) {
					var success = true;
					$(sendingForm).trigger('reset');
					$(submit_btn).removeClass('waiting');
					$(submit_btn).text(value_text);
					$(submit_btn).prop( 'disabled', false );
					$('#boc_order').modal('hide');
					$('#boc_order').on('hidden.bs.modal', function (e) {
						if (success) {
							$('#boc_success').modal('show');
							setTimeout(function(){
									console.log('success sending!');
									$('#boc_success').modal('hide');
							}, 4000);
							success = false;
						}
					});
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				$(submit_btn).prop( 'disabled', false );
				$(submit_btn).removeClass('waiting').text("ERROR");
				setTimeout(function(){
					$(submit_btn).delay( 3000 ).text(value_text);
				}, 3000);				
			}
		});
		event.preventDefault();
    });
});
function formValidation(formElem){
	var elements = $(formElem).find('.required');
	var errorCounter = 0;
	$(elements).each(function(indx,elem){
		var placeholder = $(elem).attr('placeholder');
		if($.trim($(elem).val()) == '' || $(elem).val() == placeholder){
			$(elem).parent().addClass('has-error');
			errorCounter++;
		} else {
			$(elem).parent().removeClass('has-error');
		}
	});  
	
	if ($('#boc_agree').length) {
		if ($('#boc_agree').is(':checked')) { 
			$('#boc_agree').parent().parent().removeClass('has-error');
		} else {
			// console.log('Checkbox agree not checked!!!');
			$('#boc_agree').parent().parent().addClass('has-error');
			errorCounter++;	
		}
	}
	
	$(formElem).find('input[name="boc_phone"]').each(function() {
		var pattern = new RegExp(/^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$/);
		var data_pattern = $(this).attr('data-pattern');
		var data_placeholder = $(this).attr('placeholder');
		console.log(pattern.test($(this).val()));
		if(!pattern.test($(this).val()) || $.trim($(this).val()) == '' ){
			console.log('NON valid phone!');
			$('input[name="boc_phone"]').parent().addClass('has-error');
			errorCounter++;
		} else if (data_pattern == 'true') {
			console.log('data-pattern = true');
			if ($(this).val().length != data_placeholder.length) {
				console.log('Phone too short!!!');
				$('input[name="boc_phone"]').parent().addClass('has-error');
				errorCounter++;
			}
		} else {
			$(this).parent().removeClass('has-error');
		}
	});
	if (errorCounter > 0) {
		return false;
	} else {
		return true;
	}
}