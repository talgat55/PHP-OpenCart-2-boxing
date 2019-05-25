<div class="filter_type_image">
    <?php foreach ($inputs_data as $input_data) { ?>
        <?php if ($input_data['image']) { ?>
            <label>
                <?php $attr_checked = ''; ?>
                <?php if ($input_data['is_active']) { ?>
                    <?php $attr_checked = 'checked="checked"'; ?>
                <?php } ?>

                <?php $attr_disabled = (!$input_data['is_enable']) ? 'disabled="disabled"' : ''; ?>
                <input style="display: none;"
                       type="radio"
                       name="<?= $input_data['input_name']; ?>[<?= $section['id']; ?>][]"
                       value="<?= $input_data['input_value']; ?>"
                    <?= $attr_checked; ?>
                    <?= $attr_disabled; ?>
                    >
                <img
                    src="<?= $input_data['image']; ?>"
                    data-toggle="tooltip"
                    data-placement="bottom"
                    title="<?= $input_data['input_label'] ?>"/>
            </label>
        <?php } ?>
    <?php } ?>
</div>