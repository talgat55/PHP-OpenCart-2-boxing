<?php echo $header; ?>
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
                        <div class="navbar-header"><span id="category"  ><?php echo $text_category; ?></span>
                            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse"  data-target=".navbar-ex1-collapse">

                                <img src="/catalog/view/theme/theme/image/main/bar.png" alt="Иконка " />

                            </button>
                        </div>
                        <div class="collapse navbar-collapse navbar-ex1-collapse">
                            <ul class="nav navbar-nav">
                                <?php foreach ($categories as $category) { ?>
                                <?php if ($category['children']) { ?>
                                <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"
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
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
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
<?php echo $footer; ?>