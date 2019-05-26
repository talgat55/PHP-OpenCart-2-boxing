<footer>
    <div class="container">
        <div class="row">
            <?php if ($informations) { ?>
            <div class="information-block col-sm-5 col-xs-12">
                <h4><?php echo $text_information; ?></h4>
                <ul class="list-unstyled  footer-list-links">
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?>
            <div class="col-sm-7 col-xs-12">
                <div class="row">
                    <div class="col-sm-6 col-xs-12">
                        <div class="email-block">
                            <h4>
                                Наша почта:
                            </h4>
                            <a href="mailto:<?php echo $emailto; ?>">
                                <?php echo $emailto;?>
                            </a>
                        </div>
                        <div class="search-block">
                            <?php echo $search; ?>
                        </div>
                        <div class="phone-block">
                            <img src="/catalog/view/theme/theme/image/main/phone.png" alt="Иконка "/>
                            <ul class="lists-phones">
                                <li>
                                    <a href="tel:88007759535">
                                        8 (800) 775-95-35
                                    </a>
                                </li>
                                <li>
                                    <a href="tel:84993471935">
                                        8 (499) 347-19-35
                                    </a>
                                </li>
                            </ul>

                        </div>
                        <div class="request-call-block">
                            <div  class="link-call">
                                <?php echo $sobfeedback_id34; ?>
                            </div>
                        </div>

                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <div class="social-block">
                            <h4>Мы в соц. сетях:</h4>
                            <ul class="list-soc-link">
                                <li>
                                    <a  target="_blank" href="https://vk.com/takeshi_fight_gear">
                                        <i class="fab fa-vk"></i>
                                    </a>
                                </li>
                                <li>
                                    <a  target="_blank" href="https://www.facebook.com/takeshi.fight.gear/">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target="_blank" href="https://www.instagram.com/takeshi.fight.gear/">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                </li>
                                <li>
                                    <a  target="_blank" href="#">
                                        <i class="fab fa-odnoklassniki"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target="_blank"  href="#">
                                        <i class="fab fa-youtube"></i>
                                    </a>
                                </li>


                            </ul>
                        </div>
                        <div class="delivery-block">
                            <h4>Способы оплаты:</h4>

                            <ul class="list-delivery-images">
                                <li>
                                    <img src="/catalog/view/theme/theme/image/main/visa-logo.png" alt="Иконка "/>
                                </li>
                                 <li>
                                    <img src="/catalog/view/theme/theme/image/main/pochta.png" alt="Иконка "/>
                                </li> <li>
                                    <img src="/catalog/view/theme/theme/image/main/sberbank-oproverg-in.png" alt="Иконка "/>
                                </li>

                            </ul>
                        </div>
                    </div>


                </div>
            </div>


            <?php   /*
      <div class="col-sm-3">
            <h5><?php echo $text_service; ?></h5>
            <ul class="list-unstyled">
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
            </ul>
        </div>
        <div class="col-sm-3">
            <h5><?php echo $text_extra; ?></h5>
            <ul class="list-unstyled">
                <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            </ul>
        </div>
        <div class="col-sm-3">
            <h5><?php echo $text_account; ?></h5>
            <ul class="list-unstyled">
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
            </ul>
        </div*/ ?>
    </div>
    </div>
</footer>

<?php if (!isset($this->request->get['route']) || $this->request->get['route'] == 'common/home'){ ?>
<link href="catalog/view/theme/theme/stylesheet/slick.css" rel="stylesheet">
<link href="catalog/view/theme/theme/stylesheet/slick-theme.css" rel="stylesheet">
<?php } ?>
<link href="catalog/view/theme/theme/stylesheet/fontawesome-all.css" rel="stylesheet">
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php if (!isset($this->request->get['route']) || $this->request->get['route'] == 'common/home'){ ?>
<script src="catalog/view/theme/theme/js/jquery-ui.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme/js/slick.min.js" type="text/javascript"></script>

<?php } ?>
<?php
// enable script on page product
$pos = strpos($class, 'product-product');
if($pos !== false) {
?>
<script src="catalog/view/theme/theme/js/select2.min.js" type="text/javascript"></script>

<?php } ?>

<script src="catalog/view/theme/theme/js/load-more.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme/js/default.js" type="text/javascript"></script>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>