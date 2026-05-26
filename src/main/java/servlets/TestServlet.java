package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;

@WebServlet("/test")
public class TestServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			Connection conn = DBConnection.getConnection();
			
			if(conn != null) {
				out.println("<h2>DB Connected Successfully </h2>");
			}else {
				out.println("<h2> Connection Failed </h2>");
			}
	}
	

}
