<?php echo $header; ?>
<nav id="bottom_add_to_cart">
  <ul class="list-unstyled">
    <li style="width:15%"><button id="add_to_wishlist"><i class="fa fa-heart"></i><div>收藏</div></button></li>
    <li style="width:35%"><button data-loading-text="处理中" class="add_to_cart">添加购物车</button></li>
    <li style="width:35%"><button data-loading-text="处理中" class="buy_now">立即购买</button></li>
    <li style="width:15%"><a href="index.php?route=checkout/cart"><i class="iconfont icon-iconfontgouwuche"><span class="cart_total" style=""></span></i><div class="name">购物车</div></a></li>
  </ul>
</nav>

<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="product-details-page <?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row widget first-widget">
        <div id="slides" class="owl-carousel owl-theme owl-loaded owl-drag">
          <?php if ($thumb && $popup) { ?>
          <div class="item">
            <a class="popups" href="<?php echo $popup; ?>">
              <img src="<?php echo $thumb; ?>" alt="" class="img-responsive">
            </a>
          </div>
          <?php } ?>
          <?php if ($images) { ?>
          <?php foreach ($images as $image) {?>
          <div class="item">
            <a class="popups" href="<?php echo $image['popup']; ?>">
              <img src="<?php echo $image['thumb']; ?>" alt="" class="img-responsive">
            </a>
          </div>
          <?php } ?>
          <?php } ?>
        </div>
      </div>
          
      <div class="row widget">
        <div class="col-xs-12">
          <span class="product_name"><?php echo $heading_title; ?></span>
          <div class="price">
            <?php if (!$special) { ?>
            <span class="price-new"><?php echo $price; ?></span>
            <?php } else { ?>
            <span class="price-new"><?php echo $special; ?></span>
            <?php } ?>
            <span class="points"><?php echo $text_points; ?> <?php echo $points; ?></span>
            <?php if ($tax) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
            <?php } ?>
          </div>

          <?php if ($discounts) { ?>
          <span class="product-info-list-item">
            <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
          </span>
          <?php } ?>

          <?php if ($manufacturer) { ?>
          <span class="product-info-list-item">
            <b><?php echo $text_manufacturer; ?></b>: 
            <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
          </span>
          <?php } ?>
          <?php if ($model) { ?>
          <span class="product-info-list-item"><b><?php echo $text_model; ?></b>: <?php echo $model; ?></span>
          <?php } ?>
          <?php if ($reward) { ?>
          <span class="product-info-list-item"><b><?php echo $text_reward; ?></b>: <?php echo $reward; ?></span>
          <?php } ?>
          <?php if ($stock) { ?>
          <span class="product-info-list-item"><b><?php echo $text_stock; ?></b>: <?php echo $stock; ?></span>
          <?php } ?>
        </div>
      </div>

      <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
      
      <div class="row widget product_options">
        <div class="col-xs-12">
          <?php if ($options) { ?>
          <span class="title"><?php echo $text_option; ?></span>
          <div id="options">
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <label class="radio">
                  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                  <span><?php echo $option_value['name']; ?></span>
                </label>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <label class="checkbox">
                  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                  <span><?php echo $option_value['name']; ?></span>
                </label>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <hr>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="option_item">
              <div id="product-quantity">
  						  <input type="button" id="qty_substract" value="-">
                <input type="text" id="input_quantity" name="quantity" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_qty; ?>" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" size="2">
  							<input type="button" id="qty_add" value="+">
              </div>
              <?php if ($minimum > 1) { ?>
              <div class="minimum-note">
                <i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>

      <?php if ($review_status) { ?>
      <div class="row widget">
        <div class="rating">
          <?php if ($tags) { ?>
          <p><strong><?php echo $text_tags; ?></strong>
            <?php for ($i = 0; $i < count($tags); $i++) { ?>
            <?php if ($i < (count($tags) - 1)) { ?>
            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
            <?php } else { ?>
            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
            <?php } ?>
            <?php } ?>
          </p>
          <?php } ?>
          <!-- Baidu Share BEGIN -->
          <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more">分享到：</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博">腾讯微博</a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网">人人网</a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a></div>
          <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{"bdSize":16}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
          <!-- Baidu Share END -->
        </div>
      </div>
      <?php } ?>

      <div class="row widget">
        <div class="col-xs-12">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="product-layout product-grid <?php echo $class ?>">
          <div class="product-wrapper">
            <div class="product-image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="product-info">
              <div class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <div class="product-description"><p><?php echo $product['description']; ?></p></div>
              <?php if ($product['price']) { ?>
              <div class="product-price">
                <span class="price-new"><?php echo $product['special'] ? $product['special'] : $product['price']; ?></span>
                <?php if ($product['special']) { ?><span class="price-old"><?php echo $product['price']; ?></span><?php } ?>
                <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['rating']): ?>
              <div class="product-rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star off fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php endif ?>
              <div class="product-action">
                <button type="button" class="add-to-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span><?php echo $button_cart; ?></span></button>
                <button type="button" class="wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i> <span><?php echo $button_wishlist; ?></span></button>
                <button type="button" class="compare" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-bars"></i> <span><?php echo $button_compare; ?></span></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if ($thumb || $images) { ?>
<script type="text/javascript"><!--
  $(document).ready(function(){
    $('#tab-description img').not('[img-responsive]').addClass('img-responsive'); // Make description image responsive

    $('#slides').owlCarousel({
            items:1,
            loop:true,
          });

    $('.popups').swipebox({
      useCSS : true,
      useSVG : true,
    });

    $('#qty_substract').click(function(){
      qty_input = $('#input_quantity');
      if (qty_input.val() <= <?php echo $minimum; ?>) {
        qty_input.val($minimum);
      } else {
        qty_input.val(qty_input.val() - 1);
      }
    });

    $('#qty_add').click(function(){
      qty_input = $('#input_quantity');
      qty_input.val(qty_input.val() * 1 + 1);
    });

  });

  $('#add_to_wishlist').on('click', function(){
    wishlist.add(<?php echo $product_id; ?>);
  });
//--></script>
<?php } ?>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.add_to_cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('input[name=\'product_id\'], #options input[type=\'text\'], #options input[type=\'hidden\'], #options input[type=\'radio\']:checked, #options input[type=\'checkbox\']:checked, #options select, #options textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('.add_to_cart').button('loading');
		},
		complete: function() {
			$('.add_to_cart').button('reset');
		},
		success: function(json) {
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
				$('#cart #cart-total').html(json['total']);
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				$('#cart > .cart-content').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});

$('.buy_now').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('input[name=\'product_id\'], #options input[type=\'text\'], #options input[type=\'hidden\'], #options input[type=\'radio\']:checked, #options input[type=\'checkbox\']:checked, #options select, #options textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('.buy_now').button('loading');
    },
    complete: function() {
      $('.buy_now').button('reset');
    },
    success: function(json) {
      $('.right_list').removeClass('has_error');
      $('.text-danger').remove();

      if (json['error']) {
        $('html, body').animate({scrollTop: $("#options").parent().offset().top}, 0);
        //$.Prompt('请选择选项！', '1500');
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
      }

      if (json['success']) {
        $('.cart_total').show();
        $.Prompt('跳转至购物车...', '100000');
        location = 'index.php?route=checkout/cart';
      }
    }
  });
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
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
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
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
});

$("#product select[name*='option']").change(function(){
  refresh_price();
});

$("#product input[type='radio'], #product input[type='checkbox']").on("click",function(){
  refresh_price();
});

$('.quantity-input-wrapper a').click(function(e){
  e.preventDefault();
  if( $(this).hasClass('quantity-up')) {
    $('#input-quantity').val( parseInt($('#input-quantity').val()) + 1 );
  } else {
    if( parseInt($('#input-quantity').val())  > <?php echo $minimum; ?> ) {
      $('#input-quantity').val( parseInt($('#input-quantity').val()) - 1 );
    }
  }
  refresh_price();
});

$("#product input[name*=\'quantity\']").keyup(function() {
  if (parseInt($(this).val()) < <?php echo $minimum; ?>) {
    $(this).val(<?php echo $minimum; ?>);
  }
  refresh_price();
});

$("#product input[name*=\'quantity\']").on("focusout", function(){
  this.value = this.value.replace(/[^0-9\.]/g,'');
  if(this.value < <?php echo $minimum; ?>) {
    this.value = <?php echo $minimum; ?>;
  }
  refresh_price();
});

<?php if ($minimum > 1) { ?>
$(document).ready(function() {
  refresh_price();
});
<?php } ?>

function refresh_price() {
  $.ajax({
    url: 'index.php?route=product/product/price',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
    },
    complete: function() {
    },
    success: function(json) {
      if (json['special'] !== undefined) {
        $('.product-price-wrapper .price-new').html(json['special']);
        if (!$('.product-price-wrapper .price-old').length) {
          $('.product-price-wrapper .price-new').after("<span class=\"price-old\"></span>");
        }
        $('.product-price-wrapper .price-old').html(json['price']);
      } else {
        $('.product-price-wrapper .price-new').html(json['price']);
        $('.product-price-wrapper .price-old').remove();
      }

      if (json['tax'] !== undefined) {
        $('.product-price-wrapper .price-tax').html(json['tax']);
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
    }
  });
}
//--></script>
<?php echo $footer; ?>

