package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;

@WebServlet("/deleteRepo")
public class DeleteRepoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost( HttpServletRequest request, HttpServletResponse response )
		throws ServletException , IOException {
		
		String repoName = request.getParameter("repoName").trim();
		
		try {
			Connection conn = DBConnection.getConnection();
			
			String query = "DELETE FROM repositories WHERE name = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setString(1, repoName);
			
			ps.executeUpdate();
			
			response.sendRedirect("viewRepos");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
