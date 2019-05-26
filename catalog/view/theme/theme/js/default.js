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

    // end redy function
});


//-------------------------------
//  Home slideshow
//-------------------------------
function homeSlider() {
    "use strict";
    let homeClass = jQuery('.home-slider');
    if (homeClass.length) {

        let windowWidth = jQuery(window).width();
        let containerWidth = jQuery('.container').width();
        let columnrWidth = jQuery('.col-sm-9').width();

        homeClass.css('width',  (windowWidth - containerWidth ) / 2 + columnrWidth );

       setTimeout(function(){
           homeClass.slick({
               slidesToShow: 1,
               slidesToScroll: 1,
               arrows: false,
               dots: true,
               autoplay: true,
               pauseOnHover: false
           });
       }, 300);

    }
}

//-------------------------------
//  Click on wish block
//-------------------------------
function clickWishBlock() {
    "use strict";
     jQuery('.product-thumb .top-block .wish a').click(function(){
         return false;
     });
}
//-------------------------------
//  Change type input for subscribe
//-------------------------------
function changeInputForm() {
    "use strict";
    let inputId = jQuery('#form-sobfeedback33 #sobInput33-1, #sobInput34-2');
    if(inputId.length){
        inputId.attr('type','email');
    }

}


//-------------------------------
//  Carousel Category Set
//-------------------------------
function carouselSetCategory() {
    "use strict";
    let carouselClass = jQuery('.list-specific-products, .list-linked-products');
    let sliderHandle  = jQuery('.slider');
    if (carouselClass.length) {
        carouselClass.slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            arrows: false,
            autoplay: true,
            pauseOnHover: true
        });
        sliderHandle.slider({
            min: 1,
            max: 8,
            step: 1,
            value: 1,
            slide: function( event, ui ) {
                carouselClass.slick('slickGoTo', ui.value - 1);
            }
        });

        carouselClass.on('beforeChange', function(event, slick, currentSlide, nextSlide){
            sliderHandle.slider('value',nextSlide+1);
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

    var accordionClass =  jQuery( ".accordion-block" );

    if(accordionClass.length){
        accordionClass.each(function( index ) {

            var thisClass = jQuery( this );
            if(thisClass.find('div').length == '0'){

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

    var selectClass =  jQuery( ".select-two-selection" );
    if(selectClass.length){
        selectClass.select2({
            minimumResultsForSearch: -1,
            width: 'resolve'
        });
    }

}
