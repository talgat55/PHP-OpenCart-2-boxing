<?php foreach ($packages as $package) { ?>
    <?php $package_key = $package['key'] ?>
    <?php $package_name = $package['name'] ?>
    <div class="form-group">
        <label class="col-sm-1 control-label"><?= $package_name ?></label>

        <label class="col-sm-1 control-label"><?= $text_sort ?></label>

        <div class="col-sm-1">
            <select
                    name="DEF_settings[advance][<?= $package_key ?>][sort]"
                    class="form-control"
            >
                <?php foreach ($list_types_sort as $type_sort) { ?>
                    <?php $selected = '' ?>
                    <?php if (isset($DEF_settings['advance'][$package_key]['sort'])) { ?>
                        <?php if ($type_sort['value'] == $DEF_settings['advance'][$package_key]['sort']) { ?>
                            <?php $selected = '  selected="selected"'; ?>
                        <?php } ?>
                    <?php } ?>

                    <option
                            value="<?= $type_sort['value'] ?>"
                        <?= $selected; ?>
                    >
                        <?= $type_sort['name'] ?>
                    </option>
                <?php } ?>
            </select>
        </div>
    </div>
<?php } ?>