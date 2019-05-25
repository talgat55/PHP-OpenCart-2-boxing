<?php
/**
 * filter_data(manufacturers[], categories[], options[], attributes[])
 */
?>
<div class="form-group">
    <label class="col-sm-2 control-label"></label>
    <label class="col-sm-2 control-label"><?= $text_type; ?></label>
    <label class="col-sm-1 control-label">
        <?= $text_hide; ?>
        <input type="checkbox"
               class="form-control checkbox-inline"
               id="hide_all"
        >
    </label>
    <label class="col-sm-1 control-label">
        <?= $text_close; ?>
        <input type="checkbox"
               class="form-control checkbox-inline"
               id="close_all"
        >
    </label>

</div>

<div class="row">
    <div class="col-sm-2">
        <span class="badge badge-danger"><?= $text_filter_price ?></span>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label"><?= $text_filter_price ?></label>
    <label class="col-sm-offset-2 col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['filter_price']['hide'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               class="form-control checkbox-inline hide_all"
               name="DEF_settings[filter_price][hide]"
            <?= $checked ?>
        >
    </label>

    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['filter_price']['close'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               class="form-control checkbox-inline close_all"
               name="DEF_settings[filter_price][close]"
            <?= $checked ?>
        >
    </label>
</div>

<?php foreach ($packages as $package) { ?>
    <div class="row">
        <div class="col-sm-2">
            <span class="badge badge-warning"> <?= $package['name'] ?></span>
        </div>
    </div>
    <div class="form-group">
        <?php foreach ($package['items'] as $section) { ?>
            <?php
            $input_name = $package['key'];
            $input_label = $section['input_label'];
            $section_id = $section['section_id'];
            $group_name = $section['group_name'];
            ?>
            <div class="row">
                <label class="col-sm-2 control-label"><?= $input_label; ?> <label class="badge badge-secondary"><?= $group_name; ?></label></label>

                <div class="col-sm-2">
                    <select
                            name="DEF_settings[<?= $input_name ?>][<?= $section_id ?>][type]"
                            class="form-control"
                    >
                        <?php foreach ($list_types_input as $type_input => $type_name) { ?>
                            <?php $selected = '' ?>

                            <?php if (!empty($exception_type_inputs_for_packages[$package['key']]) && preg_match($exception_type_inputs_for_packages[$package['key']], $type_input)) { ?>
                                <?php continue; ?>
                            <?php } ?>

                            <?php if (isset($DEF_settings[$input_name][$section_id]['type'])) { ?>
                                <?php if ($type_input == $DEF_settings[$input_name][$section_id]['type']) { ?>
                                    <?php $selected = '  selected="selected"'; ?>
                                <?php } ?>
                            <?php } ?>

                            <option value="<?= $type_input ?>" <?= $selected; ?>><?= $type_name ?></option>
                        <?php } ?>
                    </select>
                </div>
                <label class="col-sm-1 control-label">
                    <?php $checked = ''; ?>
                    <?php if (isset($DEF_settings[$input_name][$section_id]['hide'])) { ?>
                        <?php $checked = ' checked="checked"'; ?>
                    <?php } ?>

                    <input type="checkbox"
                           class="form-control checkbox-inline hide_all"
                           name="DEF_settings[<?= $input_name ?>][<?= $section_id ?>][hide]"
                        <?= $checked ?>
                    >
                </label>

                <label class="col-sm-1 control-label">
                    <?php $checked = ''; ?>
                    <?php if (isset($DEF_settings[$input_name][$section_id]['close'])) { ?>
                        <?php $checked = ' checked="checked"'; ?>
                    <?php } ?>

                    <input type="checkbox"
                           class="form-control checkbox-inline close_all"
                           name="DEF_settings[<?= $input_name ?>][<?= $section_id ?>][close]"
                        <?= $checked ?>
                    >
                </label>

                <input
                        type="hidden"
                        name="DEF_settings[<?= $input_name ?>][<?= $section_id ?>][input_label]"
                        value="<?= $input_label ?>"
                >

                <input
                        type="hidden"
                        name="DEF_settings[<?= $input_name ?>][<?= $section_id ?>][element_id]"
                        value="<?= $section_id ?>"
                >
            </div>

        <?php } ?>
    </div>
<?php } ?>
