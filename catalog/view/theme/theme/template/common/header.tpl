<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title;  ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="<?php echo $og_url; ?>"/>
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>"/>
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>"/>
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

    <!-- <link href="catalog/view/theme/theme/stylesheet/stylesheet.css" rel="stylesheet"> -->
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <link href="catalog/view/theme/theme/stylesheet/style.css" rel="stylesheet">



    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>

    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>

    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
</head>
<body class="<?php echo $class; ?>">

<div id="top-bar">
    <div class="container">
        <div class="row">
            <div class="col-sm-5 col-xs-12">
                <ul class="list-information">
                    <li>
                        <img src="/catalog/view/theme/theme/image/main/icon-maps.png" alt="Иконка "/>
                        <p>
                            Москва и Подмосковье
                        </p>
                    </li>
                    <li>
                        <a href="/shops">
                            <img src="/catalog/view/theme/theme/image/main/icon-home.png" alt="Иконка "/>
                            <p>
                                Наши магазины
                            </p>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-sm-7 col-xs-12">
                <div class="work-time">
                    <?php echo $work_time_redy; ?>
                </div>
                <ul class="navigation text-right">
                    <li>
                        <a href="#">
                            Войти
                        </a>

                    </li>

                    <li>
                        /
                    </li>
                    <li>
                        <a href="#">
                            Зарегистрироваться
                        </a>

                    </li>

                </ul>
            </div>
        </div>
    </div>
</div>

<header>
    <div class="container">
        <div class="row">
            <div class="col-sm-3 col-xs-12">
                <div id="logo">
                    <?php if ($logo) { ?>
                    <?php if ($home == $og_url) { ?>
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"
                         class="img-responsive"/>
                    <?php } else { ?>
                    <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
                                                        alt="<?php echo $name; ?>" class="img-responsive"/></a>
                    <?php } ?>
                    <?php } else { ?>
                    <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>
                </div>
            </div>
            <div class="col-sm-9 col-xs-12">
                <div class="top">
                    <div class="phone-block">
                        <img src="/catalog/view/theme/theme/image/main/phone.png" alt="Иконка "/>
                        <ul class="lists-phones">
                            <li>
                                <a href="tel:88007759535">
                                    8 (800) 775-95-35
                                </a>
                            </li>
                            <li>
                                <a href="tel:84993471935">
                                    8 (499) 347-19-35
                                </a>
                            </li>
                        </ul>

                    </div>
                    <div class="request-call-block">
                        <div  class="link-call">
                            <?php echo $sobfeedback_id34; ?>
                        </div>
                    </div>
                    <div class="cart-block">
                        <?php echo $cart; ?>
                        <a href="#" class="wish-block">
                            <img src="/catalog/view/theme/theme/image/main/wish-icon.png" alt="Иконка "/>
                            <span class="count">
                                <?php echo $text_wishlist; ?>
                            </span>
                            <p>
                                Избранное
                            </p>
                        </a>


                    </div>
                </div>
                <div class="bottom">
                    <?php

                    /*
                    <div class="list-group">
                        <?php foreach ($categories as $category) { ?>
                        <?php if ($category['category_id'] == $category_id) { ?>
                        <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
                        <?php if ($category['children']) { ?>
                        <?php foreach ($category['children'] as $child) { ?>
                        <?php if ($child['category_id'] == $child_id) { ?>
                        <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php } else { ?>
                        <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
                        <?php } ?>
                        <?php } ?>
                    </div>
                */
                if(isset($categories) && !empty($categories)){  ?>
                    <div class="top-category-page-category">
                        <div class="heading">
                            <p>Каталог товаров</p>
                            <img src="/catalog/view/theme/theme/image/main/bar.png" alt="Иконка ">
                        </div>
                    </div>
                <?php }  ?>

                    <?php echo $search; ?>
                </div>

            </div>
        </div>
    </div>
</header>

