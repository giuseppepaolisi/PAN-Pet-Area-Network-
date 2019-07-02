package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beam.Carrello;
import beam.Servizio;
import model.ConnessioneServizi;
import supporto.Data;

/**
 * Servlet implementation class ControllerCarrello
 */
public class ControlloCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	static ConnessioneServizi model=new ConnessioneServizi();
	
    public ControlloCarrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Carrello cart = (Carrello)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("cart", cart);
		}
		
		
		String action = request.getParameter("action");
		System.out.println(action);
		try{
			if (action != null){
				if (action.equalsIgnoreCase("addC")) {
					String id = request.getParameter("id");
					cart.addServizio(model.doRetrieveByKey(id));
				} else if (action.equalsIgnoreCase("deleteC")) {
					String id = request.getParameter("id");
					cart.deleteServizio(model.doRetrieveByKey(id));
				}else if(action.equals("svuota")){
					//cart=new Carrello();
					request.getSession().removeAttribute("cart");
					cart = (Carrello)request.getSession().getAttribute("cart");
					if(cart == null) {
						cart = new Carrello();
						request.getSession().setAttribute("cart", cart);
					}
				}else if(action.equals("modificaC")){
					String id=request.getParameter("id");
					int qta=Integer.parseInt(request.getParameter("qta"));
					//request.getParameter("datai")
					Data datai=new Data();
					datai.setData(Data.converti(request.getParameter("datai"), "yyyy-MM-dd"));
					Data dataf=new Data();
					if(id.equals("Custodia"))
						dataf.setData(Data.converti(request.getParameter("dataf"), "yyyy-MM-dd"));
					else
						dataf=null;
					if(dataf==null || dataf.equals("")){
						cart.updateServizio(id, qta,datai );
					}else{
						cart.updateServizio(id, qta,datai,dataf );
					}
						
					request.getSession().setAttribute("cart", cart);
					response.setContentType("text/json");
					response.setCharacterEncoding("UTF-8");
					String s="";
					for(Servizio ser:cart.getServizi()){
						if(ser.getNome().equals(id)){
							Data d1=new Data();
							d1.setData(Data.converti(Data.dd_MM_yyyy(datai.getDataSTR()), "dd-MM-yyyy"));
							if(dataf==null || dataf.equals(""))
								s+="{\n\"id\":\""+id+"\",\n\"qta\":"+qta+",\n\"datai\":\""+d1.getDataSTR()+"\"\n}";
							else{
								Data d2=new Data();
								d2.setData(Data.converti(Data.dd_MM_yyyy(dataf.getDataSTR()), "dd-MM-yyyy"));
								s+="{\"id\":\""+id+"\",\"qta\":"+qta+",\"datai\":\""+d1.getDataSTR()+"\",\"dataf\":\""+d2.getDataSTR()+"\"}";
							}
						}
					}
					System.out.println(s);
					response.getWriter().write(s);
					return;
				}
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		request.getSession().setAttribute("cart", cart);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
		dispatcher.forward(request, response);
	}


}
