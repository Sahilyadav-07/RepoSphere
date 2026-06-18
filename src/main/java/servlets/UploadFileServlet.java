package servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@MultipartConfig
@WebServlet("/uploadFile")
public class UploadFileServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException , IOException{
		
		
		String repoName = request.getParameter("repoName");
		
		Part filePart = request.getPart("file");
		String fileName = filePart.getSubmittedFileName();
		
		//folder path (inside project)
		String uploadPath = getServletContext().getRealPath("") + File.separator + "Repositories" + File.separator + repoName;
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		filePart.write(uploadPath + File.separator + fileName);
		
		response.sendRedirect(
			    "openRepo?repoName=" +
			    repoName +
			    "&msg=uploaded"
			);
		
	}

}
