<table class="uk-table uk-table-hover uk-table-striped table-gearlist">
    <thead>
        <tr>
            <th><?php echo $text_name; ?></th>
            <th style="width:110px;"><?php echo $text_status; ?></th>
            <th style="width:110px;"><?php echo $text_action; ?></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($modules as $module) { ?>
            <tr>
                <td><a href="<?php echo $module['link_edit']; ?>"><?php echo $module['name']; ?></a></td>
                <td class="uk-text-center"><span class="uk-badge <?php echo $module['status'] ? 'uk-badge-success' : 'uk-badge-danger'; ?>"><?php echo $module['status'] ? $text_enabled : $text_disabled; ?></span></td>
                <td class="uk-text-center">
                    <a href="<?php echo $module['link_edit']; ?>" data-uk-tooltip title="<?php echo $text_edit; ?>"><i class="uk-icon-edit uk-icon-small uk-text-primary"></i></a>
                    <a href="<?php echo $module['link_delete']; ?>" data-uk-tooltip title="<?php echo $text_delete; ?>"><i class="uk-icon-trash-o uk-icon-small uk-text-danger"></i></a>
                </td>
            </tr>
        <?php } ?>
    </tbody>
</table>