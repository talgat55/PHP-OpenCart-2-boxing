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
                        <a href="#">
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
<?php

?>
<?php  /*
<nav id="top">
<div class="container">
    <div id="top-links" class="nav pull-right">
        <ul class="list-inline">
            <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span
                        class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
            <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"
                                    class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span
                            class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span
                            class="caret"></span></a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <?php if ($logged) { ?>
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                    <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                    <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                    <?php } else { ?>
                    <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                    <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                    <?php } ?>
                </ul>
            </li>
            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i
                            class="fa fa-heart"></i> <span
                            class="hidden-xs hidden-sm hidden-md"></span></a></li>
            <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i
                            class="fa fa-shopping-cart"></i> <span
                            class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
            <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i>
                    <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
        </ul>
    </div>
</div>
</nav>

*/ ?>
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
                        <a href="#" class="link-call">
                            Заказать звонок
                        </a>
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
                    <?php echo $search; ?>
                </div>

            </div>
        </div>
    </div>
</header>

