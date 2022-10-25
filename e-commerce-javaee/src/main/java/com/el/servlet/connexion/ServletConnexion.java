package com.el.servlet.connexion;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ServletConnexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //private ClientDao clientDao;

    public ServletConnexion() {
        super();
    }

    // pour l'initialisation
    /*public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
		this.clientDao = daoFactory.getClientDao();
	}*/

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/connexion.jsp").forward(request, response); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    /*String email = request.getParameter("email");
	    String motDePass = request.getParameter("motDePass");
	    
	    try {
	    	String connection = request.getParameter("connexion");
	    	if(connection.equals("true")) { // si on veut se connecter
	    		if(clientDao.verifierEmail(email) && clientDao.verifierMotDePass(motDePass)) {
					// recuperation du client
					Client client = clientDao.profileClient(email);
					// creation de la session
					HttpSession session = request.getSession();
					session.setAttribute("email", email);
					session.setAttribute("motDePass", motDePass);
					session.setAttribute("nom", client.getNom());
					session.setAttribute("prenom", client.getPrenom());
					session.setAttribute("identifiant", client.getIdentifiant());
					session.setAttribute("connection", connection);
					
					this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/accueil.jsp").forward(request, response); 
				}
				else {
					request.setAttribute("connexionEchouer", "email ou mot de passe invalide");
					this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/connexion.jsp").forward(request, response); 
				}
	    	}else if(connection.equals("false")){ // si on veut se deconnecter
	    		HttpSession session = request.getSession();
	    		session.invalidate();
	    		
	    		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/connexion.jsp").forward(request, response); 
	    	}
			
		} catch (DaoException e) {
			request.setAttribute("erreurTechnique", e.getMessage());
			this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/connexion.jsp").forward(request, response); 
		}*/
		
	}

}
