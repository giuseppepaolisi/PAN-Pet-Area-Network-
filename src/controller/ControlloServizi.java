package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConnessioneServizi;
import beam.Carrello;
import beam.Servizio;

/**
 * Servlet implementation class ProductControl
 */
//@WebServlet("/servlet_servizi")
public class ControlloServizi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static ConnessioneServizi model=new ConnessioneServizi();
	
	public ControlloServizi() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Carrello cart = (Carrello)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("read")) {
					String id = request.getParameter("id");
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dettaglio.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("delete")) {
					String id = request.getParameter("id");
					model.doDelete(id);
				} else if (action.equalsIgnoreCase("insert")) {
					String nome = request.getParameter("nome");
					String descrizione = request.getParameter("descrizione");
					double prezzo = Double.parseDouble(request.getParameter("prezzo"));
					String foto=request.getParameter("foto");

					Servizio ser=new Servizio();
					ser.setNome(nome);
					ser.setDescrizione(descrizione);
					ser.setPrezzo(prezzo);
					ser.setFoto(foto);
					model.doSave(ser);
				} 
			}
			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		//request.setAttribute("cart", cart);
		
		
		String sort = request.getParameter("sort");
		request.getSession().setAttribute("sort", sort);
		request.setAttribute("sort", sort);
		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(sort));
			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/servizi.jsp");
		dispatcher.forward(request, response);
	}


}
