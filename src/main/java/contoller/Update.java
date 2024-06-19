package contoller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/update")
public class Update extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int taskid=Integer.parseInt(req.getParameter("taskid"));
		String tasktittle=req.getParameter("tasktitle");
		String taskdescripti=req.getParameter("taskdescription");
		String taskpriority=req.getParameter("taskpriority");
		String taskduedate=req.getParameter("taskduedate");
		
		
		User user=(User)req.getSession().getAttribute("user");
		int userid=user.getUserid();
		
		Dao dao=new Dao();
		
		Task t=new Task(taskid, tasktittle, taskdescripti, taskpriority, taskduedate, "pending", userid);
		
		try 
		{
			dao.update(t);
			resp.sendRedirect("home.jsp");
			
			
		}
		
		catch (ClassNotFoundException | SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
