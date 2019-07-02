$(window).ready(function(){
            $("img.menu-button").click(function(){
                $("div.container").toggleClass("mycontainer");
                $("nav.navigator").toggleClass("mymenu");
                $("img.menu-button").toggleClass("mymenu-button");
            });
            $("nav.navigator a").on("click",function(){
            	$("div.container").removeClass("mycontainer");
                $("nav.navigator").removeClass("mymenu");
                $("img.menu-button").removeClass("mymenu-button");
            });
            $("nav.navigator a").on("click",function(){
            	var a=$("nav.navigator a");
            	for(i=0;i<4;i++){
            		a.removeClass("active-menu");
            		a=a.next();
            	}
            	$(this).addClass("active-menu");
            });
        });
        $(document).ready(function(){

        	  // Add smooth scrolling on all links inside the navbar
        	  $("nav.navigator a").on('click', function(event) {
        	    // Make sure this.hash has a value before overriding default behavior
        	    if (this.hash !== "") {
        	      // Prevent default anchor click behavior
        	      event.preventDefault();

        	      // Store hash
        	      var hash = this.hash;

        	      // Using jQuery's animate() method to add smooth page scroll
        	      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
        	      $('html, body').animate({
        	        scrollTop: $(hash).offset().top
        	      }, 800, function(){
        	   
        	        // Add hash (#) to URL when done scrolling (default click behavior)
        	        window.location.hash = hash;
        	      });
        	    }  // End if
        	  });
        	});