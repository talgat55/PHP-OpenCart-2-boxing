// ---------------------------------------------------------
// !!!!!!!!!!!!!!!!!document ready!!!!!!!!!!!!!!!!!!!!!!!!!!
// ---------------------------------------------------------
jQuery(document).ready(function () {




    homeSlider();
    clickWishBlock();
    changeInputForm();

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
