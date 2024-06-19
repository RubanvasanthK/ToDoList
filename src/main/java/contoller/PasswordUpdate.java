package contoller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.User;

@WebServlet("/email")
public class PasswordUpdate extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		
		Dao d=new Dao();
		
		try {
			User u=d.findByEmail(email);
			
			if(u!=null)
			{
				Random r=new Random();
			    int a=r.nextInt(1000, 9999);
				
				req.setAttribute("email", email);
				req.setAttribute("pin", a);
				
				d.updatepassword(u, a);
			
				req.getRequestDispatcher("mailapp").include(req, resp);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
	}
	
}
