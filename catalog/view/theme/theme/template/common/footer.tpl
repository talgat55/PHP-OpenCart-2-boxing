<footer>
    <div class="container">
        <div class="row">
            <?php if ($informations) { ?>
            <div class="information-block col-md-5  col-sm-12 col-xs-12">
                <h4><?php echo $text_information; ?></h4>
                <ul class="list-unstyled  footer-list-links">
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?>
            <div class="col-md-7  col-sm-12 col-xs-12">
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

    </div>
    </div>
</footer>

<?php if (!isset($this->request->get['route']) || $this->request->get['route'] == 'common/home'){ ?>
<link href="catalog/view/theme/theme/stylesheet/slick.css" rel="stylesheet">
<link href="catalog/view/theme/theme/stylesheet/slick-theme.css" rel="stylesheet">
<?php } ?>
<link href="catalog/view/theme/theme/stylesheet/fontawesome-all.css" rel="stylesheet">

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

<?php if (!isset($this->request->get['route']) || $this->request->get['route'] == 'common/home'){ ?>
<script src="catalog/view/theme/theme/js/jquery-ui.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme/js/slick.min.js" type="text/javascript"></script>

<?php } ?>
<?php
// enable script on page product
$pos = strpos($class, 'product-product');
if($pos !== false) {
?>
<script src="catalog/view/theme/theme/js/select2.min.js" type="text/javascript"></script>

<?php } ?>
<?php  if($_REQUEST['_route_'] == 'contacts') :   ?>

    <script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>

<?php endif; ?>



<script src="catalog/view/theme/theme/js/load-more.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme/js/default.js" type="text/javascript"></script>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>