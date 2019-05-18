// ---------------------------------------------------------
// !!!!!!!!!!!!!!!!!document ready!!!!!!!!!!!!!!!!!!!!!!!!!!
// ---------------------------------------------------------
jQuery(document).ready(function () {




    homeSlider();
    clickWishBlock();

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
