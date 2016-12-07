<?php echo $header; ?>
<div class="container">
    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top; ?>
            <div class="content">
                <div class="container">
                    <div class="article-top">
                        <h3><?php echo $heading_title; ?></h3>
                        <div class="article-bottom">
                            <div class="col-md-4 article-para">
                                <div>
                                    <img src="catalog/view/theme/test/image/men.jpg" alt="image" class="img-responsive zoom-img">
                                </div>
                            </div>
                            <div class="col-md-8 article-head">
                                <h6 ><a href="#">Lorem ipsum dolor sit amet, consectetur adipisci ngelit. Donec nisi sem, vestibulum</a></h6>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisi sem, vestibulum ac lobortis quis, aliquet in metus. Suspendi sse a nibh id eros consectetur laoreet. Etiam viverra auctor orci, eu mattis ipsum rutrum nec.</p>
                                <p>Etortor tortor in turpis. Proin mauris nulla, rutrum aliquet arcu vel, porttitor varius dolor. Phasellus vitae tincidunt orci, et faucibus eros. Sed dolor sapien, pharetra placerat feugiat.</p>
                                <p>Proin mauris nulla, rutrum aliquet arcu vel, porttitor varius dolor. Phasellus vitae tincidunt orci, et faucibus eros. Sed dolor sapien, pharetra placerat feugiat non, molestie nec elit.Aenean fringilla metus enim, non congue velit porta id. Mauris non lacus sollicitudin, suscipit erat eu, sodales metus. Pellentesque sit amet fringilla orci. Suspendisse lacinia quam et sapien blandit, eu mattis risus posuere. Morbi turpis lorem, vestibulum at turpis vel, suscipit tristique urna. Sed nec dapibus tellus, vel fringilla turpis. Phasellus mollis, lacus sed auct or lobortis, ante nisl tincidunt nibh.</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="article-bottom">

                            <div class="col-md-8 article-head">
                                <h6 ><a href="#">Lorem ipsum dolor sit amet, consectetur adipisci ngelit. Donec nisi sem, vestibulum</a></h6>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisi sem, vestibulum ac lobortis quis, aliquet in metus. Suspendi sse a nibh id eros consectetur laoreet. Etiam viverra auctor orci, eu mattis ipsum rutrum nec.</p>
                                <p>Etortor tortor in turpis. Proin mauris nulla, rutrum aliquet arcu vel, porttitor varius dolor. Phasellus vitae tincidunt orci, et faucibus eros. Sed dolor sapien, pharetra placerat feugiat.</p>
                                <p>Proin mauris nulla, rutrum aliquet arcu vel, porttitor varius dolor. Phasellus vitae tincidunt orci, et faucibus eros. Sed dolor sapien, pharetra placerat feugiat non, molestie nec elit.Aenean fringilla metus enim, non congue velit porta id. Mauris non lacus sollicitudin, suscipit erat eu, sodales metus. Pellentesque sit amet fringilla orci. Suspendisse lacinia quam et sapien blandit, eu mattis risus posuere. Morbi turpis lorem, vestibulum at turpis vel, suscipit tristique urna. Sed nec dapibus tellus, vel fringilla turpis. Phasellus mollis, lacus sed auct or lobortis, ante nisl tincidunt nibh.</p>
                            </div>
                            <div class="col-md-4 article-para">
                                <div>
                                    <img src="catalog/view/theme/test/image/women.jpg" alt="image" class="img-responsive zoom-img">
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>

                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>