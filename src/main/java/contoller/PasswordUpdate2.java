package contoller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import dao.Dao;
import dto.User;

@WebServlet("/up")
public class PasswordUpdate2 extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pass=req.getParameter("pass");
		String pass2=req.getParameter("pass2");
		
		User u=(User) req.getSession().getAttribute("user");
		
		if((pass.equals(pass2)) && (!pass.isBlank()) && (pass2 != null))
		{
			Dao d=new Dao();
			try {
				d.updatepassword(u, pass);
				resp.sendRedirect("Profile.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else
		{
			resp.getWriter().print("unable to update");
		}
		
		
	}
	
}
