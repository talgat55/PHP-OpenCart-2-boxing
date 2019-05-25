<?php foreach ($packages as $package) { ?>
    <?php $package_key = $package['key'] ?>
    <?php $package_name = $package['name'] ?>
    <div class="form-group">
        <?php if (!in_array($package['key'], $exception_image_for_packages)) { ?>
            <label class="col-sm-1 control-label"><?= $package_name ?></label>
            <div class="col-sm-8">
                <label class="control-label col-sm-2"><?= $entry_image; ?></label>

                <div class="col-sm-1">
                    <input
                        type="text"
                        class="form-control"
                        name="DEF_settings[advance][<?= $package_key ?>][image][width]"
                        value="<?= $DEF_settings['advance'][$package_key]['image']['width'] ?>"
                        placeholder="<?= $entry_width; ?>"
                        size="3"
                    />
                </div>
                <div class="col-sm-1">
                    <input
                        type="text"
                        class="form-control"
                        name="DEF_settings[advance][<?= $package_key ?>][image][height]"
                        value="<?= $DEF_settings['advance'][$package_key]['image']['height'] ?>"
                        placeholder="<?= $entry_height; ?>"
                        size="3"
                    />
                </div>
            </div>
        <?php } ?>
    </div>
<?php } ?>