<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beam.*,java.util.*"%>
    <%
	Servizio product = (Servizio) request.getAttribute("product");
	
	//Carrello cart = (Carrello) session.getAttribute("cart");
	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= product.getNome()%></title>
<link rel="stylesheet" href="stile.css" type="text/css">
<%@ include file="ico.html" %>
</head>
<body>
	<h1 id="titolo_pagina" align="center"><%=product.getNome() %></h1>
	<div id="contenitore_servizi">
		<div id="blocco_azioni">
			<table>
				<tr>
					<td><a href="carrello.jsp"><img alt="img not found" src="immagini/carrello.png" width="50px" height="50px"></a></td>
				</tr>
			</table>
		</div>
		<div id="contenitore_servizio">
				<table id="tabella_servizio">
						<tr>
							<td id="blocco_img_servizio"> 
								<div>
									<img id="img_servizio" src="foto/<%=product.getFoto() %>" alt="img not found"/>
								</div>
							</td>
							<td>
								<table>
									<tr>
										<td><%=product.getDescrizione() %>
									</tr>
									<tr>
										<td><%=product.getPrezzo() %>&euro;
									</tr>
									<tr>
										<td><a href="servlet_servizi?action=addC&id=<%= product.getNome() %>"><img src="immagini/add_cart.png" alt="img not found" width="50px" height="50px"> </a>
									</tr>
								</table>
							</td>
						</tr>
					</table>
		</div>
	</div>
</body>
</html>