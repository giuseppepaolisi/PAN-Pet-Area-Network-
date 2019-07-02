package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConnessioneUtente;
import beam.UtenteRegistrazione;
import supporto.Data;
/**
 * Servlet implementation class ServletUtente
 */
@WebServlet("/ServletUtente")
public class ServletUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ConnessioneUtente model=new ConnessioneUtente();
	
    public ServletUtente() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ciao");
		String action= request.getParameter("action");
		System.out.println("dopo action");
		if(action.equals("registrazione")){
			System.out.println("sono nell'if");
			UtenteRegistrazione utente=new UtenteRegistrazione();
			utente.setEmail(request.getParameter("email"));
			utente.setNome(request.getParameter("nome"));
			utente.setCognome(request.getParameter("cognome"));
			utente.setPass(request.getParameter("password"));
			Data d=new Data();
			System.out.println(request.getParameter("data_nascita"));
			d.setData(Data.converti(request.getParameter("data_nascita"), "yyyy-MM-dd"));
			utente.setNascita(d);
			System.out.println(utente.getNascita().getDataSTR());
			utente.setCitta(request.getParameter("citta"));
			utente.setVia(request.getParameter("via"));
			utente.setNcv(Integer.parseInt(request.getParameter("nc")));
			utente.setTell(request.getParameter("tell"));
			utente.setIntestatario(request.getParameter("intestatario"));
			utente.setNcarta(request.getParameter("numero_carta"));
			d.setData(Data.converti(request.getParameter("scadenza"), "yyyy-MM-dd"));
			utente.setScadenza(d);
			
			System.out.println(utente);
			
			try {
				model.doSave(utente);//utente
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("scemo");
				e.printStackTrace();
			}
			
		}
	}

}
