package servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/deleteFile")
public class DeleteFileServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		String repoName = request.getParameter("repoName");
		String fileName = request.getParameter("fileName");
		
		String filePath = getServletContext().getRealPath("")
				+ File.separator + "Repositories"
				+ File.separator + repoName 
				+ File.separator + fileName;
		
		File file = new File(filePath);
		
		if(file.exists()) {
			if(file.delete()) {
				System.out.println("File deleted Successfully");
			}else {
				System.out.println("Failed to delete file");
			}
		}
		
		response.sendRedirect("openRepo?repoName="+ repoName + "&msg=deleted");
	}

}
