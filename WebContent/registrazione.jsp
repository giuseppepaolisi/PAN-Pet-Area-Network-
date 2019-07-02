<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
	<h1>Registrazione</h1>
	<h3>Inserisci tutti i dati rischiesti per favore:</h3>
	<div id="pannello">
		<form action="ServletUtente" method="post">
			<input type="hidden" name="action" value="registrazione">
			Nome:<input required type="text" name="nome" placeholder="nome" value="" onkeyup="controlloFormatoTesto(document.registrazione.nome.value)"><br>
			Cognome:<input required type="text" name="cognome" placeholder="cognome" value="" onkeyup="controlloFormatoTesto(document.registrazione.cognome.value)"><br>
			E-mail:<input required type="email" name="email" placeholder="email" value="" onblur="controlloFormatoEmail(document.registrazione.email.value)" ><img id="img1" src="" alt=""><br>
			Conferma E-mail:<input required type="email" name="email1" placeholder="controllo email" value="" onkeyup="controlloUguaglianza(document.registrazione.email.value,document.registrazione.email1.value)" onblur="controlloFormatoEmail(document.registrazione.email1.value)"><img id="img2" src="" alt=""><br>
			Password<input required type="password" name="pswd" value="" placeholder="password"><br>
			Controlla Password<input required type="password" name="pswd1" value="" placeholder="conferma la password" onkeyup="controlloUguaglianza(document.registrazione.pswd.value,document.registrazione.pswd1.value)"><br>
			Data:<input required type="date" name="data_nascita" placeholder="data nascita" value="" max=""><br>
			Citta:<input required type="text" name="citta" placeholder="città" value="" onkeyup="controlloFormatoTesto(document.registrazione.citta.value)"><br>
			Via:<input required type="text" name="via" placeholder="via" value="" onkeyup="controlloFormatoTesto(document.registrazione.via.value)"><br>
			N.civico<input required type="number" name="nc" placeholder="numero civico" value="" onkeyup="controlloNumeri(document.registrazione.nc.value)"><br>
			Telefono:<input required type="tell" name="tell" placeholder="telefono" value="" min=8 max=10 onkeyup="controlloNumeri(document.registrazione.tell.value)"><br>
			
			<!-- dati carta -->
			
			Intestatario:<input type="text" name="intestatario" value=""><br>
			Numero carta:<input type="text" name="numero_carta" value=""><br>
			Scadenza:<input type="date" value="" name="scadenza"><br>
			
			<button type="submit">registrati</button>
	</form>
	</div>
	<script src="controllo_dati.js" type="text/javascript"></script>
</body>
</html>