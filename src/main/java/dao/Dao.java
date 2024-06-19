package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import dto.Task;
import dto.User;

public class Dao {
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db5","root","root");
		return con;
	}
	public static int saveUser(User user) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into db5.user values (?,?,?,?,?,?)");
		pst.setInt(1, user.getUserid());
		pst.setString(2, user.getUsername());
		pst.setString(3, user.getUseremail());
		pst.setLong(4, user.getUsercontact());
		pst.setString(6, user.getUserpassword());
		
		Blob imageBlob = new SerialBlob(user.getUserimage()) ;
		pst.setBlob(5, imageBlob);
		int res = pst.executeUpdate();
		return res;
		
	}
	
	public User findByEmail(String email) throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from db5.user where useremail = ?");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			
			//convert blob image to byte[]
			Blob imageBlob = rs.getBlob(5);
			byte[] image = imageBlob.getBytes(1, (int)imageBlob.length());
			
			User u = new User(rs.getInt(1),rs.getNString(2),rs.getNString(3),rs.getLong(4),rs.getNString(6), image);
			
			return u;
			
		}
		else {
			return null;
		}
	}
	public int createtask(Task task) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("insert into db5.task values(?,?,?,?,?,?,?)");
		pst.setInt(1, task.getTaskid());
		pst.setString(2, task.getTasktitle());
		pst.setString(3, task.getTaskdescription());
		pst.setString(4, task.getTaskpriority());
		pst.setString(5, task.getTaskduedate());
		pst.setString(6, task.getTaskstatus());
		pst.setInt(7, task.getUserid());
		
		int res = pst.executeUpdate();
		return res;		
	}
	public List<Task> getalltasksByUserId(int userid) throws ClassNotFoundException, SQLException{
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("select * from db5.task where userid = ?");
		pst.setInt(1, userid);
		ResultSet rs = pst.executeQuery();
		List<Task> tasks = new ArrayList<Task>();
		while(rs.next()) {
			Task task = new Task (rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5), rs.getString(6),rs.getInt(7));
			tasks.add(task);
		}
		return tasks;
	}
	public int deleteTaskById(int taskid) throws ClassNotFoundException, SQLException 
	{
		Connection con = getConnection();
		PreparedStatement pst = con.prepareStatement("delete from db5.task where taskid = ?");
		pst.setInt(1, taskid);
		int res = pst.executeUpdate();
		return res;	
	}
	
	public void updatePriorityBasedOnDuration() throws SQLException, ClassNotFoundException {
		Connection con = getConnection();
		Statement st = con.createStatement();
		st.execute("UPDATE db5.task SET taskpriority = 'high' WHERE taskduedate BETWEEN CURDATE() AND CURDATE() +  INTERVAL 3 DAY");
		st.execute("UPDATE db5.task SET taskpriority = 'medium' WHERE taskduedate BETWEEN CURDATE() + INTERVAL 4 DAY AND CURDATE() + INTERVAL 7 DAY");
		st.execute("UPDATE db5.task SET taskpriority = 'low' WHERE taskduedate > CURDATE() + INTERVAL 7 DAY");
	}
	
	
	public Task findbyid(int id) throws ClassNotFoundException, SQLException
	{
		Connection con =getConnection();
		PreparedStatement pst=con.prepareStatement("select * from db5.task where taskid=? ");
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			Task task=new Task(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
			return task;
		}
		
		return null;
		
	}
	
	
	public int update(Task t) throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("update db5.task set tasktitle=?,taskdescription=?,taskpriority=?,taskduedate=? where taskid=?");
		pst.setString(1, t.getTasktitle());
		pst.setString(2, t.getTaskdescription());
		pst.setString(3, t.getTaskpriority());
		pst.setString(4, t.getTaskduedate());
		pst.setInt(5, t.getTaskid());
		
		int res=pst.executeUpdate();
		
		return res;
	}
	
	public int max() throws ClassNotFoundException, SQLException
	{	int id =0;
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement(" SELECT max(taskid) from task; ");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			 id=rs.getInt(1);
		}
		return id;
	}
	public int updatepassword(User u, int a) throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("update db5.user set userpassword=? where useremail=?");
		pst.setInt(1, a);
		pst.setString(2, u.getUseremail());
		
		int res=pst.executeUpdate();
		
		return res;
	}
	public int updatepassword(User u, String a) throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement pst=con.prepareStatement("update db5.user set userpassword=? where useremail=?");
		pst.setString(1, a);
		pst.setString(2, u.getUseremail());
		
		int res=pst.executeUpdate();
		
		return res;
	}
	

	

}
