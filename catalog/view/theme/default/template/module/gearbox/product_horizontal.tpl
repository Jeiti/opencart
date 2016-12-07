<div class="module-gearbox-product gearbox-product-horizontal gearbox-product-<?php echo $module['type'] ?> <?php echo $module['suffix'] ?>">
  <?php if($module['header']) { ?>
    <h3 class="oc-module-heading"><?php echo $module['title'][$language_id]; ?></h3>
  <?php } ?>

  <div class="row bs-row-condensed">
    <?php foreach ($products as $product) { ?>
      <div class="col-xs-<?php echo $module['viewport_phone']; ?> col-sm-<?php echo $module['viewport_tablet']; ?> col-md-<?php echo $module['viewport_desktop']; ?> col-lg-<?php echo $module['viewport_xdesktop']; ?>">
        <div class="product-thumb">
          <div class="product-thumb-inner">
            <div class="image">
              <a href="<?php echo $product['href']; ?>">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
              </a>
            </div>

            <div class="caption mh-<?php echo $module['type'] ?>-<?php echo $timestamp; ?>">
              <h4 class="mh-<?php echo $module['type'] ?>-<?php echo $timestamp; ?>-title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

              <?php if ($product['teaser']) { ?>
                <p class="teaser mh-<?php echo $module['type'] ?>-<?php echo $timestamp; ?>-teaser"><?php echo $product['teaser']; ?></p>
              <?php } ?>

              <?php if ($product['price']) { ?>
                <div class="price">
                  <?php if (!$product['special']) { ?>
                    <span class="price-regular"><?php echo $product['price']; ?></span>
                  <?php } else { ?>
                    <span class="price-new"><?php echo $product['special']; ?></span>
                    <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>

                  <?php if ($product['tax']) { ?>
                    <div class="price-tax">
                      <?php echo $text_tax; ?>
                      <?php echo $product['tax']; ?>
                    </div>
                  <?php } ?>
                </div>
              <?php } ?>

              <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <span class="star">
                      <?php if ($product['rating'] < $i) { ?>
                          <i class="fa fa-star-o fa-lg text-muted"></i>
                      <?php } else { ?>
                          <i class="fa fa-star fa-lg text-warning"></i>
                      <?php } ?>
                    </span>
                  <?php } ?>
                </div>
              <?php } ?>
            </div>

            <div class="btn-group button-group">
              <button type="button" class="btn btn-primary btn-cart col-xs-6 col-lg-8" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                <i class="fa fa-shopping-cart fa-lg"></i> <span class="hidden-md"><?php echo $button_cart; ?></span>
              </button>
              <button type="button" class="btn btn-default btn-wishlist col-xs-3 col-lg-2" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                <i class="fa fa-heart"></i>
              </button>
              <button type="button" class="btn btn-default btn-compare col-xs-3 col-lg-2" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
                <i class="fa fa-exchange"></i>
              </button>
            </div>
          </div>
        </div> <!-- /.product-thumb -->
      </div>
    <?php } ?>
  </div>

  <script>
  $(document).ready(function()
  {
    $('.mh-<?php echo $module["type"] ?>-<?php echo $timestamp; ?>-title').matchHeight();
    $('.mh-<?php echo $module["type"] ?>-<?php echo $timestamp; ?>-teaser').matchHeight(false);
    $('.mh-<?php echo $module["type"] ?>-<?php echo $timestamp; ?>').matchHeight();
  });
  </script>
</div>