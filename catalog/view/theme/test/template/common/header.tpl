<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title; ?></title>



  <link href="/makeup/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="/makeup/js/jquery.min.js"></script>
  <!-- Custom Theme files -->
  <!--theme-style-->
  <link href="/makeup/css/style.css" rel="stylesheet" type="text/css" media="all" />
  <!--//theme-style-->
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!--fonts-->
  <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,700,400italic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
  <!--//fonts-->
</head>
<body>
<!--header-->
<div class="header">
  <div class="header-top">
    <div class="container">
      <div class="header-grid">
        <ul>
          <li  ><a href="/makeup/articles.html" class="scroll">Articles</a></li>
          <li><a href="/makeup/contact.html" class="scroll">Contact  </a></li>
          <li><a href="/makeup/privacy.html" class="scroll">Privacy</a></li>
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
      <div class="ad-right">
        <img class="img-responsive" src="/makeup/images/ad.png" alt=" " >
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