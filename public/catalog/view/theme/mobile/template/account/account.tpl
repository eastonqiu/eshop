<?php echo $header; ?>
<div class="container account-page">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row">
    <div id="content" class="col-sm-12">      <div class="row widget">
        <div class="col-sm-12">
          <ul class="list-inline grid-links">
            <li><a href="<?php echo $order; ?>"><i class="iconfont icon-iconfontquanbudingdan"></i><span>所有订单</span></a></li>
            <li><a href="index.php?route=account/order&type=unpaid"><i class="iconfont icon-daifukuan"></i><span>待付款</span></a></li>
            <li><a href="index.php?route=account/order&type=unshipped"><i class="iconfont icon-tabsdaifahuo"></i><span>待发货</span></a></li>
            <li><a href="index.php?route=account/order&type=shipped"><i class="iconfont icon-iconfontdaishouhuo"></i><span>待收货</span></a></li>
          </ul>
        </div>
      </div>
      <div class="row widget">
        <div class="col-sm-12">
          <!-- <h2>我的账户</h2> -->
          <ul class="accordion-list list-unstyled">
            <li><a href="<?php echo $edit; ?>"><i class="iconfont icon-zhanghuxinxi"></i> <?php echo $text_edit; ?></a></li>
            <li><a href="<?php echo $password; ?>"><i class="iconfont icon-iconfontmima"></i> <?php echo $text_password; ?></a></li>
            <li><a href="<?php echo $address; ?>"><i class="iconfont icon-iconfontchanpincanshu"></i> <?php echo $text_address; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>"><i class="iconfont icon-iconfontyouhuiquan"></i> <?php echo $text_wishlist; ?></a></li>
          </ul>
        </div>
      </div>
      <div class="row widget">
        <div class="col-sm-12">
          <!-- <h2>我的订单</h2> -->
          <ul class="accordion-list list-unstyled">
            <li><a href="<?php echo $order; ?>"><i class="iconfont icon-iconfontquanbudingdan"></i> <?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $download; ?>"><i class="iconfont icon-iconxiazai"></i> <?php echo $text_download; ?></a></li>
            <!--
            <li><a href="<?php echo $reward; ?>"><i class="iconfont icon-iconfontwodeyouhuijuan"></i> <?php echo $text_reward; ?></a></li>
            -->
            <?php if ($reward) { ?>
            <li><a href="<?php echo $reward; ?>"><i class="iconfont icon-iconfontwodehuiyuanqia"></i> <?php echo $text_reward; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $return; ?>"><i class="iconfont icon-tuihuo"></i> <?php echo $text_return; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><i class="iconfont icon-custom-take-notes"></i> <?php echo $text_transaction; ?></a></li>
            <!-- <li class="hidden"><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
            <li><a href="http://mall.opencart.cn/index.php?route=account/recurring"><i class="iconfont">&#xf00bb;</i> 分期付款</a></li> -->
          </ul>
        </div>
      </div>
      <div class="row widget">
        <div class="col-sm-12">
          <!--<h2>我的订阅</h2>-->
          <ul class="accordion-list list-unstyled">
            <li><a href="<?php echo $newsletter; ?>"><i class="iconfont icon-iconfontyoujian"></i> <?php echo $text_newsletter; ?></a></li>
            <li><a href="index.php?route=account/logout"><i class="iconfont icon-iconfont31wode"></i> 退出登录</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
