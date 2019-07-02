<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beam.*,java.util.*,java.text.SimpleDateFormat,supporto.Data"%>
<%
	Carrello cart = (Carrello) session.getAttribute("cart");
	/*if(request.getHeader("Referer").contains("carrello"))
		response.sendRedirect(request.getHeader("Referer"));*/
//request.getHeader("Referer");http://localhost:8080/Pensione_per_animali/carrello
//response.sendRedirect(request.getHeader("Referer"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carrello</title>
<link rel="stylesheet" href="stile.css" type="text/css">
<%@ include file="ico.html" %>
</head>
<body>
	<h1 id="titolo_pagina" align="center">Carrello</h1>
	
	<div id="contenitore_servizi">
		<div id="blocco_azioni">
					<h4>Totale:<%=cart.getTotale() %> &euro;</h4>
					<a href="carrello?action=svuota"><img alt="img not found" src="immagini/checkout.png" width="50px" height="50px"></a>
		</div>
		<%
		List<Servizio> list=cart.getServizi();
		if (list != null && list.size() != 0) {
			for(Servizio ser: list) {
		%>
		<div id="contenitore_servizio">
						<div>
							<img id="img_servizio" alt="img not found" src="foto/<%=ser.getFoto()%>">
						</div>
						<div id="dati_servizio">
							<span id="id"><%=ser.getNome() %></span><br>
							<%=ser.getPrezzo() %> &euro;<br>
								Quantità: <input id="testo" type="number" min="1" name="qta" value="<%=ser.getQuantita() %>"><br>
								<%String formato="dd-MM-yyyy"; %>
								Prenotazione per: <input id="testo" class="data" name="datai" type="date" min="<%=new Data().getDataSTR()%>" value="<%=ser.getDatai().getDataSTR()%>"><br>
								<%
									if(ser.getNome().equals("Custodia")){
								%>
									<br>Fino al: <input id="testo" class="data" type="date" name="dataf" min="<%=ser.getDatai().getDataSTR()%>" value="<%=ser.getDataf().getDataSTR()%>">
								<%} %>
							
						</div>
						<div id="comandi_servizio">
							<a href="carrello?action=deleteC&id=<%= ser.getNome() %>"><img id="elimina_elemento" alt="img not found" src="immagini/elimina_servizio.png" width="50px" height="50px"> </a>
							<div id="wait" style="display:none;width:69px;height:89px;border:1px solid black;position:absolute;top:50%;left:50%;padding:2px;"><img src='loading.gif' width="64" height="64" /><br>Loading..</div>
						</div>
		</div>
		<%}} %>
		
	</div>
	<script src="jquery-3.3.1.min.js"></script>
	<script>
	$(document).ready(function(){
		$("div#dati_servizio").on("change",function(){
			var id=$(this).find("span#id").text();
			var action="modificaC";
			var qta=$(this).find("input#testo").val();
			var datai=$(this).find("input.data").val();
			var dataf=$(this).find("input.data").val();
			console.log(datai);
			console.log(dataf);
			console.log(id);
			console.log(qta);
			
			
			$(document).ajaxStart(function(){
		        $("#wait").css("display", "block");
		    });
			
			$(document).ajaxComplete(function(){
		        $("#wait").css("display", "none");
		    });
		    
			
			if(dataf==""){
				$.getJSON("carrello",{
					id:id,
					action:action,
					qta:qta,
					datai:datai,
					},function(data,status){
						console.log(status);
						$(this).find("input.data").val(parseInt(data.qta));
						$(this).find("input.data").val(data.datai);
					});
			}else{
				$.getJSON("carrello",{
					id:id,
					action:action,
					qta:qta,
					datai:datai,
					dataf:dataf
					},function(data,status){
						$(this).find("input#testo").val(parseInt(data.qta));
						$(this).find("input.data").val(data.datai);
						$(this).find("input.data").next().val(data.dataf);
					});
			}
			console.log("ok");
		});
	});
	</script>
</body>
</html>