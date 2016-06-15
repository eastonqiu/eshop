<?php echo $header; ?>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row">
    <div id="content" class="col-sm-12">
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($products) { ?>
      <?php foreach ($products as $product) { ?>
      <div class="wishlist-product-list">
        <div class="image">
          <?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>"><img data-src="<?php echo $product['thumb']; ?>" src="<?php echo $product['thumb']; ?>" alt="春装上新 女装" title="春装上新 女装" class="lazy img-responsive" style="opacity: 1;">
          </a>
          <?php } ?></td>
        </div>
        <div class="product-info">
          <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
          <div class="model"><?php echo $product['model']; ?></div>
          <div class="stock"><?php echo $product['stock']; ?></div>
          <div class="product-price">
            <?php if ($product['price']) { ?>
            <span class="price-new">
              <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                <?php } ?>
            </span>
            <?php } ?>
          </div>

          <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="remove">[移除]</i></a>
        </div>
      </div>
      <?php } ?>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <a href="<?php echo $continue; ?>" class="btn btn-primary btn-block"><?php echo $button_continue; ?></a>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>