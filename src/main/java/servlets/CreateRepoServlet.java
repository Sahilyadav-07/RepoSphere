package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;

@WebServlet("/createRepo")
public class CreateRepoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		
		String  repoName = request.getParameter("repoName");
		
		if(repoName == null || repoName.trim().isEmpty()) {
			response.getWriter().println("Reposiory name cannot be empty");
			return;
		}
		
		try {
			Connection conn = DBConnection.getConnection();
			
			String query = "INSERT INTO repositories (name) VALUE (?)";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setString(1,repoName);
			
			int result = ps.executeUpdate();
			
			if(result > 0) {

			    response.sendRedirect(
			        "viewRepos?msg=created"
			    );

			}else {
				response.getWriter().println("Failed to Create Repository");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

