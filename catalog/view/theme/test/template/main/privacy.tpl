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
        <div class="content">
            <div class="container">
                <div class="privacy-top">
                    <h3><?php echo $heading_title; ?></h3>
                    <div class="privacy-bottom">
                        <h5><a href="#">Lorem Ipsum is simply dummy text of the printing and typesetting.</a></h5>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage. and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
                    </div>
                    <div class="privacy-bottom">
                        <h5><a href="#">There are many variations of passages of Lorem Ipsum available.</a></h5>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage. and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
                    </div>
                    <div class="privacy-bottom">
                        <h5><a href="#">Lorem Ipsum is simply dummy text of the printing and typesetting.</a></h5>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage. and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
                    </div>
                    <div class="privacy-bottom">
                        <h5><a href="#">There are many variations of passages of Lorem Ipsum available.</a></h5>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage. and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
                    </div>
                </div>
            </div>
        </div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>