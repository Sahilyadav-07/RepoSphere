package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/downloadFile")
public class DownloadFileServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws  ServletException, IOException {
		
		String repoName = request.getParameter("repoName");
		String fileName = request.getParameter("fileName");
		
		String filePath = getServletContext().getRealPath("") 
				+ File.separator + "Repositories" 
				+ File.separator + repoName 
				+ File.separator + fileName;
		
		File file = new File(filePath);
		
		if(file.exists()) {
			
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment;filename-" + file.getName());
			
			FileInputStream fis = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			
			byte[] buffer = new byte[4096];
			int bytesRead;
			
			while ((bytesRead = fis.read(buffer)) != -1) {
				os.write(buffer,0, bytesRead);
			}
			
			fis.close();
			os.close();
		} else {
			response.getWriter().println("File no found");
		}
		
	}
	
}