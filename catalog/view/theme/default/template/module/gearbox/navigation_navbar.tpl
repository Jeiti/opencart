<?php if ($navigation) { ?>
<div class="module-gearbox-navigation gearbox-navigation-navbar">
  <nav class="navbar navbar-megamenu <?php echo $module['suffix'] ?>">
    <div class="navbar-header visible-xs visible-sm">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation-collapse-<?php echo $timestamp; ?>">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"><?php echo $text_navigation; ?></a>
    </div>

    <div id="navigation-collapse-<?php echo $timestamp; ?>" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($navigation as $nav) { ?>

          <?php
          if ($nav['type'] == 'all_category') { ?>
            <?php foreach ($nav['children'] as $category) { ?>
              <?php if ($category['children']) { ?>
                <li class="dropdown">
                  <a href="<?php echo $category['href']; ?>" class="dropdown-toggle disabled" data-toggle="dropdown">
                    <?php echo $category['name']; ?>
                    <span class="caret"></span>
                  </a>
                  
                  <?php if ($category['column'] > 1) { ?>
                    <div class="dropdown-menu dropdown-megamenu">
                      <div class="megamenu-container megamenu-<?php echo min($category['column'], 5); ?> clearfix">
                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / min($category['column'], 5) )) as $children) { ?>
                          <ul class="megamenu-item">
                            <?php foreach ($children as $child) { ?>
                            <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                        <?php } ?>
                      </div>
                      <ul class="megamenu-item visible-xs visible-sm">
                        <li class="see-all"><a href="<?php echo $category['href']; ?>"><?php echo $text_all; ?> <?php echo $category['name']; ?></a></li>
                      </ul>
                    </div>
                  <?php } else { ?>
                    <ul class="dropdown-menu">
                      <?php foreach ($category['children'] as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                      <?php } ?>
                        <li class="see-all visible-xs visible-sm"><a href="<?php echo $category['href']; ?>"><?php echo $text_all; ?> <?php echo $category['name']; ?></a></li>
                    </ul>
                  <?php } ?>
                </li>
              <?php } else { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
            <?php }
          // End nav type 'all_category' ?>

          <?php } else { ?>
            <?php if ($nav['children']) { ?>
              <li class="dropdown <?php echo $nav['suffix']; ?>">
                <a href="<?php echo $nav['link']; ?>" class="dropdown-toggle disabled" data-toggle="dropdown">
                  <?php echo $nav['title']; ?>
                  <span class="caret"></span>
                </a>

                <div class="dropdown-menu dropdown-megamenu">
                  <?php foreach ($nav['children'] as $layout1) { ?>
                    <?php if ($layout1['type'] == 'container' && $layout1['children']) { ?>
                      <div class="megamenu-container megamenu-<?php echo min($layout1['width'], 5); ?> <?php echo $layout1['suffix']; ?> clearfix">
                        <?php foreach ($layout1['children'] as $layout2) { ?>

                          <?php if ($layout2['type'] == 'row') { ?>
                            <div class="row <?php echo $layout2['suffix']; ?>">
                              <?php foreach ($layout2['children'] as $layout3) { ?>

                                <?php if ($layout3['type'] == 'grid') { ?>
                                  <div class="col-md-<?php echo $layout3['width']; ?> col-lg-<?php echo $layout3['width']; ?> <?php echo $layout3['suffix']; ?>">
                                    <ul class="megamenu-item">
                                      <?php foreach ($layout3['children'] as $nav1) { ?>

                                        <?php if ($nav1['children']) { ?>
                                          <li class="dropdown <?php echo $nav1['suffix']; ?>">
                                            <a href="<?php echo $nav1['link']; ?>" <?php echo $nav1['new_window'] ? 'target="_blank"' : ''; ?>>
                                              <?php echo $nav1['title']; ?>
                                              <span class="caret caret-right"></span>
                                            </a>
                                            <ul class="dropdown-menu dropside-menu">
                                              <?php foreach ($nav1['children'] as $nav2) { ?>

                                                <?php if ($nav2['children']) { ?>
                                                  <li class="dropdown <?php echo $nav2['suffix']; ?>">
                                                    <a href="<?php echo $nav2['link']; ?>" <?php echo $nav2['new_window'] ? 'target="_blank"' : ''; ?>>
                                                      <?php echo $nav2['title']; ?>
                                                      <span class="caret caret-right"></span>
                                                    </a>
                                                    <ul class="dropdown-menu dropside-menu">

                                                      <?php foreach ($nav2['children'] as $nav3) { ?>
                                                        <?php if (strpos($nav3['suffix'], 'megamenu-header') !== false) { ?>
                                                          <li class="<?php echo $nav3['suffix']; ?>"><?php echo $nav3['title']; ?></li>
                                                        <?php } else { ?>
                                                          <li class="<?php echo $nav3['suffix']; ?>"><a href="<?php echo $nav3['link']; ?>" <?php echo $nav3['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $nav3['title']; ?></a></li>
                                                        <?php } ?>
                                                      <?php } ?>

                                                    </ul>
                                                  </li>
                                                <?php } else { ?>
                                                  <?php if (strpos($nav2['suffix'], 'megamenu-header') !== false) { ?>
                                                    <li class="<?php echo $nav2['suffix']; ?>"><?php echo $nav2['title']; ?></li>
                                                  <?php } else { ?>
                                                    <li class="<?php echo $nav2['suffix']; ?>"><a href="<?php echo $nav2['link']; ?>" <?php echo $nav2['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $nav2['title']; ?></a></li>
                                                  <?php } ?>
                                                <?php } ?>

                                              <?php } ?>
                                            </ul>
                                          </li>
                                        <?php } else { ?>
                                          <?php if (strpos($nav1['suffix'], 'megamenu-header') !== false) { ?>
                                            <li class="<?php echo $nav1['suffix']; ?>"><?php echo $nav1['title']; ?></li>
                                          <?php } else { ?>
                                            <li class="<?php echo $nav1['suffix']; ?>"><a href="<?php echo $nav1['link']; ?>" <?php echo $nav1['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $nav1['title']; ?></a></li>
                                          <?php } ?>
                                        <?php } ?>

                                      <?php } ?>
                                    </ul>
                                  </div>
                                <?php } // end grid ?>

                              <?php } ?>
                            </div>
                          <?php } // end row ?>

                        <?php } ?>
                      </div>
                    <?php } ?>
                    <?php if (strpos($layout1['suffix'], 'see-all') !== false) { ?>
                      <ul class="megamenu-item visible-xs visible-sm">
                        <li class="<?php echo $layout1['suffix']; ?>"><a href="<?php echo $layout1['link']; ?>" <?php echo $layout1['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $layout1['title']; ?></a></li>
                      </ul>
                    <?php } ?>
                  <?php } // end $nav['children'] ?>
                </div>
              </li>

            <?php } else{ ?>
              <li class="<?php echo $nav['suffix']; ?>"><a href="<?php echo $nav['link']; ?>" <?php echo $nav['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $nav['title']; ?></a></li>
            <?php } ?>
          <?php } ?>

        <?php } ?>
      </ul> <!-- /.navbar-nav -->
    </div>
  </nav>

  <script>
  navbarClickable();

  if (typeof debouncer === 'function') { 
    $(window).resize(debouncer(function(e) { navbarClickable(); }));
  } else {
    $(window).resize(function() { navbarClickable(); });
  }

  function navbarClickable() {
    if ($('.gearbox-navigation-navbar .navbar-header').is(':hidden')) {
      $('#navigation-collapse-<?php echo $timestamp; ?>').find('.dropdown-toggle').addClass('disabled');
    }
    if (!$('.gearbox-navigation-navbar .navbar-header').is(':hidden')) {
      $('#navigation-collapse-<?php echo $timestamp; ?>').find('.dropdown-toggle').removeClass('disabled');
    }
  }
  </script>
</div>
<?php } ?>