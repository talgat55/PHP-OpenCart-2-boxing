<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a></li>
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
        <div id="content" class="<?php echo $class; ?>   main-page"><?php echo $content_top; ?>
            <h1 class="title">Наши бренды</h1>
            <?php if ($categories) { ?>
            <div class="brend-block">
                <div class="row">
                    <?php   foreach($categories as $category) { ?>
                    <div class="brend-col col-md-2 col-sm-4 col-xs-12">
                        <div class="brend-item">
                            <a href="<?=$category['url']; ?>">
                                <img src="<?=$category['image']; ?>" alt="Бренд"/>

                                <h3 class="title">
                                    <?= $category['name']; ?>

                                </h3>
                            </a>
                        </div>
                    </div>

                    <?php  } ?>
                </div>
            </div>
            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>

            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>