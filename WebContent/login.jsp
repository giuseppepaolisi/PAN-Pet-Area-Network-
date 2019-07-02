<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <h4>Immetti i tuoi dati:</h4>
    <div id="pannello">
	    <form action="" method="post" name="login">
	    
		    E-mail:<input type="email" name="email" value="" onblur="controlloFormatoEmail(document.login.email.value)" required>
		    Password:<input type="text" nome="password" placeholder="password" value="" required>
		    <button type="submit">login</button>
	    
	    </form>
    </div>
    <script src="controllo_dati.js" type="text/javascript"></script>     
</body>
</html>