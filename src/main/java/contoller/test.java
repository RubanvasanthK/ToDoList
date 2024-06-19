package contoller;

import java.sql.SQLException;

import dao.Dao;

public class test {

	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
	Dao d=new Dao();
	System.out.println(d.max());
	}
	
}
