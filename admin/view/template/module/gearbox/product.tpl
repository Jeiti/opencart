<div class="uk-panel">
    <h2 id="component-title" class="uk-margin-remove uk-float-left"><?php echo $module_id ? $text_edit_product . ' <span class="uk-article-lead uk-text-muted">' . $text_module . ' #' . $module_id . '</span>' : $text_new_product; ?></h2>

    <div class="uk-float-right">
        <div class="uk-button-group">
            <a id="js-actionSave" class="uk-button uk-button-success"><i class="uk-icon-save uk-icon-nano"></i> <?php echo $text_save; ?></a>
            <div data-uk-dropdown>
                <a class="uk-button uk-button-success"><i class="uk-icon-cog uk-icon-nano"></i></a>
                <div class="uk-dropdown uk-dropdown-small uk-dropdown-flip">
                    <ul class="uk-nav uk-nav-dropdown">
                        <li><a id="js-actionSaveClose"><i class="uk-icon-check-square-o"></i> <?php echo $text_save_close; ?></a></li>
                        <li><a id="js-actionSaveNew"><i class="uk-icon-file-text-o"></i> <?php echo $text_save_new; ?></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <a class="uk-button" href="<?php echo $url_cancel; ?>"><i class="uk-icon-times uk-icon-nano"></i> <?php echo $text_cancel; ?></a>
    </div>
</div>

<div class="uk-divider"></div>

<div class="uk-form uk-form-horizontal et-form-striped-row">
    <form id="js-module-form" action="<?php echo $url_action; ?>" method="post">
        <div class="uk-panel uk-panel-box">
            <label class="uk-form-label" for="name"><span class="uk-text-danger">*</span> <?php echo $text_module_name; ?></label>
            <div class="uk-form-controls">
                <input id="module-name" type="text" name="name" value="<?php echo $form['name'] ?>" class="uk-width-4-5">
                <input id="module-id" type="hidden" name="module_id" value="<?php echo $module_id ?>">
                <input id="component" type="hidden" name="component" value="product">
            </div>
        </div>

        <div class="uk-form-row uk-margin-large-top">
            <label class="uk-form-label"><?php echo $text_title; ?></label>
            <div class="uk-form-controls">
                <div class="uk-width-19-40 uk-float-left">
                    <?php foreach ($languages as $lang) { ?>
                        <div class="multi-input-row">
                            <img src="view/image/flags/<?php echo $lang['image']; ?>" />
                            <input type="text" name="title[<?php echo $lang['language_id']; ?>]" value="<?php echo isset($form['title'][$lang['language_id']]) ? $form['title'][$lang['language_id']] : ''; ?>" class="uk-width-9-10">
                        </div>
                    <?php } ?>
                </div>
                <div class="et-form-help et-form-help-right"><?php echo $text_module_title_help; ?></div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_show_header; ?></label>
            <div class="uk-form-controls">
                <div class="uk-button-group" data-uk-button-radio>
                    <label for="header-1" class="uk-button uk-button-small uk-button-primary-active et-cursor-pointer <?php echo $form['header'] ? 'uk-active' : ''; ?>"><?php echo $text_yes; ?></label>
                    <label for="header-0" class="uk-button uk-button-small uk-button-danger-active et-cursor-pointer <?php echo !$form['header'] ? 'uk-active' : ''; ?>"><?php echo $text_no; ?></label>
                </div>
                <div class="uk-hidden">
                    <input type="radio" id="header-1" name="header" value="1" <?php echo $form['header'] ? 'checked' : ''; ?>>
                    <input type="radio" id="header-0" name="header" value="0" <?php echo !$form['header'] ? 'checked' : ''; ?>>
                </div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_status; ?></label>
            <div class="uk-form-controls">
                <div class="uk-button-group" data-uk-button-radio>
                    <label for="status-1" class="uk-button uk-button-small uk-button-primary-active et-cursor-pointer <?php echo $form['status'] ? 'uk-active' : ''; ?>"><?php echo $text_enabled; ?></label>
                    <label for="status-0" class="uk-button uk-button-small uk-button-danger-active et-cursor-pointer <?php echo !$form['status'] ? 'uk-active' : ''; ?>"><?php echo $text_disabled; ?></label>
                </div>
                <div class="uk-hidden">
                    <input type="radio" id="status-1" name="status" value="1" <?php echo $form['status'] ? 'checked' : ''; ?>>
                    <input type="radio" id="status-0" name="status" value="0" <?php echo !$form['status'] ? 'checked' : ''; ?>>
                </div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label" for="suffix"><?php echo $text_class_suffix; ?></label>
            <div class="uk-form-controls">
                <input type="text" id="suffix" name="suffix" value="<?php echo $form['suffix']; ?>" class="uk-width-2-5">
                <div class="et-form-help et-form-help-right"><?php echo $text_module_class_suffix_help; ?></div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label" for="template"><?php echo $text_template; ?></label>
            <div class="uk-form-controls">
                <select id="template" name="template" class="uk-width-1-5">
                    <?php foreach ($templates as $template) { ?>
                        <option value="<?php echo $template['value']; ?>" <?php echo $template['value'] == $form['template'] ? 'selected' : ''; ?>><?php echo $template['name']; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>

        <h3 class="uk-section uk-margin-large-top"><?php echo $text_setting; ?></h2>
        <div class="uk-form-row">
            <label class="uk-form-label" for="type"><?php echo $text_module_type; ?></label>
            <div class="uk-form-controls">
                <select id="type" name="type" class="uk-width-1-5">
                    <option value="latest" <?php echo $form['type'] == 'latest' ? 'selected' : ''; ?>>Latest</option>
                    <option value="special" <?php echo $form['type'] == 'special' ? 'selected' : ''; ?>>Special</option>
                    <option value="bestseller" <?php echo $form['type'] == 'bestseller' ? 'selected' : ''; ?>>Bestseller</option>
                    <option value="featured" <?php echo $form['type'] == 'featured' ? 'selected' : ''; ?>>Featured</option>
                </select>
            </div>
        </div>
        <div id="type-featured" class="uk-form-row <?php echo $form['type'] == 'featured' ? '' : 'hidden'; ?>">
            <label class="uk-form-label" for="featured-input"><?php echo $text_products; ?></label>
            <div class="uk-form-controls select2-width-1-2">
                <input type="text" id="featured-input" name="featured" autocomplete="off" placeholder="<?php echo $text_product_search; ?>">
                <div class="uk-scrollable-box uk-width-1-2 uk-margin-top">
                    <ul id="featured-placeholder" class="uk-list uk-list-striped">
                        <?php foreach ($featured as $product) { ?>
                            <li id="featured-product-<?php echo $product['id']; ?>"><i class="uk-icon-minus-square"></i> <label><input type="hidden" name="featured[]" value="<?php echo $product['id']; ?>"> <?php echo $product['name']; ?></label></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label" for="limit"><?php echo $text_product_limit; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="limit" value="<?php echo $form['limit']; ?>" id="limit" class="uk-width-3-40">
                <div class="et-form-help et-form-help-right"><?php echo $text_product_limit_help; ?></div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label" for="desc-limit"><?php echo $text_teaser_length; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="desc_length" value="<?php echo $form['desc_length'] ?>" id="desc-limit" class="uk-width-3-40">
                <div class="et-form-help et-form-help-right"><?php echo $text_teaser_length_help; ?></div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label" for="image"><?php echo $text_image_size; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="image_w" value="<?php echo $form['image_w'] ?>" id="image" class="uk-width-3-40"> x 
                <input type="text" name="image_h" value="<?php echo $form['image_h'] ?>" class="uk-width-3-40">
            </div>
        </div>

        <h3 class="uk-section uk-margin-large-top"><?php echo $text_viewport; ?></h2>
        <p><?php echo $text_viewport_help; ?></p>
        <div class="uk-form-row">
            <label class="uk-form-label" for="viewport-phone"><?php echo $text_phone; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="viewport_phone" value="<?php echo $form['viewport_phone'] ?>" id="viewport-phone" class="uk-width-3-40">
                <div class="et-form-help et-form-help-right"><?php echo $text_phone_screen; ?></div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label" for="viewport-tablet"><?php echo $text_tablet; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="viewport_tablet" value="<?php echo $form['viewport_tablet'] ?>" id="viewport-tablet" class="uk-width-3-40">
                <div class="et-form-help et-form-help-right"><?php echo $text_tablet_screen; ?></div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label" for="viewport-desktop"><?php echo $text_desktop; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="viewport_desktop" value="<?php echo $form['viewport_desktop'] ?>" id="viewport-desktop" class="uk-width-3-40">
                <div class="et-form-help et-form-help-right"><?php echo $text_desktop_screen; ?></div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label" for="viewport-xdesktop"><?php echo $text_xdesktop; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="viewport_xdesktop" value="<?php echo $form['viewport_xdesktop'] ?>" id="viewport-xdesktop" class="uk-width-3-40">
                <div class="et-form-help et-form-help-right"><?php echo $text_xdesktop_screen; ?></div>
            </div>
        </div>
    </form>
</div> <!-- /.uk-form -->

<script>
$(document).ready(function()
{
    $('#type').on('change', function() {
        if ($(this).val() == 'featured') {
            $('#type-featured').removeClass('hidden');
        } else {
            $('#type-featured').addClass('hidden');
        }
    });

    $('#featured-input').autocomplete({
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item.name,
                            value: item.product_id
                        };
                    }));
                }
            });
        },
        select: function(item) {
            $('#featured-input').val('');
            $('#featured-product-' + item.value).remove();
            $('#featured-placeholder').append('<li id="featured-product-' + item.value + '"><i class="uk-icon-minus-square"></i> <label><input type="hidden" name="featured[]" value="' + item.value + '"> ' + item.label + '</label></li>');
        }
    });
    $('#featured-placeholder').on('click', '.uk-icon-minus-square', function() {
        $(this).parent().remove();
    });

    //=== Save Module
    $('#js-actionSave').on('click', function() {
        submitModuleForm('save', true);
    });
    $('#js-actionSaveClose').on('click', function() {
        submitModuleForm('close', true);
    });
    $('#js-actionSaveNew').on('click', function() {
        submitModuleForm('new', true);
    });
});

function submitModuleForm(type, notify) {
    $('#js-module-form').ajaxSubmit({
        dataType    : 'json',
        cache       : false,
        data        : { 'submitType': type, 'name': 'Product - ' + $('#module-name').val(), 'module_id': $('#module-id').val(), 'component': $('#component').val() },
        beforeSubmit: function (formData, jqForm, options) {
            var error           = false,
                modName         = $('#module-name'),
                modNameCount    = $('#module-name').val().length;

            $('.module-name-alert').remove();
            modName.removeClass('uk-form-danger');

            if (modNameCount < 3 || modNameCount > 64) {
                modName.addClass('uk-form-danger');
                modName.parent().append('<div class="uk-form-help-block uk-text-danger uk-text-small module-name-alert"><?php echo $error_module_name; ?></div>');

                error = true;
            }

            if (error) {
                $.etNotify({
                    message : '<?php echo $error_general; ?>',
                    icon    : 'thumbs-down',
                    status  : 'warning'
                });

                return false;
            }
        },
        beforeSend  : function (data) {
            if (notify) {
                $.etNotify({
                    message     : '<?php echo $js_general_saving_module; ?>',
                    icon        : 'refresh uk-icon-spin',
                    timeout     : 120000,
                    clear       : true,
                });
            }
        },
        success     : function (data) {
            if (!data.error) {
                if (data.new_id) {
                    $('#module-id').val(data.new_id);
                    $('#component-title').html('<?php echo $text_edit_product; ?> <span class="uk-article-lead uk-text-muted"><?php echo $text_module; ?> #' + data.new_id + '</span>');
                }

                if (notify) {
                    $.etNotify({
                        message     : '<?php echo $js_success_save; ?>',
                        icon        : 'check',
                        status      : 'success',
                        clear       : true,
                    });

                    if (data.redirect) {
                        $.etNotify({
                            message     : '<?php echo $js_redirect; ?>',
                            icon        : 'location-arrow',
                            status      : 'primary',
                            clear       : true,
                        });
                        setTimeout(function() {
                            window.location.replace(data.redirect);
                        }, 1000);
                    }
                }
            } else {
                $.etNotify({
                    message : data.errorMsg ? data.errorMsg : '<?php echo $js_general_error; ?>',
                    icon    : 'exclamation',
                    status  : 'danger',
                    clear   : true
                });
            }
        }
    });
}

</script>