package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/openRepo")
public class OpenRepoServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		
		String repoName = request.getParameter("repoName");
		
		request.setAttribute("repoName", repoName);
		
		request.getRequestDispatcher("repo.jsp").forward(request,response);
		
	}
	
}
