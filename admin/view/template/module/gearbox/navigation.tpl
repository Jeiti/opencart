<div class="uk-panel">
    <h2 id="component-title" class="uk-margin-remove uk-float-left"><?php echo $module_id ? $text_edit_navigation . ' <span class="uk-article-lead uk-text-muted">' . $text_module . ' #' . $module_id . '</span>' : $text_new_navigation; ?></h2>

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
    <div class="uk-grid">
        <div class="uk-width-1-1">
            <div class="uk-form-row uk-panel uk-panel-box">
                <label class="uk-form-label" for="name"><span class="uk-text-danger">*</span> <?php echo $text_module_name; ?></label>
                <div class="uk-form-controls">
                    <input id="module-name" type="text" name="name" value="<?php echo $form['name'] ?>" class="uk-width-4-5">
                    <input id="module-id" type="hidden" name="module_id" value="<?php echo $module_id ?>">
                    <input id="component" type="hidden" name="component" value="navigation">
                </div>
            </div>
        </div>
    </div>

    <div class="uk-grid">
        <div class="uk-width-1-1">
            <ul class="uk-tab" data-uk-tab="{connect:'#content-main'}">
                <li class="uk-active"><a><?php echo $text_configuration; ?></a></li>
                <li><a><?php echo $text_module_content; ?></a></li>
            </ul>

            <div id="content-main" class="uk-margin-medium-top uk-switcher">
                <!-- Module Setting -->
                <div class="uk-animation-fade et-label-narrow">
                    <form id="js-module-form" action="<?php echo $url_action; ?>" method="post">
                        <div class="uk-form-row">
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

                        <h3 class="uk-section uk-margin-large-top"><?php echo $text_information; ?></h2>
                        <ul class="uk-list uk-list-striped">
                            <li><?php echo $text_nav_info_1; ?>
                                <ul class="uk-list">
                                    <li><?php echo $text_nav_info_1a; ?></li>
                                    <li><?php echo $text_nav_info_1b; ?></li>
                                    <li><?php echo $text_nav_info_1c; ?></li>
                                    <li><?php echo $text_nav_info_1d; ?></li>
                                </ul>
                            </li>
                        </ul>
                    </form>
                </div>

                <!-- Module Content -->
                <div class="uk-animation-fade">
                    <div class="uk-grid">
                        <div class="uk-width-3-5 et-label-short">
                            <div class="uk-panel">
                                <h2 id="item-title" class="uk-section uk-float-left uk-margin-remove"><?php echo $text_new_item; ?></h2>
                                <a id="js-item-save" class="uk-button uk-float-right uk-button-small uk-button-primary"><i class="uk-icon-save uk-icon-nano"></i> <?php echo $text_save_item; ?></a>
                            </div>

                            <form id="js-item-form" action="<?php echo $url_action_item; ?>" method="post" class="uk-margin-top">
                                <div id="item-form" class="uk-margin-top"></div>

                                <div class="uk-divider uk-margin-medium-top"></div>
                                <a id="js-item-save-bottom" class="uk-button uk-float-right uk-button-small uk-button-primary"><i class="uk-icon-save uk-icon-nano"></i> <?php echo $text_save_item; ?></a>
                            </form>
                        </div>

                        <div class="uk-width-2-5">
                            <div class="uk-panel">
                                <h2 class="uk-section uk-float-left uk-margin-remove"><?php echo $text_item_tree; ?></h2>
                                <a id="js-item-new" class="uk-button uk-float-right uk-button-small uk-button-primary"><i class="uk-icon-plus"></i> <?php echo $text_new; ?></a>
                            </div>

                            <div id="item-tree" class="uk-margin-top"></div>
                            <div class="uk-divider uk-margin-medium-top"></div>
                            <a id="js-actionSave-bottom" class="uk-button uk-float-right uk-button-success"><i class="uk-icon-save uk-icon-nano"></i> <?php echo $text_save; ?></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div> <!-- /.uk-form -->

<script>
$(document).ready(function()
{
    itemForm(0, 0);
    $('#item-tree').load('index.php?route=module/gearbox/navigation/itemTree&module_id=<?php echo $module_id ?>&token=<?php echo $token; ?>');

    //=== Save Module
    $('#js-actionSave, #js-actionSave-bottom').on('click', function() {
        submitModuleForm('save', true);
    });
    $('#js-actionSaveClose').on('click', function() {
        submitModuleForm('close', true);
    });
    $('#js-actionSaveNew').on('click', function() {
        submitModuleForm('new', true);
    });

    //=== Save Item
    $('#js-item-save, #js-item-save-bottom').on('click', function() {
        submitItemForm('save');
    });

    //======================================================
    $('#item-form').on('change', '#item-type', function() {
        gearComponnentInput('#item-type');
    });

    $('#item-form').on('change', '#container-width', function() {
        $('.js-item-title').val('Container ' + $('#container-width option:selected').html());
    });
    $('#item-form').on('change', '#grid-width', function() {
        $('.js-item-title').val('Grid ' + $('#grid-width option:selected').html());
    });

    $('#js-item-new').on('click', function() {
        itemForm(0, 0);
    });
    $('#item-tree').on('click', '.js-item-disabled', function() {
        var item_id = $(this).closest('li').data('item');

        $.ajax({
            url     : 'index.php?route=module/gearbox/navigation/itemState&item_id=' + item_id + '&type=status&status=0&token=<?php echo $token; ?>',
            success : function (data) {
                $('.nav-item-' + item_id + ' > .uk-nestable-item').addClass('uk-nestable-item-notice');
                $('.nav-item-' + item_id + ' > .uk-nestable-item > .uk-nestable-action > .js-item-disabled').replaceWith('<a class="js-item-enabled" data-uk-tooltip title="<?php echo $text_click_enabled; ?>"><i class="uk-icon-check uk-icon-small uk-text-success"></i></a>');
            }
        });

        $.etNotify({
            message     : '<?php echo $js_success_disabled; ?>',
            icon        : 'check',
            status      : 'success',
            clear       : true,
        });
    });
    $('#item-tree').on('click', '.js-item-enabled', function() {
        var item_id = $(this).closest('li').data('item');

        $.ajax({
            url     : 'index.php?route=module/gearbox/navigation/itemState&item_id=' + item_id + '&type=status&status=1&token=<?php echo $token; ?>',
            success : function (data) {
                $('.nav-item-' + item_id + ' > .uk-nestable-item').removeClass('uk-nestable-item-notice');
                $('.nav-item-' + item_id + ' > .uk-nestable-item > .uk-nestable-action > .js-item-enabled').replaceWith('<a class="js-item-disabled" data-uk-tooltip title="<?php echo $text_click_disabled; ?>"><i class="uk-icon-times uk-icon-small uk-text-warning"></i></a>');
            }
        });

        $.etNotify({
            message     : '<?php echo $js_success_disabled; ?>',
            icon        : 'check',
            status      : 'success',
            clear       : true,
        });
    });
    $('#item-tree').on('click', '.js-item-edit', function() {
        var item_id     = $(this).closest('li').data('item'),
            parent_id   = $(this).closest('li').data('parent');

        itemForm(item_id, parent_id);
    });
    $('#item-tree').on('click', '.js-item-delete', function() {
        var this_li     = $(this).closest('li');
            this_child  = this_li.find('.uk-nestable-list:first > li');

            swal({
                title: '<?php echo $text_confirm_sure; ?>',
                text: '<?php echo $text_confirm_delete_item_nav; ?>',
                html: true,
                showCancelButton: true,
                confirmButtonText: "<?php echo $text_confirm_yes; ?>",
                cancelButtonText: '<?php echo $text_cancel; ?>',
                closeOnConfirm: true,
                allowEscapeKey: true,
                allowOutsideClick: true,
            }, function(isConfirm) {
                if (isConfirm) {
                    if ($('#item-id').val() == this_li.data('item')) {
                        itemForm(0, 0);
                    }

                    this_child.insertBefore(this_li);
                    this_li.remove();

                    $.ajax({
                        url: 'index.php?route=module/gearbox/navigation/itemState&item_id=' + this_li.data('item') + '&type=delete&token=<?php echo $token; ?>'
                    });

                    $('#navigation').trigger('nestable-save');

                    $.etNotify({
                        message     : '<?php echo $js_success_delete; ?>',
                        icon        : 'check',
                        status      : 'success',
                        clear       : true,
                    });
                }
            });
    });

    $('#item-tree').on('nestable-stop', '#navigation', function() {
        $('#navigation').trigger('nestable-save');

        var formItemId = $('#item-id').val();
        if (formItemId !== '0') {
            itemForm(0, 0);
        }
    });

    $('#item-tree').on('nestable-save', '#navigation', function() {
        $('#navigation').find('li').each(function(){
            var item = $(this),
                item_parent = item.parents('li').data('item') || 0;

            item.attr('data-parent', item_parent);
        });
    });
});

function gearComponnentInput(s) {
    var value = $(s).val();

    $('.component-input').hide();
    $('.component-data-' + value).show();

    if (value == 'container') {
        $('.js-item-title').val('Container ' + $('#container-width option:selected').text());
    } else if (value == 'row') {
        $('.js-item-title').val('Row');
    } else if (value == 'grid') {
        $('.js-item-title').val('Grid ' + $('#grid-width option:selected').text());
    } else if (!$(s).is(':disabled')) {
        $('.js-item-title').val('');
    }
}

function itemForm(item_id, parent_id) {
    $('#item-form').html('<i class="uk-icon-refresh uk-icon-spin"></i> Loading');

    if (!item_id) {
        $('#item-title').html('<?php echo $text_new_item; ?>');
    } else {
    $('#item-title').html('<?php echo $text_edit_item; ?>');
    }

    setTimeout(function() {
        $('#item-form').load('index.php?route=module/gearbox/navigation/itemForm&item_id=' + item_id + '&parent_id=' + parent_id + '&token=<?php echo $token; ?>');
    }, 500);
}

//=== Save
function submitModuleForm(type, notify) {
    $('#js-module-form').ajaxSubmit({
        dataType    : 'json',
        cache       : false,
        data        : { 'submitType': type, 'name': 'Navigation - ' + $('#module-name').val(), 'module_id': $('#module-id').val(), 'component': $('#component').val(), 'navigation': $('#navigation').data('nestable').serialize() },
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
                    $('#component-title').html('<?php echo $text_edit_navigation; ?> <span class="uk-article-lead uk-text-muted">Module #' + data.new_id + '</span>');
                } else {
                    $('#item-tree').load('index.php?route=module/gearbox/navigation/itemTree&module_id=' + $('#module-id').val() + '&token=<?php echo $token; ?>');
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

function submitItemForm(type) {
    $('#js-item-form').ajaxSubmit({
        dataType    : 'json',
        cache       : false,
        data        : { 'submitType': type, 'module_id': $('#module-id').val(), 'item_id': $('#item-id').val(), 'parent_id': $('#parent-id').val(), 'sort_order': $('#sort-order').val(), 'data_1': $('#item-type').val() },
        beforeSubmit: function (formData, jqForm, options) {
            var error       = false,
                moduleId    = $('#module-id').val();

            $('.module-item-title-alert').remove();
            $('.js-item-title').removeClass('uk-form-danger');

            if (moduleId === '0') {
                $.etNotify({
                    message : '<?php echo $error_save_module; ?>',
                    icon    : 'thumbs-down',
                    status  : 'warning'
                });

                return false;
            }

            $('.js-item-title').filter(function () {
                var titleLength = $.trim($(this).val()).length;

                if (!titleLength) {
                    $(this).addClass('uk-form-danger');
                    error = true;
                }
            });
            if (error) {
                $('.js-item-title').closest('.uk-form-controls').append('<div class="uk-form-help-block uk-text-danger uk-text-small module-item-title-alert"><?php echo $error_item_title; ?></div>');
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
            $.etNotify({
                message     : '<?php echo $js_general_saving_item; ?>',
                icon        : 'refresh uk-icon-spin',
                timeout     : 120000,
                clear       : true,
            });
        },
        success     : function (data) {
            if (!data.error) {
                var item = '';

                if (data.new_id) {
                    $('#item-type').prop('disabled', true);
                    $('#item-id').val(data.new_id);

                    item += '<li data-item="' + data.new_id + '" data-parent="0" class="nav-item-' + data.new_id + '">';
                    item += '    <div class="uk-nestable-item ' + (data.item.status == '0' ? 'uk-nestable-item-notice' : '') + '">';
                    item += '       <div class="uk-nestable-handle"></div> <div data-nestable-action="toggle"></div> ';
                    item += '       <span class="nestable-content">' + data.item.title + '</span>';
                    item += '       <div class="uk-nestable-action uk-animation-slide-right"> <code class="uk-text-small uk-margin-small-right">' + data.item.data_1 + '</code>';
                    if (data.item.status == '0') {
                        item += '       <a class="js-item-enabled" data-uk-tooltip title="<?php echo $text_click_enabled; ?>"><i class="uk-icon-check uk-icon-small uk-text-success"></i></a>';
                    } else {
                        item += '       <a class="js-item-disabled" data-uk-tooltip title="<?php echo $text_click_disabled; ?>"><i class="uk-icon-times uk-icon-small uk-text-warning"></i></a>';
                    }
                    item += '           <a class="js-item-edit" data-uk-tooltip title="<?php echo $text_edit; ?>"><i class="uk-icon-edit uk-icon-small uk-text-primary"></i></a>';
                    item += '           <a class="js-item-delete" data-uk-tooltip title="<?php echo $text_delete; ?>"><i class="uk-icon-trash-o uk-icon-small uk-text-danger"></i></a>';
                    item += '       </div>';
                    item += '   </div>';
                    item += '</li>';

                    $('#navigation').prepend(item);
                }

                if (data.update_id) {
                    $('.nav-item-' + data.update_id + ' > .uk-nestable-item > .nestable-content').html(data.item.title);

                    if (data.item.status == '1') {
                        $('.nav-item-' + data.update_id + ' > .uk-nestable-item').removeClass('uk-nestable-item-notice');
                        $('.nav-item-' + data.update_id + ' > .uk-nestable-item > .uk-nestable-action > .js-item-enabled').replaceWith('<a class="js-item-disabled" data-uk-tooltip title="<?php echo $text_click_disabled; ?>"><i class="uk-icon-times uk-icon-small uk-text-warning"></i></a>');
                    } else {
                        $('.nav-item-' + data.update_id + ' > .uk-nestable-item').addClass('uk-nestable-item-notice');
                        $('.nav-item-' + data.update_id + ' > .uk-nestable-item > .uk-nestable-action > .js-item-disabled').replaceWith('<a class="js-item-enabled" data-uk-tooltip title="<?php echo $text_click_enabled; ?>"><i class="uk-icon-check uk-icon-small uk-text-success"></i></a>');
                    }
                }

                $('#navigation').trigger('nestable-save');
                $('#item-title').html('<?php echo $text_edit_item; ?>');

                $.etNotify({
                    message     : '<?php echo $js_success_save; ?>',
                    icon        : 'check',
                    status      : 'success',
                    clear       : true,
                });

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