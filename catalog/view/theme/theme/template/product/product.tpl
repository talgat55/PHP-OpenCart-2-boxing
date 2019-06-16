<?php echo $header; ?>
<div class="container product-page">
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
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="row">
                <?php if ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } ?>
                <div class="col-sm-6 col-xs-12">
                    <?php if ($thumb || $images) { ?>
                    <div class="row">
                        <div class="thumbnails">
                            <?php if ($thumb) { ?>
                            <div class="col-sm-9 col-xs-12"><a class="thumbnail" href="<?php echo $popup; ?>"
                                                               data-lightbox="gallery"
                                                               title="<?php echo $heading_title; ?>"><img
                                            src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                                            alt="<?php echo $heading_title; ?>"/></a></div>
                            <?php } ?>

                            <div class="image-additional-block col-sm-3 col-xs-12">
                                <?php if ($images) { ?>
                                <?php foreach ($images as $image) { ?>
                                <div class="image-additional "><a class="thumbnail"
                                                                  href="<?php echo $image['popup']; ?>"
                                                                  data-lightbox="gallery"
                                                                  title="<?php echo $heading_title; ?>"> <img
                                                src="<?php echo $image['thumb']; ?>"
                                                title="<?php echo $heading_title; ?>"
                                                alt="<?php echo $heading_title; ?>"/></a></div>
                                <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <?php } ?>


                </div>
                <?php if ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-4'; ?>
                <?php } ?>
                <div class="col-sm-6 col-xs-12">

                    <h1 class="title"><?php echo $heading_title; ?></h1>
                    <ul class="list-unstyled   first-block-information">
                        <?php if ($manufacturer) { ?>
                        <li><?php echo $text_manufacturer; ?> <a
                                    href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                        <?php } ?>
                        <li><?=$sku_text; ?>  <span><?=$sku; ?></span></li>
                    </ul>
                    <?php if ($price) { ?>
                    <ul class="list-unstyled second-block-information">
                        <?php if (!$special) { ?>
                        <li>
                            <h2 class="price"><?php echo $price; ?></h2>
                        </li>
                        <?php } else { ?>
                        <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
                        <li>
                            <h2 class="special-price"><?php echo $special; ?></h2>
                        </li>
                        <li class="promotion-countdown">
                            <div class="promotion-block">
                                <div class="heading">
                                    До конца акции осталось:
                                </div>
                                <div id="countdown"></div>
                                <div class="text-wrapper">
                                    <div>дней</div>
                                    <div>часов</div>
                                    <div>минут</div>
                                    <div>секунд</div>

                                </div>
                                <?php
                                $date=date_create($date_end_promotion);
                                ?>


                                <p id="note"   data-date="<?= date_format($date,'Y,m,d'); ?>"></p>

                            </div>

                        </li>
                        <?php } ?>
                        <?php if ($tax) { ?>
                        <li class="no-dispaly"><?php echo $text_tax; ?> <?php echo $tax; ?></li>
                        <?php } ?>
                        <?php if ( isset($points)  &&  $points) { ?>
                        <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                        <?php } ?>
                        <?php if ($discounts) { ?>
                        <li>
                            <hr>
                        </li>
                        <?php foreach ($discounts as $discount) { ?>
                        <li class="no-dispaly"><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                    <div id="product">

                        <div class="clearfix">
                            <div class="row">
                                <div class="cm-attribute-potion-block  col-lg-8  col-md-12 col-sm-12 col-xs-12">
                                    <?php if ($options) { ?>

                                    <?php foreach ($options as $option) { ?>
                                    <?php if ($option['type'] == 'select') { ?>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"
                                               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                        <select name="option[<?php echo $option['product_option_id']; ?>]"
                                                id="input-option<?php echo $option['product_option_id']; ?>"
                                                class="form-control  select-two-selection">
                                            <option value=""><?php echo $text_select_size; ?></option>
                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                                )
                                                <?php } ?>
                                            </option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'radio') { ?>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"><?php echo $option['name']; ?></label>
                                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio"
                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                    <?php if ($option_value['image']) { ?>
                                                    <img src="<?php echo $option_value['image']; ?>"
                                                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                         class="img-thumbnail"/>
                                                    <?php } ?>
                                                    <?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                                    )
                                                    <?php } ?>
                                                </label>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'checkbox') { ?>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"><?php echo $option['name']; ?></label>
                                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"
                                                           name="option[<?php echo $option['product_option_id']; ?>][]"
                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                    <?php if ($option_value['image']) { ?>
                                                    <img src="<?php echo $option_value['image']; ?>"
                                                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                         class="img-thumbnail"/>
                                                    <?php } ?>
                                                    <?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                                    )
                                                    <?php } ?>
                                                </label>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'text') { ?>

                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"
                                               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="<?php echo $option['value']; ?>"
                                               placeholder="<?php echo $option['name']; ?>"
                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                               class="form-control"/>
                                    </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'textarea') { ?>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"
                                               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                        <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                                                  placeholder="<?php echo $option['name']; ?>"
                                                  id="input-option<?php echo $option['product_option_id']; ?>"
                                                  class="form-control"><?php echo $option['value']; ?></textarea>
                                    </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'file') { ?>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"><?php echo $option['name']; ?></label>
                                        <button type="button"
                                                id="button-upload<?php echo $option['product_option_id']; ?>"
                                                data-loading-text="<?php echo $text_loading; ?>"
                                                class="btn btn-default btn-block"><i
                                                    class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="" id="input-option<?php echo $option['product_option_id']; ?>"/>
                                    </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'date') { ?>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"
                                               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                        <div class="input-group date">
                                            <input type="text"
                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                   value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                                                   id="input-option<?php echo $option['product_option_id']; ?>"
                                                   class="form-control"/>
                                            <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
                                    </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'datetime') { ?>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"
                                               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                        <div class="input-group datetime">
                                            <input type="text"
                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                   value="<?php echo $option['value']; ?>"
                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                   id="input-option<?php echo $option['product_option_id']; ?>"
                                                   class="form-control"/>
                                            <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                    </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'time') { ?>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <label class="control-label"
                                               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                        <div class="input-group time">
                                            <input type="text"
                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                   value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                                                   id="input-option<?php echo $option['product_option_id']; ?>"
                                                   class="form-control"/>
                                            <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                    </div>
                                    <?php } ?>
                                    <?php } ?>
                                    <?php } ?>
                                    <?php if ($recurrings) { ?>
                                    <hr>
                                    <h3><?php echo $text_payment_recurring; ?></h3>
                                    <div class="form-group required">
                                        <select name="recurring_id" class="form-control">
                                            <option value=""><?php echo $text_select; ?></option>
                                            <?php foreach ($recurrings as $recurring) { ?>
                                            <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                                            <?php } ?>
                                        </select>
                                        <div class="help-block" id="recurring-description"></div>
                                    </div>
                                    <?php } ?>

                                </div>
                                <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                                    <a href="/table_sizes" class="link-to-all-size">
                                        <img src="/catalog/view/theme/theme/image/main/meter.png" alt="Иконка "/>
                                        <p>
                                            Таблица размеров
                                        </p>
                                    </a>


                                </div>
                            </div>
                        </div>
                        <div class="form-group add-to-cart-block">
                            <div class="no-dispaly">
                                <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                                <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2"
                                       id="input-quantity" class="form-control"/>
                                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                            </div>
                            <div>
                                <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"
                                        class="btn btn-primary btn-lg btn-block"><?php echo $button_cart_new; ?></button>
                            </div>

                            <div>
                                <?php if($quantity_available  == '0'){   ?>
                                <p class="text-not-available">
                                    Данного товара нет в наличии.<br>
                                    Посмотрите похожие товары ниже
                                </p>

                                <?php } ?>
                            </div>
                        </div>
                        <?php if ($minimum > 1) { ?>
                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
                        </div>
                        <?php } ?>

                    </div>

                </div>
            </div>
            <div class="clearfix">
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="tab-content  tab-first-block">
                            <h3 class="title">Описание товара</h3>
                            <?php if ($attribute_groups) { ?>
                            <div class="tab-pane active" id="tab-specification">
                                <table class="table table-bordered">
                                    <tbody>
                                    <tr>
                                        <td>Категория:</td>
                                        <td><a href="<?=$link_current_cat;?>"> <?=$current_cat; ?></a></td>
                                    </tr>
                                    <tr>
                                        <td>Вид:</td>
                                        <td><span><a href="<?=$model_link;?>"> <?=$model; ?></a></span></td>
                                    </tr>
                                    <tr>
                                        <td>Страна:</td>
                                        <td><?=$location; ?></td>
                                    </tr>


                                    <?php foreach ($attribute_groups as $attribute_group) { ?>

                                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                    <tr>
                                        <td><?php echo $attribute['name']; ?></td>
                                        <td><?php echo $attribute['text']; ?></td>
                                    </tr>
                                    <?php } ?>

                                    <?php } ?>
                                    </tbody>
                                </table>
                                <div class="decription">
                                    <div class="content">
                                        <?php echo htmlspecialchars_decode($tab_description_new); ?>
                                    </div>
                                </div>

                            </div>
                            <?php } ?>

                        </div>
                        <a href="#" class="tab-link-read-more  black">Читать все</a>
                    </div>
                    <div class="col-md-6 col-sm-12  col-xs-12">
                        <div class="tab-second-block">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab-delivery" data-toggle="tab">Доставка</a></li>
                                <li><a href="#tab-pay" data-toggle="tab">Оплата</a></li>
                                <li><a href="#tab-fitsize" data-toggle="tab">Подобрать размер</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab-delivery">
                                    <div class="content">
                                        Оперативность наших менеджеров, скорость наших курьеров, а так же быстрота
                                        доставки служб Почта России, EMS, СДЭК и пункты самозабора БоксБерри позволяют
                                        нам радовать наших клиентов хорошим товаром в кратчайшие сроки!
                                        <br>
                                        Наши преимущества:<br>

                                        - доставка за МКАД нашим курьером осуществляется при условии наличия метро не
                                        далее 1,5 км. от адреса доставки;<br>

                                        - доставка по Москве (в пределах МКАД) осуществляется в этот же день при
                                        оформлении заказа до 16:00;<br>

                                        - заказы в другие города России, принятые до 14:00, отправляются получателю в
                                        этот же день скорыми службами Почта России, EMS, СДЭК (стоимость доставки
                                        зависит от веса посылки и удаленности региона и рассчитывается автоматически на
                                        нашем сайте);<br>

                                        - заказы по странам СНГ отправляются только по предоплате Почтой России или
                                        службой EMS без наложенного платежа. Стоимость и сроки доставки рассчитываются
                                        менеджером после подтверждения заказа и зависят от веса и удаленности
                                        страны;<br>
                                    </div>
                                </div>

                                <div class="tab-pane" id="tab-pay">
                                    <div class="content">
                                        Товарищи! постоянный количественный рост и сфера нашей активности в значительной
                                        степени обуславливает создание соответствующий условий активизации. Идейные
                                        соображения высшего порядка, а также реализация намеченных плановых заданий
                                        обеспечивает широкому кругу (специалистов) участие в формировании системы
                                        обучения кадров, соответствует насущным потребностям.

                                        Разнообразный и богатый опыт рамки и место обучения кадров представляет собой
                                        интересный эксперимент проверки модели развития. С другой стороны постоянное
                                        информационно-пропагандистское обеспечение нашей деятельности способствует
                                        подготовки и реализации
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-fitsize">
                                    <div class="content">
                                        Товарищи! постоянный количественный рост и сфера нашей активности в значительной
                                        степени обуславливает создание соответствующий условий активизации. Идейные
                                        соображения высшего порядка, а также реализация намеченных плановых заданий
                                        обеспечивает широкому кругу (специалистов) участие в формировании системы
                                        обучения кадров, соответствует насущным потребностям.

                                        Разнообразный и богатый опыт рамки и место обучения кадров представляет собой
                                        интересный эксперимент проверки модели развития. С другой стороны постоянное
                                        информационно-пропагандистское обеспечение нашей деятельности способствует
                                        подготовки и реализации
                                    </div>
                                </div>
                            </div>
                            <a href="#" class="tab-link-read-more">Читать все</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="linked-products">
                <h3 class="title">
                    Похожие товары
                </h3>
                <ul class="list-linked-products">
                    <?php  foreach($products_set as $product){ ?>
                    <li class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="product-thumb transition">
                            <div class="top-block">
                                <div class="sku">
                                    Артикул: <?php echo $product['sku']; ?>
                                </div>
                                <div class="wish">

                                </div>
                            </div>
                            <div class="image"><a href="<?php echo $product['href']; ?>"><img
                                            src="<?php echo $product['thumb']; ?>"
                                            alt="<?php echo $product['name']; ?>"
                                            title="<?php echo $product['name']; ?>"
                                            class="img-responsive"/></a></div>
                            <div class="caption">
                                <div class="categories">
                                    <span><?=$current_cat; ?></span>
                                </div>
                                <h3 class="title"><a
                                            href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                </h3>

                                <?php if ($product['price']) { ?>
                                <p class="price">
                                    <?php echo $product['price']; ?>
                                </p>
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

            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').fadeTo("fast", 0.5);
            },
            complete: function () {
                $('#button-cart').fadeTo("fast", 1);
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    setTimeout(function () {
                        $('#cart > button').html('<a href="#" >\n' +
                            '        <img src="/catalog/view/theme/theme/image/main/cart.png"  alt="Иконка " />\n' +
                            '        <span id="cart-total">' + json['text_items_count'] + '</span>\n' +
                            '        <p>\n' + json['text_items'] + ' </p>\n' +
                            '    </a>');
                    }, 100);

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    // $('.date').datetimepicker({
    // 	pickTime: false
    // });
    //
    // $('.datetime').datetimepicker({
    // 	pickDate: true,
    // 	pickTime: true
    // });
    //
    // $('.time').datetimepicker({
    // 	pickDate: false
    // });

    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });


    $(document).ready(function () {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var vals = hashpart[1].split('-');
            for (i = 0; i < vals.length; i++) {
                $('#product').find('select option[value="' + vals[i] + '"]').attr('selected', true).trigger('select');
                $('#product').find('input[type="radio"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
                $('#product').find('input[type="checkbox"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
            }
        }
    })
    //--></script>
<?php echo $footer; ?>
