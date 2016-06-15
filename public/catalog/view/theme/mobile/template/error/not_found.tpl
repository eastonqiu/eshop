<?php echo $header; ?>
<div class="container empty-cart-page">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <div class="row">
        <div class="col-sm-12">
          <?php echo $content_top; ?>
          <span class="icon"><i class="iconfont icon-iconfontgouwuche"></i></span>
          <span class="msg"><?php echo $text_error; ?></span>
          <a class="link" href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a>
          <?php echo $content_bottom; ?>
        </div>
      </div>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>