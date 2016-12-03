<div class="uk-form-row">
    <label class="uk-form-label" for="type"><?php echo $text_type; ?></label>
    <div class="uk-form-controls">
        <select id="item-type" name="data_1" class="uk-width-3-5" <?php echo $form['item_id'] ? 'disabled' : ''; ?>>
            <optgroup label="<?php echo $text_links; ?>">
                <option value="category" <?php echo $form['data_1'] == 'category' ? 'selected' : ''; ?>><?php echo $text_category; ?></option>
                <option value="manufacture" <?php echo $form['data_1'] == 'manufacture' ? 'selected' : ''; ?>><?php echo $text_manufacture; ?></option>
                <option value="information" <?php echo $form['data_1'] == 'information' ? 'selected' : ''; ?>><?php echo $text_information; ?></option>
                <option value="internal" <?php echo $form['data_1'] == 'internal' ? 'selected' : ''; ?>><?php echo $text_url_internal; ?></option>
                <option value="external" <?php echo $form['data_1'] == 'external' ? 'selected' : ''; ?>><?php echo $text_url_external; ?></option>
            </optgroup>
            <optgroup label="<?php echo $text_layouts; ?>">
                <option value="container" <?php echo $form['data_1'] == 'container' ? 'selected' : ''; ?>><?php echo $text_container; ?></option>
                <option value="row" <?php echo $form['data_1'] == 'row' ? 'selected' : ''; ?>><?php echo $text_row; ?></option>
                <option value="grid" <?php echo $form['data_1'] == 'grid' ? 'selected' : ''; ?>><?php echo $text_grid; ?></option>
            </optgroup>
        </select>
        <input id="item-id" type="hidden" name="item_id" value="<?php echo $form['item_id']; ?>">
        <input id="parent-id" type="hidden" name="parent_id" value="<?php echo $form['parent_id']; ?>">
        <input id="sort-order" type="hidden" name="sort_order" value="<?php echo $form['sort_order']; ?>">
    </div>
</div>
<div class="uk-form-row">
    <label class="uk-form-label"><?php echo $text_title; ?></label>
    <div class="uk-form-controls">
        <?php foreach ($languages as $lang) { ?>
            <div class="multi-input-row">
                <img src="view/image/flags/<?php echo $lang['image']; ?>" />
                <input type="text" name="content[<?php echo $lang['language_id']; ?>][title]" value="<?php echo isset($form['content'][$lang['language_id']]) ? $form['content'][$lang['language_id']]['title'] : ''; ?>" class="uk-width-9-10 js-item-title">
            </div>
        <?php } ?>
    </div>
</div>
<div class="uk-form-row">
    <label class="uk-form-label" for="suffix"><?php echo $text_class_suffix; ?></label>
    <div class="uk-form-controls">
        <input type="text" id="suffix" name="suffix" value="<?php echo $form['suffix']; ?>" class="uk-width-9-10">
    </div>
</div>
<div class="uk-form-row">
    <label class="uk-form-label"><?php echo $text_status; ?></label>
    <div class="uk-form-controls">
        <div class="uk-button-group" data-uk-button-radio>
            <label for="status-item-1" class="uk-button uk-button-small uk-button-primary-active et-cursor-pointer <?php echo $form['status'] ? 'uk-active' : ''; ?>"><?php echo $text_enabled; ?></label>
            <label for="status-item-0" class="uk-button uk-button-small uk-button-danger-active et-cursor-pointer <?php echo !$form['status'] ? 'uk-active' : ''; ?>"><?php echo $text_disabled; ?></label>
        </div>
        <div class="uk-hidden">
            <input type="radio" id="status-item-1" name="status" value="1" <?php echo $form['status'] ? 'checked' : ''; ?>>
            <input type="radio" id="status-item-0" name="status" value="0" <?php echo !$form['status'] ? 'checked' : ''; ?>>
        </div>
    </div>
</div>

<!-- Specific component data -->
<div id="component-data">
    <div class="component-input component-data-category">
        <div class="uk-form-row"></div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_category; ?></label>
            <div class="uk-form-controls select2-width-9-10">
                <select name="category_id" class="select2-dropdown">
                    <option value="0"><?php echo $text_all_category; ?></option>
                    <?php foreach ($categories as $category) { ?>
                        <option value="<?php echo $category['category_id'] ?>" <?php echo $form['object_id'] == $category['category_id'] ? 'selected' : ''; ?>><?php echo $category['name'] ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
    </div>

    <div class="component-input component-data-manufacture">
        <div class="uk-form-row"></div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_manufacture; ?></label>
            <div class="uk-form-controls select2-width-1-2">
                <select name="manufacture_id" class="select2-dropdown">
                    <?php foreach ($manufacturers as $manufacture) { ?>
                        <option value="<?php echo $manufacture['manufacturer_id'] ?>" <?php echo $form['object_id'] == $manufacture['manufacturer_id'] ? 'selected' : ''; ?>><?php echo $manufacture['name'] ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
    </div>

    <div class="component-input component-data-information">
        <div class="uk-form-row"></div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_information; ?></label>
            <div class="uk-form-controls select2-width-9-10">
                <select name="information_id" class="select2-dropdown">
                    <?php foreach ($informations as $information) { ?>
                        <option value="<?php echo $information['information_id'] ?>" <?php echo $form['object_id'] == $information['information_id'] ? 'selected' : ''; ?>><?php echo $information['title'] ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
    </div>

    <div class="component-input component-data-internal">
        <div class="uk-form-row"></div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_url_route; ?></label>
            <div class="uk-form-controls">
                <div class="uk-form-placeholder">
                    <i style="width:115px;">index.php?route=</i>
                    <input type="text" name="data_2_internal" value="<?php echo $form['data_2']; ?>" class="uk-width-1-1" style="padding-left:115px;">
                </div>
                <div class="et-form-help"><?php echo $text_url_route_help; ?></div>
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_url_args; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="data_3_internal" value="<?php echo $form['data_3']; ?>" class="uk-width-1-1">
                <div class="et-form-help"><?php echo $text_url_args_help; ?></div>
            </div>
        </div>
    </div>

    <div class="component-input component-data-external">
        <div class="uk-form-row"></div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_url; ?></label>
            <div class="uk-form-controls">
                <input type="text" name="data_2_external" value="<?php echo $form['data_2']; ?>" class="uk-width-1-1">
            </div>
        </div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_new_window; ?></label>
            <div class="uk-form-controls">
                <div class="uk-button-group" data-uk-button-radio>
                    <label for="status-1-external" class="uk-button uk-button-small uk-button-primary-active et-cursor-pointer <?php echo $form['data_3'] ? 'uk-active' : ''; ?>">Yes</label>
                    <label for="status-0-external" class="uk-button uk-button-small uk-button-danger-active et-cursor-pointer <?php echo !$form['data_3'] ? 'uk-active' : ''; ?>">No</label>
                </div>
                <div class="uk-hidden">
                    <input type="radio" id="status-1-external" name="data_3_external" value="1" <?php echo $form['data_3'] ? 'checked' : ''; ?>>
                    <input type="radio" id="status-0-external" name="data_3_external" value="0" <?php echo !$form['data_3'] ? 'checked' : ''; ?>>
                </div>
            </div>
        </div>
    </div>

    <div class="component-input component-data-container">
        <div class="uk-form-row"></div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_width; ?></label>
            <div class="uk-form-controls select2-width-3-10">
                <select id="container-width" name="data_2_container" class="select2-dropdown">
                    <option value="1" <?php echo $form['data_2'] == '1' ? 'selected' : ''; ?>>1 - 185px</option>
                    <option value="2" <?php echo $form['data_2'] == '2' ? 'selected' : ''; ?>>2 - 370px</option>
                    <option value="3" <?php echo $form['data_2'] == '3' ? 'selected' : ''; ?>>3 - 555px</option>
                    <option value="4" <?php echo $form['data_2'] == '4' ? 'selected' : ''; ?>>4 - 740px</option>
                    <option value="5" <?php echo $form['data_2'] == '5' ? 'selected' : ''; ?>>5 - 925px</option>
                    <option value="full" <?php echo $form['data_2'] == 'full' ? 'selected' : ''; ?>>100%</option>
                </select>
            </div>
        </div>
    </div>

    <div class="component-input component-data-grid">
        <div class="uk-form-row"></div>
        <div class="uk-form-row">
            <label class="uk-form-label"><?php echo $text_width; ?></label>
            <div class="uk-form-controls select2-width-3-10">
                <select id="grid-width" name="data_2_grid" class="select2-dropdown">
                    <option value="2-10" <?php echo $form['data_2'] == '2-10' ? 'selected' : ''; ?>>20%</option>
                    <option value="5-20" <?php echo $form['data_2'] == '5-20' ? 'selected' : ''; ?>>25%</option>
                    <option value="4" <?php echo $form['data_2'] == '4' ? 'selected' : ''; ?>>33.33%</option>
                    <option value="4-10" <?php echo $form['data_2'] == '4-10' ? 'selected' : ''; ?>>40%</option>
                    <option value="6" <?php echo $form['data_2'] == '6' ? 'selected' : ''; ?>>50%</option>
                    <option value="6-10" <?php echo $form['data_2'] == '6-10' ? 'selected' : ''; ?>>60%</option>
                    <option value="8" <?php echo $form['data_2'] == '8' ? 'selected' : ''; ?>>66.66%</option>
                    <option value="15-20" <?php echo $form['data_2'] == '15-20' ? 'selected' : ''; ?>>75%</option>
                    <option value="8-10" <?php echo $form['data_2'] == '8-10' ? 'selected' : ''; ?>>80%</option>
                    <option value="12" <?php echo $form['data_2'] == '12' ? 'selected' : ''; ?>>100%</option>
                </select>
            </div>
        </div>
    </div>

    <h3 class="uk-section uk-margin-large-top"><?php echo $text_information; ?></h2>
    <ol class="uk-list-space">
        <li><?php echo $text_nav_item_info_1; ?></li>
        <li><?php echo $text_nav_item_info_2; ?>
            <ul>
                <li><?php echo $text_nav_item_info_2a; ?></li>
                <li><?php echo $text_nav_item_info_2b; ?></li>
            </ul>
        </li>
    </ol>
</div>

<script>
$(document).ready(function()
{
    gearComponnentInput('#item-type');

    $('.select2-dropdown').select2({
        formatNoMatches: '<?php echo $text_no_matchs; ?>'
    });
});
</script>