package servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DBConnection;

@WebServlet("/editRepo")
public class EditRepoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String oldRepoName = request.getParameter("oldRepoName");
        String newRepoName = request.getParameter("newRepoName");

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "UPDATE repositories SET name=? WHERE name=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, newRepoName);
            ps.setString(2, oldRepoName);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                String repoPath = getServletContext().getRealPath("")
                        + "Repositories/";

                File oldFolder = new File(repoPath + oldRepoName);

                File newFolder = new File(repoPath + newRepoName);

                oldFolder.renameTo(newFolder);

                response.sendRedirect("viewRepos?msg=updated");

            } else {

                response.sendRedirect("viewRepos?msg=failed");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("viewRepos?msg=error");

        }

    }

}