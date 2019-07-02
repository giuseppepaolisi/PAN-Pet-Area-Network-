var slideIndex = 0;
	    showSlides();
	    
	    function showSlides() {
	        var i;
	        var slides = document.getElementsByClassName("mySlides");
	        var dots = document.getElementsByClassName("dot");
	        for (i = 0; i < slides.length; i++) {
	            slides[i].style.display = "none";
	            dots[i].className = dots[i].className.replace(" active", "");
	        }
	        slideIndex++;
	        if (slideIndex > slides.length) {slideIndex = 1}
	        slides[slideIndex-1].style.display = "block";
	        dots[slideIndex-1].className += " active";
	        setTimeout(showSlides, 5000); //setta il timer a 5s
	    }
	    
		function currentSlide(n){
			var dots = document.getElementsByClassName("dot");
			var slides = document.getElementsByClassName("mySlides");
			for (i = 0; i < slides.length; i++) {
	            if(i!=n){
	            	slides[i].style.display = "none";
	            	dots[i].className = dots[i].className.replace(" active","");
	            }
	        }
			slides[n].style.display = "block";
			dots[n].className += " active";
	    }