<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">

    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row">
    <aside id="column-left" class="col-md-3 col-sm-12 col-xs-12">
      <div class="accordion-block">
        <h3 class="title">
          <p>Категории</p>
          <div class="img-block">
            <img src="/catalog/view/theme/theme/image/main/arrow-down.png" alt="Иконка ">
          </div>

        </h3>

        <?php if ($categories) { ?>
        <?php if (count($categories) <= 5) { ?>
        <div class="row-common">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><i class="fas fa-check"></i> <?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>

        </div>
        <?php } else { ?>
        <div class="row-common">
          <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>

          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><i class="fas fa-check"></i> <?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
          <?php } ?>
        </div>
        <?php } ?>
        <?php } else{ ?>

        нет категорий

        <?php } ?>
      </div>
      <?=$column_left; ?>
    </aside>


    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="col-md-9 col-sm-12 col-xs-12  category-page"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($thumb || $description) { ?>
      <div class="row">

        <?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <?php } ?>

      <?php if ($products) { ?>
      <div class="row filter-items-block">
        <div class="grid-view-hide col-md-2 col-sm-6 hidden-xs">
          <div class="btn-group btn-group-sm">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip"
                    title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip"
                    title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="grid-view-hide col-md-3 col-sm-6">
          <div class="form-group">
            <a href="<?php echo $compare; ?>" id="compare-total"
               class="btn btn-link"><?php echo $text_compare; ?></a>
          </div>
        </div>
        <div class="col-md-6 col-xs-12">
          <div class="sort-by-fields-block form-group input-group input-group-sm">
            <h4 class="title-sort"><?php echo $text_sort_new; ?></h4>
            <ul class="list-sort-values">

              <?php foreach ($sorts as $sorts) { ?>
              <li>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <a href="<?php echo $sorts['href']; ?>" class="active"><?php echo $sorts['text']; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
                <?php   } ?>
              </li>

              <?php   } ?>

            </ul>
            <?php  /*
                        <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>"
                    selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
            </select>

            */ ?>
          </div>
        </div>
        <div class="col-md-6 col-xs-12">
          <div class="sort-by-fields-block items-per-page  form-group input-group input-group-sm">
            <h4 class="title-sort"><?php echo $text_limit_new; ?></h4>
            <ul class="list-sort-values">

              <?php foreach ($limits as $limits) { ?>
              <li>
                <?php if ($limits['value'] == $limit) { ?>
                <a href="<?php echo $limits['href']; ?>" class="active"><?php echo $limits['text']; ?></a>
                <?php   } else { ?>
                <a href="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></a>
                <?php   } ?>
              </li>
              <?php   } ?>

            </ul>

            <?php /*
                        <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>"
                    selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
            </select>
            */ ?>
          </div>
        </div>
      </div>
      <div class="row products-row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12 col-xs-12">

          <div class="product-thumb">
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
            <div class="image"><a href="<?php echo $product['href']; ?>"><img
                        src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
                        title="<?php echo $product['name']; ?>" class="img-responsive"/></a></div>
            <div class="caption">
              <div class="categories">
                <span><?php  echo  $product['category_title']; ?></span>
              </div>
              <h3 class="title"><a
                        href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>

              <?php if ($product['price']) { ?>
              <p class="price">
                <?php echo $product['price']; ?>
              </p>
              <?php } ?>
            </div>

          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>

      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
