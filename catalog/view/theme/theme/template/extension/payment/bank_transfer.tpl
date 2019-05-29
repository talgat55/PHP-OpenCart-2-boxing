<h2><?php echo $text_instruction; ?></h2>
<p><b><?php echo $text_description; ?></b></p>
<div class="well well-sm">
  <dl>
    <dt>Имя владельца счета</dt>
    <dd>Индивидуальный предприниматель Шангин Евгений Николаевич</dd>
    <dt>Пожалуйста, включите эти данные</dt>
    <dd>ТОЧКА ПАО БАНКА «ФК ОТКРЫТИЕ»<br>ИНН 550705051190<br>БИК 044525999<br>р/с 40802810601500011334<br>к/с 30101810845250000999</dd>
    <dt>Название банка</dt>
    <dd>«ФК ОТКРЫТИЕ» Г.Москва</dd>
  </dl>
  <p><?php echo $text_payment; ?></p>
</div>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" data-loading-text="<?php echo $text_loading; ?>" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=extension/payment/bank_transfer/confirm',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>
