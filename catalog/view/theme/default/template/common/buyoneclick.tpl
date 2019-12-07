<div class="row">
    <?php if ($product) { ?>
		<div class="col-xs-12 col-sm-6">
			<div class="image"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></div>
		</div>
		<div class="col-xs-12 col-sm-6">
			<div class="caption">
				<h2><?php echo $product['name']; ?></h2>
				<?php if (!$product['special']) { ?>
					<h3><?php echo $product['price']; ?></h3>
				<?php } else { ?>
					<h3><?php echo $product['special']; ?></h3>
				<?php } ?>				
				<?php if ($product['option']) { ?>
					<div class="product_options text-right">
						<?php foreach ($product['option'] as $option) { ?>
						- <small>
							<?php 
								echo $option['name'] . ' ' . $option['value'];
								echo ($option['value_price']) ? ' (' . $option['value_price_prefix'] . $option['value_price'] . ')' : '';
							?>
						</small>
						<br />
						<?php } ?>
					</div>
				<?php } ?>
			</div>
			<br />
			<div class="h4 text-right">x <?php echo $product['quantity']; ?> = <?php echo $product['total']; ?></div>
		</div>
    <?php } else { ?>
		<div class="col-xs-12">
			<p class="text-center"><?php echo $text_empty; ?></p>
		</div>
    <?php } ?>
</div>
