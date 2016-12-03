<?php if ($navigation) { ?>
<div class="module-gearbox-navigation gearbox-navigation-plain-list <?php echo $module['suffix'] ?>">
  <?php if($module['header']) { ?>
    <h5 class="header"><?php echo $module['title'][$language_id]; ?></h5>
  <?php } ?>

  <ul class="list-unstyled">
    <?php foreach ($navigation as $nav) { ?>
      <li><a href="<?php echo $nav['link']; ?>" <?php echo $nav['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $nav['title']; ?></a>

        <?php if ($nav['children']) { ?>
          <ul>
            <?php foreach ($nav['children'] as $nav1) { ?>
              <li><a href="<?php echo $nav1['link']; ?>" <?php echo $nav1['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $nav1['title']; ?></a>

                <?php if ($nav1['children']) { ?>
                  <ul>
                    <?php foreach ($nav1['children'] as $nav2) { ?>
                      <li><a href="<?php echo $nav2['link']; ?>" <?php echo $nav2['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $nav2['title']; ?></a>

                        <?php if ($nav2['children']) { ?>
                          <ul>
                            <?php foreach ($nav2['children'] as $nav3) { ?>
                              <li><a href="<?php echo $nav3['link']; ?>" <?php echo $nav2['new_window'] ? 'target="_blank"' : ''; ?>><?php echo $nav3['title']; ?></a></li>
                            <?php } ?>
                          </ul>
                        <?php } ?>

                      </li>
                    <?php } ?>
                  </ul>
                <?php } ?>

              </li>
            <?php } ?>
          </ul>
        <?php } ?>

      </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>