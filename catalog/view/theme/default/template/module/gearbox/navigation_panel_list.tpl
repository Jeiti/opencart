<?php if ($navigation) { ?>
<div class="module-gearbox-navigation gearbox-navigation-panel-list <?php echo $module['suffix'] ?>">
  <?php if($module['header']) { ?>
    <h3 class="oc-module-heading"><?php echo $module['title'][$language_id]; ?></h3>
  <?php } ?>

  <div class="list-group">
    <?php foreach ($navigation as $nav) { ?>
      <a href="<?php echo $nav['link']; ?>" <?php echo $nav['new_window'] ? 'target="_blank"' : ''; ?> class="list-group-item"><?php echo $nav['title']; ?></a>

        <?php if ($nav['children']) { ?>
          <?php foreach ($nav['children'] as $nav1) { ?>
            <a href="<?php echo $nav1['link']; ?>" <?php echo $nav1['new_window'] ? 'target="_blank"' : ''; ?> class="list-group-item"><div class="bs-margin-left-xs"><?php echo $nav1['title']; ?></div></a>

              <?php if ($nav1['children']) { ?>
                <?php foreach ($nav1['children'] as $nav2) { ?>
                  <a href="<?php echo $nav2['link']; ?>" <?php echo $nav2['new_window'] ? 'target="_blank"' : ''; ?> class="list-group-item"><div class="bs-margin-left-sm"><?php echo $nav2['title']; ?></div></a>

                    <?php if ($nav2['children']) { ?>
                      <?php foreach ($nav2['children'] as $nav3) { ?>
                        <a href="<?php echo $nav3['link']; ?>" <?php echo $nav2['new_window'] ? 'target="_blank"' : ''; ?> class="list-group-item"><div class="bs-margin-left"><?php echo $nav3['title']; ?></div></a>
                      <?php } ?>
                    <?php } ?>

                <?php } ?>
              <?php } ?>

          <?php } ?>
        <?php } ?>

    <?php } ?>
  </div>
</div>
<?php } ?>