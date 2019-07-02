<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beam.*,java.util.*"%>
    
<%
	Collection<?> list = (Collection<?>) request.getAttribute("products");
	
	Carrello cart = (Carrello) session.getAttribute("cart");
	//session.setAttribute("cart", cart);
	String sort=(String)request.getAttribute("sort");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Servizi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="stile.css"/>
    
    
    <%@ include file="ico.html" %>
    
    
    <script type="text/javascript">
        function ordina(){
            document.getElementById("selectordina").submit();
        }
    </script>
</head>
<body>
	<h1 id="titolo_pagina">Servizi</h1>
	<div id="contenitore_servizi">
	    <div id="blocco_azioni">
	    		<span id="ordina">
		    		<a href="carrello.jsp"><img alt="img not found" src="immagini/carrello.png" width="50px" height="50px"></a>
	    		</span> 
   				<span id="ordina">ordina</span> 
				<!-- permette di ordinare i prodotti del catalogo -->
				<span id="ordina"><form action="catalogo" method="get" id="selectordina">
			    	<select name="sort" id="sort" onchange="ordina()"><!--   -->
						<%if(sort==null || sort.equals("nome")){ %>
							<option value="nome" selected>Nome</option>
							<option value="prezzo" >Prezzo</option>
						<%}else{ %>
							<option value="nome">Nome</option>
							<option value="prezzo" selected>Prezzo</option>
						<%} %>
	            	</select>
	        	</form>
        	</span>           
		</div>
		<%
		if (list != null && list.size() != 0) {
		    Iterator<?> it = list.iterator();
		    while (it.hasNext()) {
		    	Servizio ser = (Servizio) it.next();
		%>
				<div id="contenitore_servizio">
		        <div>
		        	<img id="img_servizio" alt="img not found" src="foto/<%=ser.getFoto()%>">
		   		</div>
				<div>
					<%=ser.getNome() %><br>
					<%=ser.getPrezzo() %> &euro;
				</div>
		   		<div id="comandi_servizio">
		     		<a href="carrello?action=addC&id=<%= ser.getNome() %>"><img alt="img not found" src="immagini/add_cart.png" width="50px" height="50px"> </a>
					<a href="catalogo?action=delete&id=<%= ser.getNome() %>"><img alt="img not found" src="immagini/elimina_servizio.png" width="50px" height="50px"> </a>
					<a href="catalogo?action=read&id=<%= ser.getNome() %>"><img src="immagini/dettagli.png" alt="img not found" width="50px" height="50px"></a></td>
		        </div>
		</div>
		<%}} %>
	</div>
    
    <div id="contenitore_inserimento">
    	<h3 id="titolo_inserimento">Inserisci</h3>
	    <form action="catalogo" method="get">
	    	<input type="hidden" name="action" value="insert">
	    	<table id="tabella_inerimento">
	    		<tr>
	    			<td id="testo_sx"><input type="text" name="nome" id="casella" required placeholder="nome"></td>
	    			<td id="testo_dx"><input type="text" name="foto" id="casella" required placeholder="nome foto"></td>
	    		</tr>
	    		<tr>
	    			<td id="testo_sx"><input type="number" name="prezzo" id="casella" min="0" placeholder="prezzo"></td>
	    		</tr>
	    		<tr>
	    			<td id="testo" colspan="2"><textarea name="descrizione" id="casella" cols="55" maxlength="1000" rows="3" placeholder="descrizione"></textarea></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2"><button type="submit" class="btn">invia</button></td>
	    		</tr>
	    	</table>
	    </form>
    </div>
    <div id="gatto"></div>
    <%=request.getHeader("Referer") %>
</body>
</html>