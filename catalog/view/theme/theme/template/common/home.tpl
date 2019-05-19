<?php echo $header; ?>
<h1 class="hidden-title">Главная страница</h1>
<section>
    <div class="container">
        <div class="row"><?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?>  home-page">
                <section class="clearfix">
                    <div class="col-sm-3 col-xs-12">
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
                                            <div class="dropdown-inner">
                                                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                                <ul class="list-unstyled">
                                                    <?php foreach ($children as $child) { ?>
                                                    <li>
                                                        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                    </li>
                                                    <?php } ?>
                                                </ul>
                                                <?php } ?>
                                            </div>
                                            <a href="<?php echo $category['href']; ?>"
                                               class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
                                        </div>
                                    </li>
                                    <?php } else { ?>
                                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                    </li>
                                    <?php } ?>
                                    <?php } ?>
                                </ul>
                            </div>
                        </nav>
                        <?php } ?>
                    </div>
                    <div class="col-sm-9 col-xs-12">
                        <ul class="home-slider clearfix">
                            <?php foreach($banner as $value){  ?>

                            <li class="item">
                                <a href="<?=$value['link']; ?>">
                                    <img src="<?=$value['image']; ?>" alt="Изображение">
                                    <div class="text">
                                        <?=$value['title']; ?>
                                    </div>
                                </a>
                            </li>

                            <?php }  ?>
                        </ul>
                    </div>
                </section>

                <section class="clearfix">
                    <?php echo $content_top; ?><?php echo $content_bottom; ?>

                </section>


            </div>
            <?php echo $column_right; ?></div>
    </div>
</section>
<section class="clearfix instagram-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-xs-12 ">
                <h3 class="title">
                    ПОДПИШИСЬ<br>
                    В ИНСТАГРАМ
                </h3>
                <a href="#" class="link-subscribe">
                    Хочу подписаться
                </a>
                <img class="img-glove" src="/catalog/view/theme/theme/image/main/glove.png" alt="Перчатка "/>
            </div>
            <div class="col-sm-6 col-xs-12 ">

            </div>
        </div>
    </div>
</section>
<section class="clearfix video-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-xs-12 ">
                <div class="block-title-alternative">
                    <h2 class="sub-title">Видеообзоры</h2>
                    <a href="#" class="link-to-all">
                        Все видеообзоры
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
                <h2 class="sub-title">Спортивная одежда для ММА</h2>
                </div>
                <p class="padding-top-90 first">
                    Современная мода на здоровый образ жизни и занятия теми или иными видами спорта обуславливает
                    стабильный спрос на специальную одежду, без наличия которой невозможно гарантировать безопасность во
                    время проведения тренировок и всевозможных соревнований. Не смотря на то, что многие непрофессионалы
                    довольно скептично относятся к выбору подходящих маек, шорт, боксерских перчаток и перчаток для ММА,
                    и др. инвентаря, правильно подобранная экипировка для единоборств играет огромную роль, - во многих
                    случаях от качества одежды напрямую зависит успех ММА поединка и сохранение здоровья в процессе
                    обучения в различных видах боевых искусств.
                </p>
                <div class="block-title-alternative two-title">
                <h2 class="sub-title">Где купить?</h2>
                </div>
                <p  class="second">
                    Интернет магазин Good Fighter предлагает бойцовскую одежду для ММА от лучших производителей в мире.
                    В нашем магазине вы можете найти большой ассортимент стильной одежды и экипировки следующих брендов:
                    Venum, Bad Boy, FixGear, RDX, UFC/Reebok, Twins Special, FightEvo и других!
                    <br>
                    Дизайн спортивной одежды разрабатывается настоящими экспертами, а в процессе производства
                    используются самые передовые технологии, поэтому спортсмены могут ни секунды не сомневаться в том,
                    что смогут достойно представить себя и свою команду, не беспокоясь при этом о собственном
                    самочувствии и будучи уверенными в надежности и удобстве экипировки. Таким образом, для того, чтобы
                    добиться успеха в ММА, имеет смысл обратить внимание не только на совершенствование физических
                    навыков, но и со всей ответственностью подойти к выбору одежды, тем более что в нашем
                    интернет-магазине вы найдете высококачественные майки, шорты и перчатки от известных брендов,
                    разработанных с учетом всех потребностей спортсменов.

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
                    ПОДПИШИСЬ
                    <span>
                        НА НОВОСТИ
                    </span>
                </h3>
            </div>
            <div class="col-sm-3 col-xs-12">
                <?php echo $sobfeedback_id33; ?>
            </div>
        </div>
    </div>


</section>

<?php echo $footer; ?>