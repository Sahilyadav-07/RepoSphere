package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;


@WebServlet("/viewRepos")
public class ViewRepoServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String> repos = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String query = "SELECT name FROM repositories";
            PreparedStatement ps = conn.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                repos.add(rs.getString("name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("repos", repos);

        request.getRequestDispatcher("viewRepos.jsp").forward(request, response);
    }
}