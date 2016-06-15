<?php echo $header; ?>
<div class="container">
  <header>
    <div id="search" class="input-group">
      <input type="text" name="search" value="" placeholder="搜索" class="form-control">
      <input type="hidden" name="category_id" value="0">
      <input type="hidden" name="sub_category" value="1">
      <input type="hidden" name="description" value="1">
      <span class="input-group-btn">
        <input type="button" value="搜索" id="button-search" class="btn btn-primary">
      </span>
    </div>
  </header>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <div class="content_top">
        <?php echo $content_top; ?>
        <div class="clear"></div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>