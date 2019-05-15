// ---------------------------------------------------------
// !!!!!!!!!!!!!!!!!document ready!!!!!!!!!!!!!!!!!!!!!!!!!!
// ---------------------------------------------------------
jQuery(document).ready(function () {




    homeSlider();


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
