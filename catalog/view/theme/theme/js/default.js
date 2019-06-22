// ---------------------------------------------------------
// !!!!!!!!!!!!!!!!!document ready!!!!!!!!!!!!!!!!!!!!!!!!!!
// ---------------------------------------------------------
jQuery(document).ready(function () {


    homeSlider();
    clickWishBlock();
    changeInputForm();
    carouselSetCategory();
    instagram();
    dropDownMenuCategories();
    dropDownFiltersCategoryPage();
    hideLeftBlockCAtegoryPage();
    select2OnProductPage();
    accordionTabInPageProduct();
    showCategotyonMobile();
    mapInit();
    reviewSlider();
    addImageInMenu();
    addDropDownMenu();
    countDownPromotion();
    hoverMenuItem();


    /*
    * Match height
    */
    var product_item = jQuery('.latest-block .product-layout, .products-row .product-layout');
    if (product_item.length) {

        product_item.matchHeight();

    }


    // end redy function
});

jQuery(window).resize(function () {
    homeSlider();
    showCategotyonMobile();

});


//-------------------------------
//  Add arrow in menu for dropdown
//-------------------------------
function addDropDownMenu() {
    "use strict";
    var menulist = jQuery('#menu .navbar-nav li');
    menulist.each(function () {
        var $this = jQuery(this);
        if ($this.hasClass('dropdown')) {
            $this.append('<span class="arrow-down"></span>');
            console.log('true');
        } else {

            console.log('false');
        }
    });

}

//-------------------------------
//  Add image for item menu   Sle
//-------------------------------
function addImageInMenu() {
    "use strict";
    var $this = jQuery('.nav li a.dropdown-toggle:contains("Распродажа")');

        $this.addClass('sale-class');
        $this.css('color', 'red');




}

//-------------------------------
//  Hover menu item
//-------------------------------
function hoverMenuItem() {
    "use strict";
    let widthWindow = jQuery(window).width();
    if (widthWindow > 1024) {
        jQuery( "#menu li " ).hover(
            function() {
                jQuery(this).find(' > a').addClass('active');
            }, function() {
                jQuery(this).find(' > a').removeClass('active');
            }
        );


    }
}

//-------------------------------
//  Show category menu for Mobile
//-------------------------------
function showCategotyonMobile() {
    "use strict";
    let widthWindow = jQuery(window).width();
    if (widthWindow < 993) {

        jQuery('body').on('click', ' #menu .navbar-header', function () {
            console.log('w');
            jQuery('#menu .navbar-collapse.collapse').toggleClass('active');

            return false;

        });
    }
}


// -------------------------------
//  Home slideshow
//-------------------------------
function homeSlider() {
    "use strict";
    let homeClass = jQuery('.home-slider');
    let widthWindow = jQuery(window).width();
    if (homeClass.length) {
        // homeClass.unslick();

        if (jQuery('.home-slider.slick-initialized').length) {
            homeClass.slick('unslick');

        }

        if (widthWindow > 1200) {
            sliderHomeSlick(homeClass);
        } else {
            homeClass.removeAttr('style');
            sliderHomeSlick(homeClass);
        }


    }
}

function sliderHomeSlick(homeClass) {
    homeClass.slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        autoplay: true,
        pauseOnHover: false
    });
}

//-------------------------------
//  Review slider
//-------------------------------
function reviewSlider() {
    "use strict";
    let reviewClass = jQuery('.review-block');
    if (reviewClass.length) {
        reviewClass.slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: true,
            dots: true,
            // autoplay: true,
            pauseOnHover: false
        });
    }

}

//-------------------------------
//  Click on wish block
//-------------------------------
function clickWishBlock() {
    "use strict";
    jQuery('.product-thumb .top-block .wish a').click(function () {
        return false;
    });
}

//-------------------------------
//  Change type input for subscribe
//-------------------------------
function changeInputForm() {
    "use strict";
    let inputId = jQuery('#form-sobfeedback33 #sobInput33-1, #sobInput34-2');
    if (inputId.length) {
        inputId.attr('type', 'email');
    }

}


//-------------------------------
//  Carousel Category Set
//-------------------------------
function carouselSetCategory() {
    "use strict";
    let carouselClass = jQuery('.list-specific-products, .list-linked-products');
    let sliderHandle = jQuery('.slider');
    if (carouselClass.length) {
        carouselClass.slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            arrows: false,
            autoplay: true,
            pauseOnHover: true,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                },
                {
                    breakpoint: 700,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }
                // You can unslick at a given breakpoint now by adding:
                // settings: "unslick"
                // instead of a settings object
            ]
        });
        sliderHandle.slider({
            min: 1,
            max: 8,
            step: 1,
            value: 1,
            slide: function (event, ui) {
                carouselClass.slick('slickGoTo', ui.value - 1);
            }
        });

        carouselClass.on('beforeChange', function (event, slick, currentSlide, nextSlide) {
            sliderHandle.slider('value', nextSlide + 1);
        });


    }

    // change: function( event, ui ) {}

}


//-------------------------------
//  Instagram Widget
//-------------------------------
function instagram() {
    "use strict";
    // Remove styles for instagram widget
    jQuery('.widget > a').prev().remove();
    jQuery('.widget ').find('.profile, .title').remove();
    jQuery('.instagram-section ').find('title, meta, .copyright, script, noscript').remove();
}

//-------------------------------
//  Dropdown sub menu
//-------------------------------
function dropDownMenuCategories() {
    "use strict";
    jQuery('.dropdown-toggle').click(function () {
        jQuery(this).next().stop().slideToggle();
        jQuery(this).toggleClass("accordion-open");
        jQuery(this).parent().find('.arrow-down').toggleClass("rotate");
    }).next().stop().hide();
}

//-------------------------------
//  Dropdown filters in category page
//-------------------------------
function dropDownFiltersCategoryPage() {
    "use strict";
    jQuery('.accordion-block .title').click(function () {
        jQuery(this).next().stop().slideToggle();
        jQuery(this).toggleClass("accordion-open");
    }).next().stop().hide();
}

//-------------------------------
//  Hide left sidebar in page category if empty block
//-------------------------------
function hideLeftBlockCAtegoryPage() {
    "use strict";

    var accordionClass = jQuery(".accordion-block");

    if (accordionClass.length) {
        accordionClass.each(function (index) {

            var thisClass = jQuery(this);
            if (thisClass.find('div').length == '0') {

                thisClass.hide();
            }

        });

    }

}

//-------------------------------
//  Select on page product
//-------------------------------
function select2OnProductPage() {
    "use strict";

    var selectClass = jQuery(".select-two-selection");
    if (selectClass.length) {
        selectClass.select2({
            minimumResultsForSearch: -1,
            width: 'resolve'
        });
    }

}

//-------------------------------
// Count Dom promotion in single product
//-------------------------------
function countDownPromotion() {
    "use strict";
    var countDown = jQuery('#countdown');
    var note = jQuery('#note');
    if (countDown.length) {
        var ts = new Date(note.attr('data-date')),
            newYear = true;

        if ((new Date()) > ts) {
            // The new year is here! Count towards something else.
            // Notice the *1000 at the end - time must be in milliseconds
            ts = (new Date()).getTime() + 1 * 0 * 0 * 0 * 0;
            newYear = false;
        }

        countDown.countdown({
            timestamp: ts,
            callback: function (days, hours, minutes, seconds) {

                var message = "";

                message += days + " дней" + (days == 1 ? '' : '') + ", ";
                message += hours + " часов" + (hours == 1 ? '' : '') + ", ";
                message += minutes + " минут" + (minutes == 1 ? '' : '') + " и ";
                message += seconds + " секунд" + (seconds == 1 ? '' : '') + " <br />";

                if (newYear) {
                    message += "";
                } else {
                    message += "";
                }

                //  note.html(message);
            }
        });
    }
}


//-------------------------------
//  Accordion tabs in page product
//-------------------------------
function accordionTabInPageProduct() {
    "use strict";

    var clickClass = jQuery(".tab-link-read-more");
    if (clickClass.length) {
        clickClass.click(function () {
            var thisTab = jQuery(this).parent().find('.tab-content .tab-pane.active');
            if (thisTab.hasClass('active-tab')) {
                thisTab.removeAttr('style');
                thisTab.removeClass('active-tab');
            } else {
                var ContentClass = jQuery(this).parent().find('.tab-content .tab-pane.active .content').height();


                if (thisTab.is("#tab-specification")) {

                    thisTab.css('height', ContentClass + 70 + jQuery('#tab-specification table').outerHeight());
                } else {
                    thisTab.css('height', ContentClass + 50);
                }


                thisTab.addClass('active-tab');
            }


            return false;
        });
    }


}


//
// Map
//
function mapInit() {
    "use strict";

    if (jQuery('#map').length) {
        ymaps.ready(function () {
            var myMap = new ymaps.Map('map', {
                    center: [55.857197, 37.558957],
                    zoom: 18,
                    controls: ['zoomControl']
                }, {
                    // searchControlProvider: 'yandex#search'
                }),

                // Создаём макет содержимого.
                /*  MyIconContentLayout = ymaps.templateLayoutFactory.createClass(
                      '<div style="color: #FFFFFF; font-weight: bold;">$[properties.iconContent]</div>'
                  ),*/

                myPlacemark = new ymaps.Placemark([55.857197, 37.558957], {
                    id: '1'
                }, {

                    // Опции.
                    // Необходимо указать данный тип макета.
                    iconLayout: 'default#image',
                    // Своё изображение иконки метки.

                    iconImageHref: 'https://good-fighter.shop/catalog/view/theme/theme/image/main/marker.png',
                    // Размеры метки.
                    iconImageSize: [79, 103],
                    // Смещение левого верхнего угла иконки относительно
                    // её "ножки" (точки привязки).
                    iconImageOffset: [-39, -103]
                });


            myMap.geoObjects

                .add(myPlacemark);

            myMap.behaviors.disable('scrollZoom');
            myMap.behaviors.disable('multiTouch');


        });
    }
}

