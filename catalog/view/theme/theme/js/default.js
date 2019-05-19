// ---------------------------------------------------------
// !!!!!!!!!!!!!!!!!document ready!!!!!!!!!!!!!!!!!!!!!!!!!!
// ---------------------------------------------------------
jQuery(document).ready(function () {




    homeSlider();
    clickWishBlock();
    changeInputForm();
    carouselSetCategory();
    // end redy function
});


//-------------------------------
//  Home slideshow
//-------------------------------
function homeSlider() {
    "use strict";
    let homeClass = '.home-slider';
    if (jQuery(homeClass).length) {
        jQuery(homeClass).slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            autoplay: true,
            pauseOnHover: false
        });
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
    let inputId = jQuery('#form-sobfeedback33 #sobInput33-1');
    if(inputId.length){
        inputId.attr('type','email');
    }

}
//-------------------------------
//  Carousel Category Set
//-------------------------------
function carouselSetCategory() {
    "use strict";
    let carouselClass = jQuery('.list-specific-products');
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