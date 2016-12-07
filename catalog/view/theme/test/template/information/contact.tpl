<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div class="content">
      <div class="container">
        <div class="contact">







          <div class="contact-in">
            <h1><?php echo $heading_title; ?></h1>
            <div class=" col-md-9 contact-left">

              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <legend><?php echo $text_contact; ?></legend>
                <div>
                  <span><?php echo $entry_name; ?></span>
                  <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="textbox" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
                <div>
                  <span><?php echo $entry_email; ?></span>
                  <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="textbox" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
                <div>
                  <span><?php echo $entry_enquiry; ?></span>
                  <textarea name="enquiry" rows="10" id="input-enquiry"><?php echo $enquiry; ?></textarea>
                  <?php if ($error_enquiry) { ?>
                  <div class="text-danger"><?php echo $error_enquiry; ?></div>
                  <?php } ?>
                </div>
                <div>
                  <span><input type="submit" value="<?php echo $button_submit; ?>" /></span>
                </div>
              </form>
            </div>

            <div class=" col-md-3 contact-right">
              <div class="row">
                <div class="col-sm-12"><strong><?php echo $store; ?></strong><br />
                  <address>
                    <?php echo $address; ?>
                  </address>
                  <?php if ($geocode) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-12"><strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $telephone; ?><br />
                  <br />
                  <?php if ($fax) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $fax; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($open) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $open; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($comment) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $comment; ?>
                  <?php } ?>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>
          </div>

          <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d505145.6949089349!2d115.07157704999999!3d-8.455471450000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd22f7520fca7d3%3A0x2872b62cc456cd84!2sBali%2C+Indonesia!5e0!3m2!1sen!2sin!4v1418170815897"></iframe>
          </div>
        </div>
      </div>
    </div>
    <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>

<?php echo $footer; ?>
