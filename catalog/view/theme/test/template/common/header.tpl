<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
  <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
  <link href="catalog/view/theme/test/stylesheet/style.css" rel="stylesheet">
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!--fonts-->
  <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,700,400italic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
  <?php foreach ($styles as $style) { ?>
  <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
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
<body>
<!--header-->
<div class="header">
  <div class="header-top">
    <div class="container">
      <div class="header-grid">
        <ul>
          <li>
            <a href="<?php echo $home; ?>" class="scroll">
              <?php echo $text_home; ?>
            </a>
          </li>
          <li>
            <a href="<?php echo $articles; ?>" class="scroll">
              <?php echo $entry_history; ?>
            </a>
          </li>
          <li><a href="<?php echo $contact; ?>" class="scroll"><?php echo $entry_contact; ?></a></li>
          <li><a href="<?php echo $privacy; ?>" class="scroll">О нас</a></li>
        </ul>
      </div>
      <div class="header-grid-right">
        <a href="<?php echo $login; ?>" class="sign-in"><?php echo $text_login; ?></a>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
          <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />

          <input type="password" name="password" value="<?php echo $password;?>" placeholder="<?php echo $entry_password;?>" id="input-password" class="form-control" />

          <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
        </form>
        <label>|</label>
        <a href="<?php echo $register; ?>" class="sign-up">Sign Up</a>
      </div>
      <div class="clearfix"> </div>
    </div>
  </div>
  <div class="container">
    <div class="header-bottom">
      <div class="logo">
        <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" alt=" " ></a>
      </div>
      <div class="clearfix"> </div>
    </div>
    <div class="header-bottom-bottom">
      <div class="top-nav">
        <span class="menu"> </span>
        <ul>
          <li class="active"><a href="/makeup/index.html">HOME </a></li>
          <li><a href="/makeup/men.html" >MEN</a></li>
          <li><a href="/makeup/women.html" >WOMEN</a></li>
          <li><a href="/makeup/collection.html" >COLLECTION</a></li>
          <li><a href="/makeup/collection.html" >STORE PRODUCTS</a></li>
          <li><a href="/makeup/collection.html" >LATEST  PRODUCT</a></li>
        </ul>
        <script>
          $("span.menu").click(function(){
            $(".top-nav ul").slideToggle(500, function(){
            });
          });
        </script>

        <div class="clearfix"> </div>
      </div>
      <div class="search">
        <form>
          <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" >
          <input type="submit"  value="">
        </form>
      </div>
      <div class="clearfix"> </div>
    </div>
  </div>
</div>