<?php
/**
 * @package     default2 Theme
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

echo $header;
echo $menu; ?>

<div id="content">
    <ul class="uk-breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php if ($breadcrumb['href']) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>" class="uk-link"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } else { ?>
                <li class="<?php echo ($breadcrumb['class'] == 'active') ? 'uk-active' : ''; ?>"><span><?php echo $breadcrumb['text']; ?></span></li>
            <?php } ?>
        <?php } ?>
    </ul>

    <div class="uk-container uk-container-center">

    <div class="uk-grid app-header">
        <div class="uk-width-1-1 uk-text-center app-title">
            <h1>
                Gear<span class="uk-text-danger uk-text-bold">B<i class="uk-icon-cog"></i>X</span>
                <span class="uk-badge uk-badge-success app-state">Free</span>
            </h1>
        </div>
    </div>

    <div class="uk-grid">
        <div class="uk-width-1-5">
            <div class="et-content-border">
                <div class="et-content-inner">
                    <div class="app-navigation">
                        <ul class="uk-nav uk-nav-side">
                            <?php foreach ($navigations as $nav) { ?>
                                <li class="<?php echo $nav[2]; ?><?php echo $this_component == $nav[0] && !$module_id ? 'uk-active' : ''; ?>">
                                    <?php if ($nav[1]) { ?>
                                        <a href="<?php echo $nav[1]; ?>" <?php echo $nav[3]; ?>><?php echo ${'text_' . $nav[0]}; ?></a>
                                    <?php } elseif ($nav[0]) { ?>
                                        <?php echo ${'text_' . $nav[0]}; ?>
                                    <?php } ?>
                                </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="uk-width-4-5">
            <?php foreach ($alerts as $alert) { ?>
                <?php if (isset(${'alert_'.$alert})) { ?>
                    <div class="uk-alert uk-alert-<?php echo $alert; ?>" data-uk-alert>
                        <a class="uk-alert-close uk-close"></a>
                        <p><?php echo ${'alert_'.$alert}; ?></p>
                    </div>
                <?php } ?>
            <?php } ?>

            <div class="et-content-border">
                <div class="et-content-inner">
                    <?php echo $load_component; ?>
                </div>
            </div>
        </div>
    </div>

    <div id="et-footer" class="uk-text-center">
        <div>
            <a href="http://www.echothemes.com"><?php echo $ext_name; ?></a> <?php echo $ext_version; ?> &copy; <a href="http://www.echothemes.com">EchoThemes</a>. All Rights Reserved.
        </div>
    </div>

</div> <!-- /.uk-container -->

<a href="#content" title="Go Up!" data-uk-smooth-scroll class="js-scroll-to-top uk-fixed-bottom-right">
    <span class="uk-panel uk-panel-box uk-panel-box-white">
        <i class="uk-icon-angle-double-up uk-icon-small"></i>
    </span>
</a>

<script>
$(document).ready(function() {
    $('.select2-dropdown').select2({
        formatNoMatches: '<?php echo $text_no_matchs; ?>'
    });
});
</script>

</div> <!-- /#content -->

<?php echo $footer; ?>