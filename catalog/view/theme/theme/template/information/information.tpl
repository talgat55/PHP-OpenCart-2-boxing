<?php echo $header; ?>
<div class="container">

    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>  main-page"><?php echo $content_top; ?>
            <?php  if ($_REQUEST['_route_'] == 'reviews') :    ?>
            <h1 class="title"> Отзывы клиентов</h1>
            <?php  elseif ($_REQUEST['_route_'] == 'brends') :    ?>
            <h1 class="title"> Наши бренды</h1>
            <?php else: ?>
            <h1 class="title"> <?php echo $heading_title; ?></h1>
            <?php endif; ?>

            <div class="content">
                <?php  if($_REQUEST['_route_'] == 'contacts') :   ?>
                <div class="contact-block  padding-top-50">
                    <div class="row">
                        <div class="block-item col-sm-4 col-xs-12">
                            <div class="heading">
                                <div class="icon">
                                    <img src="/catalog/view/theme/theme/image/main/geo-contact.png" alt="Иконка "/>
                                </div>
                                <h3 class="title">
                                        Адрес:
                                </h3>
                            </div>
                            <div class="content">
                                Дмитровское шоссе 73 стр<br> 1, ТЦ «Метромолл»
                            </div>
                        </div>
                        <div class="block-item col-sm-4 col-xs-12">
                            <div class="heading">
                                <div class="icon">
                                    <img src="/catalog/view/theme/theme/image/main/mail-contact.png" alt="Иконка "/>
                                </div>
                                <h3 class="title">
                                    Почта:
                                </h3>
                            </div>
                            <div class="content">
                               <a href="mailto:zakaz1@octagon-shop.com" >
                                   zakaz1@octagon-shop.com
                               </a>
                                по вопросам заказа товара
                            </div>
                        </div>

                        <div class="block-item col-sm-4 col-xs-12">
                            <div class="heading">
                                <div class="icon">
                                    <img src="/catalog/view/theme/theme/image/main/phone-contact.png" alt="Иконка "/>
                                </div>
                                <h3 class="title">
                                    Телефон:
                                </h3>
                            </div>
                            <div class="content">
                                <a href="tel:+79175438587" >
                                    +79175438587
                                </a>
                                Звонок по России бесплатный
                            </div>
                        </div>

                    </div>

                </div>
                <div id="map"></div>
                <?php  elseif ($_REQUEST['_route_'] == 'brends') :    ?>
                    <div class="brend-block">
                    <div class="row">
                        <?php   foreach($categories as $category) { ?>
                            <div class="brend-col col-md-2 col-sm-4 col-xs-12">
                                <div class="brend-item">
                                    <img src="<?=$category['image']; ?>"  alt="Бренд"/>

                                    <h3 class="title">
                                        <?= $category['name']; ?>

                                    </h3>

                                </div>
                            </div>

                        <?php  } ?>
                    </div>
                    </div>
                <?php  elseif ($_REQUEST['_route_'] == 'reviews') :    ?>
                    <div class="review-block">
                        <?php   if(!empty($news_list) )  :  ?>
                            <?php   foreach($news_list as $news_item) { ?>

                                    <div class="review-item">
                                    <div class="review-item-walp">
                                        <div class="img-block">
                                            <img src="<?=$news_item['thumb']; ?>"  alt="Изображение"/>
                                        </div>
                                        <div class="content">
                                            <?= $news_item['description']; ?>
                                        </div>
                                        <div class="divider"></div>
                                        <h3 class="name">
                                            <?= $news_item['title']; ?>
                                        </h3>
                                        <div class="position">
                                            <?= $news_item['position']; ?>
                                        </div>

                                    </div>
                                    </div>


                            <?php  } ?>
                            <?php  endif; ?>
                    </div>
                <?php  else : ?>

                <?php echo $description; ?>


                <?php  endif; ?>

                <?php echo $content_bottom; ?>
            </div>
        </div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>