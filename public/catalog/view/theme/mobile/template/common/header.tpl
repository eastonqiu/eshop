<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/theme/mobile/javascript/jquery-1.11.3.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/mobile/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/mobile/stylesheet/font-iconfont/iconfont.css" rel="stylesheet">
<link href="catalog/view/theme/mobile/javascript/owl-carousel2/owl.carousel.min.css" rel="stylesheet">
<link href="catalog/view/theme/mobile/javascript/owl-carousel2/owl.theme.default.min.css" rel="stylesheet">
<link href="catalog/view/theme/mobile/javascript/swipebox/swipebox.min.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/theme/mobile/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/mobile/javascript/owl-carousel2/owl.carousel.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/mobile/javascript/swipebox/jquery.swipebox.min.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>

<?php
    $active = 0;
    if(isset($_GET['route'])) {
        if ($_GET['route'] == 'product/search') {
            $active = 1;
        } elseif($_GET['route'] == 'mobile/categoryhome') {
            $active = 2; 
        } elseif($_GET['route'] == 'checkout/cart') {
            $active = 3;     
        } elseif($_GET['route'] == 'account/login') {
            $active = 4;     
        }
    }
?>

<nav id="bottom_tab_menu">
  <ul class="list-unstyled">
    <li><a href="<?php echo $home; ?>" class="<?php echo $active==0? active:''; ?>"><i class="iconfont icon-shouye-copy"></i> <div class="name">首页</div></a></li>
    <li><a href="index.php?route=product/search" class="<?php echo $active==1? active:''; ?>"><i class="iconfont icon-search"></i> <div class="name">搜索</div></a></li>
    <li><a href="index.php?route=mobile/categoryhome" class="<?php echo $active==2? active:''; ?>"><i class="iconfont icon-31leimu"></i> <div class="name">分类</div></a></li>
    <li><a href="<?php echo $shopping_cart; ?>" class="<?php echo $active==3? active:''; ?>"><i class="iconfont icon-iconfontgouwuche"><span class="cart_total" style="display:none;"></span></i><div class="name">购物车</div>
    </a></li>
    <li><a href="<?php echo $account; ?>" class="<?php echo $active==4? active:''; ?>"><i class="iconfont icon-iconfont31wode"></i> <div class="name">会员中心</div> </a></li>
  </ul>
</nav>

<body class="<?php echo $class; ?>">
