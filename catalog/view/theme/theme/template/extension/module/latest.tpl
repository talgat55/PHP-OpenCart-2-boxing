<div class="block-title">
    <h2 class="sub-title"><?php echo $heading_title; ?></h2>
    <a href="/new" class="link-to-all">Все новинки</a>
</div>

<div class="row latest-block">
    <?php foreach ($products as $product) { ?>
    <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="product-thumb transition">
            <div class="top-block">
                <div class="sku">
                    Артикул: <?php echo $product['sku']; ?>
                </div>
                <div class="wish">
                    <a href="#" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                        <i class="fa fa-heart"></i>
                    </a>
                </div>
            </div>
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                              alt="<?php echo $product['name']; ?>"
                                                                              title="<?php echo $product['name']; ?>"
                                                                              class="img-responsive"/></a></div>
            <div class="caption">
                <div class="categories">
                    <span>Новинки</span>
                </div>
                <h3 class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>

                <?php if ($product['price']) { ?>
                <p class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-new"><?php echo $product['special']; ?></span> <span
                            class="price-old"><?php echo $product['price']; ?></span>
                    <?php } ?>

                </p>
                <?php } ?>
            </div>

        </div>
    </div>
    <?php } ?>
</div>
