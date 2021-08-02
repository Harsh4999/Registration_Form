import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
//adding 2 features 1) bringing image to servlet left and storing it in database left
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, 
maxRequestSize = 1024 * 1024 * 5 * 5)
public class Form extends HttpServlet{


	/**
	 * 
	 */
	private static final long serialVersionUID = 3834942966764188409L;
	private String filepath;

	public void init() {
		filepath = getServletContext().getInitParameter("file-upload");
		System.out.println(filepath);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		String name = req.getParameter("name");
		String std = req.getParameter("std");
		String r = req.getParameter("roll");
		int roll = Integer.parseInt(r);
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		File uploadDir = new File(filepath);
		if (!uploadDir.exists()) uploadDir.mkdir();
		try {
			for (Part part : req.getParts()){
			    //fileName = getFileName(part);
				String fileName = part.getSubmittedFileName();
			    System.out.println(fileName);
			    if(fileName!=null) {
					part.write(filepath+File.separator + r+".png");
					String f = filepath+r+".png";
					System.out.println(f);
					Cookie cookie = new Cookie("filePath",f);
					res.addCookie(cookie);
				if(db.insert(name,std,roll,username,password,r+".png",f)==1&& Mdb.insert(roll)==1){
					res.sendRedirect(req.getContextPath()+"/index.jsp");
				}else{
					throw new Exception();
				}
				break;
			  }
			}
		}catch(Exception e){
			Cookie er = new Cookie("error",e.toString());
			res.addCookie(er);
			res.sendRedirect(req.getContextPath()+"/Error.jsp");
			System.out.println(e);
		}
		
	}


/*	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}*/
	
}
