<?php echo $header; ?>

    <h1 class="hidden-title"><?php echo $text_home_page; ?></h1>

<?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
<?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
<?php } ?>
    <div id="content" class="  home-page clearfix">
        <section class="clearfix">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-12  col-xs-12">
                        <?php if ($categories) { ?>
                            <nav id="menu" class="navbar">
                                <div class="navbar-header"><span id="category"><?php echo $text_category; ?></span>
                                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse"
                                            data-target=".navbar-ex1-collapse">

                                        <img src="/catalog/view/theme/theme/image/main/bar.png" alt="Иконка "/>

                                    </button>
                                </div>
                                <div class="collapse navbar-collapse navbar-ex1-collapse">
                                    <ul class="nav navbar-nav">

                                        <?php foreach ($categories as $category) { ?>
                                            <?php if ($category['children']) { ?>
                                                <li class="dropdown"><a href="<?php echo $category['href']; ?>"
                                                                        class="dropdown-toggle"
                                                                        data-toggle="dropdown"><?php echo $category['name']; ?></a>
                                                    <div class="dropdown-menu">
                                                        <h3 class="title"><?php echo $category['name']; ?></h3>
                                                        <div class="dropdown-inner">

                                                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                                                <ul class="list-unstyled">
                                                                    <?php foreach ($children as $child) { ?>
                                                                        <li>
                                                                            <?php if (!empty($child['image'])) : ?>
                                                                                <img src="<?= $child['image']; ?>"
                                                                                     alt="иконка">
                                                                            <?php endif; ?>
                                                                            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                        </li>
                                                                    <?php } ?>
                                                                </ul>
                                                            <?php } ?>
                                                        </div>
                                                        <a href="<?php echo $category['href']; ?>"
                                                           class="see-all"><?php echo $text_all; ?><?php echo $category['name']; ?></a>
                                                    </div>
                                                </li>
                                            <?php } else { ?>
                                                <li>
                                                    <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                                </li>
                                            <?php } ?>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </nav>
                        <?php } ?>
                    </div>
                    <div class="home-slider-wrapper col-md-9  col-sm-12 col-xs-12  " style="position: relative;">
                        <div class="slider-home col-lg-7 col-md-12">
                            <ul class="home-slider clearfix">
                                <?php foreach ($banner as $value) { ?>
                                    <li class="item">
                                        <a href="<?= $value['link']; ?>">
                                            <img src="<?= $value['image']; ?>" alt="Изображение">
                                            <div class="text">
                                                <?php
                                                $array = explode(' ', $value['title']);
                                                $array['1'] = '<span>' . $array['1'] . '</span>';
                                                $arrayRedy = implode(" ", $array);
                                                ?>
                                                <?= $arrayRedy ?>
                                            </div>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </div>
                        <div class="banner col-lg-5 col-md-12">
                            <ul class="banner-list clearfix">
                                <?php foreach ($banner_home as $value) { ?>
                                    <li class="item">
                                        <a href="<?= $value['link']; ?>">
                                            <img src="<?= $value['image']; ?>" alt="Изображение">
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </div>




                    </div>
                </div>
            </div>
        </section>
        <section class="clearfix">
            <div class="container">
                <div class="row">
                    <?php echo $content_top; ?><?php echo $content_bottom; ?>
                </div>
            </div>
        </section>
        <section class="cat-section">
            <div class="container">
                <div class="row">
                    <div class="block-title">
                        <h2 class="sub-title"><?php echo $text_sets; ?></h2>
                        <a href="/sets/" class="link-to-all"><?php echo $text_sets_all; ?></a>
                    </div>
                    <ul class="list-specific-products">

                        <?php foreach ($products_set as $product) { ?>
                            <li class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="product-thumb transition">
                                    <div class="top-block">
                                        <div class="sku">
                                            <?php echo $text_articul; ?>: <?php echo $product['sku']; ?>
                                        </div>
                                        <div class="wish">
                                            <a href="#"
                                               onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                <i class="fa fa-heart"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="image">
                                        <a href="<?php echo $product['href']; ?>">
                                            <img src="<?php echo $product['thumb']; ?>"
                                                 alt="<?php echo $product['name']; ?>"
                                                 title="<?php echo $product['name']; ?>"
                                                 class="img-responsive"/>
                                        </a>

                                        <?php if ($product['special']) {
                                            $oldPrice = preg_replace("/[^0-9]/", '', $product['price']);
                                            $price = preg_replace("/[^0-9]/", '', $product['special']);
                                            $sale = 100 * ($oldPrice - $price) / $oldPrice;

                                            echo '<div class="sale">-' . intval($sale) . '%</div>';
                                        } ?>
                                    </div>
                                    <div class="caption">
                                        <div class="categories">
                                            <span><?php echo $text_sets; ?></span>
                                        </div>
                                        <h3 class="title"><a
                                                    href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        </h3>

                                        <?php if ($product['price']) { ?>


                                            <?php if ($product['special']) { ?>
                                                <p class="price">
                                                    <span class="price-new"><?php echo $product['special']; ?></span>
                                                    <span class="price-old"><?php echo $product['price']; ?></span>

                                                </p>
                                            <?php } else { ?>
                                                <p class="price">
                                                    <?php echo $product['price']; ?>
                                                </p>
                                            <?php } ?>
                                        <?php } ?>
                                    </div>

                                </div>
                            </li>
                        <?php } ?>

                    </ul>
                    <div class="wrapper-slider">
                        <div class="slider"></div>
                    </div>

                </div>
            </div>
        </section>
        <section class="clearfix instagram-two-section">
            <div class="container">
                <div class="row">
                    <img class="img-inst" src="/catalog/view/theme/theme/image/main/instagram.png" alt="Перчатка "/>
                    <h2 class="title-inst">Лента Instagram</h2>
                    <a href="https://www.instagram.com/good_fighter_shop" target="_blank"
                       class="link-subscribe">
                        <?php echo $text_sub_inst; ?>
                    </a>
                </div>
                <div class="row">
                    <div id="instagram-widget">
                        <?php
                        $c = curl_init('http://widget.stapico.ru/?q=good_fighter_shop&s=20&w=12&h=1&b=0&p=5&title=good_fighter_shop&profile=no&header=no&effect=0');
                        curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
                        $content = curl_exec($c);

                        $pattern = "|href=\"[^\"]+\"|is";
                        $content = preg_replace($pattern, "href=\"https://www.instagram.com/good_fighter_shop\"", $content);
                        echo $content;
                        ?>
                    </div>
                </div>

                <div class="row">
                    <h3 class="title-gallery text-center"><?php echo $title_look_photos; ?></h3>
                    <div class="w100 row-photo row">
                        <?php foreach ($banner_photo as $key => $value) : ?>

                            <div class="item col">
                                <a href="<?php echo $value['image']; ?>"  data-lightbox="gallery" class="item-bg"  style="background: url('<?php echo $value['image']; ?>'); "></a>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </section>

        <section class="clearfix video-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-12 ">
                        <div class="block-title-alternative">
                            <h2 class="sub-title"><?php echo $text_video_views; ?> </h2>
                            <a href="#" class="link-to-all">
                                <?php echo $text_video_views_all; ?>
                            </a>
                        </div>
                        <div class="clearfix padding-top-90">
                            <ul class="video-list">
                                <li class="col-sm-6">
                                    <a href="#">
                                        <img class="img-glove" src="/catalog/view/theme/theme/image/main/video1.jpg"
                                             alt="Изображение "/>
                                    </a>
                                </li>
                                <li class="col-sm-6">
                                    <a href="#">
                                        <img class="img-glove" src="/catalog/view/theme/theme/image/main/video2.jpg"
                                             alt="Изображение "/>
                                    </a>
                                </li>
                                <li class="col-sm-6">
                                    <a href="#">
                                        <img class="img-glove" src="/catalog/view/theme/theme/image/main/video3.jpg"
                                             alt="Изображение "/>
                                    </a>
                                </li>
                                <li class="col-sm-6">
                                    <a href="#">
                                        <img class="img-glove" src="/catalog/view/theme/theme/image/main/video4.jpg"
                                             alt="Изображение "/>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="text-block-video col-sm-6 col-xs-12 ">
                        <div class="block-title-alternative">
                            <h2 class="sub-title">
                                <?php echo $text_part_one_title; ?>
                            </h2>
                        </div>
                        <p class="padding-top-90 first">
                            <?php echo $text_part_one_text_one; ?>

                        </p>
                        <div class="block-title-alternative two-title">
                            <h2 class="sub-title">
                                <?php echo $text_part_one_title_two; ?>
                            </h2>
                        </div>
                        <p class="second">
                            <?php echo $text_part_one_text_two; ?>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <section class="clearfix  subscribe-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9 col-xs-12">
                        <h3 class="title">
                            <?php echo $text_sub_feed; ?>
                        </h3>
                    </div>
                    <div class="col-sm-3 col-xs-12">
                        <?php echo $sobfeedback_id33; ?>
                    </div>
                </div>
            </div>


        </section>
        <section class="clearfix last-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-xs-12">
                        <br>
                        <br>
                        <br>
                        <?php echo $text_last_text ?>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
    </div>
    </section>
    </div>
<?php echo $footer; ?>