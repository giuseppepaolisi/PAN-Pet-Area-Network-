<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PAN:Pet Area Network</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style/home.css" type="text/css"/>
<link rel="stylesheet" href="style/slideshow.css" type="text/css"/>
<script src="jquery-3.3.1.min.js"></script>
 <%@ include file="ico.html" %>
</head>
<body>

<div class="container">
	
    <!-- inizio home-->
	<div id="home" class="scaglione">
		<div>
			<div class="mySlides fade">
		      <img id="imgslide" src="Immagini index/slideshow/cane1.jpg" style="width:100%">
		    </div>
		    
		    <div class="mySlides fade">
		      <img id="imgslide" src="Immagini index/slideshow/cane2.jpg" style="width:100%">
		    </div>
		    
		    <div class="mySlides fade">
		      <img id="imgslide" src="Immagini index/slideshow/cane3.jpg" style="width:100%">
		    </div>	  	    
		    <p class="text">PAN (Pet Area Network)</p>
		</div>
	    <div style="text-align:center; margin:20px 0 20px;">
	      <span class="dot" onclick="currentSlide(0)"></span> 
	      <span class="dot" onclick="currentSlide(1)"></span> 
	      <span class="dot" onclick="currentSlide(2)"></span> 
	    </div>
	    
	    <script src="script/slideShow.js"></script>
	    
    </div>
    <!-- fine home-->
	<div id="affidarsi_a_noi" class="scaglione">
		<h3> Perchè affidarsi a noi </h3>
		<img class="imgdesc" src="Immagini index\piscina.jpg" alt="Errore caricamento immagine">
		<p class="descrizione">
			Affidandoci i vostri piccoli amici a 4 zampe potrete stare sereni per qualsiasi tipo di viaggio o impegno fuoricasa 
			che vi porta ad avere difficilta' con l'affidamento o le cure che un qualsiasi animale da compagnia puo richiedere.
			Grazie alle nostre strutture esso potra' godere
		</p>
	</div>
	<div id="chi_siamo" class="scaglione">
		<h3>Chi siamo </h3>
		<p class="descrizione-right">
		La PAN e' un'associazione avente una sede di accesso per le funzionalita' sopra descritte;
		sara' possibile avere accesso ad un numero finito di servizi, acquistabili singolarmente o in gruppo,
		il cui scopo e' permettere all'utente di usufruire di trattamenti volti alla cura piu' specifica 
		del proprio animale domestico.
		</p>
		<img class="imgdesc-right" src="Immagini index\canegatto.jpg" alt="Errore di caricamento immagine">
	</div>
	<div id="dove_siamo" class="scaglione">
		<h3>Dove siamo</h3>
		<img class="imgdesc" src="Immagini index\maps.jpg" alt="Errore caricamento immagine">
	</div>

    <script src="script/menu.js"></script>
    
    <%@ include file="menu.html" %>
    <img class="menu-button" src="immagini/menu.png">
</div>
</body>
</html>