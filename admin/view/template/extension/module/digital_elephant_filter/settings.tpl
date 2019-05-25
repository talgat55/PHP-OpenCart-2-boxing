<div class="form-group">
    <label class="col-sm-2 control-label"><?= $text_setting_name; ?></label>
    <label class="col-sm-1 control-label"><?= $entry_status; ?></label>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="display-totals"><?= $text_on_display_totals ?></label>
    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['is_display_total'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               id="display-totals"
               class="form-control checkbox-inline"
               name="DEF_settings[is_display_total]"
            <?= $checked ?>
            >
    </label>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="display-attributes-group"><?= $text_on_group_attributes ?></label>

    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['is_group_attributes'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               id="display-attributes-group"
               class="form-control checkbox-inline"
               name="DEF_settings[is_group_attributes]"
            <?= $checked ?>
            >
    </label>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="display-button-apply"><?= $text_on_button_apply ?></label>

    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['is_button_apply'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               id="display-button-apply"
               class="form-control checkbox-inline"
               name="DEF_settings[is_button_apply]"
            <?= $checked ?>
            >
    </label>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="display-button-clear"><?= $text_on_button_clear ?></label>

    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['is_button_clear'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               id="display-button-clear"
               class="form-control checkbox-inline"
               name="DEF_settings[is_button_clear]"
            <?= $checked ?>
            >
    </label>
</div>


<div class="form-group">
    <label class="col-sm-2 control-label" for="enable-seo-keywords"><?= $text_on_seo_keywords ?></label>
    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['seo']['is_keywords'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               id="enable-seo-keywords"
               class="form-control checkbox-inline"
               name="DEF_settings[seo][is_keywords]"
            <?= $checked ?>
        >
    </label>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="enable-show-more"><?= $text_state_show_more ?></label>
    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['state']['is_button_show_more'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               id="enable-show-more"
               class="form-control checkbox-inline"
               name="DEF_settings[state][is_button_show_more]"
            <?= $checked ?>
        >
    </label>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="enable-pagination"><?= $text_state_pagination ?></label>
    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['state']['is_pagination'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               id="enable-pagination"
               class="form-control checkbox-inline"
               name="DEF_settings[state][is_pagination]"
            <?= $checked ?>
        >
    </label>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="enable-text-pagination"><?= $text_state_quantity_products ?></label>
    <label class="col-sm-1 control-label">
        <?php $checked = ''; ?>
        <?php if (isset($DEF_settings['state']['is_quantity_products'])) { ?>
            <?php $checked = ' checked="checked"'; ?>
        <?php } ?>
        <input type="checkbox"
               id="enable-text-pagination"
               class="form-control checkbox-inline"
               name="DEF_settings[state][is_quantity_products]"
            <?= $checked ?>
        >
    </label>
</div>

<?php if ($preloaders) { ?>
    <div class="form-group">
        <label class="col-sm-2 control-label"><?= $text_choose_preloader ?></label>
        <?php foreach ($preloaders as $value => $class) { ?>
            <?php $checked = ''; ?>
            <?php if ($value == $DEF_settings['preloader_type']) { $checked = 'checked="checked"'; } ?>
            <label class="col-sm-1 control-label">
                <input type="radio"
                       style="padding-top: 0;"
                       class="form-control radio-inline"
                       name="DEF_settings[preloader_type]"
                       value="<?= $value ?>"
                    <?= $checked ?>
                >
                <i class="<?= $class ?>"></i>
            </label>
        <?php } ?>
    </div>
<?php }